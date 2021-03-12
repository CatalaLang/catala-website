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
  citation: `Denis Merigoux, Raphaël Monat, Jonathan Protzenko. A Modern Compiler for the French Tax Code. CC '21: 30th ACM SIGPLAN International Conference on Compiler Construction, Mar 2021, Virtual, South Korea. pp.71-82, 10.1145/3446804.3446850`,
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
  citation: `Liane Huttner, Denis Merigoux. Traduire la loi en code grâce au langage de programmation Catala. Intelligence artificielle et finances publiques, Oct 2020, Nice, France.`,
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

let jurix2020 = {
  link: "https://hal.inria.fr/hal-02936606",
  citation: "Denis Merigoux, Liane Huttner. Catala: Moving Towards the Future of Legal Expert Systems. 2020.",
  bibtex: "@unpublished{merigoux:hal-02936606,
  TITLE = {{Catala: Moving Towards the Future of Legal Expert Systems}},
  AUTHOR = {Merigoux, Denis and Huttner, Liane},
  URL = {https://hal.inria.fr/hal-02936606},
  NOTE = {working paper or preprint},
  YEAR = {2020},
  MONTH = Sep,
  KEYWORDS = {Social benefits ; Tax law ; Algorithmic transparency ; Literate programming ; Formal methods ; Legal expert systems},
  PDF = {https://hal.inria.fr/hal-02936606/file/paper.pdf},
  HAL_ID = {hal-02936606},
  HAL_VERSION = {v1},
}",
}

let icfp2021 = {
  link: "https://hal.inria.fr/hal-03159939",
  citation: `Denis Merigoux, Nicolas Chataing, Jonathan Protzenko. Catala: A Programming Language for the Law. 2021.`,
  bibtex: "@unpublished{merigoux:hal-03159939,
  TITLE = {{Catala: A Programming Language for the Law}},
  AUTHOR = {Merigoux, Denis and Chataing, Nicolas and Protzenko, Jonathan},
  URL = {https://hal.inria.fr/hal-03159939},
  NOTE = {working paper or preprint},
  YEAR = {2021},
  MONTH = Mar,
  PDF = {https://hal.inria.fr/hal-03159939/file/paper.pdf},
  HAL_ID = {hal-03159939},
  HAL_VERSION = {v1},
}",
}

let save_to_clipboard: string => unit = %bs.raw(`function(text) {navigator.clipboard.writeText(text)}`)

module PubItem = {
  @react.component
  let make = (~item: pub_item) =>
    <li className=%tw("pl-6 pb-4")>
      <Utils.TextLink target=item.link>
        <i className="material-icons"> {"public" |> React.string} </i>
      </Utils.TextLink>
      <a className=%tw("cursor-pointer") onClick={_ => save_to_clipboard(item.bibtex)}>
        <i className="pl-2 material-icons"> {"content_paste" |> React.string} </i>
      </a>
      <span className=%tw("pl-2")> {item.citation |> React.string} </span>
    </li>
}

@react.component
let make = () => <>
  <Utils.PageTitle> <Lang.String english="Publications" french=`Publications` /> </Utils.PageTitle>
  <p>
    <Lang.String
      english="Copy the BibTeX citation of any publication by clicking on the "
      french=`Copiez la citation BibTeX de n'importe quelle publication en cliquant sur  `
    />
    <i className="material-icons"> {"content_paste" |> React.string} </i>
    <Lang.String english=" button." french=`.` />
  </p>
  <Utils.PageSection
    title={<Lang.String
      english="Peer-reviewed conferences and journals"
      french=`Conférences et journaux à comité de lecture`
    />}>
    <ul className=%tw("list-none list-inside")>
      <PubItem item=cc2021 /> <PubItem item=jfla2020 />
    </ul>
  </Utils.PageSection>
  <Utils.PageSection title={<Lang.String english="Invited articles" french=`Articles invités` />}>
    <ul className=%tw("list-none list-inside")> <PubItem item=iafipu2020 /> </ul>
  </Utils.PageSection>
  <Utils.PageSection title={<Lang.String english="Preprints" french=`Pré-prints` />}>
    <ul className=%tw("list-none list-inside")>
      <PubItem item=icfp2021 /> <PubItem item=jurix2020 />
    </ul>
  </Utils.PageSection>
</>
