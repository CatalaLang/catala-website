let url = "formalization";

let grammar = [%bs.raw {|require("../assets/grammar.html")|}];

[@react.component]
let make = () => {
  <>
    <Utils.PageTitle title="Formalization" />
    <Utils.PageSection title="Surface syntax">
      <p>
        {"The syntax of the langage is derived from the " |> React.string}
        <Utils.TextLink
          target="https://github.com/CatalaLang/catala/blob/master/src/catala/parsing/parser.mly"
          text="parser source file"
        />
        {" using " |> React.string}
        <Utils.TextLink target="https://github.com/Lelio-Brun/Obelisk" text="Obelisk" />
        {". This syntax is language-agnostic, meaning that it is valid for both English and French versions
        of Catala. Indeed, the language only affects the tokens, not their order."
         |> React.string}
      </p>
      <Utils.Card collapsible=true>
        <div className=[%tw "font-mono"] dangerouslySetInnerHTML={"__html": grammar} />
      </Utils.Card>
    </Utils.PageSection>
    <Utils.PageSection title="Core semantics">
      <p>
        {"Catala's unique feature is the possibility to give multiple definitions to the same variable,
    each definition being conditionned to a logical guard. If the guard is true, then the definition
    is applicable. This behavior is adapted to the style in which legal statutes are redacted. In the
    case of multiple guards being true at the same time, the definition is picked according to a
    precedence in the definitions that is specified in the source code."
         |> React.string}
      </p>
      <p className="pt-6"> {"More details coming soon..." |> React.string} </p>
    </Utils.PageSection>
  </>;
};
