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
    title: <Lang.String english="Title to be determined" french={`Titre à venir`} />,
    presenter: "Georges-André Silber",
    presenter_page_url: "https://www.cri.ensmp.fr/~silber/",
    abstract: <Lang.String english="Abstract to come." french={`Résumé à venir.`} />,
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
          english="The Catala team hosts seminars at the Inria Paris research center one Monday per month, from 17:00 to 18:30. The sessions alternate between computer science, law and sociology presentations about stakes and problems of translating law to code. The seminar happens in room Gilles Kahn on the ground floor of the Inria Paris building located at 2 rue Simone Iff 75012."
          french={`L'équipe Catala organise des séminaires au centre de recherche de l'Inria à  Paris un lundi par mois de 17:00 à 18:30. Les séances alternent des exposés d'informatique, de droit et de sociologie portant sur les enjeux et les problèmes posés par la traduction du droit en code. Le séminaire se tient dans la salle Gilles Kahn au rez-de-chaussée du bâtiment de l'Inria Paris situé au 2 rue Simone Iff 75012.`}
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
