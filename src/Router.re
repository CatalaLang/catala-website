[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  switch (url.path) {
  | [single_page] =>
    if (single_page == Formalization.url) {
      <Formalization />;
    } else if (single_page == Examples.url) {
      <Examples />;
    } else if (single_page == Guide.url) {
      <Guide />;
    } else if (single_page == Compiler.url) {
      <Compiler />;
    } else {
      <Presentation />;
    }
  | _ => <Presentation />
  };
};
