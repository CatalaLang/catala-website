open PageComponents
open LogEvent

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
          onClick={_ => setLogIndex(_ => Prev(idx > 1 ? idx - 1 : 0))}>
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
          onClick={_ => setLogIndex(_ => Next(idx < maxLogIndex ? idx + 1 : 0))}>
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
    ~currentPage: array<Nav.navElem>,
    /* ~pos: sourcePosition, */
    ~event: Raw.event,
  ) => {
    ignore(currentPage)
    <>
      {switch event.eventType {
      /* | VarComputation(_var_def) => <> </> */
      /* | FunCall(_fun_call) => <> </> */
      /* | SubScopeCall(_sub_scope_call) => <> </> */
      /* }} */
      | VariableDefinition => <>
          <CatalaCode>
            <CatalaCode.Ids ids={event.information} />
            <CatalaCode.Op op={" : "} />
            <LoggedValue val=event.loggedValue />
          </CatalaCode>
        </>
      | DecisionTaken =>
        switch event.sourcePosition {
        | Some(pos) =>
          let ids = {
            if pos.start_line != pos.end_line {
              Belt.Array.makeBy(pos.end_line - pos.start_line + 1, lnum => {
                pos.filename ++ "-" ++ (pos.start_line + lnum)->string_of_int
              })
            } else {
              [pos.filename ++ "-" ++ pos.start_line->string_of_int]
            }
          }
          if pos.filename != "" {
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
            {pos.law_headings
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
              {(pos.filename ++
              " .l " ++
              pos.start_line->string_of_int ++
              "-" ++
              pos.end_line->string_of_int)->React.string}
            </a>
          </>
        | None => <> </>
        }

      | BeginCall => <>
          <div className={%twc("text-sm border-t")}>
            <div className={%twc("font-mono text-sm")}>
              <CatalaCode>
                <Icon className=%twc("text-orange") name="flight_takeoff" />
                <CatalaCode.Ids ids={event.information} />
              </CatalaCode>
            </div>
          </div>
        </>
      | EndCall => <>
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
  let make: (~setEventsOpt: (option<array<event>> => option<array<event>>) => unit) => React.element
}

module Make = (Simulator: LOGGABLE) => {
  @react.component
  let make = (~currentPage: array<Nav.navElem>) => {
    ignore(currentPage)
    let (eventsOpt: option<array<event>>, setEventsOpt) = React.useState(_ => None)
    let (logIndex, setLogIndex) = React.useState(_ => Navigation.Next(0))

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
      {Simulator.make(Simulator.makeProps(~setEventsOpt, ()))}
      <div className=%twc("flex flex-col")>
        <div className=%twc("w-full h-full ")>
          <Section title={<Lang.String english="Log events" french=`Évènements de log` />}>
            <div
              className=%twc(
                "flex flex-col border-solid overflow-y-scroll max-h-128 border \
              border-gray rounded p-4 bg-gray_light"
              )>
              {switch eventsOpt {
              | Some(logEvents) =>
                let idx = logIndex->Navigation.getIndex
                switch logEvents->Belt.Array.get(idx) {
                | Some(event) => <>
                    <Navigation logIndex setLogIndex maxLogIndex={logEvents->Belt.Array.size} />
                    {switch event {
                    | VarComputation(_var_def) => "VarComputation"
                    | FunCall(_fun_call) => "FunCall"
                    | SubScopeCall(_sub_scope_call) => "SubScopeCall"
                    }->React.string}
                  </>
                /* <Box> */
                /* <LogEvent currentPage event=decision /> <LogEvent currentPage event /> */
                /* </Box> */
                | _ => <> </>
                }
              | _ => <> </>
              }}
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
