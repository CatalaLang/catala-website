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
  let make = (~seminar: seminar) =>
    <li className=%twc("pl-6 pb-4")>
      <span className=%twc("italic")>
        {Js.Date.toISOString(seminar.date)->String.split("T")->Array.getUnsafe(0) |> React.string}
      </span>
      <span> {" — " |> React.string} </span>
      <span className=%twc("font-bold")>
        {switch seminar.kind {
        | Sociology => <Lang.String french={`Sociologie`} english="Sociology" />
        | Law => <Lang.String french={`Droit`} english="Law" />
        | ComputerScience => <Lang.String french={`Informatique`} english="Computer Science" />
        }}
      </span>
      <span> {" — " |> React.string} </span>
      <span>
        <Link.Text target=seminar.presenter_page_url> {React.string(seminar.presenter)} </Link.Text>
      </span>
      <span> {" — " |> React.string} </span>
      <span className=%twc("font-bold")> {seminar.title} </span>
      <span> {" — " |> React.string} </span>
      <span> {seminar.abstract} </span>
    </li>
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
      empiriques issus de travaux antérieurs sur l’administration sanitaire en \
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
      développement récent des technologies numériques a accéléré l’adoption \
      des systèmes de décisions fondés sur un traitement algorithmique. Des \
      travaux de recherche du champ de l'eXplainable Artififial Intelligence \
      (XAI) visent à garantir l’intelligibilité des algorithmes de décisions. \
      Dans ce contexte, nous proposons une méthode originale permettant aux \
      utilisateurs de systèmes algorithmiques d'en contester ou d'en justifier \
      les décisions. Une justification (respectivement une contestation) est un \
      argument, soutenu par une preuve, qu’une décision est bonne (respectivement \
      mauvaise) au sens d’un ensemble de normes extérieures prédéfinies. Un \
      dispositif technique, appelé Algocate, permet de rendre ces notions \
      opérationnelles pour trois types de normes (règles, objectifs et \
      référence) grâce à un système interactif permettant à l’utilisateur \
      d’exprimer son point de vue sur le bien-fondé de la décision. Ce type de \
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
    entre le Droit et l’informatique est analysée pour fournir des solutions \
    légales opérationnelles pour l'implémentation de systèmes algorithmiques \
    dans la décision publique.`}
    />,
    kind: Law,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2023.0, ~month=11.0, ~date=04.0, ())),
    title: <Lang.String
      english="\"Predictive justice\" and lawyers, a study of a contrasting experiment"
      french={`La « justice prédictive » au service des avocats : étude d’une expérimentation contrastée`}
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
    The judges’ reactions to the development of “predictive justice” softwares \
    have been documented, yet the use of these same softwares by lawyers and \
    legal experts has not been studied a lot for now, even though they are the \
    main users of these technologies. This communication aims at rectifying \
    the situation, by presenting the analysis of an experiment that was \
    conducted in a law school, which led future lawyers to use a “predictive \
    justice” tool. Based on qualitative methods (mainly observations and \
    interviews), the presentation focuses on the relation between lawyers \
    and “predictive justice” tools, and on how they insert the tools in \
    their practices."
      french={`L’application d’algorithmes et d’Intelligence Artificielle au \
    domaine de la justice est très discutée, et au cœur de nombreux débats. \
    Dans ce contexte, le terme de « justice prédictive » a fait son \
    apparition, pour désigner certains outils numériques permettant aux \
    professionnels du droit d’estimer les résultats probables d’une affaire \
    en fonction de ses caractéristiques (nature des faits, profil social des \
    parties, juridiction, etc). Ces outils sont relativement peu utilisés en \
    France par rapport à ce que l’on peut observer dans d’autres pays, mais \
    ils sont en plein essor, comme en témoignent par exemple la \
    multiplication des legaltechs (start-ups spécialisées dans le domaine \
    du droit) et le projet DataJust (projet public de conception d’un outil \
    d’aide à la décision pour les juges en matière de préjudices corporels, \
    dont l’élaboration a été interrompue suite à de nombreuses difficultés). \
    Si les réactions (majoritairement négatives) des magistrats à ces \
    technologies ont déjà fait l’objet de quelques articles fournis, leur \
    utilisation par les avocats et juristes reste peu documentée, alors même \
    qu’ils en sont les principaux usagers. Cette présentation ambitionne de \
    combler ce manque, en analysant une expérimentation menée dans une école \
    d’avocats, au cours de laquelle une solution de « justice prédictive » a \
    été présentée aux élèves et a fait l’objet d’un « challenge » obligatoire \
    pour tous. En se basant sur une étude qualitative par observations et \
    entretiens de cette expérimentation (depuis son organisation par le \
    personnel de l’école et la start-up ayant développé l’outil jusqu’au \
    challenge en lui-même et aux retours des élèves-avocats sur ce dernier), \
    elle interroge le rapport des avocats à ces solutions informatiques, ainsi \
    que la manière dont ces dernières s’insèrent dans leurs pratiques.`}
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
    très peu d’intérêt, voire aucun. C’est un objet réservé aux sciences
    économiques et juridiques qui, pour la majorité d’entre elles, s’en
    saisissent pour proposer des solutions afin de mieux écrire un marché
    public. Or, ces recherches réduisent la rédaction d'un marché à des choix
    logiques: des modifications de clauses, l’intégration de critère ou de
    choix de procédures.
    L’enquête ethnographique que j’ai menée au sein d’un conseil départemental
    montre que le processus de production d’un marché public est loin d’être aussi
    logique. Si c’était le cas, pourquoi cette collectivité s’est réorganisée
    quatre fois et a fait l’objet de trois audits ces dix dernières années,
    et ce, uniquement pour "améliorer" l’écriture de ses marchés ? Cette
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
      automatisés, bien plus qu’une loi sur les données personnelles : quand \
      écrira-t-on l’histoire de la loi du 6 janvier 1978 Informatique et \
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
      french={`La loi du 6 janvier 1978 relative à l’informatique aux fichiers \
      et aux libertés ambitionnait de prendre à bras-le-corps le problème de \
      « l’informatisation de la société » et de ses effets sur les libertés. \
      Ce n’est que par une étrange succession de déplacements qu’elle a été \
      ramenée à l’affaire Safari, enfermée dans le paradigme du respect de \
      la vie privée et, finalement, rétractée dans le seul « droit de la \
      protection des données personnelles ». Étonnamment, toute une part de \
      l’histoire de cette loi n'a pas été faite, et reste aujourd’hui à \
      écrire. Cela suppose, bien sûr, de réinscrire ce texte dans les grands \
      débats des années 1970 sur les libertés ; mais cela exige surtout de \
      reconstruire tous ces fils que les concepteurs de la loi de 1978 \
      avaient tissés, sur lesquels leurs successeurs, au Parlement, dans \
      les administrations, à la CNIL et ailleurs, n’ont pas beaucoup tiré \
      ensuite. Ma communication s’attachera donc, en repartant de plusieurs \
      fonds d'archives publiques librement communicables, à revenir sur la \
      genèse de la loi de 1978, pour rappeler que celle-ci n’était pas tant \
      une loi sur les « données personnelles » qu’elle n’était une loi sur \
      les « traitements automatisés » - et qu'on était, alors, plutôt \
      conscient de ce qui sépare l'une de l'autre.`}
    />,
    kind: Law,
  },
  {
    date: Js.Date.fromFloat(Js.Date.utcWithYMD(~year=2024.0, ~month=4.0, ~date=6.0, ())),
    title: <Lang.String
      english={`Assessing a person using an algorithm. A legal analysis of the concept of profiling.`}
      french={`Évaluer une personne avec un algorithme. Analyse juridique via la notion de « profilage ».`}
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
      sociétés occidentales sous l’appellation de « société de l’évaluation ». \
      Ce ne sont pas les exemples qui manquent et nous n’avons rien à envier \
      au développement d’un « crédit social » en Chine. Il suffit de constater \
      que pléthore de décisions affectant les individus sont aujourd’hui \
      conditionnées au résultat d’une (bonne) évaluation. Sans un bon score \
      de crédit, pas de crédit. Si la personne présente un mauvais risque, \
      par exemple à cause de sa santé, elle ne pourra être assurée ou alors \
      à une prime très élevé. Le recrutement est le fruit d’une décision, de \
      plus en plus médiée par des algorithmes de tri ou de reconnaissance \
      faciale permettant en un clin d’œil selon leur niveau de stress ou \
      leur employabilité prédite. Ces pratiques sont généralement le fruit \
      d’une analyse par algorithme que l’on appelle « profilage ». Toutefois, \
      la notion juridique de profilage répond-elle à sa description technique ? \
      À l’examen, on verra qu’elle excède largement celle-ci. De plus, la \
      notion semble enchevêtrée avec celle de décision automatisée. Le même \
      constat peut être dressé à l’égard de son régime, qui paraît peu \
      efficace si on le cantonne au droit des données à caractère personnel. \
      Il est donc nécessaire d’examiner d’autres secteurs du droit. Dans la \
      mesure où l’évaluation est un jugement de valeur, peut-on appliquer \
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
      jusqu’à nos jours. Je montrerai que les relations contractuelles, les \
      partenariats et les transactions entre universitaires, industriels, et \
      représentants de l’administration fédérale et de la défense ont été \
      structurés en partie par le développement de modes spécifiques de \
      régulation au sein d’un complexe militaro-industriel, par l’essor \
      d’un régime d’entreprenariat scientifique et par le déploiement de \
      modes d’interaction marqués en particulier par la réalisation de
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
    title: <Lang.String english={`Title to be determined`} french={`Titre à déterminer`} />,
    presenter: "Arnaud Latil",
    presenter_page_url: "https://univ-droit.fr/universitaires/24851-arnaud-latil",
    abstract: <Lang.String
      english="Abstract to be determined" french={`Résumé à déterminer`}
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
let past = Belt.List.toArray(
  Belt.List.sort(
    Belt.List.fromArray(Belt.Array.keep(seminars, seminar => seminar.date < Js.Date.make())),
    (x, y) => compare(y.date, x.date),
  ),
)

@react.component
let make = () => {
  <>
    <Title>
      <Lang.String english="Seminar" french={`Séminaire`} />
    </Title>
    <div className=%twc("flex flex-col justify-center items-center")>
      <p>
        <Lang.String
          english="The Catala team hosts seminars at the Inria Paris research \
          center one Monday per month, from 17:00 to 18:30. The sessions \
          alternate between computer science, law and sociology presentations \
          about stakes and problems of translating law to code. The location \
          of the Inria Paris research center is: 46 rue Barrault, 75013 Paris. "
          french={`L'équipe Catala organise des séminaires au centre de \
          recherche de l'Inria à  Paris un lundi par mois de 17:00 à 18:30. \
          Les séances alternent des exposés d'informatique, de droit et de \
          sociologie portant sur les enjeux et les problèmes posés par la \
          traduction du droit en code. L'adresse du centre de recherche \
          Inria de Paris est : 46 rue Barrault, 75013 Paris.`}
        />
      </p>
      <Link.Button target={"https://sympa.inria.fr/sympa/subscribe/seminaire-catala"}>
        <Lang.String
          english="Subscribe to the seminar mailing list"
          french={`S'incrire à la newsletter du séminaire`}
        />
      </Link.Button>
    </div>
    <Section title={<Lang.String english="Upcoming seminars" french={`Séminaires à venir`} />}>
      <ul className=%twc("list-disc list-inside")>
        {upcoming
        ->Belt.Array.mapWithIndex((i, item) =>
          <Seminar key={"upcoming-seminar-item-" ++ i->string_of_int} seminar=item />
        )
        ->React.array}
      </ul>
    </Section>
    <Section title={<Lang.String english="Past seminars" french={`Séminaires passés`} />}>
      <ul className=%twc("list-disc list-inside")>
        {past
        ->Belt.Array.mapWithIndex((i, item) =>
          <Seminar key={"past-seminar-item-" ++ i->string_of_int} seminar=item />
        )
        ->React.array}
      </ul>
    </Section>
    <Section title={<Lang.String english="Organizers" french={`Organisateurs`} />}>
      <ul className=%twc("list-disc list-inside")>
        <Person person=marieAlauzen />
        <Person person=lianeHuttner />
        <Person person=denisMerigoux />
      </ul>
    </Section>
  </>
}
