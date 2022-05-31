open PageComponents

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

type eventType =
  | BeginCall
  | EndCall
  | VariableDefinition
  | DecisionTaken

type logEventRaw = {
  eventType: string,
  information: array<string>,
  sourcePosition: Js.Nullable.t<sourcePosition>,
  loggedValueJson: string,
}

type logEvent = {
  eventType: eventType,
  information: array<string>,
  sourcePosition: option<sourcePosition>,
  loggedValue: loggedValue,
}

let eventTypeFromString = (str: string): eventType => {
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

let fromRaw = (rawLogEvents: array<logEventRaw>) => {
  rawLogEvents->Belt.Array.map((rawLogEvent: logEventRaw) => {
    let loggedValue = try {
      switch loggedValue_decode(Js.Json.parseExn(rawLogEvent.loggedValueJson)) {
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
      eventType: rawLogEvent.eventType->eventTypeFromString,
      information: rawLogEvent.information,
      sourcePosition: rawLogEvent.sourcePosition->Js.Nullable.toOption,
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
      | Enum(ls, (_s, Unit)) => <CatalaCode.Ids ids={ls->Belt.List.toArray} />
      | Enum(ls, (_s, val)) => <>
          <CatalaCode.Op op={Js.String.repeat(depth * 2, " ")} />
          <CatalaCode.Ids ids={ls->Belt.List.toArray} />
          <CatalaCode.Op op=" = " />
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
module LogEvent = {
  @react.component
  let make = (~depth: React.ref<int>, ~currentPage: array<Nav.navElem>, ~event: logEvent) => {
    <>
      {switch event.eventType {
      | VariableDefinition => <>
          <div>
            <div className={%twc("font-mono text-sm")}>
              <CatalaCode>
                <CatalaCode.Ids ids={event.information} />
                <CatalaCode.Op op={" = "} />
                <LoggedValue depth=depth.current val=event.loggedValue />
              </CatalaCode>
            </div>
          </div>
        </>
      | DecisionTaken =>
        switch event.sourcePosition {
        | Some(pos) => <>
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
              href={Nav.navElemsToUrl(Some(Lang.getCurrentLang()), currentPage) ++
              "#" ++
              pos.fileName ++
              "-" ++
              pos.startLine->string_of_int}>
              {pos.fileName->React.string}
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

module Navigation = {
  type index =
    | Prev(int)
    | Next(int)

  let getIndex = idx => {
    switch idx {
    | Next(idx) | Prev(idx) => idx
    }
  }

  let buttonStyle = %twc("text-secondary py-1 px-2")

  @react.component
  let make = (~logIndex, ~setLogIndex, ~maxLogIndex) => {
    let idx = logIndex->getIndex
    <>
      <div className=%twc("inline-flex flex-row justify-center content-center text-2xl font-sans")>
        <button className=buttonStyle onClick={_ => setLogIndex(_ => Prev(idx > 2 ? idx - 2 : 0))}>
          <Icon name="arrow_circle_left" />
        </button>
        <div className=%twc("font-bold")>
          <Lang.String
            english={"Step: [ " ++ idx->string_of_int ++ "/" ++ maxLogIndex->string_of_int ++ " ]"}
            french={`Étape [ ` ++ idx->string_of_int ++ "/" ++ maxLogIndex->string_of_int ++ " ]"}
          />
        </div>
        <button
          className=buttonStyle
          onClick={_ => setLogIndex(_ => Next(idx < maxLogIndex ? idx + 2 : 0))}>
          <Icon name="arrow_circle_right" />
        </button>
      </div>
    </>
  }
}

module type LOGGABLE = {
  @react.component
  let make: (
    ~setLogEventsOpt: (option<array<logEvent>> => option<array<logEvent>>) => unit,
  ) => React.element
}

module Make = (Simulator: LOGGABLE) => {
  @react.component
  let make = (~currentPage: array<Nav.navElem>) => {
    let (logEventsOpt: option<array<logEvent>>, setLogEventsOpt) = React.useState(_ => None)
    let (logIndex, setLogIndex) = React.useState(_ => Navigation.Next(0))
    let depth = React.useRef(1)

    <>
      <Title>
        <Lang.String
          english="Execution trace visualization tool"
          french=`Outil de visualisation de la trace d'exécution`
        />
      </Title>
      {Simulator.make(Simulator.makeProps(~setLogEventsOpt, ()))}
      <div className=%twc("flex flex-col")>
        <div className=%twc("w-full h-full ")>
          <Section title={<Lang.String english="Log events" french=`Évènements de log` />}>
            {switch logEventsOpt {
            | Some(logEvts) =>
              let idx = logIndex->Navigation.getIndex
              switch (logEvts->Belt.Array.get(idx), logEvts->Belt.Array.get(idx + 1)) {
              | (Some(decision), Some(event)) =>
                // Each log event is preceded by a [DecisionTaken] event
                <div className=%twc("flex flex-col")>
                  <Navigation logIndex setLogIndex maxLogIndex={logEvts->Belt.Array.size} />
                  <div
                    className=%twc(
                      "border-solid overflow-y-scroll max-h-128 border-2 border-secondary rounded p-4"
                    )>
                    {<>
                      <LogEvent depth currentPage event=decision />
                      <LogEvent depth currentPage event />
                    </>}
                  </div>
                </div>

              | _ => <> </>
              }
            | None => "Empty"->React.string
            }}
          </Section>
        </div>
        <div className=%twc("w-full h-full")>
          <Section title={<Lang.String english="Source code" french=`Code source` />}>
            <div
              className=%twc(
                "block max-h-128 overflow-y-scroll border-solid border-2 border-secondary rounded p-4 mb-4"
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
