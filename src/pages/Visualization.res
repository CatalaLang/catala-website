open PageComponents

@decco.decode
type sourcePosition = {
  fileName: string,
  startLine: int,
  endLine: int,
  startColumn: int,
  endColumn: int,
  lawHeadings: array<string>,
}

@decco.decode
type rec loggedValue =
  | Unit
  | Bool(bool)
  | Integer(int)
  | Money(float)
  | Decimal(float)
  | Date(string)
  | Duration(string)
  | Enum(list<string>, (string, loggedValue))
  | Struct(list<string>, list<(string, loggedValue)>)
  | Array(array<loggedValue>)
  | Unembeddable

type rawEventType =
  | BeginCall
  | EndCall
  | VariableDefinition
  | DecisionTaken

type rawEventSerialized = {
  eventType: string,
  information: array<string>,
  sourcePosition: Js.Nullable.t<sourcePosition>,
  loggedValueJson: string,
}

type rawEvent = {
  eventType: rawEventType,
  information: array<string>,
  sourcePosition: option<sourcePosition>,
  loggedValue: loggedValue,
}

let eventTypeFromString = (str: string): rawEventType => {
  switch str {
  | "Begin call" => BeginCall
  | "End call" => EndCall
  | "Variable definition" => VariableDefinition
  | "Decision taken" => DecisionTaken
  | _ =>
    // NOTE: find a better way to handle errors?
    Js.Exn.raiseError(`Unknown event type: ${str}`)
  }
}

let deserializedRawEvents = (rawEventsSerialized: array<rawEventSerialized>) => {
  rawEventsSerialized->Belt.Array.map((rawEventSerialized: rawEventSerialized) => {
    let loggedValue = try {
      switch loggedValue_decode(Js.Json.parseExn(rawEventSerialized.loggedValueJson)) {
      | Ok(val) => val
      | Error(_decodeError) => Unembeddable
      }
    } catch {
    | Js.Exn.Error(obj) =>
      switch Js.Exn.message(obj) {
      | Some(m) =>
        Js.log("Caught a JS exception! Message: " ++ m)
        Unembeddable
      | None => Unembeddable
      }
    }
    {
      eventType: rawEventSerialized.eventType->eventTypeFromString,
      information: rawEventSerialized.information,
      sourcePosition: rawEventSerialized.sourcePosition->Js.Nullable.toOption,
      loggedValue: loggedValue,
    }
  })
}

let rec loggedValueToString = (val: loggedValue, tab: int) => {
  Js.String.repeat(tab, "\t") ++
  switch val {
  | Unit => "Unit"
  | Bool(b) => "Bool: " ++ string_of_bool(b)
  | Money(f) => "Money: " ++ Js.Float.toString(f)
  | Integer(i) => "Integer: " ++ string_of_int(i)
  | Decimal(f) => "Decimal: " ++ Js.Float.toString(f)
  | Date(d) => "Date: " ++ d
  | Duration(d) => "Duration: " ++ d
  | Enum(ls, (s, vals)) =>
    "Enum[" ++ String.concat(",", ls) ++ "]:" ++ s ++ "\n" ++ vals->loggedValueToString(tab + 1)
  | _ => "Other"
  }
}

module Navigation = {
  type index =
    | Prev(int)
    | Next(int)

  let getIndex = idx => {
    switch idx {
    | Next(idx) | Prev(idx) => idx
    }
  }

  let buttonStyle = %twc(
    "inline-flex justify-center text-gray_dark border text-base border-secondary \
    font-semibold bg-gray shadow-sm hover:bg-gray_medium hover:shadow \
    ease-out duration-150"
  )

  @react.component
  let make = (~logIndex, ~setLogIndex, ~maxLogIndex) => {
    let idx = logIndex->getIndex
    <>
      <div className=%twc("inline-flex flex-row justify-center content-center text-base font-sans")>
        <button
          className={buttonStyle ++ %twc(" rounded-l-lg pr-2")}
          onClick={_ => setLogIndex(_ => Prev(idx > 2 ? idx - 2 : 0))}>
          <Icon className=%twc("h-4") name="arrow_left" /> {"Prev"->React.string}
        </button>
        <button className={buttonStyle ++ " px-2"} onClick={_ => setLogIndex(_ => Prev(0))}>
          <Lang.String
            english={idx->string_of_int ++ "/" ++ maxLogIndex->string_of_int}
            french={idx->string_of_int ++ "/" ++ maxLogIndex->string_of_int}
          />
        </button>
        <button
          className={buttonStyle ++ %twc(" rounded-r-lg pl-2")}
          onClick={_ => setLogIndex(_ => Next(idx < maxLogIndex ? idx + 2 : 0))}>
          {"Next"->React.string} <Icon name="arrow_right" />
        </button>
      </div>
    </>
  }
}

module Box = {
  @react.component
  let make = (~children) => {
    <div
      className=%twc(
        "text-background my-4 p-2 border bg-gray_light border-gray rounded \
        shadow-sm"
      )>
      children
    </div>
  }
}

