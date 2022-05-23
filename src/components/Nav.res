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

let usTaxCode: navElem = {
  url: "us-tax-code",
  text: <Lang.String english="US Tax" french=`Impôts US` />,
}

let frenchExample: navElem = {
  url: "french",
  text: <Lang.String english="French" french=`Français` />,
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

let urlToNavElem = (url: ReasonReactRouter.url): (option<Lang.lang>, array<navElem>) => {
  let default_elements = [home]
  switch url.path {
  | list{lang_part, ...rest} =>
    let lang = if lang_part == Lang.lang_url(Lang.English) {
      Some(Lang.English)
    } else if lang_part == Lang.lang_url(Lang.French) {
      Some(Lang.French)
    } else {
      None
    }
    let first_path_elements = (first_path: string): option<array<navElem>> => {
      let first_path = String.lowercase_ascii(first_path)
      if first_path == formalization.url {
        Some([home, formalization])
      } else if first_path == examples.url {
        Some([home, examples])
        // } else if first_path == playground.url {
        //   Some([home, playground])
      } else if first_path == doc.url {
        Some([home, doc])
      } else if first_path == about.url {
        Some([home, about])
      } else if first_path == publications.url {
        Some([home, publications])
      } else if first_path == home.url {
        Some([home])
      } else {
        None
      }
    }
    let second_path_elements = (second_path: string): option<array<navElem>> => {
      let second_path = String.lowercase_ascii(second_path)
      if second_path == frenchFamilyBenefitsExample.url {
        Some([frenchFamilyBenefitsExample])
      } else if second_path == usTaxCode.url {
        Some([usTaxCode])
      } else if second_path == frenchExample.url {
        Some([frenchExample])
      } else if second_path == tutorialEnExample.url {
        Some([tutorialEnExample])
      } else if second_path == tutorialFrExample.url {
        Some([tutorialFrExample])
      } else if second_path == catalaManPage.url {
        Some([catalaManPage])
      } else if second_path == ocamlDocs.url {
        Some([ocamlDocs])
      } else if second_path == syntaxCheatSheet.url {
        Some([syntaxCheatSheet])
      } else {
        None
      }
    }
    let elements = switch rest {
    | list{single_page} =>
      switch first_path_elements(single_page) {
      | None => default_elements
      | Some(elts) => elts
      }
    | list{first_path, second_path} =>
      switch (first_path_elements(first_path), second_path_elements(second_path)) {
      | (Some(elts1), Some(elts2)) => Belt.Array.concat(elts1, elts2)
      | _ => default_elements
      }
    | _ => default_elements
    }
    (lang, elements)
  | _ => (None, default_elements)
  }
}

let navigationElementsToUrl = (lang: option<Lang.lang>, navs: array<navElem>): string => {
  let firstPart = switch lang {
  // If no language then English is default
  | None => Lang.lang_url(Lang.English)
  | Some(lang) => Lang.lang_url(lang)
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
  let new_url = navigationElementsToUrl(Some(lang), elementPath)
  Js.log("Pushing " ++ new_url)
  ReasonReactRouter.push(new_url)
}
