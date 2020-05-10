[@react.component]
let make = () => {
  <div className="bg-primary">
    <a
      onClick={Utils.goToUrl(Presentation.url)}
      href="javascript:void(0)"
      className="">
      {React.string("The Catala Language")}
    </a>
  </div>;
};
