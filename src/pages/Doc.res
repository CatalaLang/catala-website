%raw(`require("../../assets/man_page.css")`)

module type ManPage = {
  let title: React.element
  let html: string
}

module MakeManPageDoc = (Man: ManPage) => {
  @react.component
  let make = () => <>
    <Utils.PageTitle> Man.title </Utils.PageTitle>
    <Utils.Card collapsible=false>
      <div className="font-mono man-page" dangerouslySetInnerHTML={"__html": Man.html} />
    </Utils.Card>
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
    <Utils.PageTitle>
      <Lang.String english="OCaml documentation" french="Documentation OCaml" />
    </Utils.PageTitle>
    <div className=%tw("flex flex-row justify-center")>
      <div className=%tw("mx-8 my-4")>
        <a className=%tw("cursor-pointer uppercase text-white") href="/ocaml_docs/" target="_blank">
          <div className=%tw("bg-secondary shadow text-2xl md:text-xl lg:text-lg py-4 px-4")>
            <div className=%tw("flex flex-row flex-nowrap items-center")>
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
    <Utils.PageTitle>
      <Lang.String english="Syntax sheat cheet" french=`Pense-bête syntaxique` />
    </Utils.PageTitle>
    <div className=%tw("flex flex-row justify-center")>
      <div className=%tw("mx-8 my-4")>
        <a
          className=%tw("cursor-pointer uppercase text-white")
          href="https://github.com/CatalaLang/catala/raw/master/doc/syntax/syntax.pdf"
          target="_blank">
          <div className=%tw("bg-secondary shadow text-2xl md:text-xl lg:text-lg py-4 px-4")>
            <div className=%tw("flex flex-row flex-nowrap items-center")>
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

let catala_card: Utils.presentation_card = {
  title: <Lang.String english="The Catala Compiler" french="Le compilateur Catala" />,
  action: Some((
    [Elements.home, Elements.doc, Elements.catala_man_page],
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

let ocaml_docs_card: Utils.presentation_card = {
  title: <Lang.String english="OCaml documentation" french=`Documentation OCaml` />,
  icon: None,
  quote: None,
  action: Some((
    [Elements.home, Elements.doc, Elements.ocaml_docs],
    <Lang.String english="See documentation" french=`Voir la documentation` />,
  )),
  content: <p>
    <Lang.String
      english="The Catala tooling is developped using the OCaml language. Internal documentation is auto-generated from the code using "
      french=`L'outillage autour de Catala est développé avec le langage OCaml. La documentation interne est auto-generée à partir du code source en utilisant `
    />
    <Utils.TextLink target="https://github.com/ocaml/odoc">
      {"odoc" |> React.string}
    </Utils.TextLink>
    {"." |> React.string}
  </p>,
}

let syntax_cheat_sheet_card: Utils.presentation_card = {
  title: <Lang.String english="Syntax sheat cheet" french=`Pense-bête syntaxique` />,
  icon: None,
  quote: None,
  action: Some((
    [Elements.home, Elements.doc, Elements.syntax_cheat_sheet],
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
  <Utils.PageTitle>
    <Lang.String english="Catala tooling documentation" french=`Documentation des outils Catala` />
  </Utils.PageTitle>
  <Utils.PresentationCards cards=[catala_card, ocaml_docs_card, syntax_cheat_sheet_card] />
</>
