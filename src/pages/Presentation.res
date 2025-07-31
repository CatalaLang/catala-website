let bookLink = "https://book.catala-lang.org"
let githubLink = "https://github.com/CatalaLang/catala"
let githubLinkLatestRelease = "https://github.com/CatalaLang/catala/releases/latest"
let zulipLink = "https://zulip.catala-lang.org/"

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

let frenchHomepage: string = %raw(`require("../../assets/french_homepage.html")`)

let englishHomepage: string = %raw(`require("../../assets/english_homepage.html")`)

@react.component
let make = () => {
  <div className=%twc("flex flex-col gap-32")>
    <div className=%twc("flex flex-col justify-center items-center")>
      <div className=%twc("pt-48 pb-16")>
        <p
          className=%twc(
            "text-center text-2xl sm:text-4xl text-background italic font-sans font-semibold max-w-2xl sm:max-w-3xl"
          )>
          <Lang.String
            english="Catala is a domain-specific programming language designed for deriving correct-by-construction
          implementations from legislative texts."
            french={`Catala est un langage dédié à l'écriture d'implémentations correctes
             d'algorithmes dérivés de textes législatifs`}
          />
        </p>
      </div>
      <div
        className=%twc("inline-flex flex-row justify-between content-center text-xl font-semibold")>
        <Link.Internal
          className=%twc("cursor-pointer text-green hover:text-button_fg_hover pr-4 text-center")
          target={[Nav.home, Nav.publications]}>
          <Lang.String english="Read publications" french={`Lire les publications`} />
        </Link.Internal>
        <Link.Text
          className=%twc("cursor-pointer text-green hover:text-button_fg_hover pl-4 text-center")
          target=zulipLink>
          <Lang.String english="Join us on Zulip" french={`Rejoins-nous sur Zulip`} />
        </Link.Text>
      </div>
      <div className=%twc("inline-flex flex-row gap-4")>
        <Link.Button target={bookLink}>
          <Lang.String english="Read the documentation" french={`Lire la documentation`} />
        </Link.Button>
        <Link.Button target={githubLink}>
          <Lang.String english="Get started on GitHub" french={`Démarrer sur GitHub`} />
        </Link.Button>
      </div>
      <div className=%twc("text-base font-sans")>
        <Lang.String english="Apache-2.0 License" french={`Apache-2.0 Licence`} />
        <Link.Text
          className=%twc("cursor-pointer text-green hover:text-button_fg_hover pl-2 font-semibold")
          target={githubLinkLatestRelease}>
          <Lang.String english="GitHub v1.0.0-alpha" french={`GitHub v1.0.0-alpha`} />
        </Link.Text>
      </div>
    </div>
    <div className=%twc("flex flex-col flex-wrap content-center justify-center items-center")>
      <div className=%twc("w-full lg:w-3/5 text-background text-center text-3xl font-bold py-8")>
        <Lang.String english="Catala in action" french={`Catala en action`} />
      </div>
      <div className=%twc("w-full lg:w-3/5 border-solid")>
        <p className=%twc("text-base sm:text-lg my-4 italic")>
          <Lang.String
            english="Catala works by annotating legislative texts with their code translation.
            Here is a quick example from the US Tax Code:"
            french={`Le principe de Catala est d'annoter directement les textes législatifs ou règlementaires
            avec leur traduction en termes algorithmique. En voici un exemple rapide tiré d'un
            article du code de la sécurité sociale :`}
          />
        </p>
        <Lang.Element
          french={<CatalaCode.DangerouslySetInnerHtml html=frenchHomepage />}
          english={<CatalaCode.DangerouslySetInnerHtml html=englishHomepage />}
        />
      </div>
    </div>
    <div>
      <div className=%twc("w-full text-background text-center text-3xl font-bold py-8")>
        <Lang.String english="Why using Catala?" french={`Pourquoi utiliser Catala ?`} />
      </div>
      <div className=%twc("text-base sm:text-lg pb-10 pt-4")>
        <Card.Presentation.FromList
          cards=[examplesCard, docCard, legalGuideCard, foundationsCard]
        />
      </div>
    </div>
  </div>
}
