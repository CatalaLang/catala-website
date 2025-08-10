type affiliation = {
  name: string,
  url: string,
}

type person = {
  name: string,
  website: option<string>,
  affiliation: affiliation,
  role: React.element,
}

let denisMerigoux = {
  name: "Denis Merigoux",
  website: Some("https://merigoux.fr"),
  affiliation: {
    name: "Inria - Apollo",
    url: "https://apollo.inria.fr",
  },
  role: <Lang.String
    english="Co-designer, PhD in formal methods and project leader"
    french={`Co-créateur, docteur en méthodes formelles et chef de projet`}
  />,
}

let marieAlauzen = {
  name: "Marie Alauzen",
  website: Some("https://cv.archives-ouvertes.fr/marie-alauzen"),
  affiliation: {
    name: "CNRS, LAMSADE",
    url: "https://www.lamsade.dauphine.fr/fr.html",
  },
  role: <Lang.String
    english="Researcher at the crossroads of STS and Sociology of the State"
    french={`Chercheuse au carrefour des STS et de la sociologie de l'État`}
  />,
}

let vincentBotbol = {
  name: "Vincent Botbol",
  website: Some("https://www.linkedin.com/in/vincent-botbol-24355728b/"),
  affiliation: {
    name: "Inria - Apollo",
    url: "https://apollo.inria.fr",
  },
  role: <Lang.String
    english="Software engineer, developer experience manager"
    french={`Ingénieur logiciel, responsable de l'expérience développeurs`}
  />,
}

let estelleHary = {
  name: "Estelle Hary",
  website: Some("https://www.linkedin.com/in/estelle-hary"),
  affiliation: {
    name: "Inria - Apollo",
    url: "https://apollo.inria.fr",
  },
  role: <Lang.String
    english="Designer, specialized in digital transformation of public institutions"
    french={`Designeure, spécialisée dans la transformation digitale des institutions publiques`}
  />,
}

let lilyaSlimani = {
  name: "Lilya Slimani",
  website: Some("https://www.linkedin.com/in/wouroud-slimani-003621183/"),
  affiliation: {
    name: "EFB",
    url: "http://www.efb.fr/EC_presentation.html",
  },
  role: <Lang.String
    english="Lawyer intern, participated in the French housing benefits programming"
    french={`Stagiaire-avocate, a participé à la programmation des aides au logement`}
  />,
}

let christopheGaie = {
  name: "Christophe Gaie",
  website: Some("https://gaie.webnode.page/"),
  affiliation: {
    name: `DINUM`,
    url: "https://www.numerique.gouv.fr/dinum/",
  },
  role: <> </>,
}

let nicolasChataing = {
  name: "Nicolas Chataing",
  website: Some("https://github.com/skodt"),
  affiliation: {
    name: "ENS Paris",
    url: "https://www.ens.psl.eu/departement/departement-d-informatique",
  },
  role: <Lang.String
    english="Research intern, participated in formalizing the semantics of Catala"
    french={`Stagiaire de recherche, a participé à la formalisation de la sémantique de Catala`}
  />,
}

let alainDelaet = {
  name: `Alain Delaët-Tixeuil`,
  website: Some("https://perso.ens-lyon.fr/alain.delaet-tixeuil/"),
  affiliation: {
    name: "Inria - Prosecco",
    url: "https://team.inria.fr/prosecco/",
  },
  role: <Lang.String
    english="PhD student, participates in formalizing the semantics of Catala"
    french={`Doctorant, participe à la formalisation de la sémantique de Catala`}
  />,
}

let aymericFromherz = {
  name: `Aymeric Fromherz`,
  website: Some("https://users.ece.cmu.edu/~afromher/"),
  affiliation: {
    name: "Inria - Prosecco",
    url: "https://team.inria.fr/prosecco/",
  },
  role: <Lang.String
    english="Researcher, specialized in formal methods and automated verification"
    french={`Chercheur, spécialisé en méthodes formelles en en vérification automatisée`}
  />,
}

let raphaelMonat = {
  name: `Raphaël Monat`,
  website: Some("https://rmonat.fr/"),
  affiliation: {
    name: "Inria Lille - SyCoMoRES",
    url: "https://team.inria.fr/sycomores/",
  },
  role: <Lang.String
    english="Researcher, specialized in formal methods and automated verification"
    french={`Chercheur, spécialisé en méthodes formelles en en vérification automatisée`}
  />,
}

