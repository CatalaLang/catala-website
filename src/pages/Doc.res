%raw(`import("../../assets/css/man_page.css")`)

open PageComponents

module type ManPage = {
  let title: React.element
  let url: string
}

// I'd be happy to learn how to write this in plain rescript, please point to
// the documentation
%%raw(`
  function fetch_and_set(url, id) {
    fetch(url, {
      "headers": {
        "Content-Type": "text/plain"
      }
    })
    .then(response => response.text())
    .then(txt => document.getElementById(id).innerHTML = txt)
  }
`)
external fetch_and_set: (~url: string, ~id: string) => unit = "fetch_and_set"

module MakeManPageDoc = (Man: ManPage) => {
  @react.component
  let make = () => {
    <>
      <section className="my-16 px-4 md:px-8">
        <Title> Man.title </Title>
      </section>
      <div className="h-16 bg-primary_light/5 border-y border-border " />
      <div
        id="manpage-body"
        className="font-mono man-page text-wrap p-8 my-16 w-fit overflow-x-auto lg:min-w-4xl ">
        {
          fetch_and_set(~url=Man.url, ~id="manpage-body")
          React.string("Loading...")
        }
      </div>
    </>
  }
}

module CatalaLegifranceManPage = MakeManPageDoc({
  let title =
    <Lang.String
      english={`LégiFrance to Catala connector man page`}
      french={`Page man du connecteur entre LégiFrance et Catala`}
    />
  let url: string = "https://catleg.readthedocs.io/en/latest/"
})

let catala_legifrance_card: Card.Presentation.t = {
  title: <Lang.String
    english={`The Catala/Légifrance connector`} french={`Le connecteur Catala/Légifrance`}
  />,
  action: Some((
    External("https://github.com/CatalaLang/catleg"),
    <Lang.String english="Project page" french={`Page du projet`} />,
  )),
  icon: None,
  quote: None,
  content: <Lang.String
    english={`When working on a Catala project involving French legislation, it is possible to link up
    Catala headers with LégiFrance law article IDs. LégiFrance is the official repository of French
    legislation, and can help you check whether your Catala source code is correct and up to date
    with the legislation in force.`}
    french={`Quand vous travaillez sur un projet Catala impliquant des sources législatives ou réglementaires
    françaises, il est possible de relier des titres Catala à des articles de loi grâce à des ID LégiFrance.
    Grâce à ce connecteur, LégiFrance peut vous aider à vérifier si votre code source Catala est
    correct et à jour par rapport aux textes en vigueur.`}
  />,
}

let ocaml_docs_card: Card.Presentation.t = {
  title: <Lang.String english="OCaml documentation" french={`Documentation OCaml`} />,
  icon: None,
  quote: None,
  action: Some((
    External("https://assets.catala-lang.org/api-doc/catala/"),
    <Lang.String english="See documentation" french={`Voir la documentation`} />,
  )),
  content: <>
    <Lang.String
      english="The Catala tooling is developed using the OCaml language. Internal documentation is auto-generated from the code using "
      french={`L'outillage autour de Catala est développé avec le langage OCaml. La documentation interne est auto-generée à partir du code source en utilisant `}
    />
    <Link.Text target="https://github.com/ocaml/odoc"> {React.string("odoc")} </Link.Text>
    {"." |> React.string}
  </>,
}

let catala_book_card: Card.Presentation.t = {
  title: <Lang.String english="The Catala book" french={`Le guide de Catala`} />,
  icon: None,
  quote: None,
  action: Some((
    External("https://book.catala-lang.org"),
    <Lang.String english="Access the book" french={`Accéder au guide`} />,
  )),
  content: <Lang.String
    english="The one-stop-shop for tutorials, installation instructions, FAQ and reference guides about Catala."
    french={`Ce guide est la référence unique pour les tutoriels, installations d'instructions, FAQ et listes exhaustives des fonctionnalités de Catala.`}
  />,
}

