type nav_elem = {
  url: string,
  text: React.element,
}

let home: nav_elem = {
  url: "",
  text: <Lang.String english="Home" french=`Accueil` />,
}

let formalization: nav_elem = {
  url: "formalisation",
  text: <Lang.String english="Formalization" french=`Formalisation` />,
}

let publications: nav_elem = {
  url: "publications",
  text: <Lang.String english="Publications" french=`Publications` />,
}

let examples: nav_elem = {
  url: "examples",
  text: <Lang.String english="Examples" french=`Exemples` />,
}

let about: nav_elem = {
  url: "about",
  text: <Lang.String english="about" french=`À propos` />,
}

// let playground: nav_elem= {
//   url: "playground",
//   text: <Lang.String english="Playground" french=`Bac à sable` />,
// }

let doc: nav_elem = {
  url: "doc",
  text: <Lang.String english="Documentation" french=`Documentation` />,
}

let french_family_benefits_example: nav_elem = {
  url: "family-benefits",
  text: <Lang.String english="Family benefits" french=`Allocations familiales` />,
}

let us_tax_code: nav_elem = {
  url: "us-tax-code",
  text: <Lang.String english="US Tax" french=`Impôts US` />,
}

let french_example: nav_elem = {
  url: "french",
  text: <Lang.String english="French" french=`Français` />,
}

let tutorial_en_example: nav_elem = {
  url: "tutorial",
  text: <Lang.String english="English Tutorial" french=`Tutoriel en anglais` />,
}

let tutorial_fr_example: nav_elem = {
  url: "tutoriel",
  text: <Lang.String english="French Tutorial" french=`Tutoriel en français` />,
}

let catala_man_page: nav_elem = {
  url: "catala",
  text: "catala" |> React.string,
}

let ocaml_docs: nav_elem = {
  url: "ocaml",
  text: "ocaml" |> React.string,
}

let syntax_cheat_sheet: nav_elem = {
  url: "syntax-sheet",
  text: <Lang.String english="Syntax sheat cheet" french=`Pense-bête syntaxtique` />,
}

let url_to_navigation_elements = (url: ReasonReactRouter.url): (
  option<Lang.lang>,
  array<nav_elem>,
) => {
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
    let first_path_elements = (first_path: string): option<array<nav_elem>> => {
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
    let second_path_elements = (second_path: string): option<array<nav_elem>> => {
      let second_path = String.lowercase_ascii(second_path)
      if second_path == french_family_benefits_example.url {
        Some([french_family_benefits_example])
      } else if second_path == us_tax_code.url {
        Some([us_tax_code])
      } else if second_path == french_example.url {
        Some([french_example])
      } else if second_path == tutorial_en_example.url {
        Some([tutorial_en_example])
      } else if second_path == tutorial_fr_example.url {
        Some([tutorial_fr_example])
      } else if second_path == catala_man_page.url {
        Some([catala_man_page])
      } else if second_path == ocaml_docs.url {
        Some([ocaml_docs])
      } else if second_path == syntax_cheat_sheet.url {
        Some([syntax_cheat_sheet])
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

let navigation_elements_to_url = (lang: option<Lang.lang>, navs: array<nav_elem>): string => {
  let first_part = switch lang {
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
  "/" ++ (first_part ++ ("/" ++ rest))
}

let go_to = (element_path: array<nav_elem>, lang: Lang.lang, _) => {
  let new_url = navigation_elements_to_url(Some(lang), element_path)
  Js.log("Pushing " ++ new_url)
  ReasonReactRouter.push(new_url)
}
