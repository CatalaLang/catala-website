module Style = {
  module SwitchLang = {
    let link = %twc(
      "px-2 cursor-pointer text-tertiary uppercase font-semibold pr-4 hover:text-primary_light"
    )
  }
  module NavElem = {
    let link_base = %twc(
      "inline-flex block px-2 font-semibold text-base cursor-pointer hover:text-primary_light "
    )
    let link_inactive = link_base ++ %twc("text-tertiary")
    let link_active = link_base ++ %twc("text-primary_light")
  }

  let logo_hover_opacity = %twc("opacity-75 hover:opacity-100")
  let img_hover_oppacity = logo_hover_opacity ++ %twc(" h-5 pr-4")
}

module SwitchLang = {
  @react.component
  let make = _ => {
    let (oldLang, setLang) = React.useContext(Lang.langContext)
    let url = RescriptReactRouter.useUrl()
    <a
      className=Style.SwitchLang.link
      onClick={_ => {
        let (_, navs) = Nav.urlToNavElem(url)
        setLang()
        let newLang = Lang.newLangFromOldLang(oldLang)
        Nav.goTo(navs, newLang)
      }}>
      <Lang.String french="En" english={`Fr`} />
    </a>
  }
}

module NavElem = {
  @react.component
  let make = (~title: React.element, ~target: array<Nav.navElem>) => {
    let (_, currentElems) = RescriptReactRouter.useUrl()->Nav.urlToNavElem
    let currentElems = {
      let currElemSize = currentElems->Belt.Array.size
      let targetSize = target->Belt.Array.size
      if targetSize <= currElemSize {
        currentElems->Belt.Array.truncateToLengthUnsafe(targetSize)
      }
      currentElems
    }
    let style = if 0 == currentElems->Belt.Array.cmp(target, Nav.cmp) {
      Style.NavElem.link_active
    } else {
      Style.NavElem.link_inactive
    }

    <>
      <Link.Internal target className={style}> title </Link.Internal>
    </>
  }
}

type imgLocation = {default: string}

let logo: imgLocation = %raw("require('../../assets/logo.png')")
let github: imgLocation = %raw("require('../../assets/GitHub-Mark-Light-32px.png')")

let navElems =
  <>
    <NavElem
      title={<Lang.String english="Features" french={`Fonctionnalités`} />}
      target={[Nav.home, Nav.features]}
    />
    <NavElem
      title={<Lang.String english="Documentation" french={`Documentation`} />}
      target={[Nav.home, Nav.doc]}
    />
    <NavElem
      title={<Lang.String english="Seminar" french={`Séminaire`} />}
      target={[Nav.home, Nav.seminar]}
    />
    <NavElem
      title={<Lang.String english="About" french={`À propos`} />} target={[Nav.home, Nav.about]}
    />
  </>

@react.component
let make = () => {
  let (isMenuOpen, setIsMenuOpen) = React.useState(_ => false)

  <Flex.Column.AlignLeft style=%twc("w-full bg-background top-0 sticky z-10 shadow-md")>
    <div
      className=%twc(
        "w-full inline-flex flex-row justify-between sm:inline-grid sm:grid-cols-5 sm:grid-flow-row  "
      )>
      <div>
        <Link.Internal
          className={%twc(
            "py-2 h-full cursor-pointer inline-flex flex-row flex-nowrap items-center justify-start text-text_light pl-4 text-2xl font-sans font-bold hover:text-primary_light sm:col-span-1"
          )}
          target=[Nav.home]>
          <img className=%twc("h-8 pr-2") src={logo.default} />
          <Lang.String english="Catala" french={`Catala`} />
        </Link.Internal>
      </div>
      <div
        className=%twc(
          "hidden sm:inline-flex sm:flex-row sm:justify-center sm:items-center sm:col-span-3"
        )>
        navElems
      </div>
      <div className=%twc("inline-flex flex-row self-center sm:col-span-1 sm:justify-end")>
        <SwitchLang />
        <button
          className=%twc(
            "inline-flex text-text_light self-center hover:text-primary_light mr-4 sm:hidden"
          )
          onClick={_ => setIsMenuOpen(_ => !isMenuOpen)}>
          <Icon name="menu" />
        </button>
      </div>
    </div>
    {if isMenuOpen {
      <div
        className=%twc("inline-flex flex-col justify-center pl-2 pb-2 ease-in")
        onClick={_ => setIsMenuOpen(_ => !isMenuOpen)}>
        navElems
      </div>
    } else {
      <> </>
    }}
  </Flex.Column.AlignLeft>
}
