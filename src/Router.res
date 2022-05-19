let navigation_elements_to_component = (elements: array<Nav.nav_elem>): React.element =>
  switch Belt.List.fromArray(elements) {
  | list{first, second} =>
    if first == Nav.home && second == Nav.about {
      <About />
    } else if first == Nav.home && second == Nav.doc {
      <Doc />
      // } else if first == Nav.home && second == Nav.playground {
      //   <Playground />
    } else if first == Nav.home && second == Nav.formalization {
      <Formalization />
    } else if first == Nav.home && second == Nav.publications {
      <Publications />
    } else if first == Nav.home && second == Nav.examples {
      <Examples />
    } else {
      <Presentation />
    }
  | list{first, second, third} =>
    if first == Nav.home && (second == Nav.doc && third == Nav.catala_man_page) {
      <Doc.CatalaManPage />
    } else if first == Nav.home && (second == Nav.doc && third == Nav.ocaml_docs) {
      <Doc.OCamlDocs />
    } else if first == Nav.home && (second == Nav.doc && third == Nav.syntax_cheat_sheet) {
      <Doc.SyntaxSheatCheet />
    } else if (
      first == Nav.home && (second == Nav.examples && third == Nav.french_family_benefits_example)
    ) {
      <FrenchFamilyBenefitsExample />
    } else if first == Nav.home && (second == Nav.examples && third == Nav.tutorial_en_example) {
      <TutorialEnExample />
    } else if first == Nav.home && (second == Nav.examples && third == Nav.tutorial_fr_example) {
      <TutorialFrExample />
    } else if first == Nav.home && (second == Nav.examples && third == Nav.us_tax_code) {
      <USTaxCodeExample />
    } else {
      <Presentation />
    }
  | _ => <Presentation />
  }

@react.component
let make = () => {
  let url = ReasonReactRouter.useUrl()
  let (_, navs) = Nav.url_to_navigation_elements(url)
  navigation_elements_to_component(navs)
}
