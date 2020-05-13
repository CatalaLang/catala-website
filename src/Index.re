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
      <body className="flex flex-col h-screen">
        <main className="flex-1">
          <div className="container mx-auto px-4"> <Router /> </div>
        </main>
      </body>
      <Footer />
    </Lang.Context>;
  };
};

ReactDOMRe.renderToElementWithId(<App />, "app");
