open PageComponents
open People
open About

type seminar_kind =
  | ComputerScience
  | Sociology
  | Law

type seminar = {
  date: Js.Date.t,
  title: React.element,
  abstract: React.element,
  presenter: string,
  presenter_page_url: string,
  kind: seminar_kind,
}

module Seminar = {
  @react.component
  let make = (~seminar: seminar, ~locale: string) => {
    let date = Date.toLocaleDateStringWithLocaleAndOptions(
      seminar.date,
      locale,
      {
        day: #numeric,
        month: #long,
        year: #numeric,
      },
    ) |> React.string
    <li className="not-last:border-b border-dashed border-border p-4">
      <div className="flex items-center gap-4 mb-2">
        <span className=" text-neutral-700"> {date} </span>
        <span className="text-sm">
          {switch seminar.kind {
          | Sociology =>
            <span className="bg-violet-50 text-violet-700 py-1 px-2 rounded-sm">
              <Lang.String french={`Sociologie`} english="Sociology" />
            </span>
          | Law =>
            <span className="bg-cyan-50 text-cyan-700 py-1 px-2 rounded-sm">
              <Lang.String french={`Droit`} english="Law" />
            </span>
          | ComputerScience =>
            <span className="bg-green-50 text-green-700 py-1 px-2 rounded-sm">
              <Lang.String french={`Informatique`} english="Computer Science" />
            </span>
          }}
        </span>
      </div>
      <p className="font-serif text-lg font-medium text-black"> {seminar.title} </p>
      <Link.Text target=seminar.presenter_page_url> {React.string(seminar.presenter)} </Link.Text>
      <Box.Collapsible
        labelExpand={<Lang.String french="Voir le résumé" english="See abstract" />}
        labelCollapse={<Lang.String french="Cacher le résumé" english="Hide abstract" />}>
        <p className="mt-2"> {seminar.abstract} </p>
      </Box.Collapsible>
    </li>
  }
}

