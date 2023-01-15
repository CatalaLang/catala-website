%raw(`require("../../assets/css/man_page.css")`)

open PageComponents

module type ManPage = {
  let title: React.element
  let html: string
}

module MakeManPageDoc = (Man: ManPage) => {
  @react.component
  let make = () => <>
    <Title> Man.title </Title>
    <Card.Basic>
      <div className="font-mono man-page" dangerouslySetInnerHTML={"__html": Man.html} />
    </Card.Basic>
  </>
}

module CatalaManPage = MakeManPageDoc({
  let title =
    <Lang.String english="Catala compiler man page" french={`Page man du compilateur Catala`} />
  let html: string = %raw(`require("../../assets/catala.html")`)
})

module ClerkManPage = MakeManPageDoc({
  let title =
    <Lang.String
      english="Clerk build system man page" french={`Page man du système de build Clerk`}
    />
  let html: string = %raw(`require("../../assets/clerk.html")`)
})

module CatalaLegifranceManPage = MakeManPageDoc({
  let title =
    <Lang.String
      english={`LégiFrance to Catala connector man page`}
      french={`Page man du connecteur entre LégiFrance et Catala`}
    />
  let html: string = %raw(`require("../../assets/catala_legifrance.html")`)
})

let catala_card: Card.Presentation.t = {
  title: <Lang.String english="The Catala Compiler" french="Le compilateur Catala" />,
  action: Some((
    Internal([Nav.home, Nav.doc, Nav.catalaManPage]),
    <Lang.String english="See manpage" french={`Voir la page man`} />,
  )),
  icon: None,
  quote: None,
  content: <Lang.String
    english="The compiler is the main tool that parses Catala source code files and translate
     the contents into various literate programming or executable targets."
    french={`Le compilateur est l'outil principal qui prend en entrée un fichier source Catala et
     en traduit le contenu vers diverses cibles de programmation littéraire ou exécutable.`}
  />,
}

let clerk_card: Card.Presentation.t = {
  title: <Lang.String english="The Clerk build system" french={`Le système de build Clerk`} />,
  action: Some((
    Internal([Nav.home, Nav.doc, Nav.clerkManPage]),
    <Lang.String english="See manpage" french={`Voir la page man`} />,
  )),
  icon: None,
  quote: None,
  content: <Lang.String
    english="The build system is the tool that help you build a Catala project and perform various
    tasks like testing. Its design is influenced by Rust's cargo."
    french={`Le système de build est l'outil qui vous aide à build votre projet
    Catala ainsi que de réaliser d'autre tâches comme exécuter les tests.
     Sa conception a été influencée par l'outil cargo de Rust.`}
  />,
}

let catala_legifrance_card: Card.Presentation.t = {
  title: <Lang.String
    english={`The Catala/Légifrance connector`} french={`Le connecteur Catala/Légifrance`}
  />,
  action: Some((
    Internal([Nav.home, Nav.doc, Nav.catalaLegifranceManPage]),
    <Lang.String english="See manpage" french={`Voir la page man`} />,
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
    External("/ocaml_docs/"),
    <Lang.String english="See documentation" french={`Voir la documentation`} />,
  )),
  content: <>
    <Lang.String
      english="The Catala tooling is developped using the OCaml language. Internal documentation is auto-generated from the code using "
      french={`L'outillage autour de Catala est développé avec le langage OCaml. La documentation interne est auto-generée à partir du code source en utilisant `}
    />
    <Link.Text target="https://github.com/ocaml/odoc"> {React.string("odoc")} </Link.Text>
    {"." |> React.string}
  </>,
}

let syntax_cheat_sheet_card: Card.Presentation.t = {
  title: <Lang.String english="Syntax sheat cheet" french={`Pense-bête syntaxique`} />,
  icon: None,
  quote: None,
  action: Some((
    External("https://github.com/CatalaLang/catala/raw/master/doc/syntax/syntax.pdf"),
    <Lang.String english="Download the cheet" french={`Télécharger le pense-bête`} />,
  )),
  content: <Lang.String
    english="This cheet is a handy reference to the Catala syntax and how programs should be written."
    french={`Cette feuille est une référence complète et pratique pour la syntaxe de Catala.`}
  />,
}

@react.component
let make = () => <>
  <Title>
    <Lang.String
      english="Catala tooling documentation" french={`Documentation des outils Catala`}
    />
  </Title>
  <Card.Presentation.FromList
    cards=[
      catala_card,
      clerk_card,
      catala_legifrance_card,
      ocaml_docs_card,
      syntax_cheat_sheet_card,
    ]
  />
</>
