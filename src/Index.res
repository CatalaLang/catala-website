%raw(`require("./css/tailwind.css")`)

module App = {
  @react.component
  let make = () => {
    let url = ReasonReactRouter.useUrl()
    let (langUrl, _) = Nav.urlToNavElem(url)
    let langUrl = switch langUrl {
    | None => Lang.English
    | Some(langUrl) => langUrl
    }
    let (appLang, setLang) = React.useState(_ => langUrl)
    let setLang = _ => setLang(oldLang => Lang.newLangFromOldLang(oldLang))

    <Lang.Context value=(appLang, setLang)>
      <div className=%twc("flex flex-col min-h-screen text-xl md:text-lg lg:text-base")>
        <NavComponent />
        <main className=%twc("flex flex-col flex-grow container mx-auto px-4 ")> <Router /> </main>
        <div className=%twc("w-full bottom-0")> <Footer /> </div>
      </div>
    </Lang.Context>
  }
}

ReactDOMRe.renderToElementWithId(<App />, "app")