let seminars = [
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2023.0, ~month=03.0, ~date=24.0, ())),
    title: <Lang.String
      english="Translating law to code at the French tax authority"
      french={`Traduire le droit en code à la DGFiP`}
    />,
    presenter: "DGFiP/SI",
    presenter_page_url: "https://metiers.numerique.gouv.fr/employeurs/service-des-systemes-d-information-de-la-direction-generale-des-finances-publiques-dgfip-cl1mbk9aj914201lpc0cdqd0s4",
    abstract: <Lang.String
      english="Each year, the civil servants of the French tax authority have to implement the legislative changes to tax law voted in the finance bill. There are \
  numerous challenges in keeping a large codebase, modelling increasingly complex tax rules, up to date and correct. In this seminar, some of them \
  come to tell their tales about their experience accumulated over several decades."
      french={`Chaque année, les fonctionnaires de l'administration fiscale française doivent mettre \
    en œuvre les modifications législatives du droit fiscal votées dans le cadre de la loi de \
    finances. Maintenir à jour et corriger une base de code importante, modélisant des règles fiscales \
    de plus en plus complexes, pose de nombreux défis. Dans ce séminaire, certains d'entre eux \
    viennent raconter leur expérience accumulée depuis plusieurs décennies.`}
    />,
    kind: ComputerScience,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2023.0, ~month=05.0, ~date=05.0, ())),
    title: <Lang.String
      english="Drafting Rules between Technical and Legal Expertise: the Work of French Central Administration on Health Risks"
      french={`Rédiger les normes entre expertise technique et expertise juridique : le travail des administrations centrales face aux risques sanitaires`}
    />,
    presenter: "Didier Torny",
    presenter_page_url: "https://cv.hal.science/didier-torny",
    abstract: <Lang.String
      english="The drafting of public rules is usually considered a de facto \
    prerogative of lawyers, due to their skills and expertise. They translate \
    complex realities into law, while inserting them into a pre-existing \
    legislative and regulatory apparatus. But, in France, many ministries \
    and public administrations are almost devoid of these types of personnel \
    and entrust the drafting work to non-law professionals. It is the case of \
    the public health and veterinary health administrations where Veterinary \
    Public Health Inspectors (ISPV), Medical Public Health Inspectors (MISP) \
    and Pharmacist Public Health Inspectors (PhISP) draft decrees, \
    administrative orders and government circulars (circulaires administratives). \
    The presentation on the normative drafting work articulates the issue raised \
    by now autonomous expertise structures (agencies), the general legal framework \
    for the protection of people and animals and the will to write for an \
    implementation closer to the field."
      french={`La rédaction des normes publiques est habituellement considérée \
     comme étant une prérogative de fait des professions juridiques, en raison \
      de leurs compétences et savoir-faire. Ses membres traduisent dans le \
      droit/en droit des réalités complexes, tout en les insérant dans un \
      appareil législatif et réglementaire pré-existant.  Mais de nombreux \
      ministères et administrations sont quasiment dépourvus de ces types \
      de personnel et confient le travail rédactionnel à des non \
      professionnels du droit : c'était le cas des administrations de la santé \
      publique et de la santé vétérinaire où Inspecteurs de santé publique \
      vétérinaire (ISPV), Médecins Inspecteurs de santé publique (MISP) et \
      Pharmaciens inspecteurs de santé publique (PhISP) rédigent décrets, \
      arrêtés et circulaires. À l'articulation entre des structures \
      d'expertises désormais autonomes, un cadre juridique général de \
      protection des personnes et des animaux et une volonté d'écrire pour une \
      mise en oeuvre au plus près du terrain, ce travail de rédaction normatif \
      sera au coeur de cette présentation. Elle se fondera sur les éléments \
      empiriques issus de travaux antérieurs sur l'administration sanitaire en \
      France.`}
    />,
    kind: Sociology,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2023.0, ~month=09.0, ~date=16.0, ())),
    title: <Lang.String
      english="Explaining and justifying algorithmic decision systems: theory and practice"
      french={`Expliquer et justifier des systèmes de décisions algorithmiques : théorie et pratique`}
    />,
    presenter: "Clément Hénin",
    presenter_page_url: "https://planete.inrialpes.fr/people/chenin/",
    abstract: <Lang.String
      english="[This seminar originally planned on July 3rd has been postponed] \
      In a context favorable to the rationalization of decisions \
      through measurable objectives and quantitative methods, the recent \
      development of digital technologies has accelerated the adoption of \
      decision-making systems based on algorithmic processing. Research in \
      the field of eXplainable Artififial Intelligence (XAI) aims to guarantee \
      the intelligibility of decision algorithms. In this context, we propose \
      an original method enabling users of algorithmic systems to challenge or \
      justify their decisions. A justification (respectively a challenge) is \
      an argument, supported by evidence, that a decision is right \
      (respectively wrong) in the sense of a set of predefined external \
      norms. A technical device, called Algocate, makes it possible to \
      operationalize these notions for three types of norms (rules, \
      objectives and reference) thanks to an interactive system enabling \
      the user to express his or her point of view on the merits of the \
      decision. These types of solutions (explanations and justifications) \
      are put into practice in the context of the heart score, an algorithmic \
      decision-making system used by the Biomedicine agency since 2018 to \
      allocate heart transplants throughout France."
      french={`[Ce séminaire originellement prévu le 3 juillet a été décalé] \
      Dans un contexte favorable à la rationalisation des décisions \
      par des objectifs mesurables et des méthodes quantitatives, le \
      développement récent des technologies numériques a accéléré l'adoption \
      des systèmes de décisions fondés sur un traitement algorithmique. Des \
      travaux de recherche du champ de l'eXplainable Artififial Intelligence \
      (XAI) visent à garantir l'intelligibilité des algorithmes de décisions. \
      Dans ce contexte, nous proposons une méthode originale permettant aux \
      utilisateurs de systèmes algorithmiques d'en contester ou d'en justifier \
      les décisions. Une justification (respectivement une contestation) est un \
      argument, soutenu par une preuve, qu'une décision est bonne (respectivement \
      mauvaise) au sens d'un ensemble de normes extérieures prédéfinies. Un \
      dispositif technique, appelé Algocate, permet de rendre ces notions \
      opérationnelles pour trois types de normes (règles, objectifs et \
      référence) grâce à un système interactif permettant à l'utilisateur \
      d'exprimer son point de vue sur le bien-fondé de la décision. Ce type de \
      solutions (explications et justifications) sont mises en pratique dans le \
      cadre du score cœur, un système algorithmique de décision utilisé par \
      l'agence de Biomédecine depuis 2018 pour attribuer les greffons cardiaques \
      sur l'ensemble du territoire.`}
    />,
    kind: ComputerScience,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2023.0, ~month=08.0, ~date=04.0, ())),
    title: <Lang.String
      english="Formalizing Inconsistent Statutes: The Case of Section 121"
      french={`Formalisation de lois incohérentes : le cas de la section 121`}
    />,
    presenter: "Sarah Lawsky",
    presenter_page_url: "https://sites.northwestern.edu/sarahlawsky/",
    abstract: <Lang.String
      english="This project demonstrates the power of formal \
    methods in understanding the law, as well as the tools that the law already \
    has to resolve internal issues. We argue that a section of the Internal \
    Revenue Code, Section 121, is, as drafted, internally inconsistent. We \
    formalize the section in Catala, highlighting the challenges in the \
    process of formalization, and demonstrate, using the SMT solver, that as \
    formalized, Section 121 returns two different results for certain sets of \
    facts. Yet practically speaking, this inconsistency has not prevented the \
    implementation of the law, as taxpayers can comply with the law by \
    following forms provided by the Internal Revenue Service that tacitly \
    resolve the inconsistency. Thus while inconsistent statutes can be \
    avoided through formalization at the drafting stage, it is also true \
    that inconsistent statutes do not “break” the law."
      french={`Ce projet démontre la puissance des méthodes formelles dans \
      la compréhension du droit, ainsi que les outils dont le droit dispose \
      déjà pour résoudre les problèmes internes. Nous soutenons qu'une section \
      de l'Internal Revenue Code, la section 121, est, telle qu'elle est rédigée, \
      incohérente en elle-même. Nous formalisons la section dans Catala, \
      en soulignant les défis posés par le processus de formalisation, et nous \
      démontrons, à l'aide du solveur SMT, que la section 121, telle qu'elle \
      est formalisée, donne deux résultats différents pour certains ensembles \
      de faits. Pourtant, dans la pratique, cette incohérence n'a pas empêché \
      la mise en œuvre de la loi, puisque les contribuables peuvent s'y \
      conformer en suivant les formulaires fournis par l'Internal Revenue \
      Service qui résolvent tacitement l'incohérence. Ainsi, si les lois \
      incohérentes peuvent être évitées grâce à une formalisation au stade \
      de la rédaction, il est également vrai que les lois incohérentes ne \
      "cassent" pas la loi.`}
    />,
    kind: Law,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2023.0, ~month=10.0, ~date=13.0, ())),
    title: <Lang.String
      english="Automating public decision making: from law to code and everything in between"
      french={`De la loi au code : conditions de mise en œuvre automatisée des décisions publiques`}
    />,
    presenter: "Aïda Ibrahim",
    presenter_page_url: "https://www.linkedin.com/in/aidatechlaw/",
    abstract: <Lang.String
      english="The use of algorithmic tools by the public powers to issue \
      decisions is a well established reality. With new «legal algorithms» \
      everyday, we can expect an increase in their use, complexity and \
      potential problems. Amid the global automation trends, regulatory \
      efforts and overall take over of AI in every aspect of life, public \
      powers have to find an operational way to combine innovation with legal \
      compliance. My thesis deals with characterising the public automated \
      decision in a legal context. To do so, an interdisciplinary approach \
      was chosen, where the law and the algorithmic system that implements \
      it are treated as a whole. After a brief introduction to my research \
      method and results, I will present some partial conclusions and \
      operational ideas to kickstart the discussion."
      french={`La décision publique automatisée est le point de partie de cette \
    thèse : une décision prise par des systèmes algorithmiques est équivalente \
    à celle prise par un fonctionnaire? Comment traduire la loi en code \
    informatique? En unissant une analyse technique et juridique, la relation \
    entre le Droit et l'informatique est analysée pour fournir des solutions \
    légales opérationnelles pour l'implémentation de systèmes algorithmiques \
    dans la décision publique.`}
    />,
    kind: Law,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2023.0, ~month=11.0, ~date=04.0, ())),
    title: <Lang.String
      english="\"Predictive justice\" and lawyers, a study of a contrasting experiment"
      french={`La « justice prédictive » au service des avocats : étude d'une expérimentation contrastée`}
    />,
    presenter: "Héloïse Éloi-Hammer",
    presenter_page_url: "https://medialab.sciencespo.fr/equipe/heloise-eloi-hammer/",
    abstract: <Lang.String
      english="The use of algorithms and Artificial Intelligence in the legal \
    field is very controversial, and was the object of many discussions and \
    debates amongst law professionals. In this respect, the expression \
    “predictive justice” was formulated, in order to refer to some digital \
    tools allowing judges, lawyers and legal experts to estimate the \
    probable outcome of a case depending on its characteristics (nature of the \
    facts, legal arguments, social backgrounds of the interested parties). The \
    use of those tools are relatively shallow in France, compared to what can \
    be observed in other countries, however it is in rapid growth, as we can \
    see with the multiplication of legaltechs (start-ups that specialize in \
    the field of law) or with the DataJust experiment (DataJust was a public \
    project, aiming at developing an algorithm that could help judges to make \
    decisions in cases of physical injuries; it failed due to many problems). \
    The judges' reactions to the development of “predictive justice” softwares \
    have been documented, yet the use of these same softwares by lawyers and \
    legal experts has not been studied a lot for now, even though they are the \
    main users of these technologies. This communication aims at rectifying \
    the situation, by presenting the analysis of an experiment that was \
    conducted in a law school, which led future lawyers to use a “predictive \
    justice” tool. Based on qualitative methods (mainly observations and \
    interviews), the presentation focuses on the relation between lawyers \
    and “predictive justice” tools, and on how they insert the tools in \
    their practices."
      french={`L'application d'algorithmes et d'Intelligence Artificielle au \
    domaine de la justice est très discutée, et au cœur de nombreux débats. \
    Dans ce contexte, le terme de « justice prédictive » a fait son \
    apparition, pour désigner certains outils numériques permettant aux \
    professionnels du droit d'estimer les résultats probables d'une affaire \
    en fonction de ses caractéristiques (nature des faits, profil social des \
    parties, juridiction, etc). Ces outils sont relativement peu utilisés en \
    France par rapport à ce que l'on peut observer dans d'autres pays, mais \
    ils sont en plein essor, comme en témoignent par exemple la \
    multiplication des legaltechs (start-ups spécialisées dans le domaine \
    du droit) et le projet DataJust (projet public de conception d'un outil \
    d'aide à la décision pour les juges en matière de préjudices corporels, \
    dont l'élaboration a été interrompue suite à de nombreuses difficultés). \
    Si les réactions (majoritairement négatives) des magistrats à ces \
    technologies ont déjà fait l'objet de quelques articles fournis, leur \
    utilisation par les avocats et juristes reste peu documentée, alors même \
    qu'ils en sont les principaux usagers. Cette présentation ambitionne de \
    combler ce manque, en analysant une expérimentation menée dans une école \
    d'avocats, au cours de laquelle une solution de « justice prédictive » a \
    été présentée aux élèves et a fait l'objet d'un « challenge » obligatoire \
    pour tous. En se basant sur une étude qualitative par observations et \
    entretiens de cette expérimentation (depuis son organisation par le \
    personnel de l'école et la start-up ayant développé l'outil jusqu'au \
    challenge en lui-même et aux retours des élèves-avocats sur ce dernier), \
    elle interroge le rapport des avocats à ces solutions informatiques, ainsi \
    que la manière dont ces dernières s'insèrent dans leurs pratiques.`}
    />,
    kind: Sociology,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2024.0, ~month=0.0, ~date=8.0, ())),
    title: <Lang.String
      english="The Legistix project, an open platform for research in legal \
      informatics: automatic consolidation as an example"
      french={`Le projet Legistix, une plateforme ouverte pour la recherche \
      en informatique juridique : l'exemple de la consolidation automatique`}
    />,
    presenter: "Georges-André Silber",
    presenter_page_url: "https://www.cri.ensmp.fr/~silber/",
    abstract: <Lang.String
      english="Analyzing and understanding the law - its structure, evolution \
      and semantics - are major areas of application for NLP or formal systems. \
      Conducting research in this field requires access to complete, clean, \
      up-to-date and correctly structured data. In this talk, I will present \
      the Legistix platform, which provides access to such data with these \
      characteristics, illustrating its use through our work in automatic \
      consolidation. Most of the laws and codes used by lawyers and \
      legislators are in their consolidated version, i.e. the version \
      that is up to date with all amendments published in an \
      official journal (JORF or JOUE). The quality of this \
      consolidated version, even if it has no legal value as \
      such (only the initial text accompanied by all its amendments \
      published in the official journal does), is of the utmost \
      importance. Today, the consolidation of legal texts is carried out \
      manually by private and institutional publishers such as DILA. \
      Our aim is to make this process fully automatic."
      french={`Analyser et comprendre le droit, sa structure, son évolution, \
      sa sémantique, sont des domaines d'applications majeur du NLP ou des \
      systèmes formels. Mener des recherches dans ce domaine nécessite \
      d'avoir accès à des données complètes, propres, à jour et correctement \
      structurées. Dans cet exposé, je présenterai la plateforme Legistix qui \
      permet un accès à ces données avec ces caractéristiques, en illustrant \
      son utilisation par nos travaux en consolidation automatique. Les textes \
      de lois et les codes utilisés par les juristes et par le législateur \
      le sont la plupart du temps dans leur version consolidée, c'est-à-dire \
      dans leur version à jour de toutes les modifications publiées dans un \
      journal officiel (JORF ou JOUE). La qualité de cette version \
      consolidée, même si elle n'a pas de valeur légale en tant que tel \
      (seul le texte initial accompagné de toutes ses modifications \
      publiées au journal officiel en a une) est d'une très grande \
      importance. La consolidation des textes juridiques est aujourd'hui \
      opérée à la main par les éditeurs privés et institutionnels comme la \
      DILA. Nos travaux visent à rendre ce processus complètement \
      automatique.`}
    />,
    kind: ComputerScience,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2024.0, ~month=02.0, ~date=04.0, ())),
    title: <Lang.String
      english="Dematerialization of public procurement: transparency, competition and copying and pasting"
      french={`Dématérialisation des marchés publics : transparence, concurrence et copier-coller`}
    />,
    presenter: "Thomas Forté",
    presenter_page_url: "https://www.centreemiledurkheim.fr/notre-equipe/thomas-forte/",
    abstract: <Lang.String
      english="Far from being limited to calls for tender,
    public procurement encompasses a number of procedures under a single legal
    category. They enable economic players to compete to meet the needs of a
    public organization (works, supplies, services). Despite their place in our
    daily lives (roads, buildings...), social science research shows little or
    no interest in them. It's a subject reserved for the economic and legal
    sciences, most of which use it to propose solutions for better writing
    public procurement contracts. However, this research reduces the
    activity of writing and producing a contract to logical choices:
    modifying clauses, integrating criteria or choosing procedures.
    My ethnographic investigation of a departmental council shows that the process
    of producing a public contract is far from logical. If this were the case,
    why has this local authority reorganized four times and undergone three
    audits in the last ten years, only to \"improve\" the writing process? This
    presentation takes the example of the process of modernization through the
    dematerialization of writing practices for these contracts, mandatory since
    2018. I am particularly interested in the effects of this injunction to
    modernize on the ordinary work of writing on two levels. The first concerns
    relations between the local authority and economic players. The second
    concerns the re-actualization of practical tensions between the
    standardization of writing work and the expertise required to understand
    cases and needs. In so doing, the aim is to address a more cross-cutting
    and methodological question concerning my ability to understand the
    technical legal operations of the people involved."
      french={`Loin de se limiter aux appels d'offre, les marchés publics
    regroupent sous une même catégorie juridique plusieurs procédures qui
    permettent de mettre en concurrence des acteurs économiques afin de
    répondre aux besoins d'une organisation publique (des travaux, des
    fournitures, des services). Malgré leur place dans notre quotidien
    (routes, bâtiments...), les recherches en sciences sociales lui portent
    très peu d'intérêt, voire aucun. C'est un objet réservé aux sciences
    économiques et juridiques qui, pour la majorité d'entre elles, s'en
    saisissent pour proposer des solutions afin de mieux écrire un marché
    public. Or, ces recherches réduisent la rédaction d'un marché à des choix
    logiques: des modifications de clauses, l'intégration de critère ou de
    choix de procédures.
    L'enquête ethnographique que j'ai menée au sein d'un conseil départemental
    montre que le processus de production d'un marché public est loin d'être aussi
    logique. Si c'était le cas, pourquoi cette collectivité s'est réorganisée
    quatre fois et a fait l'objet de trois audits ces dix dernières années,
    et ce, uniquement pour "améliorer" l'écriture de ses marchés ? Cette
    présentation prend l'exemple du processus de modernisation par la
    dématérialisation des pratiques d'écritures de ces contrats, obligatoire
    depuis 2018.
    Je m'intéresse particulièrement aux effets de cette injonction à la
    modernisation sur le travail ordinaire d'écriture selon deux niveaux.
    Le premier porte sur les relations entre la collectivité et les acteurs
    économiques. Le second sur la réactualisation des tensions pratiques entre
    la standardisation du travail d'écriture avec l'expertise nécessaire à la
    compréhension des cas, des besoins. Ce faisant, le propos s'articule autour
    d'une question davantage transversale et méthodologique sur ma capacité à
    comprendre la place de ces opérations techniques du droit pour les personnes
    impliquées.`}
    />,
    kind: Sociology,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2024.0, ~month=1.0, ~date=5.0, ())),
    title: <Lang.String
      english={`A law about automatic processing, rather than a law about \
      personal data: when will we write the story of the French law Informatique et Libertés ?`}
      french={`Une loi sur les traitements \
      automatisés, bien plus qu'une loi sur les données personnelles : quand \
      écrira-t-on l'histoire de la loi du 6 janvier 1978 Informatique et \
      Libertés ?`}
    />,
    presenter: "Noé Wagener",
    presenter_page_url: "https://univ-droit.fr/universitaires/11094-wagener-noe",
    abstract: <Lang.String
      english="The French loi Informatique et Libertés of  6 January 1978 \
      was intended to tackle head-on the problem of the \
      \"computerization of society\" and its effects on freedoms. \
      It was only through a strange succession of moves that it was brought \
      brought back to the Safari affair, locked into the paradigm of respect for privacy \
      paradigm and, finally, retracted into \"personal data protection law\" alone. \
      Surprisingly, much of the \
      history of this law has not been made, and remains to be \
      to be written. This means, of course, that we need to re-inscribe \
      this text in the great debates \
      on freedoms in the 1970s; but above all, it requires us to \
      rebuild all the threads that the makers of the 1978 law had woven \
      on which their successors, in Parliament, in government departments \
      administrations, the CNIL and elsewhere, did not pull much \
      to any great extent. My presentation will therefore focus on a number of \
      public archives that can be freely communicated, to review the genesis of the \
      the genesis of the 1978 law, to remind us that it was not so much a law \
      a law on \"personal data\" as much as it was a law on \"automated \
      automated processing\" - and that we were, at the time, rather \
      aware of the difference between the two."
      french={`La loi du 6 janvier 1978 relative à l'informatique aux fichiers \
      et aux libertés ambitionnait de prendre à bras-le-corps le problème de \
      « l'informatisation de la société » et de ses effets sur les libertés. \
      Ce n'est que par une étrange succession de déplacements qu'elle a été \
      ramenée à l'affaire Safari, enfermée dans le paradigme du respect de \
      la vie privée et, finalement, rétractée dans le seul « droit de la \
      protection des données personnelles ». Étonnamment, toute une part de \
      l'histoire de cette loi n'a pas été faite, et reste aujourd'hui à \
      écrire. Cela suppose, bien sûr, de réinscrire ce texte dans les grands \
      débats des années 1970 sur les libertés ; mais cela exige surtout de \
      reconstruire tous ces fils que les concepteurs de la loi de 1978 \
      avaient tissés, sur lesquels leurs successeurs, au Parlement, dans \
      les administrations, à la CNIL et ailleurs, n'ont pas beaucoup tiré \
      ensuite. Ma communication s'attachera donc, en repartant de plusieurs \
      fonds d'archives publiques librement communicables, à revenir sur la \
      genèse de la loi de 1978, pour rappeler que celle-ci n'était pas tant \
      une loi sur les « données personnelles » qu'elle n'était une loi sur \
      les « traitements automatisés » - et qu'on était, alors, plutôt \
      conscient de ce qui sépare l'une de l'autre.`}
    />,
    kind: Law,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2024.0, ~month=4.0, ~date=6.0, ())),
    title: <Lang.String
      english={`Assessing a person using an algorithm. A legal analysis of the concept of profiling.`}
      french={`Évaluer une personne avec un algorithme. Analyse juridique via la notion de « profilage ».`}
    />,
    presenter: "Robin Plique",
    presenter_page_url: "https://www.linkedin.com/in/robin-plique-540044113",
    abstract: <Lang.String
      english="Various social scientists describe our Western societies as \
      “evaluation societies”. There is no shortage of examples. \
      The development of a \"social credit score\" (SCS) in China is \
      one. In western societies too, many impactful decisions affecting \
      individuals are dependent on the result of a good evaluation. Without \
      a good credit score, there is no credit. If a person presents a bad \
      risk, e.g because of their health status, they cannot be insured, or \
      only at a very high premium. Recruitment is the result of a decision, \
      increasingly mediated by sorting or facial recognition algorithms that \
      allow people to be selected in the blink of an eye according to their \
      stress level or predicted employability. These practices are generally \
      the result of an algorithmic analysis known as \"profiling\". But does \
      the legal concept of profiling match its technical description? \
      On closer examination, we will see that the legal notion is larger \
      than the technical one. Moreover, the concept seems to be entangled \
      with that of automated decision. The same can be said of its regime, \
      which seems ineffective if confined to personal data law. It is \
      therefore necessary to examine other areas of law. Insofar as evaluation \
      can be defined semantically as a value judgement, can we apply the area \
      of law that usually regulates those, i.e defamation law?"
      french={`Divers représentants des sciences sociales décrivent nos \
      sociétés occidentales sous l'appellation de « société de l'évaluation ». \
      Ce ne sont pas les exemples qui manquent et nous n'avons rien à envier \
      au développement d'un « crédit social » en Chine. Il suffit de constater \
      que pléthore de décisions affectant les individus sont aujourd'hui \
      conditionnées au résultat d'une (bonne) évaluation. Sans un bon score \
      de crédit, pas de crédit. Si la personne présente un mauvais risque, \
      par exemple à cause de sa santé, elle ne pourra être assurée ou alors \
      à une prime très élevé. Le recrutement est le fruit d'une décision, de \
      plus en plus médiée par des algorithmes de tri ou de reconnaissance \
      faciale permettant en un clin d'œil selon leur niveau de stress ou \
      leur employabilité prédite. Ces pratiques sont généralement le fruit \
      d'une analyse par algorithme que l'on appelle « profilage ». Toutefois, \
      la notion juridique de profilage répond-elle à sa description technique ? \
      À l'examen, on verra qu'elle excède largement celle-ci. De plus, la \
      notion semble enchevêtrée avec celle de décision automatisée. Le même \
      constat peut être dressé à l'égard de son régime, qui paraît peu \
      efficace si on le cantonne au droit des données à caractère personnel. \
      Il est donc nécessaire d'examiner d'autres secteurs du droit. Dans la \
      mesure où l'évaluation est un jugement de valeur, peut-on appliquer \
      au profilage le pan du droit traditionnellement dévolu à la \
      réglementation de ceux-ci, à savoir le droit de la presse ?`}
    />,
    kind: Law,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2024.0, ~month=3.0, ~date=15.0, ())),
    title: <Lang.String
      english={`Domain-specific languages for embedded systems and their formalization`}
      french={`Langages dédiés pour les systèmes embarqués et leur formalisation`}
    />,
    presenter: "Timothy Bourke",
    presenter_page_url: "https://www.tbrk.org/",
    abstract: <Lang.String
      english="An embedded system consists of one or more microprocessors \
      that interact with a physical process. These systems are found in \
      transport, power plants, factories and so on. Their behaviour is \
      determined by software that runs cyclically. For some systems, \
      particularly the most critical ones, the software is not implemented \
      directly in an imperative language, where we describe precisely what a \
      processor must do, but rather in a block diagram language, where we \
      define the transformations of data flows between inputs and outputs. \
      The block diagrams are then automatically transformed into imperative \
      code by a compiler. For several years we have been developing such a \
      compiler, specified and verified in the Coq proof assistant. Although \
      the language, compilation algorithms and formalisation principles are \
      already well studied, dealing with them in depth in a proof assistant \
      requires dedicated work to find the appropriate definitions and complete \
      the proofs. Our compiler transforms block diagrams into an imperative \
      language provided by the CompCert compiler.  Consequently, its correction \
      theorem formally links a semantics on the data flows between inputs and \
      outputs with the repeated executions of the imperative code generated. \
      We will present the broad outlines of embedded systems programming with \
      block diagrams, our formalisation of such a language and some of the \
      problems that had to be solved. In particular, we will discuss the \
      motivations for our work and the advantages and disadvantages of \
      this application of very formal methods."
      french={`Un système embarqué est composé d'un ou plusieurs \
      microprocesseurs qui interagissent avec un processus physique. Ces \
      systèmes se trouvent dans les transports, les centrales électriques, \
      les usines, etc. Leur comportement est déterminé par un logiciel qui \
      s'exécute cycliquement. Pour certains systèmes, et notamment les plus \
      critiques, les logiciels ne sont pas implémentés directement dans un \
      langage impératif, où l'on décrit précisément ce qu'un processeur doit
      \faire, mais plutôt dans un langage de schémas-blocs, où l'on définit \
      les transformations des flots de données entre entrées et sorties. Les \
      schémas-blocs sont ensuite transformés automatiquement en un code \
      impératif par un compilateur. Depuis plusieurs années nous développons \
      un tel compilateur, spécifié et vérifié dans l'assistant de preuve Coq. \
      Bien que le langage, les algorithmes de compilation et les principes de \
      formalisation soient déjà bien étudiés, leur traitement approfondi dans \
      un assistant de preuve demande un travail dédié pour trouver les \
      définitions appropriées et compléter les preuves. Notre compilateur \
      transforme les schémas-blocs dans un langage impératif fourni par le \
      compilateur CompCert. Par conséquent, son théorème de correction lie \
      formellement une sémantique sur les flots de données entre entrées et \
      sorties avec les exécutions répétées du code impératif généré. Nous \
      présenterons les grandes lignes de la programmation de systèmes embarqués \
      avec des schémas-blocs, notre formalisation d'un tel langage et certains \
      des problèmes qu'il a fallu résoudre. Nous parlerons en particulier des \
      motivations de notre travail et des avantages et inconvénients de cette \
      application des méthodes très formelles.`}
    />,
    kind: ComputerScience,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2024.0, ~month=5.0, ~date=3.0, ())),
    title: <Lang.String
      english={`The social conditions of exchanges in Silicon Valley: \
    military-industrial complex, scientific entrepreneurship and demos.`}
      french={`Les conditions sociales des échanges dans la Silicon Valley : \
      Complexe militaro-industriel, entreprenariat scientifique et démos.`}
    />,
    presenter: "Claude Rosental",
    presenter_page_url: "https://cems.ehess.fr/membres/claude-rosental",
    abstract: <Lang.String
      english="I will focus on the social conditions of exchange
 Silicon Valley from the second half of the 20th century to the present day.
