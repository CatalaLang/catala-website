// TODO: find a better way
let frenchLaw = %raw(`require("../assets/french_law.js")`)

let toComposant = (elements: array<Nav.navElem>): React.element =>
  switch elements->Belt.List.fromArray {
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
    if first == Nav.home && (second == Nav.doc && third == Nav.catalaManPage) {
      <Doc.CatalaManPage />
    } else if first == Nav.home && (second == Nav.doc && third == Nav.ocamlDocs) {
      <Doc.OCamlDocs />
    } else if first == Nav.home && (second == Nav.doc && third == Nav.syntaxCheatSheet) {
      <Doc.SyntaxSheatCheet />
    } else if (
      first == Nav.home && (second == Nav.examples && third == Nav.frenchFamilyBenefitsExample)
    ) {
      <FrenchFamilyBenefitsExample />
    } else if first == Nav.home && (second == Nav.examples && third == Nav.tutorialEnExample) {
      <TutorialEnExample />
    } else if first == Nav.home && (second == Nav.examples && third == Nav.tutorialFrExample) {
      <TutorialFrExample />
    } else if first == Nav.home && (second == Nav.examples && third == Nav.usTaxCode) {
      <USTaxCodeExample />
    } else {
      <Presentation />
    }
  | list{first, second, third, fourth} =>
    if (
      first == Nav.home &&
      second == Nav.examples &&
      third == Nav.frenchFamilyBenefitsExample &&
      fourth == Nav.visualization
    ) {
      <FrenchFamilyBenefitsExample.Visualizer />
    } else {
      <Presentation />
    }
  | _ =>
    // TODO: error 404 page not found
    <Presentation />
  }

@react.component
let make = () => {
  let (_, navs) = ReasonReactRouter.useUrl()->Nav.urlToNavElem
  navs->toComposant
}
