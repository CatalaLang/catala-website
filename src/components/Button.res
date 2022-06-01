module Internal = {
  @react.component
  let make = (~target, ~children) => {
    let lang = Lang.getCurrentLang()
    <button
      className=%twc(
        "cursor-pointer bg-button_bg py-2 px-4 text-button_fg text-base inline-flex \
      items-center rounded font-semibold font-sans shadow-sm \
      hover:bg-button_bg_hover hover:text-button_fg_hover"
      )
      onClick={_ => target->Nav.goTo(lang)}>
      children
    </button>
  }
}

module Small = {
  @react.component
  let make = (~style="", ~onClick, ~children) => {
    <button
      className={%twc(
        "cursor-pointer bg-button_bg px-1 text-button_fg text-base inline-flex \
      items-center rounded font-semibold font-sans shadow-sm \
      hover:bg-button_bg_hover hover:text-button_fg_hover \
      focus:bg-button_fg focus:text-button_bg "
      ) ++
      style}
      onClick>
      children
    </button>
  }
}

@react.component
let make = (~onClick, ~children) => {
  <button
    className=%twc(
      "cursor-pointer bg-button_bg py-2 px-4 text-button_fg text-base inline-flex \
      items-center rounded font-semibold font-sans shadow-sm \
      hover:bg-button_bg_hover hover:text-button_fg_hover"
    )
    onClick>
    children
  </button>
}
