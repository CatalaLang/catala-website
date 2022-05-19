module Text = {
  @react.component
  let make = (~target: string, ~children) =>
    <a className=%tw("border-solid border-secondary border-b") href=target target="_blank">
      children
    </a>
}

module Internal = {
  @react.component
  let make = (~target: array<Nav.nav_elem>, ~children) => {
    let (lang, _) = React.useContext(Lang.langContext)
    <a
      className=%tw("cursor-pointer border-solid border-secondary border-b")
      onClick={Nav.go_to(target, lang)}>
      children
    </a>
  }
}
