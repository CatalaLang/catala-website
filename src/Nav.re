module NavigationElement = {
  [@react.component]
  let make = (~element: Router.navigation_element) =>
    <a className=[%tw "cursor-pointer text-white uppercase"] onClick={Utils.goToUrl(element.url)}>
      {React.string(element.text)}
    </a>;
};

module NavigationBar = {
  [@react.component]
  let make = (~elements: array(Router.navigation_element)) => {
    <div className=[%tw "flex flex-row flex-wrap content-center bg-tertiary shadow p-4"]>
      <div>
        {elements
         ->Belt.Array.map(nav => {
             <div className="">
               <i className="float-left pr-2 text-white material-icons">
                 {"keyboard_arrow_right" |> React.string}
               </i>
               <NavigationElement element=nav />
             </div>
           })
         ->React.array}
      </div>
    </div>;
  };
};

[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  let back_to_home_button = {
    let elements = Router.url_to_navigation_elements(url);
    <NavigationBar elements />;
  };
  <div className=[%tw "flex flex-row justify-between bg-primary  border-b-8 border-secondary"]>
    <div
      className=[%tw "flex flex-row flex-wrap content-center pl-4 text-3xl text-center text-white"]>
      <div> {"The Catala Language" |> React.string} </div>
    </div>
    back_to_home_button
  </div>;
};
