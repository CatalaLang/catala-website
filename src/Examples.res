%bs.raw(`require("../assets/catala_code.css")`)

module FrenchFamilyBenefits = {
  let family_benefits: string = %bs.raw(`require("../assets/allocations_familiales.html")`)

  @react.component
  let make = () => <>
    <Utils.PageTitle>
      <Lang.String
        english="French family benefits computation" french=`Calcul des allocations familiales`
      />
    </Utils.PageTitle>
    <p className=%tw("pb-16")>
      <Lang.String
        english="The source code for this example is available "
        french=`Le code source de cet exemple est disponible `
      />
      <Utils.TextLink
        target="https://github.com/CatalaLang/catala/tree/master/examples/allocations_familiales">
        <Lang.String english="here" french=`ici` />
      </Utils.TextLink>
      <Lang.String
        english=". What you can see here is the \"weaved\" output of the source files processed by the Catala compiler.
        Weaving is a concept from "
        french=`. Ce que vous pouvez voir en dessous est la version "tissée" des fichiers sources transformés par le compilateur Catala.
        Le tissage est un concept issu de la `
      />
      <Utils.TextLink target="https://en.wikipedia.org/wiki/Literate_programming#Workflow">
        <Lang.String english="literate programming" french=`programmation littéraire` />
      </Utils.TextLink>
      <Lang.String
        english=" corresponding to the action of interleaving together the code and its textual documentation
         as to produce a reviewable and comprehensive document. Please refer to the tutorial for a hands-on introduction
          on how to read this document."
        french=` , qui correspond à l'action d'entremêler le code et sa documentation textuelle dans un document
         complet et lisible. Veuillez vous réferer au tutoriel pour savoir comment lire ce document.`
      />
    </p>
    <div className="catala-code" dangerouslySetInnerHTML={"__html": family_benefits} />
  </>
}

module USTaxCode = {
  let us_tax_code: string = %bs.raw(`require("../assets/us_tax_code.html")`)

  @react.component
  let make = () => <>
    <Utils.PageTitle>
      <Lang.String english="US Tax Code" french=`Code des impôts américain` />
    </Utils.PageTitle>
    <p className=%tw("pb-16")>
      <Lang.String
        english="The source code for this example is available "
        french=`Le code source de cet exemple est disponible `
      />
      <Utils.TextLink
        target="https://github.com/CatalaLang/catala/tree/master/examples/us_tax_code">
        <Lang.String english="here" french=`ici` />
      </Utils.TextLink>
      <Lang.String
        english=". What you can see here is the \"weaved\" output of the source files processed by the Catala compiler.
        Weaving is a concept from "
        french=`. Ce que vous pouvez voir en dessous est la version "tissée" des fichiers sources transformés par le compilateur Catala.
        Le tissage est un concept issu de la `
      />
      <Utils.TextLink target="https://en.wikipedia.org/wiki/Literate_programming#Workflow">
        <Lang.String english="literate programming" french=`programmation littéraire` />
      </Utils.TextLink>
      <Lang.String
        english=" corresponding to the action of interleaving together the code and its textual documentation
         as to produce a reviewable and comprehensive document. Please refer to the tutorial for a hands-on introduction
          on how to read this document."
        french=` , qui correspond à l'action d'entremêler le code et sa documentation textuelle dans un document
         complet et lisible. Veuillez vous réferer au tutoriel pour savoir comment lire ce document.`
      />
    </p>
    <div className="catala-code" dangerouslySetInnerHTML={"__html": us_tax_code} />
  </>
}

module DummyFrench = {
  let french: string = %bs.raw(`require("../assets/french.html")`)

