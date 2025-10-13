module Internal = {
  @react.component
  let make = (~target, ~children) => {
    let (lang, _) = React.useContext(Lang.langContext)
    <button
      className="cursor-pointer bg-button_bg py-2 px-4 text-button_fg text-base inline-flex items-center rounded font-semibold font-sans shadow-sm hover:bg-button_bg_hover hover:text-button_fg_hover ease-in duration-150 "
      onClick={_ => target->Nav.goTo(lang)}>
      children
    </button>
  }
}

module Small = {
  @react.component
  let make = (~style="", ~onClick, ~children) => {
    <button
      className={"cursor-pointer border bg-primary_light/80 text-sm p-1 px-2 text-button_fg font-medium  inline-flex items-center border-button_fg/30 font-sans hover:bg-primary_light hover:text-button_fg_hover ease-in duration-100 w-fit " ++
      style}
      onClick>
      children
    </button>
  }
}

@react.component
let make = (~onClick, ~children) => {
  <button
    className="cursor-pointer bg-button_bg py-2 px-4 text-button_fg text-base inline-flex items-center rounded font-semibold font-sans shadow-sm hover:bg-button_bg_hover hover:text-button_fg_hover ease-in duration-150 "
    onClick>
    children
  </button>
}
