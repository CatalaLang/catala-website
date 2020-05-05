[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  switch (url.path) {
  | [single_page] =>
    if (single_page == Formalization.url) {
      <Formalization />;
    } else {
      <Presentation />;
    }
  | _ => <Presentation />
  };
};
