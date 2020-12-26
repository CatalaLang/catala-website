let navigation_elements_to_component =
    (elements: array(Elements.navigation_element)): React.element => {
  switch (Belt.List.fromArray(elements)) {
  | [first, second] =>
    if (first == Elements.home && second == Elements.about) {
      <About />;
    } else if (first == Elements.home && second == Elements.doc) {
      <Doc />;
    } else if (first == Elements.home && second == Elements.playground) {
      <Playground />;
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
               && third == Elements.ocaml_docs) {
      <Doc.OCamlDocs />;
    } else if (first == Elements.home
               && second == Elements.examples
               && third == Elements.french_family_benefits_example) {
      <Examples.FrenchFamilyBenefits />;
    } else if (first == Elements.home
               && second == Elements.examples
               && third == Elements.tutorial_en_example) {
      <Examples.TutorialEn />;
    } else if (first == Elements.home
              && second == Elements.examples
              && third == Elements.tutorial_fr_example) {
      <Examples.TutorialFr />;
    }  else if (first == Elements.home
               && second == Elements.examples
               && third == Elements.french_example) {
      <Examples.DummyFrench />;
    } else if (first == Elements.home
               && second == Elements.examples
               && third == Elements.us_tax_code) {
      <Examples.USTaxCode />;
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
