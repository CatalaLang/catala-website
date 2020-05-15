let github_link = "https://github.com/CatalaLang/catala";

let examples_card: Utils.presentation_card = {
  title:
    <Lang.String
      english="Closer to the source of truth"
      french={js|Plus près de la source de vérité|js}
    />,
  icon: Some("check"),
  quote:
    Some(
      <Lang.String
        english="A program that should to stick to the law, should reside next to the law."
        french={js|Écrire le code à côté de la loi qu'il est censé suivre|js}
      />,
    ),
  action:
    Some((
      [|Elements.home, Elements.examples|],
      <Lang.String
        english="Catala program examples"
        french={js|Exemples de programmes Catala|js}
      />,
    )),
  content: {
    <Lang.String
      english="Implementations derived from legislative texts are hard to get right.
     The specification for how one quantity is computed may be scattered accross various places in your
     legislative source. Catala addressess this problem by interleaving the legislative source with the
     code that models it. To implement your program, just follow what the law says!"
      french={js|Il est difficile de produire des implémentations correctes d'algorithmes dérivés de textes législatifs.
    La définition d'une quantité peut être morcelée dans plusieurs sections de la source législative ou réglementaire. Catala
    prend en compte cette situation en intercalant la source législative ou réglementaire et le code qui est censé
    la modéliser. Pour implémenter votre programme, vous n'avez qu'à suivre la loi ligne à ligne!|js}
    />;
  },
};

let doc_card: Utils.presentation_card = {
  title:
    <Lang.String
      english="One code, multiple execution targets"
      french={js|Un seul code, plusieurs environnements d'exécution|js}
    />,
  icon: Some("device_hub"),
  quote:
    Some(
      <Lang.String
        english="Simple code should be executed simply"
        french={js|Exécuter simplement des programmes simples|js}
      />,
    ),
  action:
    Some((
      [|Elements.home, Elements.doc|],
      <Lang.String english="Documentation" french="Documentation" />,
    )),
  content: {
    <Lang.String
      english="Code derived from legislation generally uses basic programming concepts, that are present
 in every programming language. Why would you need a complex rules engine or runtime to execute that code?
 Catala uses a fully-fledged compiler to bring you the code you need, in the programming language you need.
 That also include legacy environments used in large organizations."
      french={js|Le code dérivé d'une source législative ou réglementaire n'utilise généralement que des concepts basique de la
 programmation, qui sont présents dans tous les langages de programmation. Pourquoi y aurait-il besoin
 d'un moteur de règles où d'un environnement d'exécution complexe pour exécuter ce code ? Catala utilise
 un véritable compilateur pour vous apporter le code dont vous avez besoin dans le langage de programmation
 de votre choix. Cela inclus également des environnements d'exécution anciens utilisés dans de grosses
 organisations.|js}
    />;
  },
};

let legal_guide_card: Utils.presentation_card = {
  title:
    <Lang.String
      english="Validation from legal"
      french={js|Sécurité juridique|js}
    />,
  icon: Some("work"),
  quote:
    Some(
      <Lang.String
        english="Legislative code should be reviewed by legislative experts"
        french={js|Utiliser l'expertise juridique pour valider ses programmes|js}
      />,
    ),
  action:
    Some((
      [|Elements.home, Elements.guide|],
      <Lang.String
        english="A lawyer's guide to Catala code validation"
        french={js|Guide de validation du code Catala pour juristes|js}
      />,
    )),
  content: {
    <Lang.String
      english="For programs derived from legislation, validation relies on lawyers who generally write
     test cases by hand. Maintaining a large test base is costly in a context of fast-paced legislative reforms,
     as it is difficult to predict which tests will be affected by the changes. Catala is designed with
     law professionals to ensure that the code itself is reviewable by domain experts, increasing the
     level of assurance for no additional cost."
      french={js|La validation de programmes dérivés d'une source législative ou réglementaire repose généralement
    sur des juristes spécialisés qui écrivent des cas de test manuellement. Or, maintenir une grande quantité
    de cas de tests est coûteux lorsque la législation change potentiellement tous les ans. En effet, il
    est difficile de prédire quels tests sont affectés par les changements. Catala a été  conçu en collaboration
    avec des juristes afin de garantir la relisibilité du code par des experts métier, ce qui en augmente
    le niveau d'assurance sans entraîner de coût supplémentaire.|js}
    />;
  },
};

let foundations_card: Utils.presentation_card = {
  title:
    <Lang.String
      english="Solid foundations"
      french={js|Des fondations solides|js}
    />,
  icon: Some("functions"),
  quote:
    Some(
      <Lang.String
        english="A programming language made by programming language specialists"
        french={js|Un langage de programmation conçu par des spécialistes|js}
      />,
    ),
  action:
    Some((
      [|Elements.home, Elements.formalization|],
      <Lang.String
        english="Formalized specification"
        french={js|Formalisation|js}
      />,
    )),
  content: {
    <>
      <Lang.String
        english="Catala originates from "
        french={js|Catala est développé à |js}
      />
      <Utils.TextLink target="https://www.inria.fr">
        {"Inria" |> React.string}
      </Utils.TextLink>
      <Lang.String
        english=", the French National Institute for Computer Science Research.
   The language has been designed according to state-of-the-art programming languages design principles.
   Inspired from the ML language family, Catala features an unique default logic mechanism based on "
        french={js|, l'Institut National de Recherche en Informatique et en Automatique.
   La conception du langage de programmation suit les techniques  de l'état de l'art du domaine.
   Inspiré des langages de la famille ML, Catala possède un mécanisme inédit de logique par défaut basé sur |js}
      />
      <Utils.TextLink
        target="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3088206">
        <Lang.String
          english="the work of Sarah Lawsky"
          french={js|le travail de Sarah Lawsky|js}
        />
      </Utils.TextLink>
      {"." |> React.string}
    </>;
  },
};

[@react.component]
let make = () => {
  let (lang, _) = React.useContext(Lang.langContext);
  <>
    <div className=[%tw "flex flex-col items-center"]>
      <div className=[%tw "text-center text-xl italic py-8 max-w-xl"]>
        <p>
          <Lang.String
            english="Catala is a domain-specific programming language designed for deriving correct-by-construction
          implementations from legislative texts."
            french={js|Catala est un langage dédié à l'écriture d'implémentations correctes
             d'algorithmes dérivés de textes législatifs|js}
          />
        </p>
      </div>
      <div className=[%tw "flex flex-row flex-wrap justify-center"]>
        <div className=[%tw "mx-4 my-2"]>
          <div
            className=[%tw
              "bg-secondary shadow text-2xl md:text-xl lg:text-lg py-4 px-4"
            ]>
            <a
              className=[%tw "cursor-pointer uppercase text-white"]
              href=github_link>
              <div className=[%tw "flex flex-row flex-no-wrap items-center"]>
                <Lang.String english="Get started" french={js|Essayer|js} />
                <i className="pl-4 material-icons">
                  {"code" |> React.string}
                </i>
              </div>
            </a>
          </div>
        </div>
        <div className=[%tw "mx-4 my-2"]>
          <div
            className=[%tw
              "bg-secondary shadow text-2xl md:text-xl lg:text-lg xl:text-lg py-4 px-4"
            ]>
            <a
              className=[%tw "cursor-pointer uppercase text-white"]
              onClick={Elements.goToElement(
                [|Elements.home, Elements.about|],
                lang,
              )}>
              <div className=[%tw "flex flex-row flex-no-wrap items-center"]>
                <Lang.String english="About" french={js|À propos|js} />
                <i className="pl-4 material-icons">
                  {"info" |> React.string}
                </i>
              </div>
            </a>
          </div>
        </div>
      </div>
    </div>
    <div className=[%tw "py-10"]>
      <Utils.PresentationCards
        cards=[|examples_card, doc_card, legal_guide_card, foundations_card|]
      />
    </div>
  </>;
};
