open PageComponents
open People

type publication = {
  title: string,
  authors: array<person>,
  date: string,
  link: string,
  citation: string,
  abstract: option<string>,
  bibtex: string,
}

let jfla2020 = {
  title: `Étude formelle de l'implémentation du code des impôts`,
  authors: [denisMerigoux, raphaelMonat, christopheGaie],
  date: `2020`,
  link: "https://hal.inria.fr/hal-02320347",
  citation: `Denis Merigoux, Raphaël Monat, Christophe Gaie. Étude formelle de
  l'implémentation du code des impôts. JFLA 2020 - 31ème Journées Francophones
  des Langages Applicatifs, Jan 2020, Gruissan, France.`,
  abstract: Some(`The tax code, as a legislative text, defines a mathematical function that computes the income tax of a fiscal household. In order to collect taxes, this function is implemented as an algorithm by the Direction Générale des Finances Publiques (DGFiP), using a domain specific language called M (standing for "Macro-language"). We propose a formal semantics of the M language, tested thanks to data published by the DGFiP. This formalization, coupled with the public release by the DGFiP of the codebase used to compute the income tax, allowed us to produce a fully formalized artifact encoding the fragment of the tax code describing the income tax computation. We demonstrate the usefulness of such a formalization thanks to a prototype that uses an SMT solver to infer meta-properties on the income tax computation. These meta-properties could complete and refine the existing economical analysis of the redistributive effects of the income tax, as well as various social benefits. More generally, a systematic formalization of the algorithmic fragments of the law would raise the assurance level on the coherence of the French socio-fiscal system. This work has led to the development of three software artifacts: a mechanized semantics for M, an interpreter and compiler for M based on this semantics (written in OCaml), and a Python prototype of encoding the income tax computation into the Z3 SMT solver.`),
  bibtex: "@inproceedings{merigoux:hal-02320347,
  TITLE = {{{\'E}tude formelle de l'impl{\'e}mentation du code des imp{\^o}ts}},
  AUTHOR = {Merigoux, Denis and Monat, Rapha{\"e}l and Gaie, Christophe},
  URL = {https://hal.inria.fr/hal-02320347},
  BOOKTITLE = {{JFLA 2020 - 31{\`e}me Journ{\'e}es Francophones des Langages Applicatifs}},
  ADDRESS = {Gruissan, France},
  YEAR = {2020},
  MONTH = Jan,
  PDF = {https://hal.inria.fr/hal-02320347v3/file/main.pdf},
  HAL_ID = {hal-02320347},
  HAL_VERSION = {v3},
}",
}

let cc2021 = {
  title: `A Modern Compiler for the French Tax Code`,
  authors: [denisMerigoux, raphaelMonat, jonathanProtzenko],
  date: `2021`,
  link: "https://hal.inria.fr/hal-03002266",
  citation: `Denis Merigoux, Raphaël Monat, Jonathan Protzenko. A Modern Compiler for the French Tax Code.
  CC '21: 30th ACM SIGPLAN International Conference on Compiler Construction, Mar 2021, Virtual, South Korea.
  pp.71-82.`,
  abstract: Some(`In France, income tax is computed from taxpayers' individual returns, using an algorithm that is authored, designed and maintained by the French Public Finances Directorate (DGFiP). This algorithm relies on a legacy custom language and compiler originally designed in 1990, which unlike French wine, did not age well with time. Owing to the shortcomings of the input language and the technical limitations of the compiler, the algorithm is proving harder and harder to maintain, relying on ad-hoc behaviors and workarounds to implement the most recent changes in tax law. Competence loss and aging code also mean that the system does not benefit from any modern compiler techniques that would increase confidence in the implementation. We overhaul this infrastructure and present Mlang, an open-source compiler toolchain whose goal is to replace the existing infrastructure. Mlang is based on a reverse-engineered formalization of the DGFiP's system, and has been thoroughly validated against the private DGFiP test suite. As such, Mlang has a formal semantics; eliminates previous handwritten workarounds in C; compiles to modern languages (Python); and enables a variety of instrumentations, providing deep insights about the essence of French income tax computation. The DGFiP is now officially transitioning to Mlang for their production system.`),
  bibtex: "@inproceedings{merigoux:hal-03002266,
  TITLE = {{A Modern Compiler for the French Tax Code}},
  AUTHOR = {Merigoux, Denis and Monat, Rapha{\"e}l and Protzenko, Jonathan},
  URL = {https://hal.inria.fr/hal-03002266},
  BOOKTITLE = {{CC '21: 30th ACM SIGPLAN International Conference on Compiler Construction}},
  ADDRESS = {Virtual, South Korea},
  PUBLISHER = {{ACM}},
  SERIES = {CC 2021: Proceedings of the 30th ACM SIGPLAN International Conference on Compiler Construction},
  PAGES = {71-82},
  YEAR = {2021},
  MONTH = Mar,
  DOI = {10.1145/3446804.3446850},
  KEYWORDS = {tax code ; compiler ; legal expert system},
  PDF = {https://hal.inria.fr/hal-03002266v3/file/paper.pdf},
  HAL_ID = {hal-03002266},
  HAL_VERSION = {v3},
}",
}

let iafipu2020 = {
  title: `Traduire la loi en code grâce au langage de programmation Catala.`,
  authors: [lianeHuttner, denisMerigoux],
  date: `2020`,
  link: "https://hal.inria.fr/hal-03128248",
  citation: `Liane Huttner, Denis Merigoux. Traduire la loi en code grâce au langage de programmation Catala.
  Intelligence artificielle et finances publiques, Oct 2020, Nice, France.`,
  abstract: None,
  bibtex: "@inproceedings{huttner:hal-03128248,
  TITLE = {{Traduire la loi en code gr{\^a}ce au langage de programmation Catala}},
  AUTHOR = {Huttner, Liane and Merigoux, Denis},
  URL = {https://hal.inria.fr/hal-03128248},
  BOOKTITLE = {{Intelligence artificielle et finances publiques}},
  ADDRESS = {Nice, France},
  YEAR = {2020},
  MONTH = Oct,
  PDF = {https://hal.inria.fr/hal-03128248/file/121-Actes-L.%20Huttner%20et%20D.%20Merigoux%20revu.pdf},
  HAL_ID = {hal-03128248},
  HAL_VERSION = {v1},
}",
}

let ai_law_2022 = {
  title: `Catala: Moving Towards the Future of Legal Expert Systems`,
  authors: [lianeHuttner, denisMerigoux],
  date: `2022`,
  link: "https://hal.inria.fr/hal-02936606",
  citation: "Liane Huttner, Denis Merigoux. Catala: Moving Towards the Future of Legal Expert Systems. 2022.",
  abstract: Some(`Around the world, private and public organizations use software called legal expert systems to compute taxes. This software must comply with the laws they are designed to implement. As such, a bug or an error in a program that leads to tax miscalculations can have heavy legal and democratic consequences. However, increasing evidence suggests that some legal expert systems may not comply with the law. Moreover, traditional software development processes mean that legal expert systems are difficult to adapt to the continuous flow of new legislation. To prevent further software decay and to reconcile these systems with the growing demand for algorithmic transparency, we argue that there is a need for a new development process for legal expert systems. This new system must be built to comply with the law, in particular the GDPR. It must also respect democratic transparency. For these reasons, we present a solution built by lawyers and computer scientists: Catala, a new programming language coupled with a pair programming development process.`),
  bibtex: "@unpublished{huttner:hal-02936606,
  TITLE = {{Catala: Moving Towards the Future of Legal Expert Systems}},
  AUTHOR = {Huttner, Liane and Merigoux, Denis},
  URL = {https://hal.inria.fr/hal-02936606},
  NOTE = {working paper or preprint},
  YEAR = {2022},
  MONTH = Jan,
  KEYWORDS = {Social benefits ; Tax law ; Algorithmic transparency ; Literate programming ; Formal methods ; Legal expert systems},
  PDF = {https://hal.inria.fr/hal-02936606v2/file/paper.pdf},
  HAL_ID = {hal-02936606},
  HAL_VERSION = {v2},
}",
}

let prolala_2022 = {
  title: `Turning Catala into a Proof Platform for the Law`,
  authors: [alainDelaet, denisMerigoux, aymericFromherz],
  date: `2022`,
  link: "https://hal.inria.fr/hal-03447072/",
  citation: `Alain Delaët, Denis Merigoux, Aymeric Fromherz. Turning Catala into a Proof Platform for the Law.
  POPL 2022 - Programming Languages and the Law, Jan 2022, Philadelphia, United States.`,
  abstract: None,
  bibtex: "@inproceedings{delaet:hal-03447072,
  TITLE = {{Turning Catala into a Proof Platform for the Law}},
  AUTHOR = {Dela{\"e}t, Alain and Merigoux, Denis and Fromherz, Aymeric},
  URL = {https://hal.inria.fr/hal-03447072},
  BOOKTITLE = {{POPL 2022 - Programming Languages and the Law}},
  ADDRESS = {Philadelphia, United States},
  YEAR = {2022},
  MONTH = Jan,
  PDF = {https://hal.inria.fr/hal-03447072/file/paper.pdf},
  HAL_ID = {hal-03447072},
  HAL_VERSION = {v1},
}",
}

let crcl_2021 = {
  title: `The Specification Problem of Legal Expert Systems`,
  authors: [denisMerigoux],
  date: `2022`,
  link: "https://hal.inria.fr/hal-03541637/",
  citation: "Denis Merigoux. The Specification Problem of Legal Expert Systems. 2022.",
  abstract: None,
  bibtex: "@unpublished{merigoux:hal-03541637,
  TITLE = {{The Specification Problem of Legal Expert Systems}},
  AUTHOR = {Merigoux, Denis},
  URL = {https://hal.inria.fr/hal-03541637},
  NOTE = {working paper or preprint},
  YEAR = {2022},
  MONTH = Jan,
  PDF = {https://hal.inria.fr/hal-03541637/file/main.pdf},
  HAL_ID = {hal-03541637},
  HAL_VERSION = {v1},
}
",
}

let crcl_2022 = {
  title: `Rules, Computation and Politics: Scrutinizing Unnoticed Programming Choices in French Housing Benefits`,
  authors: [denisMerigoux, marieAlauzen, lilyaSlimani],
  date: `2022`,
  link: "https://hal.inria.fr/hal-03712130",
  citation: `Denis Merigoux, Marie Alauzen, Lilya Slimani. Rules, Computation and Politics: Scrutinizing Unnoticed Programming Choices in French Housing Benefits. 2022.`,
  abstract: None,
  bibtex: "@unpublished{merigoux:hal-03712130,
  TITLE = {{Rules, Computation and Politics: Scrutinizing Unnoticed Programming Choices in French Housing Benefits}},
  AUTHOR = {Merigoux, Denis and Alauzen, Marie and Slimani, Lilya},
  URL = {https://hal.inria.fr/hal-03712130},
  NOTE = {working paper or preprint},
  YEAR = {2022},
  MONTH = Jul,
  KEYWORDS = {legal expert systems ; welfare state ; critical code studies ; regulatory law},
  PDF = {https://hal.inria.fr/hal-03712130/file/main.pdf},
  HAL_ID = {hal-03712130},
  HAL_VERSION = {v1},
}",
}

let icfp2021 = {
  title: `Catala: a programming language for the law`,
  authors: [denisMerigoux, nicolasChataing, jonathanProtzenko],
  date: `2021`,
  link: "https://hal.inria.fr/hal-03159939",
  citation: `Denis Merigoux, Nicolas Chataing, and Jonathan Protzenko. 2021. Catala: a programming language for the law.
  Proc. ACM Program. Lang. 5, ICFP, Article 77 (August 2021), 29 pages.`,
  abstract: Some(`Automated legal decision-making relies on computer programs called legal expert systems, that are executed on machines not capable of legal reasoning by themselves. Rather, it is up to the programmer to ensure that the behavior of the computer program faithfully captures the letter and intent of the law. This situation is merely an instance of the more general specification problem of computer science. Indeed, the way programs are written and executed requires the programmer to express her intention in a particular form of logic or statistical model imposed by the programming language or framework. On the other hand, the intended behavior of the program or specification, here communicated through the law, is usually described using natural language or domain-specific insights. Hence, every software endeavor begins with a requirement analysis, which consists in extracting from the specification corpus a set of requirements that the computer system must obey. In the case of automated legal decision-making and legal expert systems, the members of this set of requirements are the possible legal reasoning bits that the computer program is expected to perform. Viewing the problem through this lens immediately allows for identifying the key questions for assessing the safety and correctness of legal expert systems. First, when and how is it possible to express legal reasoning as a set of requirements for a computer system? Second, how to check that these requirements are correctly translated to computer code? Third, can we ensure that the computer code does not introduced unwanted, unlawful behavior? In this article, we take a tour of the general computer science answers to these three questions and assess their efficiency in the particular situation of legal expert systems. To do so, we introduce the distinction between result-constrained and process-constrained legal specifications. From this distinction naturally stem different software solutions, ranging from machine-learning-based to algorithm-based. Finally, we conclude by a discussion about the critical software qualification for legal expert systems, and what this qualification could entail in terms of technical and organizational change.`),
  bibtex: "@article{10.1145/3473582,
author = {Merigoux, Denis and Chataing, Nicolas and Protzenko, Jonathan},
title = {Catala: A Programming Language for the Law},
year = {2021},
issue_date = {August 2021},
publisher = {Association for Computing Machinery},
address = {New York, NY, USA},
volume = {5},
number = {ICFP},
url = {https://doi.org/10.1145/3473582},
doi = {10.1145/3473582},
abstract = {Law at large underpins modern society, codifying and governing many aspects of citizens' daily lives. Oftentimes, law is subject to interpretation, debate and challenges throughout various courts and jurisdictions. But in some other areas, law leaves little room for interpretation, and essentially aims to rigorously describe a computation, a decision procedure or, simply said, an algorithm.  Unfortunately, prose remains a woefully inadequate tool for the job. The lack of formalism leaves room for ambiguities; the structure of legal statutes, with many paragraphs and sub-sections spread across multiple pages, makes it hard to compute the intended outcome of the algorithm underlying a given text; and, as with any other piece of poorly-specified critical software, the use of informal, natural language leaves corner cases unaddressed.  We introduce Catala, a new programming language that we specifically designed to allow a straightforward and systematic translation of statutory law into an executable implementation. Notably, Catala makes it natural and easy to express the general case / exceptions logic that permeates statutory law. Catala aims to bring together lawyers and programmers through a shared medium, which together they can understand, edit and evolve, bridging a gap that too often results in dramatically incorrect implementations of the law. We have implemented a compiler for Catala, and have proven the correctness of its core compilation steps using the F* proof assistant.  We evaluate Catala on several legal texts that are algorithms in disguise, notably section 121 of the US federal income tax and the byzantine French family benefits; in doing so, we uncover a bug in the official implementation of the French benefits. We observe as a consequence of the formalization process that using Catala enables rich interactions between lawyers and programmers, leading to a greater understanding of the original legislative intent, while producing a correct-by-construction executable specification reusable by the greater software ecosystem. Doing so, Catala increases trust in legal institutions, and mitigates the risk of societal damage due to incorrect implementations of the law.},
journal = {Proc. ACM Program. Lang.},
month = {aug},
articleno = {77},
numpages = {29},
keywords = {law, domain specific language, legal expert systems}
}",
}

let save_to_clipboard: string => unit = %raw(`
function(text) {navigator.clipboard.writeText(text)}
`)

module PubItem = {
  @react.component
  let make = (~pub: publication) =>
    <div className=%twc("flex flex-col justify-center")>
      <div className=%twc("inline-flex flex-row justify-between items-center")>
        <div className=%twc("")>
          <Link.Text className=%twc("font-semibold text-xl hover:text-green") target=pub.link>
            {pub.title->React.string}
          </Link.Text>
          <span className=%twc("pl-4 pt-1 text-gray_dark font-semibold")>
            {pub.date->React.string}
          </span>
        </div>
        <div className=%twc("inline-flex self-start mt-1")>
          <Button.Small style=%twc("mx-2") onClick={_ => save_to_clipboard(pub.bibtex)}>
            <span> {"BibTeX"->React.string} </span>
          </Button.Small>
          <Button.Small onClick={_ => save_to_clipboard(pub.citation)}>
            <Icon name="format_quote" />
          </Button.Small>
        </div>
      </div>
      <div className=%twc("inline-flex flex-row flex-wrap justify-start items-center")>
        {pub.authors
        ->Belt.Array.mapWithIndex((i, author) => {
          let key = "pub-author-" ++ i->string_of_int
          let style =
            %twc(
              "px-4 mr-2 mt-2 rounded-xl text-base font-semibold bg-gray shadow-sm text-gray_dark"
            ) ++ if i > 0 {
              %twc("")
            } else {
              ""
            }
          switch author.website {
          | Some(target) =>
            <Link.Text key className={style ++ " hover:bg-primary_light hover:text-gray_dark"} target>
              {author.name->React.string}
            </Link.Text>
          | None => <span key className=style> {author.name->React.string} </span>
          }
        })
        ->React.array}
      </div>
      {switch pub.abstract {
      | Some(abstract) =>
        <Box.Collapsible
          labelExpand={<Lang.String english="Show the abstract" french=`Voir l'abstract` />}>
          <p className=%twc("text-background")> {abstract->React.string} </p>
        </Box.Collapsible>
      | None => <span className=%twc("mb-2")/>
      }}
    </div>
}

module PubItems = {
  @react.component
  let make = (~items: array<publication>) => {
    <div
      className=%twc(
        "flex flex-col justify-center content-center border-solid border \
        rounded border-gray bg-gray_light p-4"
      )>
      {items
      ->Belt.Array.mapWithIndex((i, item) =>
        <PubItem key={"pub-item-" ++ i->string_of_int} pub=item />
      )
      ->React.array}
    </div>
  }
}

@react.component
let make = () => <>
  <Title> <Lang.String english="Publications" french=`Publications` /> </Title>
  <div className=%twc("pb-10")>
    <Section
      title={<Lang.String
        english="Peer-reviewed conferences and journals"
        french=`Conférences et journaux à comité de lecture`
      />}>
      <PubItems items={[icfp2021, cc2021, jfla2020]} />
    </Section>
    <Section title={<Lang.String english="Workshops" french=`Ateliers` />}>
      <PubItems items={[prolala_2022]} />
    </Section>
    <Section title={<Lang.String english="Invited articles" french=`Articles invités` />}>
      <PubItems items={[iafipu2020]} />
    </Section>
    <Section title={<Lang.String english="Preprints" french=`Pré-prints` />}>
      <PubItems items={[crcl_2022, ai_law_2022, crcl_2021]} />
    </Section>
  </div>
</>
