module Text = {
  @react.component
  let make = (
    ~className=%twc("border-solid border-green border-b hover:text-green ease-in duration-100 "),
    ~target: string,
    ~children,
  ) => <a className href=target target="_blank"> children </a>
}

module Button = {
  module Small = {
    @react.component
    let make = (
      ~className=%twc(
        "cursor-pointer bg-button_bg mt-8 mb-4 p-2 text-button_fg text-base inline-flex \
        items-center rounded font-semibold font-sans shadow-sm \
        hover:bg-button_bg_hover hover:text-button_fg_hover ease-in duration-100 "
      ),
      ~target: string,
      ~children,
    ) => {
      <Text className target> children </Text>
    }
  }

  @react.component
  let make = (
    ~className=%twc(
      "cursor-pointer bg-button_bg mt-4 mb-4 p-3 text-button_fg text-xl inline-flex \
          items-center rounded font-semibold font-sans shadow-sm \
          hover:bg-button_bg_hover hover:text-button_fg_hover ease-in duration-100 "
    ),
    ~target: string,
    ~children,
  ) => {
    <Text className target> children </Text>
  }
}

module Internal = {
  module WithIcon = {
    @react.component
    let make = (
      ~className=%twc("cursor-pointer pt-2"),
      ~name="double_arrow",
      ~target: array<Nav.navElem>,
      ~children,
    ) => {
      let lang = Lang.getCurrentLang()
      <a className onClick={_ => Nav.goTo(target, lang)}>
        <div className=%twc("flex flex-row flex-nowrap items-center text-green")>
          <Icon className="pr-2" name />
          <span className=%twc("uppercase hover:text-secondary")> children </span>
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
    let lang = Lang.getCurrentLang()
    <a className onClick={_ => Nav.goTo(target, lang)}> children </a>
  }
}
