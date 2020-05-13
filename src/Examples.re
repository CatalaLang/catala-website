[%bs.raw {|require("../assets/catala_code.css")|}];

module FrenchFamilyBenefits = {
  let url = "examples/french-family-benefits";

  let family_benefits: string = [%bs.raw
    {|require("../assets/allocations_familiales.html")|}
  ];

  [@react.component]
  let make = () => {
    <>
      <Utils.PageTitle title="French family benefits computation" />
      <p className=[%tw "pb-16"]>
        {"The source code for this example is available " |> React.string}
        <Utils.TextLink
          target="https://github.com/CatalaLang/catala/tree/master/examples/allocations_familiales">
          <Lang.String english="here" french={js|ici|js} />
        </Utils.TextLink>
        {". What you can see here is the \"weaved\" output of the source files processed by the Catala compiler.
        Weaving is a concept from "
         |> React.string}
        <Utils.TextLink
          target="https://en.wikipedia.org/wiki/Literate_programming#Workflow">
          <Lang.String
            english="literate programming"
            french={js|programmation littéraire|js}
          />
        </Utils.TextLink>
        {", corresponding to the action of interleaving together the code and its textual documentation
         as to produce a reviewable and comprehensive document. Please refer to the "
         |> React.string}
        <Utils.InternalLink target=Guide.url text="reading guide" />
        {" for a hands-on introduction on how to read this document."
         |> React.string}
      </p>
      <div
        className="catala-code"
        dangerouslySetInnerHTML={"__html": family_benefits}
      />
    </>;
  };
};

module DummyEnglish = {
  let url = "examples/english";

  let english: string = [%bs.raw {|require("../assets/english.html")|}];

  [@react.component]
  let make = () => {
    <>
      <Utils.PageTitle title="Catala in English example" />
      <p className=[%tw "pb-16"]>
        {"The source code for this example is available " |> React.string}
        <Utils.TextLink
          target="https://github.com/CatalaLang/catala/tree/master/examples/dummy_english">
          <Lang.String english="here" french={js|ici|js} />
        </Utils.TextLink>
        {". What you can see here is the \"weaved\" output of the source files processed by the Catala compiler.
        Weaving is a concept from "
         |> React.string}
        <Utils.TextLink
          target="https://en.wikipedia.org/wiki/Literate_programming#Workflow">
          <Lang.String
            english="literate programming"
            french={js|programmation littéraire|js}
          />
        </Utils.TextLink>
        {", corresponding to the action of interleaving together the code and its textual documentation
         as to produce a reviewable and comprehensive document. Please refer to the "
         |> React.string}
        <Utils.InternalLink target=Guide.url text="reading guide" />
        {" for a hands-on introduction on how to read this document."
         |> React.string}
      </p>
      <div
        className="catala-code"
        dangerouslySetInnerHTML={"__html": english}
      />
    </>;
  };
};

module DummyFrench = {
  let url = "examples/french";

  let french: string = [%bs.raw {|require("../assets/french.html")|}];

