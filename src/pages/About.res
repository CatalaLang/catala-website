open PageComponents
open People

module Person = {
  @react.component
  let make = (~person: person) =>
    <tr scope="row" className="odd:bg-gray">
      <td className="px-2 py-2">
        {switch person.website {
        | None => person.name |> React.string
        | Some(website) => <Link.Text target=website> {React.string(person.name)} </Link.Text>
        }}
      </td>
      <td className="px-2 py-2">
        {"(" |> React.string}
        <Link.Text target=person.affiliation.url>
          {person.affiliation.name->React.string}
        </Link.Text>
        {React.string(")")}
      </td>
      <td className="px-2 py-2"> {person.role} </td>
    </tr>
}

module PersonTable = {
  @react.component
  let make = (~persons: array<person>, ~className="") =>
    <table className={"table-auto" ++ " " ++ className}>
      <tbody>
        {persons
        ->Belt.Array.map(person => {
          <Person person />
        })
        ->React.array}
      </tbody>
    </table>
}

let oecd_logo: imgLocation = %raw("import('../../assets/OECD_logo.svg')")

let inria_logo: imgLocation = %raw("import('../../assets/inr_logo_rouge.svg')")

let dinum_logo: imgLocation = %raw("import('../../assets/Logo_DINUM_2020_RVB.png')")

@react.component
let make = () => <>
  <Title>
    <Lang.String english="About" french={`À propos`} />
  </Title>
  <p className="text-lg italic">
    <Lang.String
      english="How can we ensure that our laws are accurately applied
  in the software that calculates tax, benefits and pensions? That's the
  challenge of the Catala project, an interdisciplinary initiative aimed
  at modernising tax and benefit calculation software and making it more
  reliable by translating legal specifications into computer code."
      french={`Comment garantir que nos lois sont appliquées
  avec précision dans les logiciels qui calculent impôts, allocations et pensions ?
  C'est tout l'enjeu du projet Catala, une initiative interdisciplinaire visant à
  moderniser et fiabiliser les logiciels de calcul des impôts et des prestations
  sociales en traduisant les spécifications juridiques en code informatique.`}
    />
  </p>
  <SubSection
    title={<Lang.String
      english="A language in the service of the Law" french={`Un langage au service de la loi`}
    />}>
    <p className="mb-4">
      <Lang.String
        english="Transforming legislative texts into computer programs is
    essential if the law is to be applied on a large scale, for example
    in computing taxes or distributing welfare benefits. However, this
    task is complex due to the often ambiguous and contextual nature of
    legal texts. Catala was designed to meet this challenge: a programming
    language specially developed to transcribe the law faithfully and in a
    way that is easy to understand, ensuring that legal rules are applied
    accurately."
        french={`Transformer les textes législatifs en programmes
    informatiques est essentiel pour appliquer le droit à grande échelle,
    notamment dans le calcul des impôts ou la distribution des aides sociales.
    Cependant, cette tâche est complexe en raison de la nature souvent ambiguë
    et contextuelle des textes juridiques. C'est pour répondre à ce défi que
    Catala a été conçu : un langage de programmation spécialement développé
    pour transcrire la loi de manière fidèle et explicable, assurant ainsi
    une application exacte des règles juridiques.`}
      />
    </p>
    <p className="mb-4">
      <Lang.String
        english="Denis Merigoux, project leader for software infrastructures in support of
    public policies at Inria, came up with the idea for this project while "
        french={`C'est `}
      />
      <Link.Text target="https://www.inria.fr/fr/mlang-modernisation-calcul-impot-revenu">
        <Lang.String
          english="working
    on a renovation of the M language and its compiler alongside the French
    Public Finance Department (DGFIP)"
          french={`en travaillant sur une rénovation du langage M et
de son compilateur aux côtés de la Direction générale des Finances publiques (DGFIP)`}
        />
      </Link.Text>
      <Lang.String
        english=", to make tax calculations even more reliable.
    It was interesting to go back to a blank drawing board, to redesign a system
    based on needs and the state of the art in science, rather than on old
    technical choices whose limitations are still being felt today."
        french={`, pour un calcul de l'impôt encore plus fiable, que l'idée de ce projet
s'est imposée à l'esprit de Denis Merigoux, chef de projet infrastructures
logicielles en appui aux politiques publiques chez Inria. Il état en effet
intéressant de revenir à une planche à dessin vierge, de redessiner un système
en partant des besoins et de l'état de l'art scientifique et non de choix
techniques anciens dont les limites se font ressentir aujourd'hui.`}
      />
    </p>
    <p className="mb-4">
      <Lang.String
        french={`Denis Merigoux, finissant alors son `}
        english="The scientist, while finishing his "
      />
      <Link.Text target=" https://theses.hal.science/tel-03622012">
        <Lang.String french={`doctorat`} english="PhD" />
      </Link.Text>
      <Lang.String
        french={`, décide alors de collaborer avec des
juristes et une sociologue pour faire éclore son projet : Liane Huttner,
maîtresse de conférences en droit à l'Université Paris-Saclay, Sarah Lawsky,
professeure de droit fiscal , docteure en logique formelle, qui a étudié la
structuration des textes législatifs en langage formel, et enfin Marie Alauzen,
spécialiste des questions de modernisation administrative de l'État.
Leur objectif : unir leurs compétences pour concevoir un langage de
programmation capable de préserver l'intention du législateur tout en
étant intégrable aux architectures logicielles modernes.`}
        english=", then decided to collaborate with legal experts and
