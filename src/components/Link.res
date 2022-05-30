module Text = {
  @react.component
  let make = (~target: string, ~children) =>
    <a className=%twc("border-solid border-secondary border-b") href=target target="_blank">
      children
    </a>
}

module Internal = {
  module WithIcon = {
    @react.component
    let make = (
      ~className=%twc("cursor-pointer border-solid border-t-2 border-primary pt-2"),
      ~name="double_arrow",
      ~target: array<Nav.navElem>,
      ~children,
    ) => {
      let (lang, _) = React.useContext(Lang.langContext)
      <a className onClick={_ => Nav.goTo(target, lang)}>
        <div className=%twc("flex flex-row flex-nowrap items-center")>
          <Icon className="pr-2 material-icons text-primary" name />
          <span
            className=%twc(
              "uppercase text-primary border-solid border-secondary border-b hover:text-secondary"
            )>
            children
          </span>
        </div>
      </a>
    }
  }

  @react.component
  let make = (
    ~className=%twc("cursor-pointer border-solid border-secondary border-b"),
    ~target: array<Nav.navElem>,
    ~children,
  ) => {
    let (lang, _) = React.useContext(Lang.langContext)
    <a className onClick={_ => Nav.goTo(target, lang)}> children </a>
  }
}
