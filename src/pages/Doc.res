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

module OCamlDocs = {
  @react.component
  let make = () => <>
    <Title> <Lang.String english="OCaml documentation" french="Documentation OCaml" /> </Title>
    <div className=%twc("flex flex-row justify-center")>
      <div className=%twc("mx-8 my-4")>
        <a
          className=%twc("cursor-pointer uppercase text-white") href="/ocaml_docs/" target="_blank">
          <div className=%twc("bg-secondary shadow text-2xl md:text-xl lg:text-lg py-4 px-4")>
            <div className=%twc("flex flex-row flex-nowrap items-center")>
              <Lang.String
                english="Access the OCaml documentation website"
                french=`Accéder à la documentation OCaml`
              />
              <i className="pl-4 material-icons"> {"description" |> React.string} </i>
            </div>
          </div>
        </a>
      </div>
    </div>
  </>
}

module SyntaxSheatCheet = {
  @react.component
  let make = () => <>
    <Title> <Lang.String english="Syntax sheat cheet" french=`Pense-bête syntaxique` /> </Title>
    <div className=%twc("flex flex-row justify-center")>
      <div className=%twc("mx-8 my-4")>
        <a
          className=%twc("cursor-pointer uppercase text-white")
          href="https://github.com/CatalaLang/catala/raw/master/doc/syntax/syntax.pdf"
          target="_blank">
          <div className=%twc("bg-secondary shadow text-2xl md:text-xl lg:text-lg py-4 px-4")>
            <div className=%twc("flex flex-row flex-nowrap items-center")>
              <Lang.String
                english="Access the syntax sheat cheet" french=`Accéder au pense-bête syntaxique`
              />
              <i className="pl-4 material-icons"> {"description" |> React.string} </i>
            </div>
          </div>
        </a>
      </div>
    </div>
  </>
}

let catala_doc: string = %raw(`require("../../assets/catala.html")`)

let catala_card: Card.Presentation.t = {
  title: <Lang.String english="The Catala Compiler" french="Le compilateur Catala" />,
  action: Some((
    [Nav.home, Nav.doc, Nav.catalaManPage],
    <Lang.String english="See manpage" french=`Voir la page man` />,
  )),
  icon: None,
  quote: None,
  content: <p>
    <Lang.String
      english="The compiler is the main tool that parses Catala source code files and translate
     the contents into various literate programming or executable targets."
      french=`Le compilateur est l'outil principal qui prend en entrée un fichier source Catala et
     en traduit le contenu vers diverses cibles de programmation littéraire ou exécutable.`
    />
  </p>,
}

// TODO: automatically generate redirect to the href=ocaml_docs
let ocaml_docs_card: Card.Presentation.t = {
  title: <Lang.String english="OCaml documentation" french=`Documentation OCaml` />,
  icon: None,
  quote: None,
  action: Some((
    [Nav.home, Nav.doc, Nav.ocamlDocs],
    <Lang.String english="See documentation" french=`Voir la documentation` />,
  )),
  content: <p>
    <Lang.String
      english="The Catala tooling is developped using the OCaml language. Internal documentation is auto-generated from the code using "
      french=`L'outillage autour de Catala est développé avec le langage OCaml. La documentation interne est auto-generée à partir du code source en utilisant `
    />
    <Link.Text target="https://github.com/ocaml/odoc"> {React.string("odoc")} </Link.Text>
    {"." |> React.string}
  </p>,
}

let syntax_cheat_sheet_card: Card.Presentation.t = {
  title: <Lang.String english="Syntax sheat cheet" french=`Pense-bête syntaxique` />,
  icon: None,
  quote: None,
  action: Some((
    [Nav.home, Nav.doc, Nav.syntaxCheatSheet],
    <Lang.String english="Download the cheet" french=`Télécharger le pense-bête` />,
  )),
  content: <p>
    <Lang.String
      english="This cheet is a handy reference to the Catala syntax and how programs should be written."
      french=`Cette feuille est une référence complète et pratique pour la syntaxe de Catala.`
    />
  </p>,
}

@react.component
let make = () => <>
  <Title>
    <Lang.String english="Catala tooling documentation" french=`Documentation des outils Catala` />
  </Title>
  <Card.Presentation.FromList cards=[catala_card, ocaml_docs_card, syntax_cheat_sheet_card] />
</>