a sociologist to bring his project to fruition: Liane Huttner, lecturer in law
at the Université Paris-Saclay, Sarah Lawsky, professor of tax law,
doctorate in formal logic, which has studied the structuring of legislative texts
in formal language, and finally Marie Alauzen, specialist in issues of
administrative modernisation of the State. Their aim was to combine their
skills to design a programming language that would preserve the legislator's
intentions while being able to be integrated into modern software architectures."
      />
    </p>
    <p className="mb-4">
      <Lang.String
        french={`Le but n'est pas de formaliser ou mettre en code tout le droit,
car cela n'a aucun sens, mais de s'intéresser au droit qui est déjà exécuté automatiquement,
comme le calcul des prestations sociales, des impôts, ou du chômage.
Le projet fait vraiment travailler juristes et informaticiens ensemble, qui échangent
en direct sur le code que l'informaticien est en train d'écrire afin de faire des
modifications dessus en temps réel. Grâce à cette approche, il devient possible de
garantir que les règles fiscales et sociales sont appliquées avec exactitude et
fidélité au droit, réduisant ainsi les risques d'erreur et renforçant la
transparence des décisions administratives automatisées.`}
        english="The aim is not to formalise or put into code all the law, because that
would make no sense, but we are interested in the law that is already executed
automatically, such as the calculation of social benefits, tax or unemployment.
The project is really getting lawyers and computer scientists to work together,
who exchange information live on the code that the computer scientist is writing
so that they can make changes to it in real time. Thanks to this approach, it is
possible to guarantee that tax and social security rules are applied accurately
and faithfully to the law, thereby reducing the risk of error and enhancing the
transparency of automated administrative decisions."
      />
    </p>
  </SubSection>
  <SubSection title={<Lang.String english="Highlighted by" french={`Mis en valeur par`} />}>
    <div className="flex flex-row flex-wrap justify-center gap-8">
      <Highlight src=oecd_logo>
        <Link.Text target="https://oecd-opsi.org/publications/cracking-the-code/">
          <Lang.String
            english="\"Cracking the Code\" report on Rules as Code"
            french={`Rapport « Décrypter le code » sur Rules as Code`}
          />
        </Link.Text>
      </Highlight>
      <Highlight src=dinum_logo>
        <Link.Text
          target="https://web.archive.org/web/20250118165329/https://code.gouv.fr/fr/explicabilite/">
          <Lang.String
            english="Explanainability tools comparison"
            french={`Comparaison d'outils d'explicabilité`}
          />
        </Link.Text>
        {React.string(" ")}
        <Link.Text
          target="https://github.com/codegouvfr/codegouvfr-website/commit/ec09582eafeaa5316b5">
          <Lang.String french={`(supprimé)`} english="(deleted)" />
        </Link.Text>
      </Highlight>
      <Highlight src=inria_logo>
        <Link.Text target="https://apollo.inria.fr/projets/catala/">
          <Lang.String english="Apollo program" french={`Programme Apollo`} />
        </Link.Text>
      </Highlight>
    </div>
  </SubSection>
  <SubSection
    title={<Lang.String
      english="Practical applications in the public sector"
      french={`Des applications concrètes dans les administrations `}
    />}>
    <p className="mb-4">
      <Lang.String
        french={`Catala, qui fait travailler ensemble chercheur·e·s et ingénieur·e·s,
        est particulièrement pertinent pour
les administrations publiques et les organismes chargés de l'application des
politiques fiscales et sociales. En remplaçant les systèmes informatiques
patrimoniaux de calcul des impôts et des prestations sociales, ce langage
permet de s'assurer de manière exhaustive et explicable que les algorithmes de
l'administration appliquent le droit tel qu'il est interprété par les directions
juridiques des administrations, sans distorsion ni approximation.`}
        english="Catala, by having researchers and engineers work together, is particularly relevant for
