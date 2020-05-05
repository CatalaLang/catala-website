let url = "compiler";

let catala_doc = [%bs.raw
  {|'data:text/html,'+ encodeURIComponent(require("../assets/catala.html"))|}
];

let legifrance_catala_doc = [%bs.raw
  {|'data:text/html,'+ encodeURIComponent(require("../assets/legifrance_catala.html"))|}
];

let display_man_page = (~title: string, ~man: string) =>
  <div className="section">
    <div className="card">
      <div className="card-content">
        <span className="card-title"> {React.string(title)} </span>
        <iframe
          height="500px"
          width="100%"
          src=man
          style={ReactDOMRe.Style.make(~borderStyle="none", ())}
        />
      </div>
    </div>
  </div>;

[@react.component]
let make = () => {
  <>
    <h2> {React.string("Catala tooling documentation")} </h2>
    {display_man_page("Compiler", catala_doc)}
    {display_man_page("Interaction with the LegiFrance API ", legifrance_catala_doc)}
  </>;
};
