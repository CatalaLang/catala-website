let url = "formalization";

let grammar = [%bs.raw {|require("../assets/grammar.html")|}];

[@react.component]
let make = () => {
  <>
    <h2> {React.string("Syntax")} </h2>
    <p>
      {React.string("The syntax of the langage is derived from the ")}
      <a href="https://github.com/CatalaLang/catala/blob/master/src/catala/parsing/parser.mly">
        {React.string("parser source file")}
      </a>
      {React.string(" using ")}
      <a href="https://github.com/Lelio-Brun/Obelisk"> {React.string("Obelisk")} </a>
      {React.string(".")}
    </p>
    <iframe src="http://merigoux.fr/catala/grammar.html" height="500px" width="100%" />
  </>;
};
