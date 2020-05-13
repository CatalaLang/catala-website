let url = "";

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
      Examples.url,
      <Lang.String
        english="Catala program examples"
        french={js|Exemples de programmes Catala|js}
      />,
    )),
  content: {
    "Implementations derived from legislative texts are hard to get right.
     The specification for how one quantity is computed may be scattered accross various places in your
     legislative source. Catala addressess this problem by interleaving the legislative source with the
     code that models it. To implement your program, just follow what the law says!"
    |> React.string;
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
      Doc.url,
      <Lang.String english="Documentation" french="Documentation" />,
    )),
  content: {
    "Code derived from legislation generally uses basic programming concepts, that are present
 in every programming language. Why would you need a complex rules engine or runtime to execute that code?
 Catala uses a fully-fledged compiler to bring you the code you need, in the programming language you need.
 That also include legacy environments used in large organizations."
    |> React.string;
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
      Guide.url,
      <Lang.String
        english="A lawyer's guide to Catala code validation"
        french={js|Guide de validation du code Catala pour juristes|js}
      />,
    )),
  content: {
    "For programs derived from legislation, validation relies on lawyers who generally write
     test cases by hand. Maintaining a large test base is costly in a context of fast-paced legislative reforms,
     as it is difficult to predict which tests will be affected by the changes. Catala is designed with
     law professionals to ensure that the code itself is reviewable by domain experts, increasing the
     level of assurance for no additional cost."
    |> React.string;
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
      Formalization.url,
      <Lang.String
        english="Formalized specification"
        french={js|Formalisation|js}
      />,
    )),
  content: {
    <>
      {"Catala originates from " |> React.string}
      <Utils.TextLink target="https://www.inria.fr">
        {"Inria" |> React.string}
      </Utils.TextLink>
      {", the French National Institute for Computer Science Research.
   The language has been designed according to state-of-the-art programming languages design principles.
   Inspired from the ML language, Catala features an unique default logic mechanism based on "
       |> React.string}
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
      <div className=[%tw "flex flex-row flex-no-wrap"]>
        <div className=[%tw "mx-4"]>
          <div className=[%tw "bg-secondary shadow  py-4 px-4"]>
            <a
              className=[%tw "cursor-pointer uppercase text-lg text-white"]
              href=github_link>
              <Lang.String english="Get started" french={js|Essayer|js} />
              <i className="float-right pl-2 material-icons">
                {"code" |> React.string}
              </i>
            </a>
          </div>
        </div>
        <div className=[%tw "mx-4"]>
          <div className=[%tw "bg-secondary shadow  py-4 px-4"]>
            <a
              className=[%tw "cursor-pointer uppercase text-lg text-white"]
              onClick={Utils.goToUrl(About.url)}>
              <Lang.String english="About" french={js|À propos|js} />
              <i className="float-right pl-2 material-icons">
                {"info" |> React.string}
              </i>
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
