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
    name: "Inria - Prosecco",
    url: "https://team.inria.fr/prosecco/",
  },
}

let marieAlauzen = {
  name: "Marie Alauzen",
  website: Some("https://cv.archives-ouvertes.fr/marie-alauzen"),
  affiliation: {
    name: "Centre Maurice Halbawchs - EHESS/ENS",
    url: "https://www.ehess.fr/fr/centre-maurice-halbwachs-cmh",
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
  website: None,
  affiliation: {
    name: "ENS Lyon",
    url: "http://informatique.ens-lyon.fr/",
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
    name: "LIP6 - APR",
    url: "https://www-apr.lip6.fr/web/doku.php",
  },
}

let sarahLawsky = {
  name: "Sarah Lawsky",
  website: Some("http://www.law.northwestern.edu/faculty/profiles/SarahLawsky/"),
  affiliation: {
    name: "Northwestern Pritzker School of Law",
    url: "http://www.law.northwestern.edu/",
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
  website: Some(
    "https://www.pantheonsorbonne.fr/recherche/page-perso/page/?tx_oxcspagepersonnel_pi1[uid]=lhuttner",
  ),
  affiliation: {
    name: `Université Panthéon-Sorbonne`,
    url: "https://www.pantheonsorbonne.fr/accueil",
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