  @react.component
  let make = () => <>
    <Utils.PageTitle>
      {`Exemple de programme conçu expréssement pour des juristes` |> React.string}
    </Utils.PageTitle>
    <p>
      {`
      Dans le cadre d'un projet de recherche de l'` |> React.string}
      <Utils.TextLink target="https://www.inria.fr/fr"> {"Inria" |> React.string} </Utils.TextLink>
      {` sur l'amélioration
        de la fiabilité des logiciels censés suivre une spécification législative, le langage ` |> React.string}
      <Utils.TextLink target="https://github.com/CatalaLang/catala">
        {"Catala" |> React.string}
      </Utils.TextLink>
      {` propose d'annoter directement les textes
        législatifs avec leur contenu logiciel.` |> React.string}
    </p>
    <p>
      {`Ci-dessous se trouve un exemple purement illustratif d'annotation d'une partie de l'article D 521-1 du code
        de la sécurité sociale décrivant une partie du calcul du montant des allocations familiales. Chaque
        ligne de l'article est annotée par un bloc de code informatique (préfixé par des numéros de ligne).` |> React.string}
    </p>
    <p>
      {`Le code informatique se lit en français ; les couleurs sont là à titre purement indicatif pour
        faciliter la lecture mais ne portent pas d'informations sur la manière dont le code s'exécutera.` |> React.string}
    </p>
    <p>
      {`Le "champ d'application" correspond au contexte logique dans lequel on se place pour appliquer
        l'article D 521-1. La "définition" d'une quantité permet de décrire sa valeur en fonction d'autres
        quantité. Une quantité est nommée par un identifiant (par exemple "allocations_familiales") parfois suivi d'un
        point et d'un autre identifiant correspondant à une partie de la quantité précédant le point. "sous condition"
        et "conséquence" décrivent une condition à remplir pour que la définition prenne effet. Les opérations arithmétiques
        usuelles sont utilisées, les parenthèses servent à
        délimiter des sous-expressions de manière non-ambigue.` |> React.string}
    </p>
    <p className=%tw("pb-16")>
      {`Le code présenté ci-dessous est extrait d'une étude de cas plus complète sur le calcul des allocations
      familiales, ` |> React.string}
      <Utils.InternalLink
        target=[Elements.home, Elements.examples, Elements.french_family_benefits_example]>
        {`disponible en suivant ce lien` |> React.string}
      </Utils.InternalLink>
      {`. Si cet exemple vous intéresse ou si vous avez d'autres questions, vous pouvez contacter directement
          l'auteur à l'adresse ` |> React.string}
      <Utils.TextLink target="mailto:denis.merigoux@inria.fr">
        {"denis.merigoux@inria.fr" |> React.string}
      </Utils.TextLink>
      {"." |> React.string}
    </p>
    <div className="catala-code" dangerouslySetInnerHTML={"__html": french} />
  </>
}

module TutorialEn = {
  let tutorial_en: string = %bs.raw(`require("../assets/tutorial_en.html")`)

  @react.component
  let make = () => <>
    <Utils.PageTitle>
      <Lang.String
        english="English tutorial for Catala developers"
        french=`Catala: tutoriel pour programmeurs anglophones`
      />
    </Utils.PageTitle>
    <div className="catala-code" dangerouslySetInnerHTML={"__html": tutorial_en} />
  </>
}

module TutorialFr = {
  let tutorial_fr: string = %bs.raw(`require("../assets/tutoriel_fr.html")`)

  @react.component
  let make = () => <>
    <Utils.PageTitle>
      <Lang.String
        english="French tutorial for Catala developers"
        french=`Catala: tutoriel pour programmeurs francophones`
      />
    </Utils.PageTitle>
    <div className="catala-code" dangerouslySetInnerHTML={"__html": tutorial_fr} />
  </>
}

let family_benefits: string = %bs.raw(`require("../assets/allocations_familiales.html")`)

let family_benefits_card: Utils.presentation_card = {
  title: <Lang.String english="French family benefits" french="Allocations familiales" />,
  action: Some((
    [Elements.home, Elements.examples, Elements.french_family_benefits_example],
    <Lang.String english="see example" french=`Voir l'exemple` />,
  )),
  icon: None,
  quote: None,
  content: <>
    <Lang.String
      english="The content of the example is generated by the Catala compiler from the "
      french=`Le contenu de cet exemple est généré par le compilateur Catala à partir des `
    />
    <Utils.TextLink
      target="https://github.com/CatalaLang/catala/tree/master/examples/allocations_familiales">
      <Lang.String english="source code files of the example" french=`sources de l'exemple` />
    </Utils.TextLink>
    <Lang.String
      english=". The code, like the legislative text it follows, is written in French." french="."
    />
  </>,
}

