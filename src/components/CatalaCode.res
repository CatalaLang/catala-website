%raw(`import("../css/catala_code_extended.css")`)

let typesetMathJax: unit => unit = %raw(`
function typesetMathJax() {
    if (window.MathJax) {
      window.MathJax.typeset();
    }
  }
`)

module DangerouslySetInnerHtml = {
  @react.component
  let make = (~htmlFile) => {
    React.useEffect(() => {
      // This assumes MathJax to be loaded in the page. Necessary for the
      // LaTeX components of the Catala code to be typeset after any
      // change in the collapsible structure of the page.
      typesetMathJax()
      None
    })
    <RawHtml htmlFile={htmlFile} className="catala-code w-full" />
  }
}
module Span = {
  @react.component
  let make = (~kind, ~code) => {
    <span className={"text-" ++ kind}> {code->React.string} </span>
  }
}

module Collapsible = {
  @react.component
  let make = (~start, ~end, ~children) => {
    let (isOpen, setIsOpen) = React.useState(_ => false)
    let toggleButton = s => {
      <button
        href="#"
        className="cursor-pointer rounded font-semibold hover:bg-secondary hover:text-gray_light ease-out duration-150"
        onClick={_ => {
          setIsOpen(_ => !isOpen)
        }}>
        {s->React.string}
      </button>
    }
    <>
      start
      {if isOpen {
        <>
          {" - "->toggleButton}
          <br />
          children
        </>
      } else {
        <> {"..."->toggleButton} </>
      }}
      end
    </>
  }
}

module Ids = {
  @react.component
  let make = (~ids: array<string>) => {
    ids
    ->Belt.Array.mapWithIndex((i, s) => {
      <span key={"code-id-" ++ i->string_of_int}>
        {if i > 0 {
          <span className="op"> {"."->React.string} </span>
        } else {
          <> </>
        }}
        {if s == s->Js.String.toLowerCase {
          <span className="text-nv font-medium"> {s->React.string} </span>
        } else {
          <span className="text-nc font-bold"> {s->React.string} </span>
        }}
      </span>
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
  <div className="font-mono">
    <pre> children </pre>
  </div>
}
