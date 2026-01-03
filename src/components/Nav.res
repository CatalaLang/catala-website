type navElem = {
  url: string,
  text: React.element,
}

let home: navElem = {
  url: "",
  text: <Lang.String english="Home" french={`Accueil`} />,
}

let formalization: navElem = {
  url: "formalisation",
  text: <Lang.String english="Formalization" french={`Formalisation`} />,
}

let publications: navElem = {
  url: "publications",
  text: <Lang.String english="Publications" french={`Publications`} />,
}

let examples: navElem = {
  url: "examples",
  text: <Lang.String english="Examples" french={`Exemples`} />,
}

let about: navElem = {
  url: "about",
  text: <Lang.String english="About" french={`À propos`} />,
}

let seminar: navElem = {
  url: "seminar",
  text: <Lang.String english="Seminars" french={`Séminaires`} />,
}

// let playground: nav_elem= {
//   url: "playground",
//   text: <Lang.String english="Playground" french=`Bac à sable` />,
// }

let doc: navElem = {
  url: "doc",
  text: <Lang.String english="Documentation" french={`Documentation`} />,
}

let frenchFamilyBenefitsExample: navElem = {
  url: "family-benefits",
  text: <Lang.String english="Family benefits" french={`Allocations familiales`} />,
}

let frenchHousingBenefitsExample: navElem = {
  url: "housing-benefits",
  text: <Lang.String english="Housing benefits" french={`Aides au logement`} />,
}

let usTaxCode: navElem = {
  url: "us-tax-code",
  text: <Lang.String english="US Tax" french={`Impôts US`} />,
}

let features: navElem = {
  url: "features",
  text: <Lang.String english="Features" french={`Fonctionnalités`} />,
}

let catalaManPage: navElem = {
  url: "catala",
  text: "catala" |> React.string,
}

let catalaLegifranceManPage: navElem = {
  url: "legifrance",
  text: "legifrance" |> React.string,
}

let clerkManPage: navElem = {
  url: "clerk",
  text: "clerk" |> React.string,
}

let ocamlDocs: navElem = {
  url: "ocaml",
  text: "ocaml" |> React.string,
}

let syntaxCheatSheet: navElem = {
  url: "syntax-sheet",
  text: <Lang.String english="Syntax cheat sheet" french={`Aide-mémoire syntaxique`} />,
}

let visualization: navElem = {
  url: "visualization",
  text: <Lang.String english="Visualization" french={`Visualisation`} />,
}

let ir_catala: navElem = {
  url: "ir-catala",
  text: <Lang.String english="IR Catala" french={`IR Catala`} />,
}

let cmp = (a: navElem, b: navElem) => {
  String.localeCompare(a.url, b.url)->Float.toInt
}

let urlToNavElem = (url: RescriptReactRouter.url): (option<Lang.lang>, array<navElem>) => {
  let defaultElems = [home]
  switch url.path {
  | list{langPart, ...rest} =>
    let isLangPrefixed = Lang.fromUrl(langPart)->Option.isSome
    let langPart = isLangPrefixed ? langPart : "en"
    let rest = isLangPrefixed ? rest : url.path
    let lang = Lang.fromUrl(langPart)
    let getNavElemsFrom = (~withDefaultElems=false, navElems: array<navElem>, path: string): option<
      array<navElem>,
    > => {
      let path = path->String.toLowerCase
      navElems
      ->Belt.Array.getBy(e => e.url == path)
      ->Belt.Option.map(e =>
        if withDefaultElems {
          defaultElems->Belt.Array.concat([e])
        } else {
          [e]
        }
      )
    }
    let getFirstNavElems: string => option<array<navElem>> = {
      getNavElemsFrom(
        ~withDefaultElems=true,
        [
          home,
          about,
          seminar,
          doc,
          features,
          // visualization,
          ir_catala,
        ],
      )
    }
    let getSecondNavElems: string => option<array<navElem>> = {
      getNavElemsFrom([
        frenchFamilyBenefitsExample,
        frenchHousingBenefitsExample,
        formalization,
        publications,
        usTaxCode,
        catalaManPage,
        clerkManPage,
        catalaLegifranceManPage,
        ocamlDocs,
        syntaxCheatSheet,
        ir_catala,
      ])
    }
    let getThirdNavElems: string => option<array<navElem>> = {
      getNavElemsFrom([visualization])
    }
    let elements = switch rest {
    | list{onePart} =>
      switch getFirstNavElems(onePart) {
      | None => defaultElems
      | Some(elts) => elts
      }
    | list{firsPart, secondPart} =>
      switch (getFirstNavElems(firsPart), getSecondNavElems(secondPart)) {
      | (Some(elts1), Some(elts2)) => Belt.Array.concat(elts1, elts2)
      | _ => defaultElems
      }
    | list{firstPart, secondPart, thirdPart} =>
      switch (
        getFirstNavElems(firstPart),
        getSecondNavElems(secondPart),
        getThirdNavElems(thirdPart),
      ) {
      | (Some(elts1), Some(elts2), Some(elts3)) =>
        elts1->Belt.Array.concat(elts2)->Belt.Array.concat(elts3)
      | _ => defaultElems
      }
    | _ => defaultElems
    }
    (lang, elements)
  | _ => (None, defaultElems)
  }
}

let navElemsToUrl = (lang: option<Lang.lang>, navs: array<navElem>): string => {
  let firstPart = switch lang {
  | None => Lang.toUrl(Lang.English)
  | Some(lang) => Lang.toUrl(lang)
  }
  let rest = navs->Belt.Array.reduce("", (acc, nav) =>
    acc ++
    (if acc == "" {
      ""
    } else {
      "/"
    } ++
    nav.url)
  )
  "/" ++ (firstPart ++ ("/" ++ rest))
}

let setHTMLlang = %raw(`
  function(newLang) {
  document.documentElement.setAttribute('lang', newLang);
  }`)

let goTo = (elementPath: array<navElem>, lang: Lang.lang) => {
  ignore(setHTMLlang(Lang.toUrl(lang)))
  let newUrl = navElemsToUrl(Some(lang), elementPath)
  Js.log("Pushing " ++ newUrl)
  RescriptReactRouter.push(newUrl)
}