I will show that contractual relations, partnerships and
partnerships and transactions between academics, industrialists
 and representatives of the federal and defense administrations have been
structured in part by the development of specific modes of regulation
within the military-industrial complex, the rise of a regime of scientific
entrepreneurship and the deployment of modes of interaction
 marked in particular by the staging of public
public demonstrations of technology, also known as \"demos\"."
      french={`Je prendrai pour objet les conditions sociales des échanges \
      propres à la Silicon Valley depuis la seconde moitié du 20e siècle \
      jusqu'à nos jours. Je montrerai que les relations contractuelles, les \
      partenariats et les transactions entre universitaires, industriels, et \
      représentants de l'administration fédérale et de la défense ont été \
      structurés en partie par le développement de modes spécifiques de \
      régulation au sein d'un complexe militaro-industriel, par l'essor \
      d'un régime d'entreprenariat scientifique et par le déploiement de \
      modes d'interaction marqués en particulier par la réalisation de
      \démonstrations publiques de technologie, appelées aussi « démos ».`}
    />,
    kind: Sociology,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2024.0, ~month=8.0, ~date=2.0, ())),
    title: <Lang.String
      english={`Jetlang, a platform to code up payroll rules`}
      french={`JetLang, une plateforme pour encoder les règles de paie`}
    />,
    presenter: "Thomas Villaren & Sacha Brisset",
    presenter_page_url: "https://payfit.com",
    abstract: <Lang.String
      english="Created as a simple expression language, an abstraction above
      Javascript, to enable business experts to encode legal texts when
      the startup PayFit was launched in 2016, JetLang has since evolved into
      a platform in its own right, streamlining the the application development
      chain for this payroll and human resources for European VSEs and SMEs.
      At the heart of PayFit's software architecture, the JetLang platform
      and its calculation engine enable PayFit employees (Product Builders and
      Compliance team) to implement, maintain and update the payroll-related
      calculation rules for over a hundred collective collective agreements
      in France, Spain and the UK. in France, Spain and England. We will
      present the broad outlines of PayFit's current organisation PayFit's
      current organisation, from the detection of a change in the law to its
      implementation, and present the tools available to our internal available
      to our internal users to test and validate their implementation
      calculations."
      french={`Créé comme un simple langage d'expression, une abstraction
      au-dessus de Javascript, pour permettre à des experts métier d'encoder
      les textes lois au démarrage de la startup PayFit en 2016, JetLang a
      depuis évolué dans une plateforme à part entière, rationalisation la
      chaîne de développement applicative de ce logiciel de gestion de la
      paie et des ressources humaines à destination des TPE et PME européennes.
      Au coeur de l'architecture logicielle de PayFit, la plateforme JetLang
      et son moteur de calcul permettent aux collaborateurs métiers de PayFit
      (Product Builders et équipe conformité) d'implémenter, maintenir et
      mettre à jour les règles de calcul liées à la paie de plus d'une
      centaine de conventions collectives en France, en Espagne et en
      Angleterre. Nous présenterons les grandes lignes de l'organisation
      actuelles de PayFit, depuis la détection d'une évolution de la loi
      jusqu'à son implémentation, et présenterons les outils mis à disposition
      de nos utilisateurs internes pour tester et valider leur implémentation
      des calculs.`}
    />,
    kind: ComputerScience,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2024.0, ~month=9.0, ~date=7.0, ())),
    title: <Lang.String
      english="Digital regulation : presentation and critique of the risk-based approach"
      french={`Réguler le numérique : présentation et critiques de l'approche par les risques`}
    />,
    presenter: "Arnaud Latil",
    presenter_page_url: "https://univ-droit.fr/universitaires/24851-arnaud-latil",
    abstract: <Lang.String
      english={`In recent years, the risk-based approach has established itself as a key
        legislative method. The major texts of digital law (Regulation Services Legislation, NIS 2,
        Council of Europe Framework Convention on AI, etc.) apply it to varying degrees.
        But far from being isolated, digital law is in fact part of the family of other
        risk-based regulations, such as environmental law and financial law. The aim of
        this conference is to to present this legal method and its applications,
        particularly in the areas of artificial intelligence, content regulation and
        cybersecurity. cybersecurity. On the other hand, the conference aims to set
        out the main criticisms levelled at this legislative method, in particular
        concerning the principle of technological neutrality, and the fears that this
        legislative fears that this method will be abused. `}
      french={`L'approche par les risques s'est imposée ces dernières années comme une méthode
        législative de premier plan. Les grands textes du droit du numérique (Règlement
        sur l'IA, Législation sur les services, NIS 2, Convention-cadre du Conseil de
        l'Europe sur l'IA, etc.) l'appliquent ainsi à différents degrés. Mais loin d'être
        isolé, le droit du numérique s'inscrit en réalité dans la filiation d'autres
        réglementations fondées sur les risques, à l'instar du droit de l'environnement
        et du droit financier. L'objectif de cette conférence consiste, d'une part,
        à présenter cette méthode juridique et ses déclinaisons, en particulier en
        matière d'intelligence artificielle, de régulation des contenus et de
        cybersécurité. La conférence vise, d'autre part, à exposer les principales
        critiques formulées à l'encontre de cette méthode législative, notamment
        concernant le principe de neutralité technologique ou encore s'agissant des
        craintes de dévoiement de cette méthode.`}
    />,
    kind: Law,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2024.0, ~month=10.0, ~date=4.0, ())),
    title: <Lang.String
      english={`Digital policy or digitalisation of public policies: investigation over an incomplete institutionalisation`}
      french={`Politique numérique ou numérisation des politiques publiques : enquête sur une institutionnalisation inachevée`}
    />,
    presenter: "Anne Bellon",
    presenter_page_url: "https://www.linkedin.com/in/anne-bellon-a3a90369/",
    abstract: <Lang.String
      english={`The digital revolution has profoundly transformed the actions of
      the State, whose modes and logics of intervention have been adapted to
      an increasingly ‘digitised' society, i.e. one in which production,
      commercial exchanges and social relations are now mediated by various
      digital technologies. However, these transformations have not led to the
      creation of a strong Ministry for the Digital Economy, with so-called
      digital policies instead being fragmented between different traditional
      areas of intervention, whose boundaries more often than not overlap with
      those of ministerial organisations. What, then, is the State's digital
      policy all about, and how can we think about the coherence (or otherwise)
      of the State's intervention in these pressing issues? Drawing on the major
      theories of public action, at the crossroads of sociology and political
      science, this session seeks to answer these questions and offer insights
      into the paradoxical situation of ‘digital', and the expertise, issues
      and professions associated with it, within the State.`}
      french={`La révolution numérique a profondément transformé l'action de
      l'État, dont les modes et logiques d'intervention se sont adaptés à une
      société de plus en plus « numérisée », c'est-à-dire une société où la
      production, les échanges commerciaux et les rapports sociaux sont
      désormais médiés par diverses technologies numériques. Pourtant, ces
      transformations n'ont pas abouti à la constitution d'un ministère du
      Numérique fort, les politiques dites numériques se trouvant plutôt
      éclatées entre différents domaines traditionnels d'intervention, dont
      les frontières recoupent le plus souvent celles des organisations
      ministérielles. De quoi la politique numérique de l'État est-elle donc
      le nom et comment penser la mise en cohérence (ou non) de l'intervention
      de l'État sur ces enjeux prégnants ? En s'appuyant sur les grandes
      théories de l'action publique, au croisement de la sociologie et de la
      science politique, l'intervention cherche à répondre à ces questions et
      à offrir des prises pour penser la situation paradoxale du « numérique »,
      des expertises, des questions et des métiers qui lui sont attachés, au
      sein de l'État.`}
    />,
    kind: Sociology,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2024.0, ~month=11.0, ~date=9.0, ())),
    title: <Lang.String
      english={`Projecting Computer Language for a Protean Interaction`}
      french={`Projeter les langages informatiques pour une interaction protéiforme`}
    />,
    presenter: "Camille Gobert",
    presenter_page_url: "https://www.lri.fr/~gobert/",
    abstract: <>
      <Lang.String
        french={`Depuis leur apparition au milieu du XXe siècle, les
      langages informatiques — c'est-à-dire les langages conçus pour être
      interprétés par des machines qui sont utilisés par des humains — sont
      au cœur de notre interaction avec les ordinateurs. Nous utilisons par
      exemple des langages tels que Python, LaTeX et Catala pour, respectivement,
      concevoir des programmes, formater des documents, et formaliser des
      textes légaux. Cependant, en dépit de la diversité des concepts que ces
      langages permettent de manipuler et des profils de leurs utilisateurs,
      notre interaction avec les langages informatique se réduit bien souvent à
      une seule et même approche : lire et écrire du texte brut. Dans cette
      présentation, qui s'appuie sur mon `}
        english="Since their emergence in the middle of the 20th century,
        computer languages - i.e. languages designed to be interpreted by
        machines interpreted by machines and used by humans - have been at
        the heart of our at the heart of our interaction with computers. For
        example, we use languages such as Python, LaTeX and Catala to,
        respectively, design programmes, format documents and formalise
        legal legal texts. However, despite the diversity of concepts that
        these manipulate and the profiles of their users, our interaction with
        computer languages is very often reduced to a single a single approach:
        reading and writing plain text. In this presentation, which is based on my "
      />
      <Link.Text target="https://theses.fr/2024UPASG019">
        <Lang.String french={`travail de thèse`} english="doctoral thesis" />
      </Link.Text>
      <Lang.String
        french={` sur cette thématique, je propose de repenser notre
      interaction avec ces
      langages en utilisant le concept de `}
        english=" on the subject, I propose to rethink our interaction with
        those languages by using the concept of "
      />
      <span className="italic"> {"projection" |> React.string} </span>
      <Lang.String
        french={`, qui désigne le fait de
      donner corps à des données représentant le code ou le contexte dans
      lequel celui-ci est utilisé afin de pouvoir interagir avec elles,
      indépendamment de leur encodage. Afin d'illustrer cette idée, je
      présente `}
        english=". This concept refers to giving substance to data representing
        the code or the context in which it is used, so that we can interact
        with it independently of its encoding. To illustrate this idea, I present "
      />
      <Link.Text target="https://github.com/exsitu-projects/ilatex">
        {<>
          <span className="italic"> {"i" |> React.string} </span>
          {"-LaTeX" |> React.string}
        </>}
      </Link.Text>
      <Lang.String french={` et `} english=" and " />
      <Link.Text target="https://github.com/exsitu-projects/lorgnette">
        <Lang.String french={`Lorgnette`} english="Lorgnette" />
      </Link.Text>
      <Lang.String
        french={`, deux
      prototypes de systèmes permettant d'utiliser et de créer de nouvelles
      projections pour des fragments de langages dits « textuels »
      (LaTeX, Python, CSS…), telles que des tableaux, des images et des
      formulaires. En m'inspirant de ces systèmes et de divers exemples
      issus de l'état de l'art en interaction humain-machine, je conclus
      en introduisant une taxonomie de quatre niveaux d'interaction avec
      les langages informatiques, et invite l'audience à se l'approprier
      afin d'imaginer de nouvelles formes d'interaction avec un langage
      tel que Catala.`}
        english=", two prototype systems for using and creating new projections
        for fragments of so-called ‘textual' languages (LaTeX, Python, CSS,
        etc.), such as tables, images and forms. Drawing on these systems and
        various examples from the state of the art in human-computer interaction,
        I conclude by introducing a taxonomy of four levels of interaction with
        computer languages, and invite the audience to appropriate it in order
        to imagine new forms of interaction with a language such as Catala."
      />
    </>,
    kind: ComputerScience,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2025.0, ~month=0.0, ~date=6.0, ())),
    title: <Lang.String
      english="Talking about artificial intelligence in law: between the crisis of law and the crisis of a scientific discipline"
      french={`Parler de l'intelligence artificielle en droit, entre crise du droit et crise d'une discipline scientifique`}
    />,
    presenter: "Camille Bordère",
    presenter_page_url: "https://www.linkedin.com/in/camille-bordere-9a5372a4",
    abstract: <Lang.String
      english={`Within the legal discipline, the digital revolution in law is
      usually viewed from the angle of its impact on the content and practice
      of law. This is particularly the case for one particular facet of this
      revolution, embodied by so-called predictive justice tools and the
      exhaustive case law databases on which they are based. At first glance,
      the body of literature on this subject focuses on the way in which these
      tools are likely to affect both the content of legal rules and their
      practice by lawyers and, above all, by judges. On closer examination,
      however, the surprising homogeneity and circularity of this discourse
      of rejection based on the idea of the incompatibility of these devices
      with ‘French law' conceals less explicit tensions, which affect not only
      ‘law' in the strict sense, but also the way in which it is thought
      about, understood and defined - in a word, law as a scientific discipline.
      Both against and on the basis of the content of this specific discourse,
      the doctoral thesis to be presented has thus set out to answer a central
      question: why do all these authors seem to reject these devices? On the
      basis of a study of the arguments put forward by these authors,
      three hypotheses (legal, systemic and cultural) were successively
      examined in order to determine where, in French law, the incompatibility
      in question lies. At the end of their successive analyses, and in the
      absence of a legal basis for this rejection, it is the effects of these
      devices on the frameworks of thought of the legal discipline that seem
      best able to shed light on this discourse and on the way in which legal
      experts are dealing with the effects of artificial intelligence on their
      subject matter... and on their discipline, therefore.`}
      french={`Au sein de la discipline juridique, la révolution numérique du droit est
      habituellement saisie sous l'angle de son impact sur le contenu et la pratique
      du droit. C'est particulièrement le cas d'une facette particulière de cette révolution,
      incarnée par les outils dits de justice prédictive et les bases de données
      jurisprudentielles à vocation exhaustive sur lesquelles ils s'adossent.
      À première vue, l'ensemble des écrits produits sur ce sujet se concentre
      bien sur la manière dont ces dispositifs sont susceptibles d'affecter à la
      fois le contenu des règles de droit et leur pratique par les avocats et,
      surtout, par les juges. À bien y regarder, cependant, l'homogénéité et la
      circularité surprenantes de ce discours de rejet fondé sur une idée d'incompatibilité
      de ces dispositifs avec le « droit français » dissimulent des tensions moins
      explicites, qui touchent non pas seulement au « droit » au sens strict, mais
      aussi à la manière dont il est pensé, compris et défini – en un mot, au droit
      comme discipline scientifique. À la fois à rebours et sur la base du contenu
      de ce discours spécifique, la thèse de doctorat qui sera présentée s'est ainsi
      attachée à répondre à une question centrale : pourquoi tous ces auteurs
      semblent-ils rejeter ces dispositifs ? Sur le fondement de l'étude des arguments
      mobilisés par ces auteurs, ce sont trois hypothèses (juridique, systémique
      et culturelle) qui ont été successivement étudiées afin de déterminer où,
      dans le droit français, se situe l'incompatibilité pointée du doigt. À
      l'issue de leur analyse successive et faute de pouvoir fonder ce rejet
      en droit, ce sont les effets de ces dispositifs sur les cadres de pensée
      de la discipline juridique qui semblent les plus à mêmes d'éclairer ce
      discours et la manière dont les juristes se saisissent des effets de
      l'intelligence artificielle sur leur objet... et sur leur discipline, donc.`}
    />,
    kind: Law,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2025.0, ~month=01.0, ~date=17.0, ())),
    title: <Lang.String
      english={`Good-Enoughing: an ethnography of software work at Middle Tech companies `}
      french={`Faire juste assez bien : une ethnographie du travail logiciel dans les entreprises ordinaires de la tech`}
    />,
    presenter: "Paula Bialski",
    presenter_page_url: "https://paulabialski.com/",
    abstract: <Lang.String
      english={`What if software is never in a state of seamlessness and
      perfection, but always just simply good-enough-to-function? Situated
      between science and technology studies, software studies, and
      ethnographic inquiry, in this lecture, Prof. Bialski will take the
      audience on a journey describing neither the tech giant or the flashy
      startup, but the run-of-the-mill Middletech: a place where software
      is built to be just “good enough” to function and workers create and
      sustain a complex culture of good enoughness. In examining the
      materiality of software in shaping the organization of software work,
      Bialski will show how software's technical constraints – such as bugs
      or legacy code – impacts daily workflows, decision-making processes,
      and power dynamics among software engineers.`}
      french={`Et si les logiciels n'étaient jamais parfaits et sans faille,
      mais toujours suffisamment bons pour fonctionner ? Située entre
      entre la sociologie des sciences et techniques, les études sur les
      logiciels et les enquêtes ethnographiques,
      le professeur Bialski emmènera le public dans un voyage décrivant
      non pas les géants de la
      tech ou les start-ups pimpantes mais une entreprise « moyenne » de la tech
      ordinaire : un endroit où les logiciels
      sont construits pour être juste « assez bons » pour fonctionner et où les
      travailleurs créent et entretiennent une
      culture complexe de la qualité suffisante. En examinant la matérialité
      du logiciel dans l'organisation du travail sur le logiciel, Bialski
      montrera comment
      les contraintes techniques des logiciels – telles que les bogues
      ou les codes hérités – façonnent les flux de travail quotidiens,
      les processus de prise de décision et les dynamiques de pouvoir
       parmi les ingénieurs en informatique.`}
    />,
    kind: Sociology,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2025.0, ~month=02.0, ~date=10.0, ())),
    title: <Lang.String
      english={`CUTECat: Generating Testcases for Computational Laws through Concolic Execution`}
      french={`CUTECat : Génération de cas de tests pour le droit computationel grâce à l'exécution concolique`}
    />,
    presenter: "Pierre Goutagny",
    presenter_page_url: "https://pierregoutagny.fr/",
    abstract: <Lang.String
      english={`Many legal computations, including the amount of tax owed by a
      citizen, whether they are eligible to social benefits, or the wages due
      to civil state servants, are specified by computational laws. Their
      application, however, is performed by expert computer programs intended
      to faithfully transcribe the law into computer code. Bugs in these
      programs can lead to dramatic societal impact, e.g., paying employees
      incorrect amounts, or not awarding benefits to families in need. The
      Catala domain-specific programming language allows for more faithful
      translations of law into code. However, some classes of bugs can still
      happen in Catala programs, either due to a programming error or due to a
      faithful translation of an ambiguous legal text. Program analysis can
      address these issues by studying automatically the source code (static
      analysis) or observing the behavior of the program when it is running
      under controlled circumstances (dynamic analysis). These analyses help
      deduce properties of the program — When can it crash? Does it always
      return the expected output value given known inputs? — and thus find
      bugs. In particular, we consider concolic unit testing, a combination
      of dynamic and static analysis that relies on both concrete execution
      and SMT-based symbolic execution, and propose CUTECat, a concolic
      execution tool targeting implementations of computational laws. Such
      laws typically follow a pattern where a base case is later refined by
      many exceptions in following law articles, a pattern that can be formally
      modeled using default logic. We show how to handle default logic inside a
      concolic execution tool, and implement our approach in the context of
      Catala. We evaluate CUTECat on several programs, including the Catala
      implementation of the French housing benefits and Section 132 of the US
      tax code. We show that CUTECat can successfully generate hundreds of
      thousands of testcases covering all branches of these bodies of law.
      Through several heuristics, we improve CUTECat's scalability and
      usability, making the testcases understandable by lawyers and programmers
      alike. We believe CUTECat thus paves the way for the use of formal methods
      during legislative processes.`}
      french={`De nombreux calculs juridiques, notamment le montant de l'impôt
      dû par un citoyen, son éligibilité aux prestations sociales ou le salaire
      dû aux fonctionnaires de l'État, sont spécifiés par des lois
      computationelles. Leur application est réalisée par
      des programmes informatiques experts destinés à transcrire fidèlement
      la loi en code informatique. Les bogues dans ces programmes peuvent avoir
      un impact sociétal dramatique, par exemple en payant des montants
      incorrects aux employés ou en n'accordant pas de prestations aux familles
      dans le besoin. Le langage de programmation spécifique au domaine Catala
      permet de traduire plus fidèlement la loi en code. Cependant, certaines
      catégories de bogues peuvent encore se produire dans les programmes Catala,
      soit en raison d'une erreur de programmation, soit en raison d'une
      traduction fidèle d'un texte juridique ambigu. L'analyse de programme peut
      aborder ces questions en étudiant automatiquement le code source
      (analyse statique) ou en observant le comportement du programme lorsqu'il
      est exécuté dans des circonstances contrôlées (analyse dynamique).
      Ces analyses permettent de déduire les propriétés du programme -
      Quand peut-il se planter ? Renvoie-t-il toujours la valeur de sortie
      attendue en fonction d'entrées connues ? - et donc de trouver des bogues.
      En particulier, nous considérons les tests unitaires concoliques,
      une combinaison d'analyse dynamique et statique qui repose à la fois sur
      l'exécution concrète et l'exécution symbolique basée sur SMT, et nous
      avons avons développé CUTECat, un outil d'exécution concolique ciblant
      les implémentations de lois de calcul. Ces lois suivent typiquement
      un modèle où un cas de base est ensuite raffiné par de nombreuses
      exceptions dans les articles de loi suivants, un modèle qui peut
      être formellement modélisé à l'aide de la logique par défaut.
      Nous montrons comment gérer la logique par défaut dans un outil
      d'exécution concolique, et mettons en oeuvre notre approche dans
      le contexte de Catala. Nous évaluons CUTECat sur plusieurs programmes,
      y compris l'implémentation Catala des allocations logement françaises
      et de la section 132 du code fiscal américain. Nous montrons que CUTECat
      peut générer avec succès des centaines de milliers de cas de test couvrant
      toutes les branches de ces corpus juridiques. Grâce à plusieurs
      heuristiques, nous améliorons l'extensibilité et la convivialité de
      CUTECat, en rendant les cas de test compréhensibles pour les juristes et
      les programmeurs. Nous pensons que CUTECat ouvre ainsi la voie à
      l'utilisation de méthodes formelles dans les processus législatifs.`}
    />,
    kind: ComputerScience,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2025.0, ~month=03.0, ~date=7.0, ())),
    title: <Lang.String
      english={`What is a valorizable invention? An investigation of valorization at the CNRS `}
      french={`Qu'est-ce qu'une invention valorisable ? Enquête sur la valorisation au CNRS`}
    />,
    presenter: "Victoria Brun",
    presenter_page_url: "https://www.linkedin.com/in/victoriabrun",
    abstract: <Lang.String
      english={`The valorization of public research has been a concern of
      public policies and research establishments in France since the 1960s.
      Aiming at encouraging research staff to transfer their results to society,
      numerous administrative services and a multitude of funding mechanisms
      have been set up to take charge of this new mission of public research,
      which is often considered unpopular in the eyes of its main targets.
      In this presentation, based on an investigation conducted at the Centre
      National de la Recherche Scientifique (CNRS) during my doctoral thesis,
      I will show that institutional support for valorization is based on an
      economic, proprietary and technological conception of innovation. By
      contrasting the various trajectories of inventions originating from
      public laboratories, I will explain the crucial role of administrative
      and funding mechanisms in shaping their successful valorization: how
      does a methodology shared within a research team to support public action
      against global warming become a start-up? How does the discovery of a
      biological phenomenon to fuel PhD student's publication in peer-reviewed
      journals become a patent? By taking an interest in the way research
      results are handled at the laboratory door, I am also looking at what is
      a valorizable invention in the eyes of CNRS valorization services.`}
      french={`La valorisation de la recherche publique est une préoccupation
      portée par les pouvoirs publics et les établissements depuis les années
      1960 en France. Dans l'idée d'encourager les personnels de recherche à
      transférer leurs résultats vers la société, de nombreuses instances et
      une multitude de dispositifs de financement ont été mis en place pour
      prendre en charge cette nouvelle mission de la recherche publique,
      souvent considérée comme impopulaire aux yeux de ses principales cibles.
      Dans cette présentation basée sur une enquête conduite dans le cadre de
      ma thèse de doctorat au sein du Centre National de la Recherche
      Scientifique (CNRS), je montrerai que l'accompagnement institutionnel à
      la valorisation repose sur une conception économique, propriétaire et
      technologique de l'innovation. En contrastant des trajectoires variées
      d'inventions issues de laboratoires publics, j'expliciterai le rôle
      crucial des dispositifs administratifs et de financement dans leur
      modelage vers une valorisation réussie : comment une méthodologie
      partagée dans une équipe de recherche pour soutenir l'action publique
      contre le réchauffement climatique devient-elle une start-up ? Comment
      la découverte d'un phénomène biologique pour alimenter la publication
      dans des revues à comité de lecture d'un doctorant devient-elle un
      brevet ? En m'intéressant à la prise en charge de résultats de
      recherche à la porte du laboratoire, je donnerai à voir ce qu'est
      invention valorisable pour les services de valorisation du CNRS. `}
    />,
    kind: Sociology,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2025.0, ~month=4.0, ~date=12.0, ())),
    title: <Lang.String
      english="Use of formal methods in the rail industry"
      french={`Utilisation des méthodes formelles dans l'industrie ferroviaire`}
    />,
    presenter: "Emeric Tournaire",
    presenter_page_url: "https://www.linkedin.com/in/emeric-tourniaire-14878b79",
    abstract: <Lang.String
      english={`IT in the rail industry is critical, in the sense that bugs
      in programs can result in loss of life. The CLEARSY company specializes in the use
      of formal methods to guarantee high levels of reliability. This
      presentation focuses on a complex problem found on busy lines: train tracking.`}
      french={`L'informatique dans l'industrie ferroviaire est critique, dans
      le sens où des bugs dans les programmes peuvent se traduire par des
      pertes en vie humaine. La société CLEARSY est spécialisée dans
      l'utilisation des méthodes formelles pour garantir des hauts niveaux
      de fiabilité. Cet exposé présente en particulier un problème complexe
      qu'on retrouve sur des lignes très fréquentées : le suivi des trains.`}
    />,
    kind: ComputerScience,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2025.0, ~month=5.0, ~date=2.0, ())),
    title: <Lang.String
      english="Are sandboxes for AI experimentation a legal playground?"
      french={`Les bacs-à-sables pour expérimenter les systèmes d'IA, une aire de jeu pour les règles de droit ?`}
    />,
    presenter: "Sophie Weerts",
    presenter_page_url: "https://www.linkedin.com/in/sophie-weerts-1a77a9265/",
    abstract: <Lang.String
      english={`Law is regularly described as a brake on innovation.
      Against this criticism, the European regulation on artificial intelligence
      puts in place a series of instruments to support innovation. These
      include the sandbox, i.e. an environment, under the supervision of a
      regulatory authority, in which suppliers of AI systems can develop,
      train, test or evaluate AI systems. The idea is to enable companies and
      public organisations to experiment without fear of infringing existing
      legal rules. It is thus part of a philosophy that is distinct from the
      prior regulatory approach based on ex ante risk assessment and the
      self-governance of players. So does the European regulation illustrate
      a regulatory turning point in digital law, or is it just an epiphenomenon?
      Based on studies of regulation and a documentary analysis of European
      regulations and policies on innovation and their implementation, the aim
      of this paper is to present and discuss the emergence of sandboxes in the
      field of technology regulation and to explore their aims and characteristics.`}
      french={`Le droit est régulièrement décrit comme un frein à l'innovation.
      Contre cette critique, le règlement européen sur l'intelligence artificielle
      met en place une série d'instruments en soutien à l'innovation. Parmi ceux-ci
      figure le bac à sable, à savoir un environnement, placé sous la supervision
      d'une autorité régulatoire, dans lequel les fournisseurs de systèmes
      d'IA peuvent développer, entraîner, tester ou évaluer des systèmes d'IA.
      L'idée est de permettre aux entreprises et organisations publiques
      d'expérimenter sans crainte d'atteintes aux règles juridiques existantes.
      Elle s'inscrit ainsi dans une philosophie distincte de l'approche
      régulatoire préalable fondée sur l'évaluation ex ante des risques et
      l'auto-gouvernance des acteurs. Dès lors, le règlement européen
      illustre-t-il un tournant régulatoire dans le droit du numérique ou
      s'agit-il d'un épiphénomène ? S'appuyant sur les études sur la
      régulation et à l'aune d'une analyse documentaire regroupant les
      réglementations et politiques européennes en matière d'innovation et
      leur mise en œuvre, l'intervention a pour objet de présenter et discuter
      l'émergence des bacs-à-sables dans le champ de la régulation des
      technologies et d'explorer leurs finalités et caractéristiques. `}
    />,
    kind: Law,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2025.0, ~month=9.0, ~date=13.0, ())),
    title: <Lang.String
      english="What does economization refer to?"
      french={`De quoi l'économicisation est-elle le nom ?`}
    />,
    presenter: "Pierre Alayrac",
    presenter_page_url: "https://www.cresppa.cnrs.fr/csu/equipe/les-membres-du-csu/alayrac-pierre/",
    abstract: <Lang.String
      english={`Law and Economics are intertwined in government practices.
      They have become indispensable tools, established methods for shaping
      public policy. However, economists and lawyers can produce contrasting
      bureaucratic rationales. I will return to these contrasts,
       their articulation and their confrontation, based on two examples
       from the European Union's public action: competition policy and environmental policy.`}
      french={`Le droit et l'économie s'entremêlent dans les pratiques de gouvernement.
      Ils en sont devenus des instruments indispensables, des modes institués de mise
      en forme de l'action publique. Pourtant, économistes et juristes peuvent
      produire des rationalités bureaucratiques contrastées. Je reviendrai
      sur ces contrastes, leur articulation et leur affrontement, à partir
      de deux exemples issus de l'action publique de l'Union européenne :
       politique de concurrence et la politique environnementale.`}
    />,
    kind: Sociology,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2025.0, ~month=10.0, ~date=24.0, ())),
    title: <Lang.String
      english="Regulatory monocultures in artificial intelligence law?"
      french={`Une monoculture réglementaire dans le droit de l'intelligence articielle ?`}
    />,
    presenter: "Marco Almada",
    presenter_page_url: "https://www.marcoalmada.com/",
    abstract: <Lang.String
      english={`As policymakers around the world try to deal with the challenges of AI,
      there is a growing concern about regulatory fragmentation. The EU is currently
      trying to avoid divergence in AI laws by promoting its AI Act as a global standard,
      but early signs suggest that the expected "Brussels Effect" is unlikely to manifest.
      Still, I argue in this paper that the various laws on AI being adopted around
      the world tend to build on common concepts. After outlining what are the elements
      shared between laws that regulate AI in very different ways, I examine the pros
      and cons of that conceptual alignment. The emergence of regulatory monocultures
      is not enough to ensure regulatory interoperability, and it may create problems
      of its own. Nonetheless, monoculture is not an inevitable development, and regulators,
      policymakers, and developers may all adopt measures to mitigate its potential
      adverse effects.`}
      french={`Alors que les décideurs politiques du monde entier tentent de
      relever les défis posés par l'IA, la fragmentation réglementaire suscite
      de plus en plus d'inquiétudes. L'UE s'efforce actuellement d'éviter les
      divergences entre les législations relatives à l'IA en promouvant sa loi
      sur l'IA comme norme mondiale, mais les premiers signes indiquent que
      l'« effet Bruxelles » escompté a peu de chances de se manifester. Je
      soutiens néanmoins dans cet article que les différentes législations
      relatives à l'IA adoptées à travers le monde tendent à s'appuyer sur
      des concepts communs. Après avoir décrit les éléments communs aux lois
      qui réglementent l'IA de manière très différente, j'examine les avantages
      et les inconvénients de cet alignement conceptuel. L'émergence de
      monocultures réglementaires ne suffit pas à garantir l'interopérabilité
      réglementaire et peut créer des problèmes supplémentaires.
      Néanmoins, la monoculture n'est pas une évolution inévitable, et les
      régulateurs, les décideurs politiques et les développeurs peuvent tous
      adopter des mesures pour atténuer ses effets négatifs potentiels.`}
    />,
    kind: Law,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2025.0, ~month=11.0, ~date=8.0, ())),
    title: <Lang.String
      english="How Public-Sector Open Source Actually Wins: A Field Guide to Real-World Adoption"
      french={`Comment l'open source du secteur public réussit réellement : guide pratique pour une adoption à grande échelle`}
    />,
    presenter: "Joseph Garrone",
    presenter_page_url: "https://www.linkedin.com/in/joseph-garrone-0b583490/",
    abstract: <>
      <Lang.String
        english={`Most open-source projects fail not because they lack innovation,
        but because they fail to communicate value, integrate smoothly, or earn
        trust. Drawing from the experience of building `}
        french={`La plupart des projets open source échouent non pas par manque
        d'innovation, mais parce qu'ils n'arrivent pas à communiquer clairement
        leur valeur, à s'intégrer sans friction ou à instaurer la confiance.
        En m'appuyant sur l'expérience acquise avec `}
      />
      <Link.Text target="https://www.onyxia.sh/">
        <Lang.String english={`Onyxia`} french={`Onyxia`} />
      </Link.Text>
      <Lang.String
        english={` and industry-adopted libraries like `}
        french={` et des bibliothèques largement adoptées comme `}
      />
      <Link.Text target="https://github.com/keycloakify/keycloakify">
        <Lang.String english={`Keycloakify`} french={`Keycloakify`} />
      </Link.Text>
      <Lang.String english={` or more anecdotally `} french={`, ou plus anecdotiquement `} />
      <Link.Text target="https://github.com/codegouvfr/react-dsfr">
        <Lang.String english={`react-dsfr`} french={`react-dsfr`} />
      </Link.Text>
      <Lang.String
        english={`, this talk breaks down what actually makes public-sector
        open source succeed in the real world. We'll cover:
        how to craft a value proposition that speaks to the target audience,
        how to remove barriers to adoption while staying standards-based,
        how to build trust by fixing fast rather than never failing,
        how to design documentation around user questions rather than code structure, and
        why modern presentation (UX, landing pages, storytelling) has measurable impact on adoption.`}
        french={`, cette présentation analyse ce qui permet réellement à l'open source
        du secteur public de réussir dans le monde réel. Nous aborderons :
        comment formuler une proposition de valeur qui parle immédiatement à votre audience cible,
        comment supprimer les barrières à l'adoption tout en restant fidèle aux standards ouverts,
        comment instaurer la confiance en corrigeant rapidement plutôt qu'en cherchant à ne jamais échouer,
        comment structurer une documentation autour des questions des utilisateurs plutôt que de l'architecture du code,
        et pourquoi une présentation moderne (UX, landing pages, storytelling) a un impact mesurable sur l'adoption.`}
      />
      <Lang.String
        english="
      This talk is not theory: it's hard-earned, field-tested guidance on
      building open source that organizations want to bet on, even at
      large scale."
        french={`Cette intervention n'est pas théorique : c'est un retour
        d'expérience concret, forgé sur le terrain, sur la manière de
        construire de l'open source que les organisations sont prêtes à
        adopter, y compris à grande échelle.`}
      />
    </>,
    kind: ComputerScience,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2026.0, ~month=0.0, ~date=12.0, ())),
    title: <Lang.String
      english="The University, from yesterday to today"
      french={`Université d'hier et d'aujourd'hui`}
    />,
    presenter: "Christine Musselin",
    presenter_page_url: "https://www.sciencespo.fr/cso/fr/annuaire/musselin-christine/",
    abstract: <Lang.String
      english={`The aim is to draw on a long-term historical perspective to
      trace the relationship between universities and public authorities in
      France and analyze the transformation of higher education management
      methods. In doing so, the evolution of the missions of universities
      and the idea of the university will also be addressed.`}
      french={`Il s'agit de mobiliser une perspective historique de longue durée
      pour retracer les des relations entre les universités et les autorités
      publiques en France et d'analyser la transformation des modes de pilotage
      de l'enseignement supérieur. Ce faisant, c'est aussi l'évolution des
      missions des universités et de l'idée d'université qui sera abordée.`}
    />,
    kind: Sociology,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2026.0, ~month=1.0, ~date=23.0, ())),
    title: <Lang.String
      english="Researchers and public policy: the example of Parcoursup"
      french={`Chercheurs et politique publique: l’exemple de Parcoursup`}
    />,
    presenter: "Claire Mathieu",
    presenter_page_url: "https://www.irif.fr/users/claire/index",
    abstract: <Lang.String
      english={`How can researchers and professors can interven in public policies ?
      In this talk, I will present a concrete example: the work done with Hugo
      Gimbert as CNRS researchers. We were tasked with helping to deploy
      the Parcoursup platform on algorithmic and modelling aspects.`}
      french={`Quel rôle les chercheurs et enseignants-chercheurs peuvent-ils
      jouer dans les politiques publiques ? Dans cet exposé je présenterai un
      exemple concret, celui du travail qu’avec Hugo Gimbert, nous avons fait
      en tant que chercheurs CNRS chargés de mission, participant à la mise
      en place de la plateforme Parcoursup dans les aspects d’algorithmique
      et de modélisation.`}
    />,
    kind: ComputerScience,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2026.0, ~month=2.0, ~date=30.0, ())),
    title: <Lang.String
      english="Logic, causation and performative effect"
      french={`Logique, causalité et effet performatif`}
    />,
    presenter: "Mireille Hildebrandt",
    presenter_page_url: "https://lsts.research.vub.be/mireille-hildebrandt",
    abstract: <Lang.String
      english={`I will discuss the differences between three types of
      relationships between natural language, and action on the one hand and
      programming languages on the other hand. In law, what matters is legal
      effect, which is a performative effect, whereas in programming languages
      logic prevails. One of the interesting questions is under what conditions
      legal effect can be attributed to the output of executable code.
      How should executable code be situated in the context of the Rule of Law?
      Is deployment a matter of tradeoffs, alignment, balancing or enhancement
      of the Rule of Law? Depending on this: what requirements should be met
      (e.g. types of programming: logic, domain-specific languages, generative
      AI and security: attack modelling, data protection issues, debugging) ?
      The answers to these questions must be found at two levels: (1) the
      conceptual level, where logic, causation and performative effects
      must be distinguished and (2) the empirical level, where the implications
      of the use of executable code for the law’s legal effect must be tested`}
      french={`Je vais présenter les différences de trois types de relations entre
      le langage naturel et l'action d'une part, et le langages de programmation
      d'une autre part. En droit, l'important est l'effet juridique, qui est
      un effet performatif, alors que dans les langages de programmation la logique
      seule règne. Une des questions intéressantes concerne alors les conditions
      dans lesquelles l'effet juridique peut être attribué au résultat de
      l'exécution d'un code source. Comment positionner l'exécution d'un code
      informatique dans le contexte de l'état de droit ? En fonction de ce
      positionnement: quel pré-requis faut-il prévoir (types de programmation :
      logique,  langages dédiés, IA générative, et sécurité : modélisation des
      attaques, problèmes de protection des données, débugging) ? Les réponses
      à ces querstions se situeront à deux niveaux : (1) au niveau conceptuel où
      il conviendra de distinguer la logique, la causalité et les effets performatifs,
      et (2) au niveau empirique, où les implications et l'utilisation du code
      exécutable pour produire des effets juridiques doivent être testés.`}
    />,
    kind: Law,
  },
]

