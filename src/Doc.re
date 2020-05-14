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

module LegiFranceCatalaManPage =
  MakeManPageDoc({
    let title =
      <Lang.String
        english="Catala LegiFrance connector documentation"
        french={js|Documentation de la connextion LégiFrance pour Catala|js}
      />;
    let html: string = [%bs.raw
      {|require("../assets/legifrance_catala.html")|}
    ];
  });

let catala_doc: string = [%bs.raw {|require("../assets/catala.html")|}];

let legifrance_catala_doc: string = [%bs.raw
  {|require("../assets/legifrance_catala.html")|}
];

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

let legifrance_catala_card: Utils.presentation_card = {
  title:
    <Lang.String
      english="The LegiFrance Catala connector"
      french={js|La connexion Catala-LégiFrance|js}
    />,
  icon: None,
  quote: None,
  action:
    Some((
      [|Elements.home, Elements.doc, Elements.legifrance_catala_man_page|],
      <Lang.String english="See manpage" french={js|Voir la page man|js} />,
    )),
  content: {
    <p>
      <Lang.String
        english="Only available for the French surface language, this utility connects to the LegiFrance API
     to retrieve expiration dates for the law articles used in the implementation or compare the
     text in the source code with the official legislative text."
        french={js|Cet outil uniquement disponible pour la version française de Catala permet de se connecter à
       l'API de LégiFrance afin de récupérer les dates d'expiration de tous les articles de loi ou de règlements
        utilisés dans l'implémentation d'un programme Catala.|js}
      />
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
    <Utils.PresentationCards cards=[|catala_card, legifrance_catala_card|] />
  </>;
};
