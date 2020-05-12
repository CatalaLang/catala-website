let github_link = "https://github.com/CatalaLang/catala-website/issues";

[@react.component]
let make = () => {
  <footer className=[%tw "bg-primary border-t-8 border-secondary pt-4"]>
    <div className=[%tw "text-white pb-4 pr-6 text-right"]>
      {React.string("Copyright 2020 Inria")}
    </div>
    <div className=[%tw "bg-yellow-500 text-center"]>
      <span>
        <i className="float-left pl-4 material-icons"> {React.string("warning")} </i>
        <a className=[%tw "w-auto"] href=github_link>
          {React.string("This website is under construction, click here to give some feedback")}
          <i className="float-right pr-4 material-icons"> {React.string("warning")} </i>
        </a>
      </span>
    </div>
  </footer>;
};
