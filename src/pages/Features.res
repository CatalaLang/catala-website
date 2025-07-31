open PageComponents

type imgLocation = {default: string}

let pair_programming_image: imgLocation = %raw("require('../../assets/pair_programming_compr.jpg')")

let examplesCard: Card.Presentation.t = {
  title: <Lang.String
    english="Closer to the source of truth" french={`Plus près de la source de vérité`}
  />,
  icon: Some("check"),
  quote: Some(
    <Lang.String
      english="A program that should stick to the law, should reside next to the law."
      french={`Écrire le code à côté de la loi qu'il est censé suivre`}
    />,
  ),
  action: None,
  content: <Lang.String
    english="Implementations derived from legislative texts are hard to get right.
     The specification for how one quantity is computed may be scattered across various places in your
     legislative source. Catala addresses this problem by interleaving the legislative source with the
     code that models it. To implement your program, just follow what the law says!"
    french={`Il est difficile de produire des implémentations correctes d'algorithmes dérivés de textes législatifs.
    La définition d'une quantité peut être morcelée dans plusieurs sections de la source législative ou réglementaire. Catala
    prend en compte cette situation en intercalant la source législative ou réglementaire et le code qui est censé
    la modéliser. Pour implémenter votre programme, vous n'avez qu'à suivre la loi ligne à ligne!`}
  />,
}

let docCard: Card.Presentation.t = {
  title: <Lang.String
    english="One code, multiple execution targets"
    french={`Un seul code, plusieurs environnements d'exécution`}
  />,
  icon: Some("device_hub"),
  quote: Some(
    <Lang.String
      english="Simple code should be executed simply"
      french={`Exécuter simplement des programmes simples`}
    />,
  ),
  action: None,
  content: <Lang.String
    english="Code derived from legislation generally uses basic programming concepts, that are present
 in every programming language. Why would you need a rules-engine or runtime environment to execute that code?
 Catala uses a fully-fledged compiler to bring you the code you need, in the programming language you need.
 That also includes legacy environments used in large organizations."
    french={`Le code dérivé d'une source législative ou réglementaire n'utilise généralement que des concepts basique de la
 programmation, qui sont présents dans tous les langages de programmation. Pourquoi y aurait-il besoin
 d'un moteur de règles où d'un environnement d'exécution complexe pour exécuter ce code ? Catala utilise
 un véritable compilateur pour vous apporter le code dont vous avez besoin dans le langage de programmation
 de votre choix. Cela inclus également des environnements d'exécution anciens utilisés dans de grosses
 organisations.`}
  />,
}

let legalGuideCard: Card.Presentation.t = {
  title: <Lang.String english="Validation from legal" french={`Sécurité juridique`} />,
  icon: Some("work"),
  quote: Some(
    <Lang.String
      english="Legislative code should be reviewed by legislative experts"
      french={`Utiliser l'expertise juridique pour valider ses programmes`}
    />,
  ),
  action: None,
  content: <Lang.String
    english="For programs derived from legislation, validation relies on lawyers who generally write
     test cases by hand. Maintaining a large test base is costly in a context of fast-paced legislative reforms,
     as it is difficult to predict which tests will be affected by the changes. Catala is designed with
     law professionals to ensure that the code itself is reviewable by domain experts, increasing the
     level of assurance for no additional cost."
    french={`La validation de programmes dérivés d'une source législative ou réglementaire repose généralement
    sur des juristes spécialisés qui écrivent des cas de test manuellement. Or, maintenir une grande quantité
    de cas de tests est coûteux lorsque la législation change potentiellement tous les ans. En effet, il
    est difficile de prédire quels tests sont affectés par les changements. Catala a été  conçu en collaboration
    avec des juristes afin de garantir la relisibilité du code par des experts métier, ce qui en augmente
    le niveau d'assurance sans entraîner de coût supplémentaire.`}
  />,
}

let foundationsCard: Card.Presentation.t = {
  title: <Lang.String english="Solid foundations" french={`Des fondations solides`} />,
  icon: Some("functions"),
  quote: Some(
    <Lang.String
      english="A programming language made by programming language specialists"
      french={`Un langage de programmation conçu par des spécialistes`}
    />,
  ),
  action: None,
  content: <>
    <Lang.String english="Catala originates from " french={`Catala est développé à `} />
    <Link.Text target="https://www.inria.fr"> {React.string("Inria")} </Link.Text>
    <Lang.String
      english=", the French National Institute for Computer Science Research.
   The language has been designed according to state-of-the-art programming languages design principles.
   Inspired from the ML language family, Catala features a unique default logic mechanism based on "
      french={`, l'Institut National de Recherche en Informatique et en Automatique.
   La conception du langage de programmation suit les techniques  de l'état de l'art du domaine.
   Inspiré des langages de la famille ML, Catala possède un mécanisme inédit de logique par défaut basé sur `}
    />
    <Link.Text target="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3088206">
      <Lang.String english="the work of Sarah Lawsky" french={`le travail de Sarah Lawsky`} />
    </Link.Text>
    {React.string(".")}
  </>,
}

@react.component
let make = () => <>
  <Title>
    <Lang.String english="Features" french={`Fonctionnalités`} />
  </Title>
  <div>
    <div className=%twc("text-base sm:text-lg pb-10 pt-4")>
      <Card.Presentation.FromList cards=[examplesCard, docCard, legalGuideCard, foundationsCard] />
    </div>
  </div>
  //   <img className=%twc("w-64") src={pair_programming_image.default} />
</>
