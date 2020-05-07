let url = "doc/legifrance-catala";

let legifrance_catala_doc: string = [%bs.raw {|require("../assets/legifrance_catala.html")|}];

[@react.component]
let make = () => {
  <div dangerouslySetInnerHTML={"__html": legifrance_catala_doc} />;
};
