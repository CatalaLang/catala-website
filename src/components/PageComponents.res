module Title = {
  @react.component
  let make = (~children) =>
    <h1
      className="inline-flex flex-row flex-wrap justify-center items-center text-4xl uppercase pt-20 pb-8 text-center font-sans font-bold shadow-none text-background">
      children
    </h1>
}

module Section = {
  @react.component
  let make = (~title: React.element, ~id: string, ~children) => <>
    <h2 className="text-3xl my-8 font-sans" id>
      <a href={"#" ++ id} className="text-background font-sans font-semibold"> title </a>
    </h2>
    children
  </>
}

module SubSection = {
  @react.component
  let make = (~title: React.element, ~children) => <>
    <h3 className="text-2xl my-4 font-sans">
      <span className="text-background font-sans font-semibold"> title </span>
    </h3>
    children
  </>
}

module Highlight = {
  @react.component
  let make = (~src: string, ~children) =>
    <figure className="flex flex-col items-center m-8">
      <img
        style={ReactDOM.Style.make(~objectFit="contain", ())} className="w-64 max-h-32" src={src}
      />
      <figcaption className="mt-4 text-center"> children </figcaption>
    </figure>
}
