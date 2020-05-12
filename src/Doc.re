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

[@react.component]
let make = () => {
  <>
    <h1> {React.string("Catala tooling documentation")} </h1>
    <div className="">
      {Utils.presentation_card(
         ~title="The Catala Compiler",
         ~action=(CatalaManPage.url, "See manpage"),
         {
           <p>
             {React.string(
                "The compiler is the main tool that parses Catala source code files and translate
            the contents into various literate programming or executable targets",
              )}
           </p>;
         },
       )}
      {Utils.presentation_card(
         ~title="The LegiFrance Catala connector",
         ~action=(LegiFranceCatalaManPage.url, "See manpage"),
         {
           <p>
             {React.string(
                "Only available for the French surface language, this utility connects to the LegiFrance API
            to retrieve expiration dates for the law articles used in the implementation or compare the
            text in the source code with the official legislative text.",
              )}
           </p>;
         },
       )}
    </div>
  </>;
};
