[@react.component]
let make = () => {
  let back_to_home_button_base =
    <div
      className=[%tw "flex flex-wrap content-center bg-tertiary shadow px-4"]>
      <div>
        <a
          className=[%tw "cursor-pointer text-white uppercase"]
          onClick={Utils.goToUrl(Presentation.url)}>
          {React.string("Back to home page")}
        </a>
      </div>
    </div>;
  let url = ReasonReactRouter.useUrl();
  let back_to_home_button =
    switch (url.path) {
    | [] => <div />
    | [single_page] =>
      if (single_page != Presentation.url) {
        back_to_home_button_base;
      } else {
        <div />;
      }
    | _ => back_to_home_button_base
    };
  <div
    className=[%tw
      "flex flex-row justify-between bg-primary  border-b-8 border-secondary"
    ]>
    <span className=[%tw "pl-4 text-3xl text-center text-white"]>
      {"The Catala Language" |> React.string}
    </span>
    back_to_home_button
  </div>;
};
