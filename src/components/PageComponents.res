module Title = {
  @react.component
  let make = (~children) =>
    <h1
      className=%twc(
        "inline-flex flex-row flex-wrap justify-center items-center text-4xl \
        uppercase py-10 text-center font-sans font-bold shadow-none text-background"
      )>
      children
    </h1>
}

module Section = {
  @react.component
  let make = (~title: React.element, ~children) =>
    <div>
      <h2 className=%twc("text-3xl my-4 font-sans")>
        <span className=%twc("text-background font-sans font-semibold")> title </span>
      </h2>
      children
    </div>
}
