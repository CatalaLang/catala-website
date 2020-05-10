let github_link = "https://github.com/CatalaLang/catala-website/issues";

[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  let back_to_home_button =
    <div className="">
      <div className="">
        <a
          className=""
          href=Utils.noop
          onClick={Utils.goToUrl(Presentation.url)}>
          {React.string("Back to home page")}
        </a>
      </div>
    </div>;
  let back_to_home_button =
    switch (url.path) {
    | [single_page] =>
      if (single_page != Presentation.url) {
        back_to_home_button;
      } else {
        <div />;
      }
    | _ => back_to_home_button
    };
  <>
    <div className="">
      <a className="" href=github_link>
        <i className=""> {React.string("warning")} </i>
        {React.string(
           "This website is under construction, click here to give some feedback",
         )}
        <i className=""> {React.string("warning")} </i>
      </a>
    </div>
    <footer className="">
      back_to_home_button
      <div className="">
        <div className=""> {React.string("Copyright 2020 Inria")} </div>
      </div>
    </footer>
  </>;
};
