type affiliation = {
  name: string,
  url: string,
}

type person = {
  name: string,
  website: option<string>,
  affiliation: affiliation,
}

let denisMerigoux = {
  name: "Denis Merigoux",
  website: Some("https://merigoux.fr"),
  affiliation: {
    name: "Inria - Apollo",
    url: "https://apollo.inria.fr",
  },
}

let marieAlauzen = {
  name: "Marie Alauzen",
  website: Some("https://cv.archives-ouvertes.fr/marie-alauzen"),
  affiliation: {
    name: "CNRS, LAMSADE",
    url: "https://www.lamsade.dauphine.fr/fr.html",
  },
}

let vincentBotbol = {
  name: "Vincent Botbol",
  website: Some("https://www.linkedin.com/in/vincent-botbol-24355728b/"),
  affiliation: {
    name: "Inria - Apollo",
    url: "https://apollo.inria.fr",
  },
}

let estelleHary = {
  name: "Estelle Hary",
  website: Some("https://www.linkedin.com/in/estelle-hary"),
  affiliation: {
    name: "Inria - Apollo",
    url: "https://apollo.inria.fr",
  },
}

let lilyaSlimani = {
  name: "Lilya Slimani",
  website: Some("https://www.linkedin.com/in/wouroud-slimani-003621183/"),
  affiliation: {
    name: "EFB",
    url: "http://www.efb.fr/EC_presentation.html",
  },
}

let nicolasChataing = {
  name: "Nicolas Chataing",
  website: Some("https://github.com/skodt"),
  affiliation: {
    name: "ENS Paris",
    url: "https://www.ens.psl.eu/departement/departement-d-informatique",
  },
}

let alainDelaet = {
  name: `Alain Delaët-Tixeuil`,
  website: Some("https://perso.ens-lyon.fr/alain.delaet-tixeuil/"),
  affiliation: {
    name: "Inria - Prosecco",
    url: "https://team.inria.fr/prosecco/",
  },
}

let aymericFromherz = {
  name: `Aymeric Fromherz`,
  website: Some("https://users.ece.cmu.edu/~afromher/"),
  affiliation: {
    name: "Inria - Prosecco",
    url: "https://team.inria.fr/prosecco/",
  },
}

let raphaelMonat = {
  name: `Raphaël Monat`,
  website: Some("https://rmonat.fr/"),
  affiliation: {
    name: "Inria Lille - SyCoMoRES",
    url: "https://team.inria.fr/sycomores/",
  },
}

let sarahLawsky = {
  name: "Sarah Lawsky",
  website: Some("https://www.sarahlawsky.org/"),
  affiliation: {
    name: "University of Illinois Urbana-Champaign",
    url: "https://law.illinois.edu/sarah laws",
  },
}

let jonathanProtzenko = {
  name: "Jonathan Protzenko",
  website: Some("https://jonathan.protzenko.fr"),
  affiliation: {
    name: "Microsoft Research RiSE",
    url: "https://www.microsoft.com/en-us/research/group/research-software-engineering-rise/",
  },
}

let lianeHuttner = {
  name: "Liane Huttner",
  website: Some("https://univ-droit.fr/universitaires/48558-liane-huttner"),
  affiliation: {
    name: `Université Paris-Saclay`,
    url: "https://www.jm.universite-paris-saclay.fr/",
  },
}

let christopheGaie = {
  name: "Christophe Gaie",
  website: Some("https://gaie.webnode.page/"),
  affiliation: {
    name: `DINUM`,
    url: "https://www.numerique.gouv.fr/dinum/",
  },
}

let louisGesbert = {
  name: "Louis Gesbert",
  website: Some("https://github.com/AltGr"),
  affiliation: {
    name: "Inria - Apollo",
    url: "https://apollo.inria.fr",
  },
}

let romainPrimet = {
  name: "Romain Primet",
  website: Some("https://www.linkedin.com/in/romain-primet-229b80b9"),
  affiliation: {
    name: "Inria - Apollo",
    url: "https://apollo.inria.fr",
  },
}

let emileRolley = {
  name: `Émile Rolley`,
  website: Some("https://emile-rolley.com"),
  affiliation: {
    name: "Malt",
    url: "https://www.malt.fr/profile/emilerolley",
  },
}

let justineBanuls = {
  name: `Justine Banuls`,
  website: Some("https://www.linkedin.com/in/justine-banuls-getintouch/"),
  affiliation: {
    name: "EFB",
    url: "http://www.efb.fr/EC_presentation.html",
  },
}

let carolineFlori = {
  name: `Caroline Flori`,
  website: Some("https://www.linkedin.com/in/caroline-flori-2459b919b"),
  affiliation: {
    name: "DGFiP",
    url: "https://www.economie.gouv.fr/dgfip",
  },
}

let pierreGoutagny = {
  name: `Pierre Goutagny`,
  website: Some("https://pierregoutagny.fr/"),
  affiliation: {
    name: "Inria - SyCoMoRES",
    url: "https://team.inria.fr/sycomores/",
  },
}
