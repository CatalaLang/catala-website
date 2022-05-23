module Text = {
  @react.component
  let make = (~target: string, ~children) =>
    <a className=%tw("border-solid border-secondary border-b") href=target target="_blank">
      children
    </a>
}

module Internal = {
  module WithArrow = {
    @react.component
    let make = (~withArrow=true, ~target: array<Nav.navElem>, ~children) => {
      let (lang, _) = React.useContext(Lang.langContext)
      <a
        className=%tw("cursor-pointer border-solid border-t-2 border-primary pt-2")
        onClick={_ => Nav.goTo(target, lang)}>
        {if withArrow {
          <div className=%tw("flex flex-row flex-nowrap items-center")>
            <i className="pr-2 material-icons text-primary"> {"double_arrow" |> React.string} </i>
            <span
              className=%tw(
                "uppercase text-primary border-solid border-secondary border-b hover:text-secondary"
              )>
              children
            </span>
          </div>
        } else {
          children
        }}
      </a>
    }
  }

  @react.component
  let make = (~target: array<Nav.navElem>, ~children) => {
    let (lang, _) = React.useContext(Lang.langContext)
    <a
      className=%tw("cursor-pointer border-solid border-secondary border-b")
      onClick={_ => Nav.goTo(target, lang)}>
      children
    </a>
  }
}