module CatalaCode = {
  // TODO: could be factorized with a module for each type
  module Span = {
    @react.component
    let make = (~kind, ~code) => {
      <span className=kind> {code->React.string} </span>
    }
  }
  module Ids = {
    @react.component
    let make = (~ids: array<string>) => {
      Js.log("ids.length: " ++ ids->Belt.Array.length->string_of_int)
      ids
      ->Belt.Array.mapWithIndex((i, s) => {
        <>
          {if i > 0 {
            <span className="op"> {"."->React.string} </span>
          } else {
            <> </>
          }}
          {if s == s->Js.String.toLowerCase {
            <span className="nv"> {s->React.string} </span>
          } else {
            <span className="nc"> {s->React.string} </span>
          }}
        </>
      })
      ->React.array
    }
  }

  module Op = {
    @react.component
    let make = (~op) => {
      <span className="op"> {op->React.string} </span>
    }
  }

  @react.component
  let make = (~children) => {
    <div className="catala-code">
      <div className="code-wrapper"> <div className="highlight"> <pre> children </pre> </div> </div>
    </div>
  }
}

module rec LoggedValue: {
  @react.component
  let make: (~depth: int=?, ~val: loggedValue) => React.element
} = {
  @react.component
  let make = (~depth=1, ~val: loggedValue) => {
    <>
      {switch val {
      | Unit => <CatalaCode.Span kind="nc" code={"()"} />
      | Bool(b) => <CatalaCode.Span kind="mb" code={b->string_of_bool} />
      | Integer(i) => <CatalaCode.Span kind="mi" code={i->string_of_int} />
      | Money(m) => <>
          <CatalaCode.Span kind="mf" code={m->Js.Float.toString} /> <CatalaCode.Op op={` €`} />
        </>
      | Decimal(d) => <CatalaCode.Span kind="mf" code={d->Js.Float.toString} />
      | Date(d) => <CatalaCode.Span kind="mi" code=d />
      | Duration(d) => <CatalaCode.Span kind="mi" code=d />
      | Enum(_ls, (s, Unit)) => <> <CatalaCode.Ids ids={[s]} /> </>

      | Enum(ls, (s, val)) => <>
          <CatalaCode.Op op={Js.String.repeat(depth * 2, " ")} />
          <CatalaCode.Ids ids={ls->Belt.List.toArray} />
          <CatalaCode.Op op=" = " />
          <CatalaCode.Ids ids={[s]} />
          <LoggedValue depth={depth + 1} val />
        </>
      | Struct(ls, attributes) => <>
          <CatalaCode.Ids ids={ls->Belt.List.toArray} />
          <CatalaCode.Op op=" = {" />
          <br />
          {attributes
          ->Belt.List.toArray
          ->Belt.Array.map(attribute => {
            let (id, val) = attribute
            <>
              <CatalaCode.Op op={Js.String.repeat(depth * 2, " ")} />
              <CatalaCode.Op op=" -- " />
              <CatalaCode.Ids ids={[id]} />
              <CatalaCode.Op op=" = " />
              <LoggedValue depth={depth + 1} val />
              <CatalaCode.Op op=", " />
              <br />
            </>
          })
          ->React.array}
          <br />
          <CatalaCode.Op op={Js.String.repeat((depth - 1) * 2, " ")} />
          <CatalaCode.Op op="}" />
        </>
      | Array(vals) => <>
          <CatalaCode.Op op="[" />
          <br />
          {vals
          ->Belt.Array.map(val => <>
            <CatalaCode.Op op={Js.String.repeat(depth * 2, " ")} />
            <LoggedValue depth={depth + 1} val />
            <CatalaCode.Op op="," />
            <br />
          </>)
          ->React.array}
          <CatalaCode.Op op="]" />
        </>
      | Unembeddable => <> {"Unembeddable"->React.string} </>
      }}
    </>
  }
}

let scrollTo: array<string> => unit = %raw(`
  function(ids) {
    console.log("ids.length/2 = ", Math.floor(ids.length/2))
    let el = document.getElementById(ids[Math.floor(ids.length/2)])
    console.log("ids: ", ids)
    console.log("el: ", el)
    if (null != el) {
      var links = document.getElementsByTagName("A")
      for (var i = 0; i < links.length; i++) {
        if (ids.some(id => links[i].href.includes(id))) {
          console.log("found")
          links[i].className = "selected"
        } else {
          links[i].className = ""
        }
      }
      el.scrollIntoView({behavior: "smooth", block: "center", inline: "nearest"})
    }
  }
`)

