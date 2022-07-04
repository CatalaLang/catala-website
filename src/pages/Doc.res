%raw(`require("../../assets/man_page.css")`)

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
    <Lang.String
      english="Catala compiler documentation" french=`Documentation du compilateur Catala`
    />
  let html: string = %raw(`require("../../assets/catala.html")`)
})

let catala_doc: string = %raw(`require("../../assets/catala.html")`)

let catala_card: Card.Presentation.t = {
  title: <Lang.String english="The Catala Compiler" french="Le compilateur Catala" />,
  action: Some((
    Internal([Nav.home, Nav.doc, Nav.catalaManPage]),
    <Lang.String english="See manpage" french=`Voir la page man` />,
  )),
  icon: None,
  quote: None,
  content: <Lang.String
    english="The compiler is the main tool that parses Catala source code files and translate
     the contents into various literate programming or executable targets."
    french=`Le compilateur est l'outil principal qui prend en entrée un fichier source Catala et
     en traduit le contenu vers diverses cibles de programmation littéraire ou exécutable.`
  />,
}

let ocaml_docs_card: Card.Presentation.t = {
  title: <Lang.String english="OCaml documentation" french=`Documentation OCaml` />,
  icon: None,
  quote: None,
  action: Some((
    External("/ocaml_docs/"),
    <Lang.String english="See documentation" french=`Voir la documentation` />,
  )),
  content: <>
    <Lang.String
      english="The Catala tooling is developped using the OCaml language. Internal documentation is auto-generated from the code using "
      french=`L'outillage autour de Catala est développé avec le langage OCaml. La documentation interne est auto-generée à partir du code source en utilisant `
    />
    <Link.Text target="https://github.com/ocaml/odoc"> {React.string("odoc")} </Link.Text>
    {"." |> React.string}
  </>,
}

let syntax_cheat_sheet_card: Card.Presentation.t = {
  title: <Lang.String english="Syntax sheat cheet" french=`Pense-bête syntaxique` />,
  icon: None,
  quote: None,
  action: Some((
    External("https://github.com/CatalaLang/catala/raw/master/doc/syntax/syntax.pdf"),
    <Lang.String english="Download the cheet" french=`Télécharger le pense-bête` />,
  )),
  content: <Lang.String
    english="This cheet is a handy reference to the Catala syntax and how programs should be written."
    french=`Cette feuille est une référence complète et pratique pour la syntaxe de Catala.`
  />,
}

@react.component
let make = () => <>
  <Title>
    <Lang.String english="Catala tooling documentation" french=`Documentation des outils Catala` />
  </Title>
  <Card.Presentation.FromList cards=[catala_card, ocaml_docs_card, syntax_cheat_sheet_card] />
</>
