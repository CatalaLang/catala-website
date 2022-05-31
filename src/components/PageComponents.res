module Title = {
  @react.component
  let make = (~children) =>
    <h1
      className=%twc(
        "text-4xl my-4 shadow-none border-solid border-b-2 border-tertiary text-tertiary font-sans font-bold"
      )>
      children
    </h1>
}

module Section = {
  @react.component
  let make = (~title: React.element, ~children) =>
    <div>
      <h2 className=%twc("text-3xl my-4 font-sans")>
        <span className=%twc("border-solid border-b-2 border-secondary text-secondary font-sans")>
          title
        </span>
      </h2>
      children
    </div>
}
