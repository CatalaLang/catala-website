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
      <div className="flex flex-col min-h-screen bg-primary_light/5 items-center">
        <NavComponent />
        <main className="max-w-6xl pb-16 md:mx-8 border-x border-border bg-white">
          <Router />
        </main>
        <div className="w-full border-t border-border bottom-0 px-4">
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
