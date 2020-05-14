module NavigationElement = {
  [@react.component]
  let make = (~elements: array(Elements.navigation_element)) => {
    let (lang, _) = React.useContext(Lang.langContext);
    <a
      className=[%tw "cursor-pointer text-white uppercase"]
      onClick={Elements.goToElement(elements, lang)}>
      {Belt.Array.getExn(elements, Belt.Array.length(elements) - 1).text}
    </a>;
  };
};

module NavigationBar = {
  [@react.component]
  let make = (~elements: array(Elements.navigation_element)) => {
    <div
      className=[%tw
        "flex flex-row flex-wrap content-center bg-tertiary shadow p-4"
      ]>
      {elements->Belt.Array.reduceWithIndex(<div />, (acc, _, i) => {
         <>
           acc
           <div key={string_of_int(i)}>
             {if (i != 0) {
                <i className="float-left pr-1 text-primary material-icons">
                  {"chevron_right" |> React.string}
                </i>;
              } else {
                <i />;
              }}
             <NavigationElement
               elements={Belt.Array.slice(elements, ~offset=0, ~len=i + 1)}
             />
           </div>
         </>
       })}
    </div>;
  };
};

module SwitchLanguage = {
  [@react.component]
  let make = _ => {
    let (old_lang, setLang) = React.useContext(Lang.langContext);
    let url = ReasonReactRouter.useUrl();
    <a
      className="cursor-pointer text-white uppercase"
      onClick={_ => {
        let (_, navs) = Elements.url_to_navigation_elements(url);
        setLang();
        let new_lang = Lang.new_lang_from_old_lang(old_lang);
        Elements.goToElement(navs, new_lang, ());
      }}>
      <Lang.String french="English" english={js|Français|js} />
    </a>;
  };
};

[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  let back_to_home_button = {
    let (_lang, elements) = Elements.url_to_navigation_elements(url);
    <NavigationBar elements />;
  };
  <div className=[%tw "flex flex-row justify-between bg-secondary"]>
    <div
      className=[%tw
        "flex flex-row flex-wrap content-center pl-4 pr-4 text-3xl text-center text-white"
      ]>
      <div>
        <Lang.String
          english="The Catala Language"
          french={js|Le langage Catala|js}
        />
      </div>
    </div>
    <div
      className=[%tw
        "flex flex-row flex-wrap content-center bg-tertiary shadow p-4"
      ]>
      <SwitchLanguage />
    </div>
    back_to_home_button
  </div>;
};