let upcoming = Belt.List.toArray(
  Belt.List.sort(
    Belt.List.fromArray(
      Belt.Array.keep(seminars, seminar =>
        seminar.date >= Js.Date.make() ||
          (seminar.date < Js.Date.make() &&
          Js.Date.getDate(seminar.date) == Js.Date.getDate(Js.Date.make()) &&
          Js.Date.getMonth(seminar.date) == Js.Date.getMonth(Js.Date.make()) &&
          Js.Date.getFullYear(seminar.date) == Js.Date.getFullYear(Js.Date.make()))
      ),
    ),
    (x, y) => compare(x.date, y.date),
  ),
)
let season_2025_2026 = Belt.List.toArray(
  Belt.List.sort(
    Belt.List.fromArray(
      Belt.Array.keep(seminars, seminar => {
        seminar.date < Js.Date.make() &&
        seminar.date >
        Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2025.0, ~month=7.0, ~date=30.0, ())) &&
        seminar.date <
        Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2026.0, ~month=7.0, ~date=30.0, ()))
      }),
    ),
    (x, y) => compare(y.date, x.date),
  ),
)

let season_2024_2025 = Belt.List.toArray(
  Belt.List.sort(
    Belt.List.fromArray(
      Belt.Array.keep(seminars, seminar => {
        seminar.date >
        Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2024.0, ~month=7.0, ~date=30.0, ())) &&
          seminar.date <
          Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2025.0, ~month=7.0, ~date=30.0, ()))
      }),
    ),
    (x, y) => compare(y.date, x.date),
  ),
)
let season_2023_2024 = Belt.List.toArray(
  Belt.List.sort(
    Belt.List.fromArray(
      Belt.Array.keep(seminars, seminar => {
        seminar.date >
        Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2023.0, ~month=0.0, ~date=30.0, ())) &&
          seminar.date <
          Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2024.0, ~month=7.0, ~date=30.0, ()))
      }),
    ),
    (x, y) => compare(y.date, x.date),
  ),
)

