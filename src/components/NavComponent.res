module Style = {
  module SwitchLang = {
    let link = %twc(
      "px-2 cursor-pointer text-tertiary uppercase font-semibold pr-4 \
      hover:text-primary_light"
    )
  }
  module NavElem = {
    let link_base = %twc(
      "inline-flex block px-2 font-semibold text-base cursor-pointer hover:text-primary_light "
    )
    let link_inactive = link_base ++ %twc("text-tertiary")
    let link_active = link_base ++ %twc("text-primary_light")
  }

  let nav_container = %twc("w-full justify-between bg-background top-0")
  let nav_logo_container = %twc(
    "py-2 h-full flex flex-row flex-nowrap items-center justify-center text-text_light \
    pl-4 text-3xl font-sans font-bold \
    hover:text-primary_light"
  )
  let logo_hover_opacity = %twc("opacity-75 hover:opacity-100")
  let img_hover_oppacity = logo_hover_opacity ++ %twc(" h-5 pr-4")
}

module SwitchLang = {
  @react.component
  let make = _ => {
    let (old_lang, setLang) = React.useContext(Lang.langContext)
    let url = ReasonReactRouter.useUrl()
    <a
      className=Style.SwitchLang.link
      onClick={_ => {
        let (_, navs) = Nav.urlToNavElem(url)
        setLang()
        let new_lang = Lang.new_lang_from_old_lang(old_lang)
        Nav.goTo(navs, new_lang)
      }}>
      <Lang.String french="En" english=`Fr` />
    </a>
  }
}

module NavElem = {
  @react.component
  let make = (~title: React.element, ~target: array<Nav.navElem>) => {
    let (_, currentElems) = ReasonReactRouter.useUrl()->Nav.urlToNavElem
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

    <> <Link.Internal target className={style}> title </Link.Internal> </>
  }
}

type imgLocation = {default: string}

let logo: imgLocation = %raw("require('../../assets/logo.png')")
let github: imgLocation = %raw("require('../../assets/GitHub-Mark-Light-32px.png')")

@react.component
let make = () => {
  <Flex.Row.Center style=Style.nav_container>
    <Link.Internal
      className={Style.nav_logo_container ++ %twc(" cursor-pointer")} target=[Nav.home]>
      <img className=%twc("h-8 pr-4") src={"/" ++ logo.default} />
      <Lang.String english="Catala" french=`Catala` />
    </Link.Internal>
    <Flex.Row.Center>
      <NavElem
        title={<Lang.String english="About" french=`À propos` />} target={[Nav.home, Nav.about]}
      />
      <NavElem
        title={<Lang.String english="Examples" french=`Exemples` />}
        target={[Nav.home, Nav.examples]}
      />
      <NavElem title={<Lang.String english="Doc" french=`Doc` />} target={[Nav.home, Nav.doc]} />
      <NavElem
        title={<Lang.String english="Publications" french=`Publications` />}
        target={[Nav.home, Nav.publications]}
      />
      <NavElem
        title={<Lang.String english="Formalisation" french=`Formalisation` />}
        target={[Nav.home, Nav.formalization]}
      />
    </Flex.Row.Center>
    <Flex.Row.Center>
      <SwitchLang />
      <a href="https://github.com/CatalaLang/catala" target="_blank">
        <img className=Style.img_hover_oppacity src={"/" ++ github.default} />
      </a>
      <a
        className=%twc("cursor-pointer pr-4") href="https://zulip.catala-lang.org/" target="_blank">
        <svg
          className=Style.logo_hover_opacity
          xmlns="http://www.w3.org/2000/svg"
          ariaHidden=true
          role="img"
          width="1.25em"
          height="1.25em"
          preserveAspectRatio="xMidYMid meet"
          viewBox="0 0 256 256">
          <defs>
            <linearGradient id="svgIDa" x1="50%" x2="50%" y1="0%" y2="100%">
              <stop offset="0%" stopColor="#24ADFF" /> <stop offset="100%" stopColor="#7B71FF" />
            </linearGradient>
          </defs>
          <path
            fill="url(#svgIDa)"
            d="M128 0c70.692 0 128 57.308 128 128c0 70.692-57.308 128-128 128C57.308 256 0 198.692 0 128C0 57.308 57.308 0 128 0Zm-6.32 118.222l-45.892 40.979c-4.728 3.72-7.83 9.86-7.83 16.766c0 11.279 8.274 20.508 18.386 20.508h86.247c10.112 0 18.386-9.23 18.386-20.508c0-11.28-8.274-20.507-18.386-20.507H107.3c-.968 0-1.58-1.16-1.108-2.104l16.833-33.703c.615-.983-.493-2.161-1.345-1.43Zm50.91-58.86H86.345c-10.112 0-18.386 9.227-18.386 20.508c0 11.279 8.274 20.508 18.386 20.508h65.292c.968 0 1.58 1.16 1.108 2.103l-16.834 33.704c-.615.983.494 2.161 1.346 1.43l45.892-40.984c4.727-3.723 7.829-9.86 7.829-16.767c0-11.278-8.274-20.507-18.386-20.501Z"
          />
        </svg>
      </a>
    </Flex.Row.Center>
  </Flex.Row.Center>
}