let sarahLawsky = {
  name: "Sarah Lawsky",
  website: Some("https://law.illinois.edu/faculty-research/faculty-profiles/sarah-b-lawsky/"),
  affiliation: {
    name: "University of Illinois Urbana-Champaign",
    url: "https://law.illinois.edu",
  },
  role: <Lang.String
    english="Tax law professor and PhD in Logic, inspiration of the project and close advisor"
    french={`Professeure de droit fiscal et docteure en logique, inspiration du projet et proche conseillère`}
  />,
}

let jonathanProtzenko = {
  name: "Jonathan Protzenko",
  website: Some("https://jonathan.protzenko.fr"),
  affiliation: {
    name: "Microsoft Research RiSE",
    url: "https://www.microsoft.com/en-us/research/group/research-software-engineering-rise/",
  },
  role: <Lang.String
    english="Researcher, specialized in formal methods, participated in formalizing the Catala semantics"
    french={`Chercheur, spécialisé en méthodes formelles, a participé à la formalisation de la sémantique de Catala`}
  />,
}

let lianeHuttner = {
  name: "Liane Huttner",
  website: Some("https://univ-droit.fr/universitaires/48558-liane-huttner"),
  affiliation: {
    name: `Université Paris-Saclay`,
    url: "https://www.jm.universite-paris-saclay.fr/",
  },
  role: <Lang.String
    english="Co-creator and assistant professor in Digital Law, specialized in automated decision-making"
    french={`Co-créatrice et maîtresse de conférence en droit du numérique, spécialiste de la décision automatisée`}
  />,
}

let louisGesbert = {
  name: "Louis Gesbert",
  website: Some("https://github.com/AltGr"),
  affiliation: {
    name: "Inria - Apollo",
    url: "https://apollo.inria.fr",
  },
  role: <Lang.String
    english="Software engineer, compiler maintenance manager"
    french={`Ingénieur logiciel, responsable de la maintenance du compilateur`}
  />,
}

let romainPrimet = {
  name: "Romain Primet",
  website: Some("https://www.linkedin.com/in/romain-primet-229b80b9"),
  affiliation: {
    name: "Inria - Apollo",
    url: "https://apollo.inria.fr",
  },
  role: <Lang.String
    english="Software engineer, user experience manager"
    french={`Ingénieur logiciel, responsable de l'expérience utilisateur`}
  />,
}

let emileRolley = {
  name: `Émile Rolley`,
  website: Some("https://emile-rolley.com"),
  affiliation: {
    name: "Malt",
    url: "https://www.malt.fr/profile/emilerolley",
  },
  role: <Lang.String
    english="Software engineer, participated in the development of the explanation generation engine and its various interfaces"
    french={`Ingénieur logiciel, a participé développement du moteur de génération d'explications ainsi que de ses différentes interfaces`}
  />,
}

let justineBanuls = {
  name: `Justine Banuls`,
  website: Some("https://www.linkedin.com/in/justine-banuls-getintouch/"),
  affiliation: {
    name: "EFB",
    url: "http://www.efb.fr/EC_presentation.html",
  },
  role: <Lang.String
    english="Lawyer intern, participated in the French housing benefits programming"
    french={`Stagiaire-avocates, a participé à la programmation des aides au logement`}
  />,
}

let carolineFlori = {
  name: `Caroline Flori`,
  website: Some("https://www.linkedin.com/in/caroline-flori-2459b919b"),
  affiliation: {
    name: "DGFiP",
    url: "https://www.economie.gouv.fr/dgfip",
  },
  role: <Lang.String
    english="Tax inspector, participated in the French income tax programming"
    french={`Inspectrice des finances publiques, a participé à la programmation de l'impôt sur le revenu`}
  />,
}

let pierreGoutagny = {
  name: `Pierre Goutagny`,
  website: Some("https://pierregoutagny.fr/"),
  affiliation: {
    name: "Inria - SyCoMoRES",
    url: "https://team.inria.fr/sycomores/",
  },
  role: <Lang.String
    english="PhD student, participates in the development of automated verification tools for Catala"
    french={`Doctorant, participe au développement d'outils de vérification automatique pour Catala`}
  />,
}
