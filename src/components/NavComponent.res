module Style = {
  module NavElem = {
    let link_base = "!text-black hover:!border-none cursor-pointer hover:!text-button_fg hover:bg-primary_light/25 px-2 py-1 transition-colors duration-200 ease-out "
    let link_inactive = link_base
    let link_active = link_base ++ "!text-button_fg bg-primary_light/25"
  }

  let logo_hover_opacity = "opacity-75 hover:opacity-100"
  let img_hover_oppacity = logo_hover_opacity ++ " h-5 pr-4"
}

module SwitchLang = {
  @react.component
  let make = _ => {
    let (oldLang, setLang) = React.useContext(Lang.langContext)
    let url = RescriptReactRouter.useUrl()
    let onClick = _ => {
      let (_, navs) = Nav.urlToNavElem(url)
      setLang()
      let newLang = Lang.newLangFromOldLang(oldLang)
      Nav.goTo(navs, newLang)
    }
    let style = "cursor-pointer text-button_fg px-2 text-sm border-y border-button_fg/50 hover:bg-primary_light/50"
    <div className="">
      <a className={style ++ " border-x" ++ (oldLang == French ? " bg-primary_light" : "")} onClick>
        {"fr"->React.string}
      </a>
      <a
        className={style ++ " border-r" ++ (oldLang == English ? " bg-primary_light" : "")} onClick>
        {"en"->React.string}
      </a>
    </div>
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

let navElems =
  <>
    <NavElem
      title={<Lang.String english="About" french={`À propos`} />} target={[Nav.home, Nav.about]}
    />
    <NavElem
      title={<Lang.String english="Features" french={`Fonctionnalités`} />}
      target={[Nav.home, Nav.features]}
    />
    <NavElem
      title={<Lang.String english="Documentation" french={`Documentation`} />}
      target={[Nav.home, Nav.doc]}
    />
    <NavElem
      title={<Lang.String english="Seminars" french={`Séminaires`} />}
      target={[Nav.home, Nav.seminar]}
    />
  </>

@react.component
let make = () => {
  let (isMenuOpen, setIsMenuOpen) = React.useState(_ => false)

  <div className="w-full bg-white border-b border-stone-300 top-0 sticky z-10 py-1">
    <Flex.Column.AlignLeft style="max-w-6xl mx-auto">
      <div className="w-full inline-flex flex-row items-center justify-between px-4 md:px-0">
        <Link.Internal
          className={"py-2 h-full !text-black cursor-pointer inline-flex flex-row flex-nowrap items-center justify-start text-lg font-sans font-semibold hover:!text-primary_dark sm:col-span-1 border-none"}
          target=[Nav.home]>
          <img className="h-6 pr-2" src={Assets.Image.logo_catala} />
          <Lang.String english="Catala" french={`Catala`} />
        </Link.Internal>
        <div className="inline-flex flex-row justify-end items-center">
          <div
            className="hidden text-sm sm:mr-4 sm:inline-flex sm:flex-row sm:justify-center sm:items-center sm:gap-1">
            navElems
          </div>
          <SwitchLang />
          <button
            className="inline-flex self-center hover:text-primary_light mr-4 sm:hidden"
            onClick={_ => setIsMenuOpen(_ => !isMenuOpen)}>
            <Icon name="menu" />
          </button>
        </div>
      </div>
      {if isMenuOpen {
        <div
          className="inline-flex flex-col justify-center pl-2 pb-2 ease-in"
          onClick={_ => setIsMenuOpen(_ => !isMenuOpen)}>
          navElems
        </div>
      } else {
        <> </>
      }}
    </Flex.Column.AlignLeft>
  </div>
}
