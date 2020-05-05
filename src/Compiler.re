let url = "compiler";

let doc = [%bs.raw
  {|'data:text/html,'+ encodeURIComponent(require("../assets/catala.html"))|}
];

[@react.component]
let make = () => {
  <>
    <h2> {React.string("Catala tooling documentation")} </h2>
    <div className="card">
      <div className="card-content ">
        <iframe
          height="500px"
          width="100%"
          src=doc
          style={ReactDOMRe.Style.make(~borderStyle="none", ())}
        />
      </div>
    </div>
  </>;
};
