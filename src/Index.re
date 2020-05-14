[%bs.raw {|require("./tailwind.css")|}];

module App = {
  [@react.component]
  let make = () => {
    let url = ReasonReactRouter.useUrl();
    let (lang_url, _) = Elements.url_to_navigation_elements(url);
    let lang_url =
      switch (lang_url) {
      | None => Lang.English
      | Some(lang_url) => lang_url
      };
    let (app_lang, set_lang) = React.useState(_ => lang_url);
    let set_lang: unit => unit =
      _ => set_lang(old_lang => Lang.new_lang_from_old_lang(old_lang));
    <Lang.Context value=(app_lang, set_lang)>
      <div className=[%tw "flex flex-col min-h-screen"]>
        <Nav />
        <main className=[%tw "flex-grow"]>
          <div className=[%tw "container mx-auto px-4"]> <Router /> </div>
        </main>
        <div className=[%tw "w-full bottom-0"]> <Footer /> </div>
      </div>
    </Lang.Context>;
  };
};

ReactDOMRe.renderToElementWithId(<App />, "app");