  [@react.component]
  let make = () => {
    <>
      <Utils.PageTitle
        title={js|Exemple de programme conçu expréssement pour des juristes|js}
      />
      <p>
        {{js|
      Dans le cadre d'un projet de recherche de l'|js}
         |> React.string}
        <Utils.TextLink target="https://www.inria.fr/fr">
          {"Inria" |> React.string}
        </Utils.TextLink>
        {{js| sur l'amélioration
        de la fiabilité des logiciels censés suivre une spécification législative, le langage |js}
         |> React.string}
        <Utils.TextLink target="https://github.com/CatalaLang/catala">
          {"Catala" |> React.string}
        </Utils.TextLink>
        {{js| propose d'annoter directement les textes
        législatifs avec leur contenu logiciel.|js}
         |> React.string}
      </p>
      <p>
        {{js|Ci-dessous se trouve un exemple purement illustratif d'annotation d'une partie de l'article D 521-1 du code
        de la sécurité sociale décrivant une partie du calcul du montant des allocations familiales. Chaque
        ligne de l'article est annotée par un bloc de code informatique (préfixé par des numéros de ligne).|js}
         |> React.string}
      </p>
      <p>
        {{js|Le code informatique se lit en français ; les couleurs sont là à titre purement indicatif pour
        faciliter la lecture mais ne portent pas d'informations sur la manière dont le code s'exécutera.|js}
         |> React.string}
      </p>
      <p>
        {{js|Le "champ d'application" correspond au contexte logique dans lequel on se place pour appliquer
        l'article D 521-1. La "définition" d'une quantité permet de décrire sa valeur en fonction d'autres
        quantité. Une quantité est nommée par un identifiant (par exemple "allocations_familiales") parfois suivi d'un
        point et d'un autre identifiant correspondant à une partie de la quantité précédant le point. "sous condition"
        et "conséquence" décrivent une condition à remplir pour que la définition prenne effet. Les opérations arithmétiques
        usuelles sont utilisées ; "<=" veut dire inférieur ou égal. Les parenthèses servent à
        délimiter des sous-expressions de manière non-ambigue.|js}
         |> React.string}
      </p>
      <p className=[%tw "pb-16"]>
        {{js|  Si cet exemple vous intéresse ou si vous avez d'autres questions, vous pouvez contacter directement
          l'auteur à l'adresse |js}
         |> React.string}
        <Utils.TextLink target="mailto:denis.merigoux@inria.fr">
          {"denis.merigoux@inria.fr" |> React.string}
        </Utils.TextLink>
        {"." |> React.string}
      </p>
      <div
        className="catala-code"
        dangerouslySetInnerHTML={"__html": french}
      />
    </>;
  };
};

let url = "examples";

let family_benefits: string = [%bs.raw
  {|require("../assets/allocations_familiales.html")|}
];

let family_benefits_card: Utils.presentation_card = {
  title:
    <Lang.String
      english="French family benefits"
      french="Allocations familiales"
    />,
  action:
    Some((
      FrenchFamilyBenefits.url,
      <Lang.String english="see example" french={js|Voir l'exemple|js} />,
    )),
  icon: None,
  quote: None,
  content: {
    <p>
      {React.string(
         "The content below is generated by the Catala compiler from the ",
       )}
      <a
        href="https://github.com/CatalaLang/catala/tree/master/examples/allocations_familiales">
        {React.string("source code files of the example")}
      </a>
      {React.string(
         ". The code, like the legislative text it follows, is written in French.",
       )}
    </p>;
  },
};

let english_card: Utils.presentation_card = {
  title:
    <Lang.String
      english="English dummy example"
      french="Example en anglais"
    />,
  action:
    Some((
      DummyEnglish.url,
      <Lang.String english="see example" french={js|Voir l'exemple|js} />,
    )),
  icon: None,
  quote: None,
  content: {
    <p>
      {React.string(
         "The content below is generated by the Catala compiler from the ",
       )}
      <a
        href="https://github.com/CatalaLang/catala/tree/master/examples/dummy_english">
        <Lang.String
          english="source code files of the example"
          french={js|fichiers source de l'exemple|js}
        />
      </a>
      {React.string(
         ". The code does not model real anglo-saxon legislation but showcases the English version of Catala",
       )}
    </p>;
  },
};

let french_card: Utils.presentation_card = {
  title:
    <Lang.String
      english="French dummy example"
      french={js|Exemple en français|js}
    />,
  action:
    Some((
      DummyFrench.url,
      <Lang.String english="see example" french={js|Voir l'exemple|js} />,
    )),
  icon: None,
  quote: None,
  content: {
    <p>
      {React.string(
         "This example has been used for illustrating the concepts of Catala for a rules-as-code poll sent by the ",
       )}
      <a href="hhttps://openlaw.fr/"> {React.string("OpenLaw")} </a>
      {React.string(" association.")}
    </p>;
  },
};

[@react.component]
let make = () => {
  <>
    <Utils.PageTitle title="Catala examples" />
    <Utils.PresentationCards
      cards=[|family_benefits_card, english_card, french_card|]
    />
  </>;
};
