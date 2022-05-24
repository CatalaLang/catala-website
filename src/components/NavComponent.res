module NavElem = {
  @react.component
  let make = (~elements: array<Nav.navElem>) => {
    let (lang, _) = React.useContext(Lang.langContext)
    <a
      className=%tw("cursor-pointer text-white uppercase p-4")
      onClick={_ => Nav.goTo(elements, lang)}>
      {Belt.Array.getExn(elements, Belt.Array.length(elements) - 1).text}
    </a>
  }
}

module NavBar = {
  @react.component
  let make = (~elements: array<Nav.navElem>) =>
    <div className=%tw("h-full py-2 flex flex-row flex-wrap content-center bg-tertiary shadow")>
      {elements->Belt.Array.reduceWithIndex(<div />, (acc, _, i) => <>
        acc
        <div key={string_of_int(i)}>
          {if i != 0 {
            <i className="float-left pr-1 text-primary material-icons">
              {React.string("chevron_right")}
            </i>
          } else {
            <i />
          }}
          <NavElem elements={elements->Belt.Array.slice(~offset=0, ~len=i + 1)} />
        </div>
      </>)}
    </div>
}

module SwitchLang = {
  @react.component
  let make = _ => {
    let (old_lang, setLang) = React.useContext(Lang.langContext)
    let url = ReasonReactRouter.useUrl()
    <a
      className=%tw(
        "py-2 h-full flex flex-row flex-wrap content-center bg-tertiary shadow px-4 cursor-pointer text-white uppercase"
      )
      onClick={_ => {
        let (_, navs) = Nav.urlToNavElem(url)
        setLang()
        let new_lang = Lang.new_lang_from_old_lang(old_lang)
        Nav.goTo(navs, new_lang)
      }}>
      <Lang.String french="English" english=`Français` />
    </a>
  }
}

type imgLocation = {default: string}

let logo: imgLocation = %raw("require('../../assets/logo.png')")

@react.component
let make = () => {
  let url = ReasonReactRouter.useUrl()
  let back_to_home_button = {
    let (_lang, elements) = Nav.urlToNavElem(url)
    <NavBar elements />
  }
  <div className=%tw("grid grid-cols-1 md:grid-cols-3 w-full bg-secondary top-0")>
    <div
      className=%tw(
        "py-2 h-full flex flex-row items-center justify-center md:justify-start pl-4 text-3xl md:text-2xl lg:text-xl text-white"
      )>
      <Link.Internal target=[Nav.home]>
        <div className=%tw("flex flex-row flex-nowrap items-center")>
          <img className=%tw("h-8 pr-4") src={"/" ++ logo.default} />
          <Lang.String english="The Catala Language" french=`Le langage Catala` />
        </div>
      </Link.Internal>
    </div>
    <div className=%tw("h-full flex flex-grow flex-row flex-wrap justify-center bg-secondary")>
      <SwitchLang />
    </div>
    <div
      className=%tw(
        "h-full flex flex-grow flex-row flex-wrap items-center justify-center md:justify-end bg-secondary pt-4 md:pt-0"
      )>
      back_to_home_button
    </div>
  </div>
}
