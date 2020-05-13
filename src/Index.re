[%bs.raw {|require("./tailwind.css")|}];

module App = {
  [@react.component]
  let make = () => {
    // English is the default language
    let (app_lang, set_lang) = React.useState(_ => Lang.English);
    let set_lang: unit => unit =
      _ =>
        set_lang(old_lang =>
          if (old_lang == Lang.English) {
            Lang.French;
          } else {
            Lang.English;
          }
        );
    <Lang.Context value=(app_lang, set_lang)>
      <Nav />
      <div className=[%tw "flex flex-col h-full"]>
        <main className=[%tw "flex-1"]>
          <div className=[%tw "container mx-auto px-4"]> <Router /> </div>
        </main>
        <div className=[%tw "w-full bottom-0"]> <Footer /> </div>
      </div>
    </Lang.Context>;
  };
};

ReactDOMRe.renderToElementWithId(<App />, "app");
