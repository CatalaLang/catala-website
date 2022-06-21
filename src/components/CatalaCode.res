module DangerouslySetInnerHtml = {
  @react.component
  let make = (~html) => {
    <div
      className={%twc("border-gray rounded border") ++ " catala-code"}
      dangerouslySetInnerHTML={
        "__html": html,
      }
    />
  }
}
module Span = {
  @react.component
  let make = (~kind, ~code) => {
    <span className={"text-" ++ kind}> {code->React.string} </span>
  }
}

module Ids = {
  @react.component
  let make = (~ids: array<string>) => {
    //TODO: could be improved.
    ids
    ->Belt.Array.mapWithIndex((i, s) => {
      <>
        {if i > 0 {
          <span className="op"> {"."->React.string} </span>
        } else {
          <> </>
        }}
        {if s == s->Js.String.toLowerCase {
          <span className=%twc("text-nv font-medium")> {s->React.string} </span>
        } else {
          <span className=%twc("text-nc font-bold")> {s->React.string} </span>
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
  <div className=%twc("font-mono")> <pre> children </pre> </div>
}
