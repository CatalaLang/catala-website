let github_link = "https://github.com/CatalaLang/catala-website/issues";

[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  let back_to_home_button =
    switch (url.path) {
    | [single_page] =>
      if (single_page != Presentation.url) {
        <div className="row">
          <div className="col s12 center-align">
            <a
              className="btn secondary-color"
              href=Utils.noop
              onClick={Utils.goToUrl(Presentation.url)}>
              {React.string("Back to home page")}
            </a>
          </div>
        </div>;
      } else {
        <div />;
      }
    | _ => <div />
    };
  <>
    <div className="under-construction center-align">
      <a className="btn-flat" href=github_link>
        <i className="material-icons left"> {React.string("warning")} </i>
        {React.string("This website is under construction, click here to give some feedback")}
        <i className="material-icons right"> {React.string("warning")} </i>
      </a>
    </div>
    <footer className="page-footer primary-color">
      back_to_home_button
      <div className="footer-copyright primary-color">
        <div className="container"> {React.string("Copyright 2020 Inria")} </div>
      </div>
    </footer>
  </>;
};
