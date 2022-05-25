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
  // NOTE: a lost of precision could be a problem here
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

module type LOGGABLE = {
  @react.component
  let make: (
    ~setLogEventsOpt: (option<array<logEvent>> => option<array<logEvent>>) => unit,
  ) => React.element
}

module Make = (Simulator: LOGGABLE) => {
  @react.component
  let make = () => {
    let (logEventsOpt: option<array<logEvent>>, setLogEventsOpt) = React.useState(_ => None)
    <>
      <Title>
        <Lang.String
          english="Execution trace visualization tool"
          french=`Outil de visualisation de la trace d'exécution`
        />
      </Title>
      {Simulator.make(Simulator.makeProps(~setLogEventsOpt, ()))}
      <div className=%tw("grid grid-cols-2 grid-rows-1 gap-4 h-full w-full")>
        <div className=%tw("w-full h-full")>
          <Section title={<Lang.String english="Source code" french=`Code source` />}>
            <div
              className="catala-code"
              dangerouslySetInnerHTML={
                "__html": %raw(`require("../../assets/allocations_familiales.html")`),
              }
            />
          </Section>
        </div>
        <div className=%tw("w-full h-full")>
          <Section title={<Lang.String english="Log events" french=`Évènements de log` />}>
            {switch logEventsOpt {
            | None =>
              Js.log("No log events")
              ["Empty"->React.string]
            | Some(logEvts) =>
              Js.log("Log events")
              logEvts->Belt.Array.map(evt => evt.loggedValue->loggedValueToString(0)->React.string)
            }->React.array}
          </Section>
        </div>
      </div>
    </>
  }
}
