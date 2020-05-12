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
        {"." |> React.string}
      </p>
      <Utils.Card collapsible=true>
        <div className=[%tw "font-mono"] dangerouslySetInnerHTML={"__html": grammar} />
      </Utils.Card>
    </Utils.PageSection>
  </>;
};
