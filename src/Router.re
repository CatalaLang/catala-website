let default_page = <Presentation />;

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
    } else if (single_page == Doc.url) {
      <Doc />;
    } else {
      default_page;
    }
  | [first_path, second_path] =>
    if (first_path ++ "/" ++ second_path == Examples.FrenchFamilyBenefits.url) {
      <Examples.FrenchFamilyBenefits />;
    } else if (first_path ++ "/" ++ second_path == Doc.CatalaManPage.url) {
      <Doc.CatalaManPage />;
    } else if (first_path ++ "/" ++ second_path == Doc.LegiFranceCatalaManPage.url) {
      <Doc.LegiFranceCatalaManPage />;
    } else {
      default_page;
    }
  | _ => default_page
  };
};
