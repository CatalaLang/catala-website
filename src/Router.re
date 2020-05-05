[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  switch (url.path) {
  | [single_page] =>
    if (single_page == Formalization.url) {
      <Formalization />;
    } else if (single_page == Examples.url) {
      <Examples />;
    } else {
      <Presentation />;
    }
  | _ => <Presentation />
  };
};
