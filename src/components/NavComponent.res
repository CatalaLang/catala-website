module Style = {
  module NavElem = {
    let link_base = "!text-black hover:!border-none cursor-pointer hover:!text-button_fg px-2 py-1 "
    let link_inactive = link_base
    let link_active = link_base ++ "font-semibold !text-button_fg"
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
        {"FR"->React.string}
      </a>
      <a
        className={style ++ " border-r" ++ (oldLang == English ? " bg-primary_light" : "")} onClick>
        {"EN"->React.string}
      </a>
    </div>
  }
}

module NavElem = {
  @react.component
  let make = (~title: React.element, ~target: array<Nav.navElem>, ~mobile=false) => {
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

    let style = if mobile {
      style ++ " text-2xl mb-2"
    } else {
      style
    }

    <>
      <Link.Internal target className={style}> title </Link.Internal>
    </>
  }
}

let navElems = (~mobile=false) => <>
  <NavElem
    mobile
    title={<Lang.String english="About" french={`À propos`} />}
    target={[Nav.home, Nav.about]}
  />
  <NavElem
    mobile
    title={<Lang.String english="Features" french={`Fonctionnalités`} />}
    target={[Nav.home, Nav.features]}
  />
  <NavElem
    mobile
    title={<Lang.String english="Documentation" french={`Documentation`} />}
    target={[Nav.home, Nav.doc]}
  />
  <NavElem
    mobile
    title={<Lang.String english="Seminars" french={`Séminaires`} />}
    target={[Nav.home, Nav.seminar]}
  />
</>

@react.component
let make = () => {
  let (isMenuOpen, setIsMenuOpen) = React.useState(_ => false)

  <div className="w-full bg-white border-b border-stone-300 top-0 sticky z-10 py-1 px-4">
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
            {navElems(~mobile=false)}
          </div>
          <SwitchLang />
          <button
            className="cursor-pointer inline-flex self-center hover:text-primary_light ml-4 sm:hidden"
            onClick={_ => setIsMenuOpen(_ => !isMenuOpen)}>
            {isMenuOpen
              ? <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round">
                  <line x1="18" y1="6" x2="6" y2="18" />
                  <line x1="6" y1="6" x2="18" y2="18" />
                </svg>
              : <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round">
                  <path d="M4 5h16" />
                  <path d="M4 12h16" />
                  <path d="M4 19h16" />
                </svg>}
          </button>
        </div>
      </div>
      {if isMenuOpen {
        <div
          className="inline-flex flex-col justify-center items-center mx-auto pl-2 pb-2 ease-in h-screen overflow-y-hidden"
          onClick={_ => setIsMenuOpen(_ => !isMenuOpen)}>
          {navElems(~mobile=true)}
        </div>
      } else {
        <> </>
      }}
    </Flex.Column.AlignLeft>
  </div>
}
