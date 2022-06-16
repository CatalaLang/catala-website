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
