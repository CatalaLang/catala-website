module NavigationElement = {
  [@react.component]
  let make = (~element: Router.navigation_element) =>
    <a
      className=[%tw "cursor-pointer text-white uppercase"]
      onClick={Utils.goToUrl(element.url)}>
      {React.string(element.text)}
    </a>;
};

module NavigationBar = {
  [@react.component]
  let make = (~elements: array(Router.navigation_element)) => {
    <div
      className=[%tw
        "flex flex-row flex-wrap content-center bg-tertiary shadow p-4"
      ]>
      {elements
       ->Belt.Array.mapWithIndex((i, nav) => {
           <div>
             {if (i != 0) {
                <i className="float-left pr-1 text-primary material-icons">
                  {"chevron_right" |> React.string}
                </i>;
              } else {
                <i />;
              }}
             <NavigationElement element=nav />
           </div>
         })
       ->React.array}
    </div>;
  };
};

module SwitchLanguage = {
  [@react.component]
  let make = _ => {
    let (_lang, setLang) = React.useContext(Lang.langContext);
    <btn
      className="cursor-pointer text-white uppercase" onClick={_ => setLang()}>
      <Lang.String french="English" english={js|Français|js} />
    </btn>;
  };
};

[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  let back_to_home_button = {
    let elements = Router.url_to_navigation_elements(url);
    <NavigationBar elements />;
  };
  <div className=[%tw "flex flex-row justify-between bg-secondary"]>
    <div
      className=[%tw
        "flex flex-row flex-wrap content-center pl-4 pr-4 text-3xl text-center text-white"
      ]>
      <div> {"The Catala Language" |> React.string} </div>
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
