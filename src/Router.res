let navigation_elements_to_component = (
  elements: array<Elements.navigation_element>,
): React.element =>
  switch Belt.List.fromArray(elements) {
  | list{first, second} =>
    if first == Elements.home && second == Elements.about {
      <About />
    } else if first == Elements.home && second == Elements.doc {
      <Doc />
      // } else if first == Elements.home && second == Elements.playground {
      //   <Playground />
    } else if first == Elements.home && second == Elements.formalization {
      <Formalization />
    } else if first == Elements.home && second == Elements.publications {
      <Publications />
    } else if first == Elements.home && second == Elements.examples {
      <Examples />
    } else {
      <Presentation />
    }
  | list{first, second, third} =>
    if first == Elements.home && (second == Elements.doc && third == Elements.catala_man_page) {
      <Doc.CatalaManPage />
    } else if first == Elements.home && (second == Elements.doc && third == Elements.ocaml_docs) {
      <Doc.OCamlDocs />
    } else if (
      first == Elements.home && (second == Elements.doc && third == Elements.syntax_cheat_sheet)
    ) {
      <Doc.SyntaxSheatCheet />
    } else if (
      first == Elements.home &&
        (second == Elements.examples &&
        third == Elements.french_family_benefits_example)
    ) {
      <FrenchFamilyBenefitsExample />
    } else if (
      first == Elements.home &&
        (second == Elements.examples &&
        third == Elements.tutorial_en_example)
    ) {
      <TutorialEnExample />
    } else if (
      first == Elements.home &&
        (second == Elements.examples &&
        third == Elements.tutorial_fr_example)
    ) {
      <TutorialFrExample />
    } else if (
      first == Elements.home && (second == Elements.examples && third == Elements.us_tax_code)
    ) {
      <USTaxCodeExample />
    } else {
      <Presentation />
    }
  | _ => <Presentation />
  }

@react.component
let make = () => {
  let url = ReasonReactRouter.useUrl()
  let (_, navs) = Elements.url_to_navigation_elements(url)
  navigation_elements_to_component(navs)
}