let english_card: Utils.presentation_card = {
  title: <Lang.String english="US Tax Code" french=`Code des impôts américain` />,
  action: Some((
    [Elements.home, Elements.examples, Elements.us_tax_code],
    <Lang.String english="see example" french=`Voir l'exemple` />,
  )),
  icon: None,
  quote: None,
  content: <>
    <Lang.String
      english="The content of this example is generated by the Catala compiler from the "
      french=`Le contenu de cet exemple est généré par le compilateur de Catala à partir des `
    />
    <Utils.TextLink
      target="https://github.com/CatalaLang/catala/tree/master/examples/dummy_english">
      <Lang.String
        english="source code files of the example" french=`fichiers source de l'exemple`
      />
    </Utils.TextLink>
    <Lang.String english="." french=`.` />
  </>,
}

let french_card: Utils.presentation_card = {
  title: <Lang.String english="French dummy example" french=`Exemple en français` />,
  action: Some((
    [Elements.home, Elements.examples, Elements.french_example],
    <Lang.String english="see example" french=`Voir l'exemple` />,
  )),
  icon: None,
  quote: None,
  content: <>
    <Lang.String
      english="This example has been used for illustrating the concepts of Catala for
     a rules-as-code poll sent by the "
      french=`Cet exemple a été utilisé pour illustrer les concepts de Catala pour un sondage
       sur le thème "transformer la loi en code" envoyé par l'association `
    />
    <Utils.TextLink target="hhttps://openlaw.fr/"> {React.string("OpenLaw")} </Utils.TextLink>
    <Lang.String english=" association." french=`.` />
  </>,
}

let tutorial_en_card: Utils.presentation_card = {
  title: <Lang.String
    english="English tutorial for Catala developers"
    french=`Catala: tutoriel pour programmeurs anglophones`
  />,
  action: Some((
    [Elements.home, Elements.examples, Elements.tutorial_en_example],
    <Lang.String english="See the tutorial" french=`Voir le tutoriel` />,
  )),
  icon: None,
  quote: None,
  content: <Lang.String
    english="This tutorial is an opportunity to discover Catala from a developer's point of view.
    The document goes over a fictional legislative example and give insights and tips about how annotate the
    law with Catala code."
    french=`Ce tutoriel est le meilleur moyen de découvrir Catala de la perspective d'un développeur.
      Le document part d'un exemple fictif d'un morceau de législation, et donne les éléments conceptuelles
      et meilleures méthodes pour annoter la loi avec du code Catala.
      `
  />,
}

let tutorial_fr_card: Utils.presentation_card = {
  title: <Lang.String
    english="French tutorial for Catala developers"
    french=`Catala: tutoriel pour programmeurs francophones`
  />,
  action: Some((
    [Elements.home, Elements.examples, Elements.tutorial_fr_example],
    <Lang.String english="See the tutorial" french=`Voir le tutoriel` />,
  )),
  icon: None,
  quote: None,
  content: <Lang.String
    english="This tutorial is an opportunity to discover Catala from a developer's point of view.
    The document goes over a fictional legislative example and give insights and tips about how annotate the
    law with Catala code."
    french=`Ce tutoriel est le meilleur moyen de découvrir Catala de la perspective d'un développeur.
      Le document part d'un exemple fictif d'un morceau de législation, et donne les éléments conceptuelles
      et meilleures méthodes pour annoter la loi avec du code Catala.
      `
  />,
}

@react.component
let make = () => <>
  <Utils.PageTitle>
    <Lang.String english="Catala examples" french=`Exemples de programmes Catala` />
  </Utils.PageTitle>
  <Utils.PresentationCards
    cards=[tutorial_en_card, tutorial_fr_card, family_benefits_card, english_card, french_card]
  />
</>
