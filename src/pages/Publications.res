open PageComponents

type pub_item = {
  link: string,
  citation: string,
  bibtex: string,
}

let jfla2020 = {
  link: "https://hal.inria.fr/hal-02320347",
  citation: `Denis Merigoux, Raphaël Monat, Christophe Gaie. Étude formelle de l'implémentation du code des impôts. JFLA 2020 - 31ème Journées Francophones des Langages Applicatifs, Jan 2020, Gruissan, France.`,
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
  link: "https://hal.inria.fr/hal-03002266",
  citation: `Denis Merigoux, Raphaël Monat, Jonathan Protzenko. A Modern Compiler for the French Tax Code.
  CC '21: 30th ACM SIGPLAN International Conference on Compiler Construction, Mar 2021, Virtual, South Korea.
  pp.71-82.`,
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
  link: "https://hal.inria.fr/hal-03128248",
  citation: `Liane Huttner, Denis Merigoux. Traduire la loi en code grâce au langage de programmation Catala.
  Intelligence artificielle et finances publiques, Oct 2020, Nice, France.`,
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
  link: "https://hal.inria.fr/hal-02936606",
  citation: "Liane Huttner, Denis Merigoux. Catala: Moving Towards the Future of Legal Expert Systems. 2022.",
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
  link: "https://hal.inria.fr/hal-03447072/",
  citation: `Alain Delaët, Denis Merigoux, Aymeric Fromherz. Turning Catala into a Proof Platform for the Law.
  POPL 2022 - Programming Languages and the Law, Jan 2022, Philadelphia, United States.`,
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
  link: "https://hal.inria.fr/hal-03541637/",
  citation: "Denis Merigoux. The Specification Problem of Legal Expert Systems. 2022.",
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

let icfp2021 = {
  link: "https://hal.inria.fr/hal-03159939",
  citation: `Denis Merigoux, Nicolas Chataing, and Jonathan Protzenko. 2021. Catala: a programming language for the law.
  Proc. ACM Program. Lang. 5, ICFP, Article 77 (August 2021), 29 pages.`,
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

let save_to_clipboard: string => unit = %raw(`function(text) {navigator.clipboard.writeText(text)}`)

module PubItem = {
  @react.component
  let make = (~item: pub_item) =>
    <li className=%twc("pl-6 pb-4")>
      <Link.Text target=item.link>
        <i className="material-icons"> {"public" |> React.string} </i>
      </Link.Text>
      <a className=%twc("cursor-pointer") onClick={_ => save_to_clipboard(item.bibtex)}>
        <i className="pl-2 material-icons"> {"content_paste" |> React.string} </i>
      </a>
      <span className=%twc("pl-2")> {item.citation |> React.string} </span>
    </li>
}

@react.component
let make = () => <>
  <Title> <Lang.String english="Publications" french=`Publications` /> </Title>
  <p>
    <Lang.String
      english="Copy the BibTeX citation of any publication by clicking on the "
      french=`Copiez la citation BibTeX de n'importe quelle publication en cliquant sur  `
    />
    <i className="material-icons"> {"content_paste" |> React.string} </i>
    <Lang.String english=" button." french=`.` />
  </p>
  <Section
    title={<Lang.String
      english="Peer-reviewed conferences and journals"
      french=`Conférences et journaux à comité de lecture`
    />}>
    <ul className=%twc("list-none list-inside")>
      <PubItem item=icfp2021 /> <PubItem item=cc2021 /> <PubItem item=jfla2020 />
    </ul>
  </Section>
  <Section title={<Lang.String english="Workshops" french=`Ateliers` />}>
    <ul className=%twc("list-none list-inside")> <PubItem item=prolala_2022 /> </ul>
  </Section>
  <Section title={<Lang.String english="Invited articles" french=`Articles invités` />}>
    <ul className=%twc("list-none list-inside")> <PubItem item=iafipu2020 /> </ul>
  </Section>
  <Section title={<Lang.String english="Preprints" french=`Pré-prints` />}>
    <ul className=%twc("list-none list-inside")> <PubItem item=ai_law_2022 /> </ul>
    <ul className=%twc("list-none list-inside")> <PubItem item=crcl_2021 /> </ul>
  </Section>
</>
