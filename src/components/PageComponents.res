module Title = {
  @react.component
  let make = (~children) => <h1 className="mt-16 mb-8"> children </h1>
}

module Section = {
  @react.component
  let make = (~title: React.element, ~id: string, ~className="", ~children) =>
    <section className={"px-4 md:px-8 " ++ className}>
      <h2 id>
        <a href={"#" ++ id}> title </a>
      </h2>
      children
    </section>
}

module SubSection = {
  @react.component
  let make = (~title: React.element, ~className="", ~children) =>
    <section className>
      <h3> title </h3>
      children
    </section>
}

module Highlight = {
  @react.component
  let make = (
    ~src: string,
    ~className="flex flex-col h-full justify-between not-md:not-last:border-b md:not-last:border-r border-border",
    ~children,
  ) =>
    <figure className={className}>
      <img
        style={ReactDOM.Style.make(~objectFit="contain", ())} className="max-h-28 p-4" src={src}
      />
      <figcaption className="border-t border-border border-dashed px-4 py-2 text-sm">
        children
      </figcaption>
    </figure>

  module Large = {
    @react.component
    let make = (
      ~src: string,
      ~className="flex flex-col h-full justify-between not-md:not-last:border-b md:not-last:border-r border-border",
      ~children,
    ) =>
      <figure className={className}>
        <img
          style={ReactDOM.Style.make(~objectFit="contain", ())} className="max-h-40 p-4" src={src}
        />
        <figcaption className="border-t border-dashed border-border px-4 py-2 text-sm text-center">
          children
        </figcaption>
      </figure>
  }
}
