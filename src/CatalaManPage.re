let url = "doc/catala";

let catala_doc: string = [%bs.raw {|require("../assets/catala.html")|}];

[@react.component]
let make = () => {
  <div className="man-page" dangerouslySetInnerHTML={"__html": catala_doc} />;
};
