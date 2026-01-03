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
    if first == Nav.home && (second == Nav.doc && third == Nav.formalization) {
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
  let defaultDescriptionFr = `un langage spécifique conçu par des chercheuses
    et chercheurs en informatique et en droit, pour l'écriture précise
    d'algorithmes appliquant automatiquement du droit.`
  let defaultDescriptionEn = `a domain-specific language designed by
    researchers in Computer Science and Law, for precisely deriving
    algorithms producing automated legal decisions.`
  let defaultEnMeta = {
    title: "Catala - Law to Code",
    description: `The official website of Catala, ${defaultDescriptionEn}`,
  }
  let defaultFrMeta = {
    title: "Catala - Du droit vers le code",
    description: `Le site officiel de Catala, ${defaultDescriptionFr}`,
  }
  Console.log(navs)
  let {title, description} = switch navs {
  | [first, second] if first == Nav.home && second == Nav.about =>
    switch lang {
    | English => {
        ...defaultEnMeta,
        title: "About - Catala",
      }
    | French => {
        ...defaultFrMeta,
        title: "À propos - Catala",
      }
    }
  | [first, second] if first == Nav.home && second == Nav.features =>
    switch lang {
    | English => {
        title: "Features - Catala",
        description: `Overview of the features of the Catala programming language. Catala is ${defaultDescriptionEn}`,
      }
    | French => {
        title: "Fonctionnalités - Catala",
        description: `Présentation des fonctionnalités du langage de programmation Catala. Catala est ${defaultDescriptionFr}`,
      }
    }
  | [first, second] if first == Nav.home && second == Nav.seminar =>
    switch lang {
    | English => {
        title: "Seminars - Catala",
        description: `List of past and upcoming academic research seminars organized
      by the Catala team. Catala is ${defaultDescriptionEn}`,
      }
    | French => {
        title: "Séminaires - Catala",
        description: `Liste des séminaires de recherche passés et à venir organisés
      par l'équipe Catala. Catala est ${defaultDescriptionFr}`,
      }
    }
  | [first, second] if first == Nav.home && second == Nav.doc =>
    switch lang {
    | English => {
        title: "Documentation - Catala",
        description: `Documentation of the Catala programming language. Catala is ${defaultDescriptionEn}`,
      }
    | French => {
        title: "Documentation - Catala",
        description: `Documentation du langage de programmation Catala. Catala est ${defaultDescriptionFr}`,
      }
    }
  | [first, second, third] if first == Nav.home && second == Nav.doc && third == Nav.publications =>
    switch lang {
    | English => {
        title: "Publications - Catala",
        description: `Academic publications related to the Catala programming language. Catala is ${defaultDescriptionEn}`,
      }
    | French => {
        title: "Publications - Catala",
        description: `Publications académiques liées au langage de programmation Catala. Catala est ${defaultDescriptionFr}`,
      }
    }
  | [first, second, third]
    if first == Nav.home && second == Nav.doc && third == Nav.formalization =>
    switch lang {
    | English => {
        title: "Formalization - Catala",
        description: `Resources on the formalization of the Catala language. Catala is ${defaultDescriptionEn}`,
      }
    | French => {
        title: "Formalisation - Catala",
        description: `Ressources sur la formalisation du langage Catala. Catala est ${defaultDescriptionFr}`,
      }
    }
  | _ =>
    switch lang {
    | English => defaultEnMeta
    | French => defaultFrMeta
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
  document
  ->Webapi.Dom.HtmlDocument.querySelector(`meta[name="og:image"]`)
  ->Option.getExn
  ->Webapi.Dom.Element.setAttribute(
    "content",
    switch lang {
    | English => "/assets/catala-ogimage-en.png"
    | French => "/assets/catala-ogimage-fr.png"
    },
  )
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
