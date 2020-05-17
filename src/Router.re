let navigation_elements_to_component =
    (elements: array(Elements.navigation_element)): React.element => {
  Js.log(elements);
  switch (Belt.List.fromArray(elements)) {
  | [first, second] =>
    if (first == Elements.home && second == Elements.about) {
      <About />;
    } else if (first == Elements.home && second == Elements.doc) {
      <Doc />;
    } else if (first == Elements.home && second == Elements.guide) {
      <Guide />;
    } else if (first == Elements.home && second == Elements.formalization) {
      <Formalization />;
    } else if (first == Elements.home && second == Elements.examples) {
      <Examples />;
    } else {
      <Presentation />;
    }
  | [first, second, third] =>
    if (first == Elements.home
        && second == Elements.doc
        && third == Elements.catala_man_page) {
      <Doc.CatalaManPage />;
    } else if (first == Elements.home
               && second == Elements.doc
               && third == Elements.legifrance_catala_man_page) {
      <Doc.LegiFranceCatalaManPage />;
    } else if (first == Elements.home
               && second == Elements.examples
               && third == Elements.french_family_benefits_example) {
      <Examples.FrenchFamilyBenefits />;
    } else if (first == Elements.home
               && second == Elements.examples
               && third == Elements.tutorial_example) {
      <Examples.Tutorial />;
    } else if (first == Elements.home
               && second == Elements.examples
               && third == Elements.french_example) {
      <Examples.DummyFrench />;
    } else if (first == Elements.home
               && second == Elements.examples
               && third == Elements.english_example) {
      <Examples.DummyEnglish />;
    } else {
      <Presentation />;
    }
  | _ => <Presentation />
  };
};

[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  let (_, navs) = Elements.url_to_navigation_elements(url);
  navigation_elements_to_component(navs);
};
