let render_navigation_element = (nav: Router.navigation_element) =>
  <a className=[%tw "cursor-pointer text-white uppercase"] onClick={Utils.goToUrl(nav.url)}>
    {React.string(nav.text)}
  </a>;

let render_navigation_bar = (navs: array(Router.navigation_element)) => {
  <div className=[%tw "flex flex-row flex-wrap content-center bg-tertiary shadow p-4"]>
    <div>
      {navs
       ->Belt.Array.map(nav => {
           <div className="">
             <i className="float-left pr-2 text-white material-icons">
               {"keyboard_arrow_right" |> React.string}
             </i>
             {render_navigation_element(nav)}
           </div>
         })
       ->React.array}
    </div>
  </div>;
};

[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  let back_to_home_button = {
    let elements = Router.url_to_navigation_elements(url);
    render_navigation_bar(elements);
  };
  <div className=[%tw "flex flex-row justify-between bg-primary  border-b-8 border-secondary"]>
    <div
      className=[%tw "flex flex-row flex-wrap content-center pl-4 text-3xl text-center text-white"]>
      <div> {"The Catala Language" |> React.string} </div>
    </div>
    back_to_home_button
  </div>;
};
