module CatalaManPage = {
  let url = "doc/catala";

  let catala_doc: string = [%bs.raw {|require("../assets/catala.html")|}];

  [@react.component]
  let make = () => {
    <div className="" dangerouslySetInnerHTML={"__html": catala_doc} />;
  };
};

module LegiFranceCatalaManPage = {
  let url = "doc/legifrance-catala";

  let legifrance_catala_doc: string = [%bs.raw {|require("../assets/legifrance_catala.html")|}];

  [@react.component]
  let make = () => {
    <div dangerouslySetInnerHTML={"__html": legifrance_catala_doc} />;
  };
};

let url = "doc";

let catala_doc: string = [%bs.raw {|require("../assets/catala.html")|}];

let legifrance_catala_doc: string = [%bs.raw {|require("../assets/legifrance_catala.html")|}];

let catala_card: Utils.presentation_card = {
  title: "The Catala Compiler",
  action: Some((CatalaManPage.url, "See manpage")),
  icon: None,
  quote: None,
  content: {
    <p>
      {React.string(
         "The compiler is the main tool that parses Catala source code files and translate
     the contents into various literate programming or executable targets",
       )}
    </p>;
  },
};

let legifrance_catala_card: Utils.presentation_card = {
  title: "The LegiFrance Catala connector",
  icon: None,
  quote: None,
  action: Some((LegiFranceCatalaManPage.url, "See manpage")),
  content: {
    <p>
      {React.string(
         "Only available for the French surface language, this utility connects to the LegiFrance API
     to retrieve expiration dates for the law articles used in the implementation or compare the
     text in the source code with the official legislative text.",
       )}
    </p>;
  },
};

[@react.component]
let make = () => {
  <>
    {Utils.page_title("Catala tooling documentation")}
    {Utils.render_presentation_cards([|catala_card, legifrance_catala_card|])}
  </>;
};
