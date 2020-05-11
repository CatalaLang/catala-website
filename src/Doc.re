let url = "doc";

let catala_doc: string = [%bs.raw {|require("../assets/catala.html")|}];

let legifrance_catala_doc: string = [%bs.raw
  {|require("../assets/legifrance_catala.html")|}
];

[@react.component]
let make = () => {
  <>
    <h1> {React.string("Catala tooling documentation")} </h1>
    <div className="">
      {Utils.presentation_card(
         "The Catala Compiler",
         None,
         None,
         <p>
           {React.string(
              "The compiler is the main tool that parses Catala source code files and translate
            the contents into various literate programming or executable targets",
            )}
         </p>,
         Some((CatalaManPage.url, "See manpage")),
       )}
      {Utils.presentation_card(
         "The LegiFrance Catala connector",
         None,
         None,
         <p>
           {React.string(
              "Only available for the French surface language, this utility connects to the LegiFrance API
            to retrieve expiration dates for the law articles used in the implementation or compare the
            text in the source code with the official legislative text.",
            )}
         </p>,
         Some((LegiFranceCatalaManPage.url, "See manpage")),
       )}
    </div>
  </>;
};
