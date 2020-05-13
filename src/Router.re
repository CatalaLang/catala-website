let default_page = <Presentation />;

type navigation_element = {
  url: string,
  text: React.element,
  component: React.element,
};

let home_element: navigation_element = {
  url: Presentation.url,
  text: <Lang.String english="Home" french={js|Accueil|js} />,
  component: <Presentation />,
};

let formalization_element: navigation_element = {
  url: Formalization.url,
  text: <Lang.String english="Formalization" french={js|Formalisation|js} />,
  component: <Formalization />,
};

let examples_element: navigation_element = {
  url: Examples.url,
  text: <Lang.String english="Examples" french={js|Exemples|js} />,
  component: <Examples />,
};

let about_element: navigation_element = {
  url: About.url,
  text: <Lang.String english="about" french={js|À propos|js} />,
  component: <About />,
};

let guide_element: navigation_element = {
  url: Guide.url,
  text: <Lang.String english="Guide" french={js|Guide|js} />,
  component: <Guide />,
};

let doc_element: navigation_element = {
  url: Doc.url,
  text: <Lang.String english="Documentation" french={js|Documentation|js} />,
  component: <Doc />,
};

let french_family_benefits_examples_element: navigation_element = {
  url: Examples.FrenchFamilyBenefits.url,
  text:
    <Lang.String
      english="Family benefits"
      french={js|Allocations familiales|js}
    />,
  component: <Examples.FrenchFamilyBenefits />,
};

let english_example_element: navigation_element = {
  url: Examples.DummyEnglish.url,
  text: <Lang.String english="English" french={js|Français|js} />,
  component: <Examples.DummyEnglish />,
};

let french_example_element: navigation_element = {
  url: Examples.DummyFrench.url,
  text: <Lang.String english="French" french={js|Français|js} />,
  component: <Examples.DummyFrench />,
};

let catala_man_page_element: navigation_element = {
  url: Doc.CatalaManPage.url,
  text: {
    "catala" |> React.string;
  },
  component: <Doc.CatalaManPage />,
};

let legifrance_catala_man_page_element: navigation_element = {
  url: Doc.LegiFranceCatalaManPage.url,
  text: {
    "legifrance-catala" |> React.string;
  },
  component: <Doc.LegiFranceCatalaManPage />,
};

let url_to_navigation_elements =
    (url: ReasonReactRouter.url): array(navigation_element) =>
  switch (url.path) {
  | [single_page] =>
    if (single_page == Formalization.url) {
      [|home_element, formalization_element|];
    } else if (single_page == Examples.url) {
      [|home_element, examples_element|];
    } else if (single_page == Guide.url) {
      [|home_element, guide_element|];
    } else if (single_page == Doc.url) {
      [|home_element, doc_element|];
    } else if (single_page == About.url) {
      [|home_element, about_element|];
    } else {
      [|home_element|];
    }
  | [first_path, second_path] =>
    if (first_path ++ "/" ++ second_path == Examples.FrenchFamilyBenefits.url) {
      [|
        home_element,
        examples_element,
        french_family_benefits_examples_element,
      |];
    } else if (first_path ++ "/" ++ second_path == Examples.DummyEnglish.url) {
      [|home_element, examples_element, english_example_element|];
    } else if (first_path ++ "/" ++ second_path == Examples.DummyFrench.url) {
      [|home_element, examples_element, french_example_element|];
    } else if (first_path ++ "/" ++ second_path == Doc.CatalaManPage.url) {
      [|home_element, doc_element, catala_man_page_element|];
    } else if (first_path
               ++ "/"
               ++ second_path == Doc.LegiFranceCatalaManPage.url) {
      [|home_element, doc_element, legifrance_catala_man_page_element|];
    } else {
      [|home_element|];
    }
  | _ => [|home_element|]
  };

[@react.component]
let make = () => {
  let url = ReasonReactRouter.useUrl();
  let navs = url_to_navigation_elements(url);
  Belt.Array.getExn(navs, Belt.Array.length(navs) - 1).component;
};
