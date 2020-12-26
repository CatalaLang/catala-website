[%bs.raw {|require("../assets/man_page.css")|}];

module type ManPage = {
  let title: React.element;
  let html: string;
};

module MakeManPageDoc = (Man: ManPage) => {
  [@react.component]
  let make = () => {
    <>
      <Utils.PageTitle> Man.title </Utils.PageTitle>
      <Utils.Card collapsible=false>
        <div
          className="font-mono man-page"
          dangerouslySetInnerHTML={"__html": Man.html}
        />
      </Utils.Card>
    </>;
  };
};

module CatalaManPage =
  MakeManPageDoc({
    let title =
      <Lang.String
        english="Catala compiler documentation"
        french={js|Documentation du compilateur Catala|js}
      />;
    let html: string = [%bs.raw {|require("../assets/catala.html")|}];
  });

module OCamlDocs = {
  [@react.component]
  let make = () => {
    <>
      <Utils.PageTitle>
        <Lang.String
          english="OCaml documentation"
          french="Documentation OCaml"
        />
      </Utils.PageTitle>
      <div className=[%tw "flex flex-row justify-center"]>
        <div className=[%tw "mx-8 my-4"]>
          <a
            className=[%tw "cursor-pointer uppercase text-white"]
            href="/ocaml_docs/"
            target="_blank">
            <div
              className=[%tw
                "bg-secondary shadow text-2xl md:text-xl lg:text-lg py-4 px-4"
              ]>
              <div className=[%tw "flex flex-row flex-no-wrap items-center"]>
                <Lang.String
                  english="Access the OCaml documentation website"
                  french={js|Accéder à la documentation OCaml|js}
                />
                <i className="pl-4 material-icons">
                  {"description" |> React.string}
                </i>
              </div>
            </div>
          </a>
        </div>
      </div>
    </>;
  };
};

let catala_doc: string = [%bs.raw {|require("../assets/catala.html")|}];


let catala_card: Utils.presentation_card = {
  title:
    <Lang.String
      english="The Catala Compiler"
      french="Le compilateur Catala"
    />,
  action:
    Some((
      [|Elements.home, Elements.doc, Elements.catala_man_page|],
      <Lang.String english="See manpage" french={js|Voir la page man|js} />,
    )),
  icon: None,
  quote: None,
  content: {
    <p>
      <Lang.String
        english="The compiler is the main tool that parses Catala source code files and translate
     the contents into various literate programming or executable targets."
        french={js|Le compilateur est l'outil principal qui prend en entrée un fichier source Catala et
     en traduit le contenu vers diverses cibles de programmation littéraire ou exécutable.|js}
      />
    </p>;
  },
};

let ocaml_docs_card: Utils.presentation_card = {
  title:
    <Lang.String
      english="OCaml documentation"
      french={js|Documentation OCaml|js}
    />,
  icon: None,
  quote: None,
  action:
    Some((
      [|Elements.home, Elements.doc, Elements.ocaml_docs|],
      <Lang.String
        english="See documentation"
        french={js|Voir la documentation|js}
      />,
    )),
  content: {
    <p>
      <Lang.String
        english="The Catala tooling is developped using the OCaml language. Internal documentation is auto-generated from the code using "
        french={js|L'outillage autour de Catala est développé avec le langage OCaml. La documentation interne est auto-generée à partir du code source en utilisant |js}
      />
      <Utils.TextLink target="https://github.com/ocaml/odoc">
        {"odoc" |> React.string}
      </Utils.TextLink>
      {"." |> React.string}
    </p>;
  },
};

[@react.component]
let make = () => {
  <>
    <Utils.PageTitle>
      <Lang.String
        english="Catala tooling documentation"
        french={js|Documentation des outils Catala|js}
      />
    </Utils.PageTitle>
    <Utils.PresentationCards
      cards=[|catala_card, ocaml_docs_card|]
    />
  </>;
};
