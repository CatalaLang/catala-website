let url = "formalization";

let grammar = [%bs.raw
  {|'data:text/html,'+ encodeURIComponent(require("../assets/grammar.html"))|}
];

[@react.component]
let make = () => {
  <>
    <h4> {React.string("Syntax")} </h4>
    <p>
      {React.string("The syntax of the langage is derived from the ")}
      <a
        href="https://github.com/CatalaLang/catala/blob/master/src/catala/parsing/parser.mly">
        {React.string("parser source file")}
      </a>
      {React.string(" using ")}
      <a href="https://github.com/Lelio-Brun/Obelisk">
        {React.string("Obelisk")}
      </a>
      {React.string(".")}
    </p>
    <div className="card">
      <div className="card-content ">
        <iframe
          height="500px"
          width="100%"
          src=grammar
          style={ReactDOMRe.Style.make(~borderStyle="none", ())}
        />
      </div>
    </div>
  </>;
};
