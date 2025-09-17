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
  citation: "Liane Huttner, Denis Merigoux. Catala: Moving Towards the Future of Legal Expert Systems. Artificial Intelligence and Law, 2022, ⟨10.1007/s10506-022-09328-5⟩. ⟨hal-02936606v3⟩.",
  abstract: Some(`Around the world, private and public organizations use software called legal expert systems to compute taxes. This software must comply with the laws they are designed to implement. As such, a bug or an error in a program that leads to tax miscalculations can have heavy legal and democratic consequences. However, increasing evidence suggests that some legal expert systems may not comply with the law. Moreover, traditional software development processes mean that legal expert systems are difficult to adapt to the continuous flow of new legislation. To prevent further software decay and to reconcile these systems with the growing demand for algorithmic transparency, we argue that there is a need for a new development process for legal expert systems. This new system must be built to comply with the law, in particular the GDPR. It must also respect democratic transparency. For these reasons, we present a solution built by lawyers and computer scientists: Catala, a new programming language coupled with a pair programming development process.`),
  bibtex: "@article{huttner:hal-02936606,
  TITLE = {{Catala: Moving Towards the Future of Legal Expert Systems}},
  AUTHOR = {Huttner, Liane and Merigoux, Denis},
  URL = {https://inria.hal.science/hal-02936606},
  JOURNAL = {{Artificial Intelligence and Law}},
  PUBLISHER = {{Springer Verlag}},
  YEAR = {2022},
  MONTH = Aug,
  DOI = {10.1007/s10506-022-09328-5},
  KEYWORDS = {Social benefits ; Tax law ; Algorithmic transparency ; Literate programming ; Formal methods ; Legal expert systems},
  PDF = {https://inria.hal.science/hal-02936606v3/file/paper.pdf},
  HAL_ID = {hal-02936606},
  HAL_VERSION = {v3},
}
",
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

let these_denis = {
  title: `Proof-oriented domain-specific language design for high-assurance software`,
  authors: [denisMerigoux],
  date: `2022`,
  link: "https://theses.hal.science/tel-03622012",
  citation: `Denis Merigoux. Proof-oriented domain-specific language design for high-assurance software. Programming Languages [cs.PL]. Université Paris sciences et lettres, 2021. English. ⟨NNT : 2021UPSLE006⟩. ⟨tel-03622012⟩`,
  abstract: None,
  bibtex: "@phdthesis{merigoux:tel-03622012,
  TITLE = {{Proof-oriented domain-specific language design for high-assurance software}},
  AUTHOR = {Merigoux, Denis},
  URL = {https://theses.hal.science/tel-03622012},
  NUMBER = {2021UPSLE006},
  SCHOOL = {{Universit{\'e} Paris sciences et lettres}},
  YEAR = {2021},
  MONTH = Dec,
  KEYWORDS = {Programme verification ; Domain-specific language ; Formal methods ; Cryptography ; Law ; V{\'e}rification de programme ; Langage d{\'e}di{\'e} ; M{\'e}thodes formelles ; Cryptographie ; Droit},
  TYPE = {Theses},
  PDF = {https://theses.hal.science/tel-03622012v1/file/Merigoux_2021_These.pdf},
  HAL_ID = {tel-03622012},
  HAL_VERSION = {v1},
}",
}

let these_liane = {
  title: `La décision de l'algorithme. Étude de droit privé sur les relations entre l'humain et la machine`,
  authors: [lianeHuttner],
  date: `2023`,
  link: "https://shs.hal.science/CERDI-SACLAY/tel-04184956v1",
  citation: `Liane Huttner. La décision de l'algorithme. Étude de droit privé sur les relations entre l'humain et la machine.. Droit. Paris 1 - Panthéon-Sorbonne, 2022. Français. ⟨NNT : ⟩. ⟨tel-04184956⟩`,
  abstract: None,
  bibtex: "@phdthesis{huttner:tel-04184956,
  TITLE = {{La d{\'e}cision de l'algorithme. {\'E}tude de droit priv{\'e} sur les relations entre l'humain et la machine.}},
  AUTHOR = {Huttner, Liane},
  URL = {https://hal.science/tel-04184956},
  SCHOOL = {{Paris 1 - Panth{\'e}on-Sorbonne}},
  YEAR = {2022},
  MONTH = Nov,
  KEYWORDS = {Algorithm ; GDPR ; internet law ; digital law ; Automated decision-making ; data protection law ; artificial intelligence and law ; Algorithme ; Donn{\'e}es {\`a} caract{\`e}re personnel ; Droit du num{\'e}rique ; Intelligence Articifielle ; D{\'e}cisions automatis{\'e}es ; Droit priv{\'e} ; Relation homme machine ; RGPD},
  TYPE = {Theses},
  PDF = {https://hal.science/tel-04184956v1/file/Huttner%20-%20La%20d%C3%A9cision%20de%20l%27algorithme.pdf},
  HAL_ID = {tel-04184956},
  HAL_VERSION = {v1},
}",
}

let these_marie = {
  title: `Plis et replis de l'État plateforme. Enquête sur la modernisation des services publics en France`,
  authors: [marieAlauzen],
  date: `2019`,
  link: "https://pastel.hal.science/tel-02418677v1",
  citation: `Marie Alauzen. Plis et replis de l'État plateforme. Enquête sur la modernisation des services publics en France. Sociologie. Université Paris sciences et lettres, 2019. Français. ⟨NNT : 2019PSLEM037⟩. ⟨tel-02418677⟩`,
  abstract: None,
  bibtex: "@phdthesis{alauzen:tel-02418677,
  TITLE = {{Plis et replis de l'{\'E}tat plateforme. Enqu{\^e}te sur la modernisation des services publics en France}},
  AUTHOR = {Alauzen, Marie},
  URL = {https://pastel.hal.science/tel-02418677},
  NUMBER = {2019PSLEM037},
  SCHOOL = {{Universit{\'e} Paris sciences et lettres}},
  YEAR = {2019},
  MONTH = Oct,
  KEYWORDS = {State reform ; Modernisation projects ; Digital transformation ; Administrative workplace study ; Public services ; France ; R{\'e}forme de l'{\'E}tat ; Projets de modernisation ; Transformation num{\'e}rique ; Ethnographie de l'activit{\'e} administrative ; Services publics ; France},
  TYPE = {Theses},
  PDF = {https://pastel.hal.science/tel-02418677v1/file/2019PSLEM037_archivage.pdf},
  HAL_ID = {tel-02418677},
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
  date: `2023`,
  link: "https://hal.inria.fr/hal-03712130",
  citation: `Denis Merigoux, Marie Alauzen, Lilya Slimani. Rules, Computation and Politics: Scrutinizing Unnoticed Programming Choices in French Housing Benefits. 2023.`,
  abstract: None,
  bibtex: "@article{merigoux:hal-03712130,
  title       = {{Rules, Computation and Politics: Scrutinizing Unnoticed Programming Choices in French Housing Benefits}},
  author      = {Merigoux, Denis and Alauzen, Marie and Slimani, Lilya},
  url         = {https://hal.inria.fr/hal-03712130},
  intype      = {to appear in},
  year        = {2023},
  volume      = {1},
  number      = {3},
  note        = {(forthcoming)},
  journal     = {Journal of Cross-disciplinary Research in Computational Law},
  keywords    = {Legal expert systems ; Welfare state ; Critical code studies ; Regulatory law},
  pdf         = {https://hal.inria.fr/hal-03712130/file/main.pdf},
  hal_id      = {hal-03712130},
  hal_version = {v1}
}",
}

let crcl_2023 = {
  title: `Scoping AI & Law Projects: Wanting It All is Counterproductive `,
  authors: [denisMerigoux],
  date: `2023`,
  link: "https://journalcrcl.org/crcl/article/view/56/",
  citation: `Merigoux, Denis. 2024. “Scoping AI & Law Projects: Wanting It All Is Counterproductive”. Journal of Cross-Disciplinary Research in Computational Law 2 (2).`,
  abstract: Some(`The intersection of law and computer science has been
    dominated for decades by a community that self-identifies with the pursuit
    of ‘artificial intelligence'. This self-identification is not a coincidence;
    many AI & Law researchers have expressed their interest in the
    ideologically-charged idea-utopia of government by machines, and the field
    of artificial intelligence aligns with the pursuit of all-encompassing
    systems that could crack the very diverse nature of legal tasks. As a
    consequence, a lot of theoretical and practical work has been carried
    in the AI & Law community with the objective of creating logic-based,
    knowledge-based or machine-learning-based systems that could eventually
    ‘solve' any legal task. This ‘want-it-all' research attitude echoes some
    of the debates in my home field of formal methods around formalization of
    programming languages and proofs. Hence, I will argue here that the quest
    for an unscoped system that does it all is counterproductive for multiple
    reasons. First, because these systems perform generally poorly on everything
    rather than being good at one task, and most legal applications have high
    correctness standards. Second, because it yields artifacts that are very
    difficult to evaluate in order to build a sound methodology for advancing
    the field. Third, because it nudges into technological choices that require
    large infrastructure-building (sometimes on a global scale) before reaping
    benefits and encouraging adoption. Fourth, because it distracts efforts
    away from the basic applications of legal technologies that have been
    neglected by the research community.`),
  bibtex: "@article{Merigoux_2024,
  title={Scoping AI &amp;; Law Projects: Wanting It All is Counterproductive},
  volume={2}, url={https://journalcrcl.org/crcl/article/view/56},
  number={2},
  journal={Journal of Cross-disciplinary Research in Computational Law},
  author={Merigoux, Denis},
  year={2024},
  month={May}}",
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

let smu_2022 = {
  title: `Coding the Code: Catala and Computationally Accessible Tax Law`,
  authors: [sarahLawsky],
  date: `2022`,
  link: "https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4291177",
  citation: `Lawsky, Sarah B., Coding the Code: Catala and Computationally Accessible Tax Law (December 1, 2022). 75 SMU L. Rev. 535 (2022), Northwestern Public Law Research Paper No. 22-32.`,
  abstract: Some(`This Article describes a new programming language, Catala, created by a team of computer scientists and lawyers. Catala provides a tractable and functional approach to coding U.S. tax law that offers a more transparent formalization and could potentially hold the government more accountable than the current patchwork of forms, worksheets, and secret programs. While this Article describes a particular programming language, key characteristics of this particular language could generalize to other programming languages that formalize the law. First, Catala is a domain-specific programming language designed specifically for formalizing tax law. In particular, Catala is structured using default logic, a nonstandard logic that represents the underlying structure of the U.S. tax code more accurately than does standard logic. This structure makes the computer code easier to read, easier to create, and easier to modify when the law changes. Second, computer code is created in Catala using a well-known approach in the field of computer science (though rarely mentioned in legal literature) called “pair programming,” which, in this implementation, takes advantage of the knowledge of both lawyers and computer coders. Finally, Catala uses literate programming to create computer code that is, among other things, easier to read and that communicates the decisions behind the coding to the user.`),
  bibtex: "@article{lawsky2022,
  title   = {Coding the Code: Catala and Computationally Accessible Tax Law},
  journal = {SMU Law Review},
  year    = {2022},
  number  = {535},
  volume  = {75},
  url     = {https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4291177}}",
}

let sif_1024_2024 = {
  title: `Pour une citoyenneté informatique: Plaidoyer pour une investigation en commun des codes sources publics`,
  authors: [marieAlauzen],
  date: `2024`,
  link: "https://1024.socinfo.fr/2024/11/1024_24_2024_085.html",
  citation: `Alauzen, M. Pour une citoyenneté informatique: Plaidoyer pour une investigation en commun des codes sources publics. 2024. 1024 Bulletin de la Société Informatique de France n°24`,
  abstract: None,
  bibtex: "@Article{1024_24_2024_85,
title={Pour une citoyenneté informatique},
author={Marie Alauzen},
pages={85--99},
journal={1024},
x-hal_journal_id={103290},
volume={24},
month={11},
year={2024},
editor={Société informatique de France},
publisher={Société informatique de France},
publisherLink={https://www.socinfo.fr/bulletin/},
issn={2270-1419},
keywords={Informatique},
domain={Computer Science},
licence={Attribution - NonCommercial - NoDerivatives},
popularlevel={Yes},
peerReviewing={Yes},
audience={International},
language={fr},
PDF={https://www.socinfo.fr/2024/11/1024_11_2024_85.pdf},
fileSource={publisherAgreement},
DOI={10.48556/SIF.1024.24.85}
}
",
}

let forms_as_formalization_2020 = {
  title: `Form as Formalization`,
  authors: [sarahLawsky],
  date: `2020`,
  link: "https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3587576",
  citation: ` Lawsky, Sarah B., Form as Formalization (2020). Ohio State Technology Law Journal, 16, 114.`,
  abstract: None,
  bibtex: "@article{lawsky2020form,
  title={Form as formalization},
  author={Lawsky, Sarah},
  journal={Ohio State Technology Law Journal},
  volume={16},
  pages={114},
  year={2020}
  }",
}

let observations_2022 = {
  title: `Observations sur le calcul des aides au logement`,
  authors: [denisMerigoux],
  date: `2022`,
  link: "https://inria.hal.science/hal-03781578",
  citation: `Denis Merigoux. Observations sur le calcul des aides au logement. [Rapport de recherche] RR-9485, Inria Paris. 2022, pp.27. ⟨hal-03781578⟩`,
  abstract: Some(`À l'aide du langage de programmation dédié Catala, nous avons implémenté le calcul de l'éligibilité et du montant des aides au logement en France à partir de l'ensemble de textes législatifs et réglementaires s'y rapportant. Cette démarche correspond à la rétro-ingénierie d'une partie du système informatique CRISTAL, utilisé par l'opérateur des aides au logement et de multiples autre prestations sociales, la CNAF (Caisse Nationale des Allocations Familiales). Ce rapport présente quelques observations dont le but est d'améliorer la qualité des textes réglementaires gérés conjointement et entre autres par la direction de l'habitat, de l'urbanisme et du paysage (DHUP), la direction de la sécurité sociale (DSS) et la direction du budget (DB).`),
  bibtex: "@techreport{merigoux:hal-03781578,
  TITLE = {{Observations sur le calcul des aides au logement}},
  AUTHOR = {Merigoux, Denis},
  URL = {https://inria.hal.science/hal-03781578},
  TYPE = {Research Report},
  NUMBER = {RR-9485},
  PAGES = {27},
  INSTITUTION = {{Inria Paris}},
  YEAR = {2022},
  MONTH = Sep,
  KEYWORDS = {Law ; Housing benefits ; Formal methods ; Droit ; Aides au logement ; M{\'e}thodes formelles},
  PDF = {https://inria.hal.science/hal-03781578/file/RR-9485.pdf},
  HAL_ID = {hal-03781578},
  HAL_VERSION = {v1},
}",
}

let explicabilite_2024 = {
  title: `De la transparence à l'explicabilité automatisée des algorithmes`,
  authors: [denisMerigoux, marieAlauzen, justineBanuls, louisGesbert, emileRolley],
  date: `2024`,
  link: "https://inria.hal.science/hal-04391612",
  citation: `Denis Merigoux, Marie Alauzen, Justine Banuls, Louis Gesbert, Émile Rolley. De la transparence à l'explicabilité automatisée des algorithmes : Comprendre les obstacles informatiques, juridiques et organisationnels. RR-9535, INRIA Paris. 2024, pp.68. ⟨hal-04391612⟩`,
  abstract: Some(`Les algorithmes publics ou traitements informatiques opérés \
  par les administrations sont soumis à des obligations de transparence et \
  d'explicabilité. Ces obligations ont été mises en place pour justifier les \
  décisions prises par ces algorithmes et garantir leur redevabilité vis-à-vis \
  des personnes concernées. Ce rapport de recherche vise à explorer les \
  obstacles informatiques, juridiques et organisationnels, qui entravent \
  la mise en œuvre de la redevabilité et propose d'élargir la conception \
  de l'explicabilité, afin de la rendre plus opérationnalisable par les \
  administrations. Partant d'un état de l'art de l'explicabilité des décisions \
  automatisées ajusté aux spécificités administratives, nous avons initié une \
  enquête exploratoire sur l'algorithme de calcul des aides au logement de la \
  Caisse nationale d'allocations familiales et conçu, à partir de ce \
  diagnostic, trois prototypes testant la faisabilité de la production \
  automatique d'explications de qualité. Nous montrons ainsi que l'utilité \
  des explications est tout aussi cruciale d'un point de vue externe -- pour \
  les citoyennes et les institutions de contrôle -- que d'un point de vue \
  interne à l'administration -- afin d'assurer la fiabilité du système \
  d'information au gré des évolutions. Nous recommandons que la technologie \
  de la décision automatisée et celle de son explication partagent une \
  infrastructure commune, s'appuyant sur la lettre du droit. `),
  bibtex: "@techreport{merigoux:hal-04391612,
  TITLE = {{De la transparence {\`a} l'explicabilit{\'e} automatis{\'e}e des algorithmes}},
  AUTHOR = {Merigoux, Denis and Alauzen, Marie and Banuls, Justine and Gesbert, Louis and Rolley, {\'E}mile},
  URL = {https://inria.hal.science/hal-04391612},
  NUMBER = {RR-9535},
  PAGES = {68},
  INSTITUTION = {{INRIA Paris}},
  YEAR = {2024},
  MONTH = Jan,
  KEYWORDS = {Accountability ; Public algorithms ; Law ; Automated decisions ; Explanainability ; Algorithmes publics ; Droit ; D{\'e}cisions automatiques ; Explicabilit{\'e} ; Redevabilit{\'e}},
  PDF = {https://inria.hal.science/hal-04391612/file/RR-9535.pdf},
  HAL_ID = {hal-04391612},
  HAL_VERSION = {v1},
}",
}

let droit_societe_2024 = {
  title: `L'altération informatique du droit. Une sociologie du passage du droit aux droits`,
  authors: [marieAlauzen],
  date: `2024`,
  citation: `Marie Alauzen. L'altération informatique du droit. Une sociologie du passage du droit aux droits. Droit et Société : Revue internationale de théorie du droit et de sociologie juridique, 2024, 117 (2), ⟨10.3917/drs1.117.0277⟩. ⟨hal-04650848⟩`,
  link: "https://hal.science/hal-04650848",
  bibtex: `@article{alauzen:hal-04650848,
  TITLE = {{L'alt{\'e}ration informatique du droit. Une sociologie du passage du droit aux droits}},
  AUTHOR = {Alauzen, Marie},
  URL = {https://hal.science/hal-04650848},
  JOURNAL = {{Droit et Soci{\'e}t{\'e} : Revue internationale de th{\'e}orie du droit et de sociologie juridique}},
  PUBLISHER = {{Librairie g{\'e}n{\'e}rale de droit et de jurisprudence (LGDJ)  [1991-2007] - Lextenso {\'e}ditions [2007-....]}},
  VOLUME = {117},
  NUMBER = {2},
  YEAR = {2024},
  DOI = {10.3917/drs1.117.0277},
  KEYWORDS = {alteration ; calculation ; personal rights ; passes of law ; actor-network theory ; alt{\'e}ration ; calcul ; droits sociaux ; passes du droit ; sociologie de la traduction},
  PDF = {https://hal.science/hal-04650848v1/file/Alauzen-alte%CC%81ration%20informatique%20du%20droit-D%26S-2024.pdf},
  HAL_ID = {hal-04650848},
  HAL_VERSION = {v1},
}`,
  abstract: Some(`Comment passe-t-on du droit, c'est-à-dire d'énoncés généraux et impersonnels, à la déclinaison personnelle des droits ? Dans les bureaucraties contemporaines, répondre à cette question suppose de décrire non plus seulement l'interprétation réalisée par des agents d'interface, mais la traduction des règles de droit dans des programmes exécutant automatiquement et massivement des actes administratifs, comme le calcul des impôts et des prestations sociales. À partir d'une enquête par rétro-ingénierie du programme de calcul des allocations logement en France et par entretiens, l'article met en lumière les tâches réalisées dans les ministères et à la Caisse nationale d'allocations familiales : passes et traductions du droit. En qualifiant ce phénomène d'altération des énoncés juridiques vers un agencement machinique, il attire l'attention sur des conséquences de choix d'interprétation et d'organisation jusqu'alors sous-estimées, avant d'inviter à de nouvelles collaborations avec des informaticiens. `),
}

let chicago_law_review_2024 = {
  title: `Tax Law and Flexible Formalizations`,
  authors: [sarahLawsky],
  date: `2024`,
  citation: `Lawsky, S. B. (2024). Tax Law and Flexible Formalizations. U. Chi. L. Rev. Online, 1.`,
  link: "https://lawreview.uchicago.edu/online-archive/tax-law-and-flexible-formalizations",
  bibtex: `@article{lawsky2024tax,
  title={Tax Law and Flexible Formalizations},
  author={Lawsky, Sarah B},
  journal={University of Chicago Law Review Online},
  pages={1},
  year={2024},
  publisher={HeinOnline}
}`,
  abstract: None,
}

let virginia_tax_review_2024 = {
  title: `Reasoning with Formalized Statutes: The Case of Capital Gains and Losses`,
  authors: [sarahLawsky],
  date: `2024`,
  citation: ` Lawsky, Sarah B., Reasoning with Formalized Statutes: The Case of Capital Gains and Losses (May 16, 2024). Virginia Tax Review, Vol. 43, No. 3, 2024, Northwestern Public Law Research Paper No. 24-11.`,
  link: "https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4832255",
  bibtex: `@article{lawsky2024tax,
  title={Reasoning with Formalized Statutes: The Case of Capital Gains and Losses},
  author={Lawsky, Sarah B},
  journal={Virginia Tax Review},
  volume={43},
  numero={3}
  year={2024},
}`,
  abstract: Some("This article formalizes sections of the Internal Revenue Code — that is,
    represents them symbolically — and then reasons with these formalizations
    algebraically, graphically, and, in a novel approach for U.S. legal
    scholarship, using a computer program that proves theorems. Reasoning
    with the formalizations reveals previously overlooked errors in the statute,
    demonstrates equivalence between the actual law and facially dissimilar
    administrative implementations of the law, and uncovers technical corrections
    in these administrative implementations that the Internal Revenue Service
    has not openly acknowledged. The article thus shows how reasoning with
    formalized statutes leads to insights that may be otherwise obscured by
    the law's complexity. "),
}

let epistemic_trespassing_2024 = {
  title: `Computational Law and Epistemic Trespassing`,
  authors: [sarahLawsky],
  date: `2024`,
  citation: `Lawsky, Sarah. 2024. “Computational Law and Epistemic Trespassing”. Journal of Cross-Disciplinary Research in Computational Law 2 (2).`,
  link: "https://journalcrcl.org/crcl/article/view/58",
  bibtex: `@article{Lawsky_2024,
  title={Computational Law and Epistemic Trespassing},
  volume={2},
  url={https://journalcrcl.org/crcl/article/view/58},
  number={2}, journal={Journal of Cross-disciplinary Research in Computational Law},
  author={Lawsky, Sarah}, year={2024}, month={May}
  }`,
  abstract: None,
}

let scoping_ai_law_2024 = {
  title: `Scoping AI & Law Projects: Wanting It All is Counterproductive`,
  authors: [denisMerigoux],
  date: `2024`,
  citation: `Merigoux, Denis. 2024. “Scoping AI &Amp; Law Projects: Wanting It All Is Counterproductive”. Journal of Cross-Disciplinary Research in Computational Law 2 (2).`,
  link: "https://journalcrcl.org/crcl/article/view/56",
  bibtex: `@article{Lawsky_2024,
  title={Scoping AI & Law Projects: Wanting It All is Counterproductive},
  volume={2},
  url={https://journalcrcl.org/crcl/article/view/56},
  number={2}, journal={Journal of Cross-disciplinary Research in Computational Law},
  author={Merigoux, Denis}, year={2024}, month={May}
  }`,
  abstract: None,
}

let dates_2024 = {
  title: `Formalizing Date Arithmetic and Statically Detecting Ambiguities for the Law`,
  authors: [raphaelMonat, aymericFromherz, denisMerigoux],
  date: `2024`,
  citation: `Raphaël Monat, Aymeric Fromherz, and Denis Merigoux. Formalizing date arithmetic \
   and statically detecting ambiguities for the law. In Programming Languages \
and Systems, ESOP, Cham, 2024. Springer Nature Switzerland.`,
  link: "https://rmonat.fr/data/pubs/2024/2024-04-08_esop_dates.pdf",
  bibtex: `@InProceedings{dates2024monat,
author="Raphaël Monat and Aymeric Fromherz and Denis Merigoux",
title="Formalizing Date Arithmetic and Statically Detecting Ambiguities for the Law ",
booktitle="Programming Languages and Systems",
year="2024",
publisher="Springer Nature Switzerland",
address="Cham",
series = "ESOP",
note = "forthcoming"
}`,
  abstract: Some(`Legal expert systems routinely rely on date computations to \
determine the eligibility of a citizen to social benefits or whether an \
application has been filed on time. Unfortunately, date arithmetic exhibits \
many corner cases, which are handled differently from one library to the \
other, making faithfully transcribing the law into code error-prone, and \
possibly leading to heavy financial and legal consequences for users. \
In this work, we aim to provide a solid foundation for date arithmetic \
working on days, months and years. We first present a novel, formal \
semantics for date computations, and formally establish several semantic \
properties through a mechanization in the F⋆ proof assistant. Building \
upon this semantics, we then propose a static analysis by abstract \
interpretation to automatically detect ambiguities in date computations. We \
finally integrate our approach in the Catala language, a recent \
domain-specific language for formalizing computational law, and use it to analyze \
the Catala implementation of the French housing benefits, leading to the \
discovery of several date-related ambiguities.`),
}

let cutecat_2025 = {
  title: `CUTECat: Concolic Execution for Computational Law`,
  authors: [pierreGoutagny, aymericFromherz, raphaelMonat],
  date: `2025`,
  citation: `Pierre Goutagny, Aymeric Fromherz, Raphaël Monat. CUTECat: Concolic Execution for \
    Computational Law. ESOP 2025 - 34th European Symposium on Programming, May 2025, Hamilton, ON, Canada.`,
  link: "https://rmonat.fr/data/pubs/2025/2025-05-03_esop_cutecat.pdf",
  bibtex: `@inproceedings{goutagny:hal-04907935,
  TITLE = {{CUTECat: Concolic Execution for Computational Law}},
  AUTHOR = {Goutagny, Pierre and Fromherz, Aymeric and Monat, Rapha{\"e}l},
  URL = {https://inria.hal.science/hal-04907935},
  BOOKTITLE = {{ESOP 2025 - 34th European Symposium on Programming}},
  ADDRESS = {Hamilton, ON, Canada},
  YEAR = {2025},
  MONTH = May,
  KEYWORDS = {Concolic execution ; Symbolic execution ; Computational law},
  PDF = {https://inria.hal.science/hal-04907935v1/file/final.pdf},
  HAL_ID = {hal-04907935},
  HAL_VERSION = {v1},
}`,
  abstract: Some(`Many legal computations, including the amount of tax owed by a citizen, whether they are eligible to social benefits, or the wages due to civil state servants, are specified by computational laws. Their application, however, is performed by expert computer programs intended to faithfully transcribe the law into computer code. Bugs in these programs can lead to dramatic societal impact, e.g., paying employees incorrect amounts, or not awarding benefits to families in need. To address this issue, we consider concolic unit testing, a combination of concrete execution with SMT-based symbolic execution, and propose CUTECat, a concolic execution tool targeting implementations of computational laws. Such laws typically follow a pattern where a base case is later refined by many exceptions in following law articles, a pattern that can be formally modeled using default logic. We show how to handle default logic inside a concolic execution tool, and implement our approach in the context of Catala, a recent domain-specific language tailored to implement computational laws. We evaluate CUTECat on several programs, including the Catala implementation of the French housing benefits and Section 132 of the US tax code. We show that CUTECat can successfully generate hundreds of thousands of testcases covering all branches of these bodies of law. Through several heuristics, we improve CUTECat's scalability and usability, making the testcases understandable by lawyers and programmers alike. We believe CUTECat thus paves the way for the use of formal methods during legislative processes.`),
}

let ml_workshop_2023 = {
  title: `Modern DSL compiler architecture in OCaml our experience with Catala`,
  authors: [louisGesbert, denisMerigoux],
  date: `2023`,
  citation: `Louis Gesbert and Denis Merigoux. Modern DSL compiler architecture in OCaml our experience with Catala. Presentation at
  the ML Workshop (IFCFP 2023)`,
  link: "https://icfp23.sigplan.org/details/ocaml-2023-papers/4/Modern-DSL-compiler-architecture-in-OCaml-our-experience-with-Catala",
  bibtex: `@unpublished{gesbert2023mlwork,
  author = {Louis Gesbert and Denis Merigoux},
  note   = {Presentation at the ML Workshop in the ICFP conference},
  title  = {Modern DSL compiler architecture in OCaml our experience with Catala},
  year   = {2023},
  url    = {https://icfp23.sigplan.org/details/ocaml-2023-papers/4/Modern-DSL-compiler-architecture-in-OCaml-our-experience-with-Catala}
}`,
  abstract: Some(`In this presentation, we intend to show a state-of-the-art \
  DSL implementation in OCaml, with concrete examples and experience reports.\
  In particular, we found that some advanced practices, while accepted among \
   the hardcore OCaml developers (e.g. use of row type variables through object \
    types), lacked visibility and documentation: some of them deserve to be \
    better known. Our experience is based on the Catala compiler, a DSL \
    for the implementation of algorithms defined in law.`),
}

let prolala_2023 = {
  title: "Experience report: implementing a real-world, medium-sized program derived from a legislative specification",
  authors: [denisMerigoux],
  date: `2023`,
  abstract: Some(`Implementing computer programs from legislative specifications \
   has been a longstanding academic endeavor. However, few of these experiments \
   has so far sought to replicate a computer program that is already in production \
   in public administration; most of them have created new programs or formalizations \
   that cover sections of the law not previously automatically enforced by public \
   administration. A somewhat dated but accurate state of the art of the use of \
   legal expert systems in government agencies was compiled by Oskamp (2002). \
   Building on the work around the Catala domain-specific language, we have \
   chosen to engage in an exercise of replication of the existing IT system \
   that computes the French housing benefits (and various other benefits) within \
   the CNAF administrative agency, CRISTAL. More general context and main \
   non-technical findings of this replication exercise can be found in a \
   companion paper; this presentation will focus on the challenges and lessons \
   learned about the programming act itself, in an effort of consolidation of \
   knowledge for this line of research.`),
  citation: `Denis Merigoux. Experience report: implementing a real-world, medium-sized program \
derived from a legislative specification. Programming Languages and the Law 2023 \
(affiliated with POPL), Jan 2023, Boston (MA), United States. ⟨hal-03933574⟩`,
  link: "https://inria.hal.science/hal-03869335",
  bibtex: `@inproceedings{merigoux:hal-03933574,
  TITLE = {{Experience report: implementing a real-world, medium-sized program derived from a legislative specification}},
  AUTHOR = {Merigoux, Denis},
  URL = {https://inria.hal.science/hal-03933574},
  BOOKTITLE = {{Programming Languages and the Law 2023 (affiliated with POPL)}},
  ADDRESS = {Boston (MA), United States},
  YEAR = {2023},
  MONTH = Jan,
  KEYWORDS = {Legal expert systems ; Catala ; Housing benefits ; Legal formalization},
  PDF = {https://inria.hal.science/hal-03933574/file/article.pdf},
  HAL_ID = {hal-03933574},
  HAL_VERSION = {v1},
}`,
}

let save_to_clipboard: (string, string, string) => unit = %raw(`
function(text, id, lang) {
  navigator.clipboard.writeText(text);
  document.getElementById(id).innerText =
    lang === "fr" ? "Copié !" : "Copied!";
  setTimeout(() => {
    document.getElementById(id).innerText = "";
  }, 500);
}
`)

module PubItem = {
  @react.component
  let make = (~pub: publication, ~locale: string) =>
    <div className="flex flex-col justify-center p-4 not-last:border-b border-dashed border-border">
      <span className="text-gray-800 mb-2"> {pub.date->React.string} </span>
      <div className="inline-flex flex-row justify-between items-center">
        <div className="">
          <Link.Text className="font-semibold font-serif text-lg" target=pub.link>
            {pub.title->React.string}
          </Link.Text>
        </div>
        <div className="inline-flex self-start mt-1 ">
          <span
            id={"citation-" ++ pub.title} className="text-green-700 italic text-sm font-medium m-1"
          />
          <Button.Small
            style="mx-2 "
            onClick={_ => save_to_clipboard(pub.bibtex, "citation-" ++ pub.title, locale)}>
            <span> {"BibTeX"->React.string} </span>
          </Button.Small>
          <Button.Small
            onClick={_ => save_to_clipboard(pub.citation, "citation-" ++ pub.title, locale)}>
            <Icon name="format_quote" />
            <span className=""> {""->React.string} </span>
          </Button.Small>
        </div>
      </div>
      <div className="inline-flex flex-row flex-wrap justify-start items-center gap-2">
        {pub.authors
        ->Belt.Array.mapWithIndex((i, author) => {
          let key = "pub-author-" ++ i->string_of_int
          let style =
            "" ++ if i > 0 {
              ""
            } else {
              ""
            }
          switch author.website {
          | Some(target) =>
            <Link.Text key className={style} target> {author.name->React.string} </Link.Text>
          | None => <span key className=style> {author.name->React.string} </span>
          }
        })
        ->React.array}
      </div>
      {switch pub.abstract {
      | Some(abstract) =>
        <Box.Collapsible
          labelExpand={<Lang.String english="Show the abstract" french={`Voir l'abstract`} />}>
          <p className="mt-2"> {abstract->React.string} </p>
        </Box.Collapsible>
      | None => <span className="mb-2" />
      }}
    </div>
}

module PubItems = {
  @react.component
  let make = (~items: array<publication>) => {
    let (lang, _) = React.useContext(Lang.langContext)
    let locale = switch lang {
    | Lang.French => "fr"
    | _ => "en"
    }
    <ul className="bg-white border border-border">
      {items
      ->Belt.Array.mapWithIndex((i, item) =>
        <PubItem key={"pub-item-" ++ i->string_of_int} pub=item locale />
      )
      ->React.array}
    </ul>
  }
}

@react.component
let make = () => <>
  <section className="my-16 px-8">
    <Title>
      <Lang.String english="Publications" french={`Publications`} />
    </Title>
  </section>
  <section
    id="peer-reviewed" className="mb-16 px-8 border-y border-border py-16 bg-primary_light/5">
    <h2>
      <a href="#peer-reviewed">
        <Lang.String
          english="Peer-reviewed conferences and journals"
          french={`Conférences et journaux à comité de lecture`}
        />
      </a>
    </h2>
    <PubItems
      items={[
        cutecat_2025,
        droit_societe_2024,
        virginia_tax_review_2024,
        dates_2024,
        crcl_2022,
        ai_law_2022,
        icfp2021,
        cc2021,
        forms_as_formalization_2020,
        jfla2020,
      ]}
    />
  </section>
  <section id="workshops" className="mb-16 px-8">
    <h2>
      <a href="#workshops">
        <Lang.String english="Workshops" french={`Ateliers`} />
      </a>
    </h2>
    <PubItems items={[prolala_2023, prolala_2022, ml_workshop_2023]} />
  </section>
  <section id="invited" className="px-8 border-y border-border py-16 bg-primary_light/5">
    <h2>
      <a href="#invited">
        <Lang.String english="Invited articles" french={`Articles invités`} />
      </a>
    </h2>
    <PubItems
      items={[
        epistemic_trespassing_2024,
        sif_1024_2024,
        scoping_ai_law_2024,
        chicago_law_review_2024,
        crcl_2023,
        smu_2022,
        iafipu2020,
      ]}
    />
  </section>
  <section id="phd" className="my-16 px-8">
    <h2>
      <a href="#phd">
        <Lang.String english="PhD dissertations" french={`Thèses de doctorat`} />
      </a>
    </h2>
    <PubItems items={[these_liane, these_denis, these_marie]} />
  </section>
  <section id="preprints" className="mt-16 px-8 border-y border-border py-16 bg-primary_light/5">
    <h2>
      <a href="#preprints">
        <Lang.String
          english="Preprints, technical reports" french={`Pré-prints et rapports de recherche`}
        />
      </a>
    </h2>
    <PubItems items={[explicabilite_2024, observations_2022, crcl_2021]} />
  </section>
</>
