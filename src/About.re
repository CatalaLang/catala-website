let url = "about";

type person = {
  name: string,
  website: option(string),
  affiliation: React.element,
};

let denis_merigoux = {
  name: "Denis Merigoux",
  website: Some("https://merigoux.fr"),
  affiliation: <Utils.TextLink target="https://prosecco.gforge.inria.fr" text="Inria Prosecco" />,
};

let nicolas_chataing = {
  name: "Nicolas Chataing",
  website: Some("https://github.com/skodt"),
  affiliation:
    <Utils.TextLink
      target="https://www.ens.psl.eu/departement/departement-d-informatique"
      text={js|École Normale Supérieure|js}
    />,
};

let sarah_lawsky = {
  name: "Sarah Lawsky",
  website: Some("http://www.law.northwestern.edu/faculty/profiles/SarahLawsky/"),
  affiliation:
    <Utils.TextLink
      target="www.law.northwestern.edu/"
      text="Northwestern Pritzker School of Law"
    />,
};

let jonathan_protzenko = {
  name: "Jonathan Protzenko",
  website: Some("https://jonathan.protzenko.fr"),
  affiliation:
    <Utils.TextLink
      target="https://www.microsoft.com/en-us/research/group/research-software-engineering-rise/"
      text="Microsoft Research RiSE"
    />,
};

let liane_huttner = {
  name: "Liane Huttner",
  website:
    Some(
      "https://www.pantheonsorbonne.fr/recherche/page-perso/page/?tx_oxcspagepersonnel_pi1[uid]=lhuttner",
    ),
  affiliation:
    <Utils.TextLink
      target="https://www.pantheonsorbonne.fr/accueil"
      text={js|Université Panthéon-Sorbonne|js}
    />,
};

module Person = {
  [@react.component]
  let make = (~person: person) => {
    <li className=[%tw "pl-6 pb-4"]>
      {switch (person.website) {
       | None => person.name |> React.string
       | Some(website) => <Utils.TextLink target=website text={person.name} />
       }}
      <span className=[%tw "pl-2"]>
        {"(" |> React.string}
        {person.affiliation}
        {")" |> React.string}
      </span>
    </li>;
  };
};

[@react.component]
let make = () => {
  <>
    <Utils.PageTitle title="About" />
    <Utils.PageSection title="Policy-maker oriented description">
      <p>
        {"In 2019, the French National Research Institute for Computer Science (Inria) has initiated an
      initiative focused on developing a new coding language for rules as code: Catala. The language is based on
      the field of formal methods, which are used in safety-critical domains like avionics or nuclear power
      plants to ensure that software behaves as expected, given a precise and unambiguous description of
      the expected behavior. Led by Denis Merigoux from the "
         |> React.string}
        <Utils.TextLink text="Inria Prosecco group" target="https://prosecco.gforge.inria.fr/" />
        {{js| , in collaboration with academics from the Paris Panthéon-Sorbonne
       University and the Northwestern Pritzker School of Law, Catala is designed to achieve semantic
       equivalence with the law itself (its fundamental source of truth).|js}
         |> React.string}
      </p>
      <p>
        {"Catala is unique because of its use of a style called literate programming, which sees each line of
        a legislative style text annotated with a snippet of code. This is of obvious benefit because it allows
        non-technical experts, such as policy makers and lawyers, to understand the representation of the code
        in relation to the legislation or rules. This allows Catala programmes to be easily verified and
        validated. Catala also comprises a compiler, which is a mechanism that allows for code to be
        translated into a range of programming languages, which improves interoperability. For example,
        the compiler can generate Javascript for web applications, SAS for economic models and COBOL for
        legacy environments. Crucially, the translated output will be guaranteed to behave in the same
        way as the original Catala programme. By using compilation, the code can be written once and be
        deployed everywhere; this avoids the need to manually write multiple versions of the code, which
        increases the chances of bugs. Catala remains an early stage project. In the future, the team is
        working on finalising the development of a compiler (e.g. for multiple languages including
        Javascript, Python, etc.) and implementing a large-size body of legislation to demonstrate the
        tool's utility."
         |> React.string}
      </p>
      <p className="float-right text-primary pt-4 italic">
        {"Credit: the Catala team and James Mohun from the OECD Public Sector Innovation Observatory (2020)"
         |> React.string}
      </p>
    </Utils.PageSection>
    <Utils.PageSection title="People">
      <ul className=[%tw "list-none"]>
        <Person person=denis_merigoux />
        <Person person=liane_huttner />
        <Person person=nicolas_chataing />
        <Person person=jonathan_protzenko />
        <Person person=sarah_lawsky />
      </ul>
    </Utils.PageSection>
  </>;
};