module LogEvent = {
  @react.component
  let make = (
    ~depth: React.ref<int>,
    ~currentPage: array<Nav.navElem>,
    /* ~pos: sourcePosition, */
    ~event: rawEvent,
  ) => {
    <>
      {switch event.eventType {
      | VariableDefinition => <>
          <CatalaCode>
            <CatalaCode.Ids ids={event.information} />
            <CatalaCode.Op op={" : "} />
            <LoggedValue depth=depth.current val=event.loggedValue />
          </CatalaCode>
        </>
      | DecisionTaken =>
        switch event.sourcePosition {
        | Some(pos) =>
          let ids = {
            if pos.startLine != pos.endLine {
              Belt.Array.makeBy(pos.endLine - pos.startLine + 1, lnum => {
                pos.fileName ++ "-" ++ (pos.startLine + lnum)->string_of_int
              })
            } else {
              [pos.fileName ++ "-" ++ pos.startLine->string_of_int]
            }
          }
          if pos.fileName != "" {
            React.useEffect(() => {
              ids->scrollTo
              None
            })
          }

          <>
            <div
              className=%twc(
                "inline-flex flex-row justify-center content-center items-center text-green font-bold"
              )>
              <Icon name="verified" />
              <Lang.String english="Definition applied" french=`Définition appliquée` />
            </div>
            <div className=%twc("font-bold text-primary") />
            {pos.lawHeadings
            ->Belt.Array.reverse
            ->Belt.Array.mapWithIndex((i, hd) => {
              <h3 className=%twc("font-bold text-secondary")>
                {(Js.String.repeat(i + 1, "#") ++ " " ++ hd)->React.string}
              </h3>
            })
            ->React.array}
            <a
              className={%twc("text-secondary font-mono")}
              href={Nav.navElemsToUrl(Some(Lang.getCurrentLang()), currentPage) ++ "#" ++ ids[0]}>
              {(pos.fileName ++
              " .l " ++
              pos.startLine->string_of_int ++
              "-" ++
              pos.endLine->string_of_int)->React.string}
            </a>
          </>
        | None => <> </>
        }

      | BeginCall =>
        {depth.current = depth.current + 1}
        <>
          <div className={%twc("text-sm border-t")}>
            <div className={%twc("font-mono text-sm")}>
              <CatalaCode>
                <Icon className=%twc("text-orange") name="flight_takeoff" />
                <CatalaCode.Ids ids={event.information} />
              </CatalaCode>
            </div>
          </div>
        </>
      | EndCall =>
        {depth.current = depth.current - 1}
        <>
          <div className={%twc("text-sm border-t")}>
            <div className={%twc("font-mono text-sm")}>
              <CatalaCode>
                <Icon className=%twc("text-orange") name="flight_land" />
                <CatalaCode.Ids ids={event.information} />
              </CatalaCode>
            </div>
          </div>
        </>
      }}
    </>
  }
}

module type LOGGABLE = {
  let pageTitle: React.element

  @react.component
  let make: (
    ~setRawEventsOpt: (option<array<rawEvent>> => option<array<rawEvent>>) => unit,
  ) => React.element
}

module Make = (Simulator: LOGGABLE) => {
  @react.component
  let make = (~currentPage: array<Nav.navElem>) => {
    let (rawEventsOpt: option<array<rawEvent>>, setRawEventsOpt) = React.useState(_ => None)
    let (logIndex, setLogIndex) = React.useState(_ => Navigation.Next(0))
    let depth = React.useRef(1)

    <>
      <Title>
        Simulator.pageTitle
        <p
          className=%twc(
            "text-2xl font-semibold italic font-sans rounded bg-purple_bg text-purple_text \
             px-2 ml-2 shadow-sm "
          )>
          {"Viz"->React.string}
        </p>
      </Title>
      {Simulator.make(Simulator.makeProps(~setRawEventsOpt, ()))}
      <div className=%twc("flex flex-col")>
        <div className=%twc("w-full h-full ")>
          <Section title={<Lang.String english="Log events" french=`Évènements de log` />}>
            <div
              className=%twc(
                "flex flex-col border-solid overflow-y-scroll max-h-128 border \
              border-gray rounded p-4 bg-gray_light"
              )>
              {switch rawEventsOpt {
              /* None | */ | Some(logEvents) =>
                let idx = logIndex->Navigation.getIndex
                switch (logEvents->Belt.Array.get(idx), logEvents->Belt.Array.get(idx + 1)) {
                | (Some(decision), Some(event)) => <>
                    <Navigation logIndex setLogIndex maxLogIndex={logEvents->Belt.Array.size} />
                    <Box>
                      <LogEvent depth currentPage event=decision />
                      <LogEvent depth currentPage event />
                    </Box>
                  </>
                | _ => <> </>
                }

              //TODO: make two case: for variable definition and function call

              | _ => <> </>
              }}
              /* | None => "Empty"->React.string */
            </div>
          </Section>
        </div>
        <div className=%twc("w-full h-full")>
          <Section title={<Lang.String english="Source code" french=`Code source` />}>
            <div
              className=%twc(
                "block max-h-80 overflow-y-scroll border-solid border-t border-b border-gray rounded mb-4"
              )>
              <div
                className="catala-code"
                dangerouslySetInnerHTML={
                  "__html": %raw(`require("../../assets/allocations_familiales.html")`),
                }
              />
            </div>
          </Section>
        </div>
      </div>
    </>
  }
}
