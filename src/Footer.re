[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  let back_to_home_button =
    switch (url.path) {
    | [single_page] =>
      if (single_page != Presentation.url) {
        <div className="row">
          <div className="col s12 center-align">
            <a className="btn secondary-color" href=Presentation.url>
              {React.string("Back to home page")}
            </a>
          </div>
        </div>;
      } else {
        <div />;
      }
    | _ => <div />
    };
  <footer className="page-footer primary-color">
    back_to_home_button
    <div className="footer-copyright primary-color">
      <div className="container">
        {React.string("Copyright 2020 Inria")}
      </div>
    </div>
  </footer>;
};
