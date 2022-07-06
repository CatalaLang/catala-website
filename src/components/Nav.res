type navElem = {
  url: string,
  text: React.element,
}

let home: navElem = {
  url: "",
  text: <Lang.String english="Home" french=`Accueil` />,
}

let formalization: navElem = {
  url: "formalisation",
  text: <Lang.String english="Formalization" french=`Formalisation` />,
}

let publications: navElem = {
  url: "publications",
  text: <Lang.String english="Publications" french=`Publications` />,
}

let examples: navElem = {
  url: "examples",
  text: <Lang.String english="Examples" french=`Exemples` />,
}

let about: navElem = {
  url: "about",
  text: <Lang.String english="about" french=`À propos` />,
}

// let playground: nav_elem= {
//   url: "playground",
//   text: <Lang.String english="Playground" french=`Bac à sable` />,
// }

let doc: navElem = {
  url: "doc",
  text: <Lang.String english="Documentation" french=`Documentation` />,
}

let frenchFamilyBenefitsExample: navElem = {
  url: "family-benefits",
  text: <Lang.String english="Family benefits" french=`Allocations familiales` />,
}

let frenchHousingBenefitsExample: navElem = {
  url: "housing-benefits",
  text: <Lang.String english="Housing benefits" french=`Aides au logement` />,
}

let usTaxCode: navElem = {
  url: "us-tax-code",
  text: <Lang.String english="US Tax" french=`Impôts US` />,
}

let tutorialEnExample: navElem = {
  url: "tutorial",
  text: <Lang.String english="English Tutorial" french=`Tutoriel en anglais` />,
}

let tutorialFrExample: navElem = {
  url: "tutoriel",
  text: <Lang.String english="French Tutorial" french=`Tutoriel en français` />,
}

let catalaManPage: navElem = {
  url: "catala",
  text: "catala" |> React.string,
}

let ocamlDocs: navElem = {
  url: "ocaml",
  text: "ocaml" |> React.string,
}

let syntaxCheatSheet: navElem = {
  url: "syntax-sheet",
  text: <Lang.String english="Syntax sheat cheet" french=`Pense-bête syntaxtique` />,
}

let visualization: navElem = {
  url: "visualization",
  text: <Lang.String english="Visualization" french=`Visualisation` />,
}

let cmp = (a: navElem, b: navElem) => {
  String.compare(a.url, b.url)
}

let urlToNavElem = (url: ReasonReactRouter.url): (option<Lang.lang>, array<navElem>) => {
  let defaultElems = [home]
  switch url.path {
  | list{langPart, ...rest} =>
    let lang = Lang.fromUrl(langPart)
    let getNavElemsFrom = (~withDefaultElems=false, navElems: array<navElem>, path: string): option<
      array<navElem>,
    > => {
      let path = path->String.lowercase_ascii
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
        [home, formalization, publications, examples, about, doc, visualization],
      )
    }
    let getSecondNavElems: string => option<array<navElem>> = {
      getNavElemsFrom([
        frenchFamilyBenefitsExample,
        frenchHousingBenefitsExample,
        usTaxCode,
        tutorialEnExample,
        tutorialFrExample,
        catalaManPage,
        ocamlDocs,
        syntaxCheatSheet,
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

let goTo = (elementPath: array<navElem>, lang: Lang.lang) => {
  let newUrl = navElemsToUrl(Some(lang), elementPath)
  Js.log("Pushing " ++ newUrl)
  ReasonReactRouter.push(newUrl)
}
