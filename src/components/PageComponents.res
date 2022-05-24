module Title = {
  @react.component
  let make = (~children) =>
    <h1 className=%tw("text-3xl my-4 shadow-none")>
      <span className=%tw("border-solid border-b-2 border-tertiary text-tertiary")> children </span>
    </h1>
}

module Section = {
  @react.component
  let make = (~title: React.element, ~children) =>
    <div>
      <h2 className=%tw("text-2xl my-4")>
        <span className=%tw("border-solid border-b-2 border-secondary text-secondary")>
          title
        </span>
      </h2>
      children
    </div>
}