@react.component
let make = () => {
  let (lang, _) = React.useContext(Lang.langContext)
  let locale = switch lang {
  | Lang.French => "fr-FR"
  | Lang.English => "en-US"
  }
  <>
    <section className="my-16 px-4 md:px-8">
      <Title>
        <Lang.String english="Seminars" french={`Séminaires`} />
      </Title>
    </section>
    <div className="py-8 px-4 md:px-8 bg-primary_light/5 border-y border-border font-serif text-lg">
      <p className="mx-auto ">
        <Lang.String
          english="The project continues to maintain close ties with the \
          academic research community. As such, the Catala team hosts seminars"
          french={`Le projet continue à maintenir des liens étroits avec la \
          communauté de la recherche académique. Ainsi, l'équipe Catala organise des séminaires au centre de \
          recherche de l'`}
        />
        <TextHighlight>
          <Lang.String
            english="at the Inria Paris research center one Monday per month, from 17:00 to 18:30."
            french={`Inria à Paris un lundi par mois de 17:00 à 18:30.`}
          />
        </TextHighlight>
        <Lang.String
          english="The sessions \
          alternate between Computer Science, Law and Sociology presentations \
          about stakes and problems of translating law to code."
          french={`Les séances alternent des exposés d'informatique, de droit et de \
          sociologie portant sur les enjeux et les problèmes posés par la \
          traduction du droit en code.`}
        />
      </p>
      // <p className="!my-0  mx-auto ">
      //   <Lang.String
      //     english=""
      //     french={``}
      //   />
      // </p>
    </div>
    <div className="my-16 px-4 md:px-8 sm:text-center mx-auto">
      <p className="italic text-base mx-auto">
        <Lang.String
          english="The location \
          of the Inria Paris research center is: 48 rue Barrault, 75013 Paris. Please arrive
          5 minutes early to leave to ID card at the front desk, before proceeding to the seminar room."
          french={`L'adresse du centre de recherche \
          Inria de Paris est : 48 rue Barrault, 75013 Paris. Veuillez arriver 5 minutes en avance
          pour laisser votre carte d'identité à l'accueil, avant d'entrer dans la salle du séminaire.`}
        />
      </p>
      <div className="mt-4">
        <Link.Button.Primary target={"https://sympa.inria.fr/sympa/subscribe/seminaire-catala"}>
          <Lang.String
            english="Subscribe to the seminar mailing list"
            french={`S'incrire à la newsletter du séminaire`}
          />
        </Link.Button.Primary>
      </div>
    </div>
    <section
      id="upcoming" className="mb-16 px-4 md:px-8 border-y border-border py-16 bg-primary_light/5">
      <h2>
        <a href={"#upcoming"}>
          <Lang.String english="Upcoming seminars" french={`Séminaires à venir`} />
        </a>
      </h2>
      {if Belt.Array.length(upcoming) == 0 {
        <Lang.String
          english="No upcoming seminar planned yet, stay tuned!"
          french={`Les prochains séminaires ne sont pas encore planifiés, n'hésitez pas à revenir plus tard !`}
        />
      } else {
        <> </>
      }}
      <ul className="bg-white border border-border">
        {upcoming
        ->Belt.Array.mapWithIndex((i, item) =>
          <Seminar key={"upcoming-seminar-item-" ++ i->string_of_int} seminar=item locale />
        )
        ->React.array}
      </ul>
    </section>
    <Section
      id="organizers" title={<Lang.String english="Organizers" french={`Organisateur·ices`} />}>
      <PersonTable persons=[marieAlauzen, lianeHuttner, denisMerigoux] className="mb-8" />
    </Section>
    {if Belt.Array.length(season_2025_2026) != 0 {
      <section
        id="past" className="my-16 px-4 md:px-8 border-y border-border py-16 bg-primary_light/5">
        <h2>
          <a href={"#past"}>
            <Lang.String english="Season 2025-2026" french={`Saison 2025-2026`} />
          </a>
        </h2>
        <ul className="bg-white border border-border">
          {season_2025_2026
          ->Belt.Array.mapWithIndex((i, item) =>
            <Seminar key={"season25-26-seminar-item-" ++ i->string_of_int} seminar=item locale />
          )
          ->React.array}
        </ul>
      </section>
    } else {
      <> </>
    }}
    <section
      id="past-2024-2025"
      className="my-16 px-4 md:px-8 border-y border-border py-16 bg-primary_light/5">
      <h2>
        <a href={"#past-2024-2025"}>
          <Lang.String english="Season 2024-2025" french={`Saison 2024-2025`} />
        </a>
      </h2>
      <ul className="bg-white border border-border">
        {season_2024_2025
        ->Belt.Array.mapWithIndex((i, item) =>
          <Seminar key={"season24-25-seminar-item-" ++ i->string_of_int} seminar=item locale />
        )
        ->React.array}
      </ul>
    </section>
    <section id="#past-2023-2024" className="mt-16 px-4 md:px-8">
      <h2>
        <a href={"#past-2023-2024"}>
          <Lang.String english="Season 2023-2024" french={`Saison 2023-2024`} />
        </a>
      </h2>
      <ul className="bg-white border border-border">
        {season_2023_2024
        ->Belt.Array.mapWithIndex((i, item) =>
          <Seminar key={"season23-24-seminar-item-" ++ i->string_of_int} seminar=item locale />
        )
        ->React.array}
      </ul>
    </section>
  </>
}
