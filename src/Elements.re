type navigation_element = {
  url: string,
  text: React.element,
};

let home: navigation_element = {
  url: "",
  text: <Lang.String english="Home" french={js|Accueil|js} />,
};

let formalization: navigation_element = {
  url: "formalisation",
  text: <Lang.String english="Formalization" french={js|Formalisation|js} />,
};

let examples: navigation_element = {
  url: "examples",
  text: <Lang.String english="Examples" french={js|Exemples|js} />,
};

let about: navigation_element = {
  url: "about",
  text: <Lang.String english="about" french={js|À propos|js} />,
};

let guide: navigation_element = {
  url: "guide",
  text: <Lang.String english="Guide" french={js|Guide|js} />,
};

let doc: navigation_element = {
  url: "doc",
  text: <Lang.String english="Documentation" french={js|Documentation|js} />,
};

let french_family_benefits_example: navigation_element = {
  url: "family-benefits",
  text:
    <Lang.String
      english="Family benefits"
      french={js|Allocations familiales|js}
    />,
};

let us_tax_code: navigation_element = {
  url: "us-tax-code",
  text: <Lang.String english="US Tax" french={js|Impôts US|js} />,
};

let french_example: navigation_element = {
  url: "french",
  text: <Lang.String english="French" french={js|Français|js} />,
};

let tutorial_example: navigation_element = {
  url: "tutorial",
  text: <Lang.String english="Tutorial" french={js|Tutoriel|js} />,
};

let catala_man_page: navigation_element = {
  url: "catala",
  text: {
    "catala" |> React.string;
  },
};

let legifrance_catala_man_page: navigation_element = {
  url: "legifrance-catala",
  text: {
    "legifrance-catala" |> React.string;
  },
};

let ocaml_docs: navigation_element = {
  url: "ocaml",
  text: {
    "ocaml" |> React.string;
  },
};

let url_to_navigation_elements =
    (url: ReasonReactRouter.url)
    : (option(Lang.lang), array(navigation_element)) => {
  let default_elements = [|home|];
  switch (url.path) {
  | [lang_part, ...rest] =>
    let lang =
      if (lang_part == Lang.lang_url(Lang.English)) {
        Some(Lang.English);
      } else if (lang_part == Lang.lang_url(Lang.French)) {
        Some(Lang.French);
      } else {
        None;
      };
    let first_path_elements =
        (first_path: string): option(array(navigation_element)) => {
      let first_path = String.lowercase_ascii(first_path);
      if (first_path == formalization.url) {
        Some([|home, formalization|]);
      } else if (first_path == examples.url) {
        Some([|home, examples|]);
      } else if (first_path == guide.url) {
        Some([|home, guide|]);
      } else if (first_path == doc.url) {
        Some([|home, doc|]);
      } else if (first_path == about.url) {
        Some([|home, about|]);
      } else if (first_path == home.url) {
        Some([|home|]);
      } else {
        None;
      };
    };
    let second_path_elements =
        (second_path: string): option(array(navigation_element)) => {
      let second_path = String.lowercase_ascii(second_path);
      if (second_path == french_family_benefits_example.url) {
        Some([|french_family_benefits_example|]);
      } else if (second_path == us_tax_code.url) {
        Some([|us_tax_code|]);
      } else if (second_path == french_example.url) {
        Some([|french_example|]);
      } else if (second_path == tutorial_example.url) {
        Some([|tutorial_example|]);
      } else if (second_path == catala_man_page.url) {
        Some([|catala_man_page|]);
      } else if (second_path == legifrance_catala_man_page.url) {
        Some([|legifrance_catala_man_page|]);
      } else if (second_path == ocaml_docs.url) {
        Some([|ocaml_docs|]);
      } else {
        None;
      };
    };
    let elements =
      switch (rest) {
      | [single_page] =>
        switch (first_path_elements(single_page)) {
        | None => default_elements
        | Some(elts) => elts
        }
      | [first_path, second_path] =>
        switch (
          first_path_elements(first_path),
          second_path_elements(second_path),
        ) {
        | (Some(elts1), Some(elts2)) => Belt.Array.concat(elts1, elts2)
        | _ => default_elements
        }
      | _ => default_elements
      };
    (lang, elements);
  | _ => (None, default_elements)
  };
};

let navigation_elements_to_url =
    (lang: option(Lang.lang), navs: array(navigation_element)): string => {
  let first_part =
    switch (lang) {
    // If no language then English is default
    | None => Lang.lang_url(Lang.English)
    | Some(lang) => Lang.lang_url(lang)
    };
  let rest =
    navs->Belt.Array.reduce("", (acc, nav) =>
      acc
      ++ (
        if (acc == "") {
          "";
        } else {
          "/";
        }
      )
      ++ nav.url
    );
  "/" ++ first_part ++ "/" ++ rest;
};

let goToElement =
    (element_path: array(navigation_element), lang: Lang.lang, _) => {
  let new_url = navigation_elements_to_url(Some(lang), element_path);
  Js.log("Pushing " ++ new_url);
  ReasonReactRouter.push(new_url);
};
