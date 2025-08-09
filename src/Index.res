%raw(`import("../assets/css/global.css")`)
%raw(`import("../assets/css/form.css")`)
%raw(`import("../assets/css/catala_code.css")`)

module App = {
  @react.component
  let make = () => {
    let url = RescriptReactRouter.useUrl()
    let (langUrl, _) = Nav.urlToNavElem(url)
    let langUrl = switch langUrl {
    | None => Lang.English
    | Some(langUrl) => langUrl
    }
    ignore(Nav.setHTMLlang(Lang.toUrl(langUrl)))
    let (appLang, setLang) = React.useState(_ => langUrl)
    let setLang = _ => setLang(oldLang => Lang.newLangFromOldLang(oldLang))

    <Lang.Context value=(appLang, setLang)>
      <div className="flex flex-col min-h-screen text-xl md:text-lg lg:text-base">
        <NavComponent />
        <main className="flex flex-col grow container mx-auto px-4 lg:px-0 ">
          <Router />
        </main>
        <div className="w-full bottom-0">
          <Footer />
        </div>
      </div>
    </Lang.Context>
  }
}

ReactDOM.Client.createRoot(
  ReactDOM.querySelector("#app")->Belt.Option.getExn,
)->ReactDOM.Client.Root.render(
  <React.StrictMode>
    <App />
  </React.StrictMode>,
)
