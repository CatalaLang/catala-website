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

type logEvent = {
  eventType: string,
  information: array<string>,
  sourcePosition: Js.Nullable.t<sourcePosition>,
  loggedValueJson: array<loggedValue>,
}

let rec logValue = (val: loggedValue, tab: int) => {
  Js.log(Js.String.repeat(tab, "\t"))
  switch val {
  | Unit => Js.log("Unit")
  | Bool(b) => Js.log("Bool: " ++ string_of_bool(b))
  | Money(f) => Js.log("Money: " ++ Js.Float.toString(f))
  | Integer(i) => Js.log("Integer: " ++ string_of_int(i))
  | Decimal(f) => Js.log("Decimal: " ++ Js.Float.toString(f))
  | Date(d) => Js.log("Date: " ++ d)
  | Duration(d) => Js.log("Duration: " ++ d)
  | Enum(ls, (s, vals)) =>
    Js.log("Enum[" ++ String.concat(",", ls) ++ "]:" ++ s ++ "\n")
    vals->logValue(tab + 1)
  | _ => Js.log("Other")
  }
}
module type Simulable = {
  module type Simulator = {
    let makeProps: (~key: string=?, unit) => {.}
    let make: {.} => React.element
  }
}

/* module Make = (S: Simulable) => { */
/* @react.component */
/* let make = () => { */
/* <> */
/* <Title> */
/* <Lang.String */
/* english="Execution trace visualization tool" */
/* french=`Outil de visualisation de la trace d'exécution` */
/* /> */
/* </Title> */
/* <S.Simulator /> */
/* </> */
/* } */
/* } */

@react.component
let make = (~simulator: React.element) => {
  <>
    <Title>
      <Lang.String
        english="Execution trace visualization tool"
        french=`Outil de visualisation de la trace d'exécution`
      />
    </Title>
    simulator
  </>
}
