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
    } else if first == Nav.home && second == Nav.features {
      <Features />
    } else if first == Nav.home && second == Nav.ir_catala {
      <IRcatala />
    } else {
      <Presentation />
    }
  | list{first, second, third} =>
    if first == Nav.home && (second == Nav.doc && third == Nav.catalaManPage) {
      <Doc.CatalaManPage />
    } else if first == Nav.home && (second == Nav.doc && third == Nav.clerkManPage) {
      <Doc.ClerkManPage />
    } else if first == Nav.home && (second == Nav.doc && third == Nav.formalization) {
      <Formalization />
    } else if first == Nav.home && (second == Nav.doc && third == Nav.publications) {
      <Publications />
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
    } else if first == Nav.home && (second == Nav.examples && third == Nav.usTaxCode) {
      <USTaxCodeExample />
    } else {
      <Presentation />
    }
  // | list{first, second, third, fourth} =>
  //   if (
  //     first == Nav.home &&
  //     second == Nav.examples &&
  //     third == Nav.frenchFamilyBenefitsExample &&
  //     fourth == Nav.visualization
  //   ) {
  //     <FrenchFamilyBenefitsExample.Visualizer />
  //   } else if (
  //     first == Nav.home &&
  //     second == Nav.examples &&
  //     third == Nav.frenchHousingBenefitsExample &&
  //     fourth == Nav.visualization
  //   ) {
  //     <FrenchHousingBenefitsExample.Visualizer />
  //   } else {
  //     <Presentation />
  //   }
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

type metaData = {
  title: string,
  description: string,
}

let setMetaData = (navs: array<Nav.navElem>, lang: Lang.lang): unit => {
  let {title, description} = switch (navs, lang) {
  | ([first, second], English) if first == Nav.home => {
      title: "About Catala",
      description: "Catala is a declarative language for legal rules, designed to be readable",
    }
  // | ([first, second], French) if first == Nav.home => "À propos de Catala"
  | (_, English) => {
      title: "Catala - Law to Code",
      description: "The official website of the Catala domain-specific programming language for translating law into code.",
    }
  | (_, French) => {
      title: "Catala - Du droit vers le code",
      description: "Le site officiel du langage de programmation Catala, un langage spécifique au domaine pour traduire le droit en code.",
    }
  }
  let document = Webapi.Dom.document->Webapi.Dom.Document.asHtmlDocument->Option.getExn
  document->Webapi.Dom.HtmlDocument.setTitle(title)
  document
  ->Webapi.Dom.HtmlDocument.querySelector(`meta[name="og:title"]`)
  ->Option.getExn
  ->Webapi.Dom.Element.setAttribute("content", title)
  document
  ->Webapi.Dom.HtmlDocument.querySelector(`meta[name="description"]`)
  ->Option.getExn
  ->Webapi.Dom.Element.setAttribute("content", description)
  document
  ->Webapi.Dom.HtmlDocument.querySelector(`meta[name="og:description"]`)
  ->Option.getExn
  ->Webapi.Dom.Element.setAttribute("content", description)
}

@react.component
let make = () => {
  let (lang, _) = React.useContext(Lang.langContext)
  let (_, navs) = RescriptReactRouter.useUrl()->Nav.urlToNavElem
  React.useEffect(() => {
    manageInternalPageRedirections()
    setMetaData(navs, lang)
    None
  })
  navs->toComposant
}