public administrations and bodies responsible for applying tax and social
policies. By replacing legacy IT systems for computing tax and social
security benefits, this language provides exhaustive and explainable assurance
that the administration's algorithms apply the law as interpreted by the
administration's legal departments, without distortion or approximation."
      />
    </p>
    <p className="mb-4">
      <Lang.String
        english="Two proofs of concept for government departments
    have already been produced: the first for the Caisse Nationale des
    Allocations Familiales, which is currently carrying out studies on
    the future of the system for computing all social benefits in France,
    and the second for the Direction Générale des Finances Publiques, for
    computing income tax."
        french={`Deux preuves de concept pour les administrations ont ainsi, pour le
    moment, vu le jour : une première pour la Caisse Nationale des Allocations
    Familiales (CNAF), qui mène actuellement des études sur le futur du système
    calculant l'ensemble des prestations sociales en France, et une seconde
    pour la Direction Générale des Finances publiques, autour du calcul de
    l'impôt sur le revenu.`}
      />
    </p>
  </SubSection>
  <p className="float-right text-green pt-4 italic">
    <Lang.String
      english="Text credits: the Catala team and " french={`Source : l'équipe de Catala et `}
    />
    <Link.Text target="https://www.inria.fr/fr/catala-logiciel-administration-dgfip-cnaf">
      {React.string("Iris Maignan")}
    </Link.Text>
  </p>
  <div className="clear-right" />
  <Section id="people" title={<Lang.String english="People" french={`Membres du projet`} />}>
    <PersonTable
      persons=[
        marieAlauzen,
        vincentBotbol,
        alainDelaet,
        aymericFromherz,
        louisGesbert,
        pierreGoutagny,
        estelleHary,
        lianeHuttner,
        sarahLawsky,
        denisMerigoux,
        raphaelMonat,
        romainPrimet,
      ]
    />
  </Section>
  <Section id="alumni" title={<Lang.String english="Alumni" french={`Alumni`} />}>
    <PersonTable
      persons=[
        justineBanuls,
        nicolasChataing,
        carolineFlori,
        jonathanProtzenko,
        emileRolley,
        lilyaSlimani,
      ]
    />
  </Section>
  <Section
    id="naming"
    title={<Lang.String
      english="Why the name \"Catala\"?" french={`Pourquoi le nom « Catala » ?`}
    />}>
    <p className="mb-16">
      <Lang.String
        english={`This programming language is named after `}
        french={`Ce langage de programmation est nommé d'après `}
      />
      <Link.Text target="https://fr.wikipedia.org/wiki/Pierre_Catala">
        <Lang.String english={`Pierre Catala`} french={`Pierre Catala`} />
      </Link.Text>
      <Lang.String
        english={` who is, together with
        Lucien Mehl, a pioneer of French legal informatics. Beware, the name Catala is typographically close to
        the name of the Catalan language written in Catalan : Català. However, the very narrow scope of our programming language should not be prone to
        set any confusion given the existing wide influence of the Catalan language and culture.`}
        french={`, qui est avec Lucien Mehl un des pionners de l'informatique juridique française.
        Attention, le nom Catala est typographiquement proche du nom de la langue catalane écrite en catalan : Català. Cependant, le champ
        d'application très restreint de notre langage de programmation ne devrait pas cause de confusion étant donné le rayonnement et l'influence
        conséquents de la langue et culture catalane.`}
      />
    </p>
  </Section>
</>
