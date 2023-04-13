let toComposant = (elements: array<Nav.navElem>): React.element =>
  switch elements->Belt.List.fromArray {
  | list{first, second} =>
    if first == Nav.home && second == Nav.about {
      <About />
    } else if first == Nav.home && second == Nav.seminar {
      <Seminar />
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
    } else if first == Nav.home && (second == Nav.doc && third == Nav.clerkManPage) {
      <Doc.ClerkManPage />
    } else if first == Nav.home && (second == Nav.doc && third == Nav.catalaLegifranceManPage) {
      <Doc.CatalaLegifranceManPage />
    } else if (
      first == Nav.home && (second == Nav.examples && third == Nav.frenchFamilyBenefitsExample)
    ) {
      <FrenchFamilyBenefitsExample />
    } else if (
      first == Nav.home && (second == Nav.examples && third == Nav.frenchHousingBenefitsExample)
    ) {
      <FrenchHousingBenefitsExample />
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
    } else if (
      first == Nav.home &&
      second == Nav.examples &&
      third == Nav.frenchHousingBenefitsExample &&
      fourth == Nav.visualization
    ) {
      <FrenchHousingBenefitsExample.Visualizer />
    } else {
      <Presentation />
    }
  | _ => <Presentation />
  }

// Handle redirection with internal linking.
let manageInternalPageRedirections: unit => unit = %raw(`
  function() {
    window.scrollTo({top:0})
    if (location.hash) {
      var id = location.hash.replace('#', '')
      var elementToScroll = document.getElementById(id);
      if (elementToScroll) {
        let parent = elementToScroll.parentNode;

        // Opens the parent collapsed <details> elements.
        while (null != parent) {
          if ('DETAILS' == parent.nodeName) {
            parent.setAttribute("open", true);
            parent = null;
          }
          else {
            parent = parent.parentNode;
          }
        }
        if (elementToScroll) {
          elementToScroll.scrollIntoView(true);
        }
      }
    }
  }
`)

@react.component
let make = () => {
  let (_, navs) = RescriptReactRouter.useUrl()->Nav.urlToNavElem
  React.useEffect(() => {
    manageInternalPageRedirections()
    None
  })
  navs->toComposant
}
