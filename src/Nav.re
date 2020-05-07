[@react.component]
let make = () => {
  <div className="nav-wrapper primary-color">
    <a
      onClick={Utils.goToUrl(Presentation.url)}
      href="javascript:void(0)"
      className="center brand-logo">
      {React.string("The Catala Language")}
    </a>
  </div>;
};