let syntax_cheat_sheet_card: Card.Presentation.t = {
  title: <Lang.String english="Syntax cheat sheet" french={`Aide-mémoire syntaxique`} />,
  icon: None,
  quote: None,
  action: Some((
    External("https://catalalang.github.io/catala/syntax.pdf"),
    <Lang.String english="Download the sheet" french={`Télécharger l'aide-mémoire`} />,
  )),
  content: <Lang.String
    english="This sheet is a handy reference to the Catala syntax and how programs should be written."
    french={`Cette feuille est une référence complète et pratique pour la syntaxe de Catala.`}
  />,
}
let formalization_card: Card.Presentation.t = {
  title: <Lang.String english="Formalization" french={`Formalisation`} />,
  action: Some((
    Internal([Nav.home, Nav.doc, Nav.formalization]),
    <Lang.String english="See the formalization" french={`Voir la formalisation`} />,
  )),
  icon: None,
  quote: None,
  content: <Lang.String
    english="Catala as a programming language has a complete formal specification,
    complete with syntax and semantics. This makes its behavior unambiguous and
    a solid foundation for complex software."
    french={`Catala en tant que langage de programmation possède une spécification
    formelle complète, avec syntaxe et sémantique. Ceci rend son comportement
    non-ambigu et en fait une fondation solide pour du logiciel complexe.`}
  />,
}

let publications_card: Card.Presentation.t = {
  title: <Lang.String english="Publications" french={`Publications`} />,
  action: Some((
    Internal([Nav.home, Nav.doc, Nav.publications]),
    <Lang.String english="See the publications" french={`Voir les publications`} />,
  )),
  icon: None,
  quote: None,
  content: <Lang.String
    english="Catala is the product of a significant effort research intersecting
    digital law, sociology of the State and formal methods. Multiple
    peer-reviewed and distinguished papers have been written by the members of the project
    over the years describing the context, motivation and features of Catala."
    french={`Catala est let produit d'un effort de recherche significatif mélangeant
    droit du numérique, sociologie de l'État et méthodes formelles. Plusieurs
    papiers primés et relus par les pairs ont été écrits par les membres du projet
    au fil des années, décrivant le contexte, les motivation et les caractéristiques
    de Catala.`}
  />,
}

@react.component
let make = () => <>
  <section className="px-4 md:px-8 my-16">
    <Title>
      <Lang.String english="Catala documentation" french={`Documentation de Catala`} />
    </Title>
  </section>
  <section id="examples" className="my-16 border-y border-border bg-primary_light/5 py-16">
    <h2 id="examples" className="px-4 md:px-8">
      <a href={"#core-principles"}>
        <Lang.String
          english="Examples of use for public administrations"
          french={`Exemples d'utilisation pour les administrations publiques`}
        />
      </a>
    </h2>
    <Card.Presentation.FromList
      cards=[
        FrenchFamilyBenefitsExample.card,
        FrenchHousingBenefitsExample.card,
        USTaxCodeExample.card,
        IRcatala.card,
      ]
    />
  </section>
  <section id="technical-doc">
    <h2 id="technical-doc" className="px-4 md:px-8 ">
      <a href={"#core-principles"}>
        <Lang.String
          english="Technical documentation for programmers"
          french={`Documentation technique pour les programmeur·e·s`}
        />
      </a>
    </h2>
    <Card.Presentation.FromList
      cards=[catala_book_card, syntax_cheat_sheet_card, catala_legifrance_card, ocaml_docs_card]
    />
  </section>
  <section
    id="researchers-content" className="mt-16 border-y border-border bg-primary_light/5 py-16">
    <h2 id="researchers-content" className="px-4 md:px-8 ">
      <a href={"#core-principles"}>
        <Lang.String
          english="Content for researchers" french={`Contenu pour les chercheur·e·s`}
        />
      </a>
    </h2>
    <Card.Presentation.FromList cards=[formalization_card, publications_card] />
  </section>
</>
