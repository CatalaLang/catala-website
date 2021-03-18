%bs.raw(`require("../assets/catala_code.css")`)

let french_law = %bs.raw(`require("../assets/french_law.js")`)

module FrenchFamilyBenefits = {
  let family_benefits: string = %bs.raw(`require("../assets/allocations_familiales.html")`)

  type child_input = {
    birth_date: option<Js.Date.t>,
    id: int,
    monthly_income: option<int>,
    prise_en_charge: option<string>,
    a_deja_ouvert_droit_allocations_familiales: option<bool>,
  }

  let empty_child = i => {
    birth_date: None,
    id: i,
    monthly_income: None,
    prise_en_charge: None,
    a_deja_ouvert_droit_allocations_familiales: None,
  }

  type allocations_familiales_input = {
    current_date: option<Js.Date.t>,
    num_children: option<int>,
    children: array<child_input>,
    income: option<int>,
    residence: option<string>,
  }

  type child_input_validated = {
    dateNaissance: Js.Date.t,
    id: int,
    remunerationMensuelle: int,
    priseEnCharge: string,
    aDejaOuvertDroitAuxAllocationsFamiliales: bool,
  }

  type allocations_familiales_input_validated = {
    currentDate: Js.Date.t,
    children: array<child_input_validated>,
    income: int,
    residence: string,
    personneQuiAssumeLaChargeEffectivePermanenteEstParent: bool,
    personneQuiAssumeLaChargeEffectivePermanenteRemplitConditionsTitreISecuriteSociale: bool,
  }

  type allocations_familiales_output =
    | Result(float)
    | Error(React.element)

  let validate_input = (input: allocations_familiales_input) => {
    switch (input.current_date, input.num_children, input.income, input.residence) {
    | (Some(current_date), Some(_num_children), Some(income), Some(residence)) =>
      let children_validated = Belt.Array.map(input.children, child => {
        switch (child.birth_date, child.monthly_income) {
        | (Some(birth_date), Some(monthly_income)) =>
          Some({
            dateNaissance: birth_date,
            id: child.id,
            remunerationMensuelle: monthly_income,
            priseEnCharge: {
              switch child.prise_en_charge {
              | None => "Effective et permanente"
              | Some(s) => s
              }
            },
            aDejaOuvertDroitAuxAllocationsFamiliales: {
              switch child.a_deja_ouvert_droit_allocations_familiales {
              | None | Some(false) => false
              | Some(true) => true
              }
            },
          })
        | _ => None
        }
      })
      if (
        Belt.Array.length(children_validated) == 0 ||
          Belt.Array.every(children_validated, child => {
            switch child {
            | None => false
            | Some(_) => true
            }
          })
      ) {
        let children_validated = Belt.Array.map(children_validated, Belt.Option.getExn)
        Some({
          currentDate: current_date,
          income: income,
          residence: residence,
          children: children_validated,
          // We assume the two below are always true
          personneQuiAssumeLaChargeEffectivePermanenteEstParent: true,
          personneQuiAssumeLaChargeEffectivePermanenteRemplitConditionsTitreISecuriteSociale: true,
        })
      } else {
        None
      }
    | _ => None
    }
  }

  let allocations_familiales_exe: allocations_familiales_input_validated => float = %bs.raw(`
  function(input) {
    return french_law.computeAllocationsFamiliales(input)
  }
`)

  let incomplete_input = Error(
    <Lang.String english="Input not complete" french=`Entrée non complète` />,
  )

  let compute_allications_familiales = (input: allocations_familiales_input) => {
    switch validate_input(input) {
    | None => incomplete_input
    | Some(new_input) =>
      try {Result(allocations_familiales_exe(new_input))} catch {
      | err =>
        Js.log(err)
        Error(<>
          <Lang.String
            english="Computation error: check that the current date is between May 2019 and march 2021"
            french=`Erreur de calcul : vérifiez que la date du calcul est entre mai 2019 et mars 2021`
          />
        </>)
      }
    }
  }

  @react.component
  let make = () => {
    let (af_input, set_af_input) = React.useState(_ => {
      current_date: None,
      num_children: None,
      income: None,
      children: [],
      residence: Some(`Métropole`),
    })
    let (af_output, set_af_output) = React.useState(_ => {
      incomplete_input
    })
    <>
      <Utils.PageTitle>
        <Lang.String
          english="French family benefits computation" french=`Calcul des allocations familiales`
        />
      </Utils.PageTitle>
      <p>
        <Lang.String
          english="The source code for this example is available "
          french=`Le code source de cet exemple est disponible `
        />
        <Utils.TextLink
          target="https://github.com/CatalaLang/catala/tree/master/examples/allocations_familiales">
          <Lang.String english="here" french=`ici` />
        </Utils.TextLink>
        <Lang.String
          english=". What you can see here is the \"weaved\" output of the source files processed by the Catala compiler.
        Weaving is a concept from "
          french=`. Ce que vous pouvez voir en dessous est la version "tissée" des fichiers sources transformés par le compilateur Catala.
        Le tissage est un concept issu de la `
        />
        <Utils.TextLink target="https://en.wikipedia.org/wiki/Literate_programming#Workflow">
          <Lang.String english="literate programming" french=`programmation littéraire` />
        </Utils.TextLink>
        <Lang.String
          english=" corresponding to the action of interleaving together the code and its textual documentation
         as to produce a reviewable and comprehensive document. Please refer to the tutorial for a hands-on introduction
          on how to read this document."
          french=` , qui correspond à l'action d'entremêler le code et sa documentation textuelle dans un document
         complet et lisible. Veuillez vous réferer au tutoriel pour savoir comment lire ce document.`
        />
      </p>
      <Utils.PageSection title={<Lang.String english="Simulator" french=`Simulateur` />}>
        <p>
          <Lang.String
            english="This simulator is powered with the Catala program compiled from the source code below."
            french=`Ce simulateur utilise un programme Catala compilé à partir du code source ci-dessous.`
          />
        </p>
        <div className=%tw("flex flex-row flex-wrap justify-around bg-secondary py-4 mt-4")>
          <div className=%tw("flex flex-col mx-4")>
            <label className=%tw("text-white text-center")>
              <Lang.String
                english=`Yearly household income (€)`
                french=`Ressources annuelles du ménage (€)`
              />
            </label>
            <input
              type_="number"
              className=%tw("border-solid border-2 border-tertiary m-1 px-2")
              onChange={(evt: ReactEvent.Form.t) => {
                ReactEvent.Form.preventDefault(evt)
                let value = ReactEvent.Form.target(evt)["value"]
                let new_input = {
                  ...af_input,
                  income: Some(int_of_string(value)),
                }
                set_af_input(_ => new_input)
                set_af_output(_ => compute_allications_familiales(new_input))
              }}
            />
          </div>
          <div className=%tw("flex flex-col mx-4")>
            <label className=%tw("text-white text-center")>
              <Lang.String french=`Résidence du ménage` english=`Household residence` />
            </label>
            <select
              list="browsers"
              className=%tw("border-solid border-2 border-tertiary m-1 px-2")
              onChange={(evt: ReactEvent.Form.t) => {
                ReactEvent.Form.preventDefault(evt)
                let value = ReactEvent.Form.target(evt)["value"]
                let new_input = {
                  ...af_input,
                  residence: value,
                }
                set_af_input(_ => new_input)
                set_af_output(_ => compute_allications_familiales(new_input))
              }}>
              <option value=`Métropole`> {React.string(`Métropole`)} </option>
              <option value=`Guyane`> {React.string(`Guyane`)} </option>
              <option value=`Guadeloupe`> {React.string(`Guadeloupe`)} </option>
              <option value=`La Réunion`> {React.string(`La Réunion`)} </option>
              <option value=`Martinique`> {React.string(`Martinique`)} </option>
              <option value=`Mayotte`> {React.string(`Mayotte`)} </option>
              <option value=`Saint Barthélemy`> {React.string(`Saint Barthélemy`)} </option>
              <option value=`Saint Martin`> {React.string(`Saint Martin`)} </option>
              <option value=`Saint Pierre et Miquelon`>
                {React.string(`Saint Pierre et Miquelon`)}
              </option>
            </select>
          </div>
          <div className=%tw("flex flex-col mx-4")>
            <label className=%tw("text-white text-center")>
              <Lang.String english="Date of the computation" french=`Date du calcul` />
            </label>
            <input
              className=%tw("border-solid border-2 border-tertiary m-1 px-2")
              type_="date"
              onChange={(evt: ReactEvent.Form.t) => {
                ReactEvent.Form.preventDefault(evt)
                let value = ReactEvent.Form.target(evt)["value"]
                let new_input = {
                  ...af_input,
                  current_date: Some(Js.Date.fromString(value)),
                }
                set_af_input(_ => new_input)
                set_af_output(_ => compute_allications_familiales(new_input))
              }}
            />
          </div>
          <div className=%tw("flex flex-col mx-4")>
            <label className=%tw("text-white text-center")>
              <Lang.String english="Number of children" french=`Nombre d'enfants` />
            </label>
            <input
              onChange={(evt: ReactEvent.Form.t) => {
                ReactEvent.Form.preventDefault(evt)
                let value = ReactEvent.Form.target(evt)["value"]
                let new_input = {
                  ...af_input,
                  num_children: value,
                  children: if value <= 0 {
                    []
                  } else {
                    Array.init(value, i => {
                      if i >= Array.length(af_input.children) {
                        empty_child(i)
                      } else {
                        af_input.children[i]
                      }
                    })
                  },
                }
                set_af_input(_ => new_input)
                set_af_output(_ => compute_allications_familiales(new_input))
              }}
              className=%tw("border-solid border-2 border-tertiary m-1 px-2")
              type_="number"
            />
          </div>
        </div>
        <div className=%tw("flex flex-row flex-wrap justify-around bg-secondary py-4")>
          {React.array(
            Belt.Array.mapWithIndex(af_input.children, (i, _) => {
              <div
                className=%tw("flex flex-col border-tertiary border-2 border-solid py-2 my-2")
                key={"child_input" ++ string_of_int(i)}>
                <div key={"birth_date_div" ++ string_of_int(i)} className=%tw("flex flex-col mx-4")>
                  <label
                    key={"birth_date_label" ++ string_of_int(i)}
                    className=%tw("text-white text-center")>
                    <Lang.String english=`Child n°` french=`Enfant n°` />
                    {React.string(string_of_int(i + 1))}
                    <Lang.String english=": birthdate" french=` : date de naissance` />
                  </label>
                  <input
                    key={"birth_date_input" ++ string_of_int(i)}
                    onChange={(evt: ReactEvent.Form.t) => {
                      ReactEvent.Form.preventDefault(evt)
                      let value = ReactEvent.Form.target(evt)["value"]
                      let children = af_input.children
                      children[i] = {
                        ...children[i],
                        birth_date: Some(Js.Date.fromString(value)),
                      }
                      let new_input = {...af_input, children: children}
                      set_af_input(_ => new_input)
                      set_af_output(_ => compute_allications_familiales(new_input))
                    }}
                    className=%tw("border-solid border-2 border-tertiary m-1 px-2")
                    type_="date"
                  />
                </div>
                <div key={"custody_" ++ string_of_int(i)} className=%tw("flex flex-col mx-4")>
                  <label
                    key={"custody_label" ++ string_of_int(i)}
                    className=%tw("text-white text-center")>
                    <Lang.String english=`Child n°` french=`Enfant n°` />
                    {React.string(string_of_int(i + 1))}
                    <Lang.String english=": custody" french=` :prise en charge` />
                  </label>
                  <select
                    key={"custody_input" ++ string_of_int(i)}
                    list="browsers"
                    className=%tw("border-solid border-2 border-tertiary m-1 px-2")
                    onChange={(evt: ReactEvent.Form.t) => {
                      ReactEvent.Form.preventDefault(evt)
                      let value = ReactEvent.Form.target(evt)["value"]
                      let children = af_input.children
                      children[i] = {
                        ...children[i],
                        prise_en_charge: Some(value),
                      }
                      let new_input = {...af_input, children: children}
                      set_af_input(_ => new_input)
                      set_af_output(_ => compute_allications_familiales(new_input))
                    }}>
                    <option value=`Effective et permanente`>
                      {React.string(`Effective et permanente`)}
                    </option>
                    <option value=`Garde alternée, allocataire unique`>
                      {React.string(`Garde alternée, allocataire unique`)}
                    </option>
                    <option value=`Garde alternée, partage des allocations`>
                      {React.string(`Garde alternée, partage des allocations`)}
                    </option>
                    <option value=`Confié aux service sociaux, allocation versée à la famille`>
                      {React.string(`Confié aux service sociaux, allocation versée à la famille`)}
                    </option>
                    <option
                      value=`Confié aux service sociaux, allocation versée aux services sociaux`>
                      {React.string(`Confié aux service sociaux, allocation versée aux services sociaux`)}
                    </option>
                  </select>
                </div>
                <div
                  key={"monthly_income_div" ++ string_of_int(i)}
                  className=%tw("flex flex-col mx-4")>
                  <label
                    key={"monthly_income_label" ++ string_of_int(i)}
                    className=%tw("text-white text-center")>
                    <Lang.String english=`Child n°` french=`Enfant n°` />
                    {React.string(string_of_int(i + 1))}
                    <Lang.String
                      english=`: monthly income (€)` french=` : rémunération mensuelle (€)`
                    />
                  </label>
                  <input
                    key={"monthly_income_input" ++ string_of_int(i)}
                    onChange={(evt: ReactEvent.Form.t) => {
                      ReactEvent.Form.preventDefault(evt)
                      let value = ReactEvent.Form.target(evt)["value"]
                      let children = af_input.children
                      children[i] = {
                        ...children[i],
                        monthly_income: Some(int_of_string(value)),
                      }
                      let new_input = {...af_input, children: children}
                      set_af_input(_ => new_input)
                      set_af_output(_ => compute_allications_familiales(new_input))
                    }}
                    className=%tw("border-solid border-2 border-tertiary m-1 px-2")
                    type_="number"
                  />
                </div>
                <div
                  key={"already_used_key" ++ string_of_int(i)} className=%tw("flex flex-col mx-4")>
                  <label
                    key={"already_used_key_label" ++ string_of_int(i)}
                    className=%tw("text-white text-center")>
                    <Lang.String english=`Child n°` french=`Enfant n°` />
                    {React.string(string_of_int(i + 1))}
                    <Lang.String
                      english=": has already been eligible for benefits"
                      french=` : a déjà ouvert des droits aux allocations`
                    />
                  </label>
                  <input
                    key={"already_used_key_input" ++ string_of_int(i)}
                    onChange={_ => {
                      let children = af_input.children
                      children[i] = {
                        ...children[i],
                        a_deja_ouvert_droit_allocations_familiales: switch children[i].a_deja_ouvert_droit_allocations_familiales {
                        | None | Some(false) => Some(true)
                        | Some(true) => Some(false)
                        },
                      }
                      let new_input = {...af_input, children: children}
                      set_af_input(_ => new_input)
                      set_af_output(_ => compute_allications_familiales(new_input))
                    }}
                    className=%tw("border-solid border-2 border-tertiary m-1 px-2")
                    type_="checkbox"
                  />
                </div>
              </div>
            }),
          )}
        </div>
        <div
          className=%tw(
            "flex flex-row justify-center my-4 border-2 border-tertiary border-solid p-4"
          )>
          {switch af_output {
          | Error(msg) => <div className=%tw("font-bold")> msg </div>
          | Result(amount) => <>
              <div className=%tw("pr-2 ")>
                <Lang.String
                  english="Family benefits monthly amount:"
                  french=`Montant mensuel des allocations familiales :`
                />
              </div>
              <div className=%tw("font-bold whitespace-nowrap")>
                {React.float(amount)} {React.string(` €`)}
              </div>
            </>
          }}
        </div>
      </Utils.PageSection>
      <Utils.PageSection title={<Lang.String english="Source code" french=`Code source` />}>
        <div className="catala-code" dangerouslySetInnerHTML={"__html": family_benefits} />
      </Utils.PageSection>
    </>
  }
}

module USTaxCode = {
  let us_tax_code: string = %bs.raw(`require("../assets/us_tax_code.html")`)

  @react.component
  let make = () => <>
    <Utils.PageTitle>
      <Lang.String english="US Tax Code" french=`Code des impôts américain` />
    </Utils.PageTitle>
    <p className=%tw("pb-16")>
      <Lang.String
        english="The source code for this example is available "
        french=`Le code source de cet exemple est disponible `
      />
      <Utils.TextLink
        target="https://github.com/CatalaLang/catala/tree/master/examples/us_tax_code">
        <Lang.String english="here" french=`ici` />
      </Utils.TextLink>
      <Lang.String
        english=". What you can see here is the \"weaved\" output of the source files processed by the Catala compiler.
        Weaving is a concept from "
        french=`. Ce que vous pouvez voir en dessous est la version "tissée" des fichiers sources transformés par le compilateur Catala.
        Le tissage est un concept issu de la `
      />
      <Utils.TextLink target="https://en.wikipedia.org/wiki/Literate_programming#Workflow">
        <Lang.String english="literate programming" french=`programmation littéraire` />
      </Utils.TextLink>
      <Lang.String
        english=" corresponding to the action of interleaving together the code and its textual documentation
         as to produce a reviewable and comprehensive document. Please refer to the tutorial for a hands-on introduction
          on how to read this document."
        french=` , qui correspond à l'action d'entremêler le code et sa documentation textuelle dans un document
         complet et lisible. Veuillez vous réferer au tutoriel pour savoir comment lire ce document.`
      />
    </p>
    <div className="catala-code" dangerouslySetInnerHTML={"__html": us_tax_code} />
  </>
}

module DummyFrench = {
  let french: string = %bs.raw(`require("../assets/french.html")`)

  @react.component
  let make = () => <>
    <Utils.PageTitle>
      {`Exemple de programme conçu expréssement pour des juristes` |> React.string}
    </Utils.PageTitle>
    <p>
      {`
      Dans le cadre d'un projet de recherche de l'` |> React.string}
      <Utils.TextLink target="https://www.inria.fr/fr"> {"Inria" |> React.string} </Utils.TextLink>
      {` sur l'amélioration
        de la fiabilité des logiciels censés suivre une spécification législative, le langage ` |> React.string}
      <Utils.TextLink target="https://github.com/CatalaLang/catala">
        {"Catala" |> React.string}
      </Utils.TextLink>
      {` propose d'annoter directement les textes
        législatifs avec leur contenu logiciel.` |> React.string}
    </p>
    <p>
      {`Ci-dessous se trouve un exemple purement illustratif d'annotation d'une partie de l'article D 521-1 du code
        de la sécurité sociale décrivant une partie du calcul du montant des allocations familiales. Chaque
        ligne de l'article est annotée par un bloc de code informatique (préfixé par des numéros de ligne).` |> React.string}
    </p>
    <p>
      {`Le code informatique se lit en français ; les couleurs sont là à titre purement indicatif pour
        faciliter la lecture mais ne portent pas d'informations sur la manière dont le code s'exécutera.` |> React.string}
    </p>
    <p>
      {`Le "champ d'application" correspond au contexte logique dans lequel on se place pour appliquer
        l'article D 521-1. La "définition" d'une quantité permet de décrire sa valeur en fonction d'autres
        quantité. Une quantité est nommée par un identifiant (par exemple "allocations_familiales") parfois suivi d'un
        point et d'un autre identifiant correspondant à une partie de la quantité précédant le point. "sous condition"
        et "conséquence" décrivent une condition à remplir pour que la définition prenne effet. Les opérations arithmétiques
        usuelles sont utilisées, les parenthèses servent à
        délimiter des sous-expressions de manière non-ambigue.` |> React.string}
    </p>
    <p className=%tw("pb-16")>
      {`Le code présenté ci-dessous est extrait d'une étude de cas plus complète sur le calcul des allocations
      familiales, ` |> React.string}
      <Utils.InternalLink
        target=[Elements.home, Elements.examples, Elements.french_family_benefits_example]>
        {`disponible en suivant ce lien` |> React.string}
      </Utils.InternalLink>
      {`. Si cet exemple vous intéresse ou si vous avez d'autres questions, vous pouvez contacter directement
          l'auteur à l'adresse ` |> React.string}
      <Utils.TextLink target="mailto:denis.merigoux@inria.fr">
        {"denis.merigoux@inria.fr" |> React.string}
      </Utils.TextLink>
      {"." |> React.string}
    </p>
    <div className="catala-code" dangerouslySetInnerHTML={"__html": french} />
  </>
}

module TutorialEn = {
  let tutorial_en: string = %bs.raw(`require("../assets/tutorial_en.html")`)

  @react.component
  let make = () => <>
    <Utils.PageTitle>
      <Lang.String
        english="English tutorial for Catala developers"
        french=`Catala: tutoriel pour programmeurs anglophones`
      />
    </Utils.PageTitle>
    <div className="catala-code" dangerouslySetInnerHTML={"__html": tutorial_en} />
  </>
}

module TutorialFr = {
  let tutorial_fr: string = %bs.raw(`require("../assets/tutoriel_fr.html")`)

  @react.component
  let make = () => <>
    <Utils.PageTitle>
      <Lang.String
        english="French tutorial for Catala developers"
        french=`Catala: tutoriel pour programmeurs francophones`
      />
    </Utils.PageTitle>
    <div className="catala-code" dangerouslySetInnerHTML={"__html": tutorial_fr} />
  </>
}

let family_benefits: string = %bs.raw(`require("../assets/allocations_familiales.html")`)

let family_benefits_card: Utils.presentation_card = {
  title: <Lang.String english="French family benefits" french="Allocations familiales" />,
  action: Some((
    [Elements.home, Elements.examples, Elements.french_family_benefits_example],
    <Lang.String english="see example" french=`Voir l'exemple` />,
  )),
  icon: None,
  quote: None,
  content: <>
    <Lang.String
      english="The content of the example is generated by the Catala compiler from the "
      french=`Le contenu de cet exemple est généré par le compilateur Catala à partir des `
    />
    <Utils.TextLink
      target="https://github.com/CatalaLang/catala/tree/master/examples/allocations_familiales">
      <Lang.String english="source code files of the example" french=`sources de l'exemple` />
    </Utils.TextLink>
    <Lang.String
      english=". The code, like the legislative text it follows, is written in French." french="."
    />
  </>,
}

let english_card: Utils.presentation_card = {
  title: <Lang.String english="US Tax Code" french=`Code des impôts américain` />,
  action: Some((
    [Elements.home, Elements.examples, Elements.us_tax_code],
    <Lang.String english="see example" french=`Voir l'exemple` />,
  )),
  icon: None,
  quote: None,
  content: <>
    <Lang.String
      english="The content of this example is generated by the Catala compiler from the "
      french=`Le contenu de cet exemple est généré par le compilateur de Catala à partir des `
    />
    <Utils.TextLink
      target="https://github.com/CatalaLang/catala/tree/master/examples/dummy_english">
      <Lang.String
        english="source code files of the example" french=`fichiers source de l'exemple`
      />
    </Utils.TextLink>
    <Lang.String english="." french=`.` />
  </>,
}

let french_card: Utils.presentation_card = {
  title: <Lang.String english="French dummy example" french=`Exemple en français` />,
  action: Some((
    [Elements.home, Elements.examples, Elements.french_example],
    <Lang.String english="see example" french=`Voir l'exemple` />,
  )),
  icon: None,
  quote: None,
  content: <>
    <Lang.String
      english="This example has been used for illustrating the concepts of Catala for
     a rules-as-code poll sent by the "
      french=`Cet exemple a été utilisé pour illustrer les concepts de Catala pour un sondage
       sur le thème "transformer la loi en code" envoyé par l'association `
    />
    <Utils.TextLink target="hhttps://openlaw.fr/"> {React.string("OpenLaw")} </Utils.TextLink>
    <Lang.String english=" association." french=`.` />
  </>,
}

let tutorial_en_card: Utils.presentation_card = {
  title: <Lang.String
    english="English tutorial for Catala developers"
    french=`Catala: tutoriel pour programmeurs anglophones`
  />,
  action: Some((
    [Elements.home, Elements.examples, Elements.tutorial_en_example],
    <Lang.String english="See the tutorial" french=`Voir le tutoriel` />,
  )),
  icon: None,
  quote: None,
  content: <Lang.String
    english="This tutorial is an opportunity to discover Catala from a developer's point of view.
    The document goes over a fictional legislative example and give insights and tips about how annotate the
    law with Catala code."
    french=`Ce tutoriel est le meilleur moyen de découvrir Catala de la perspective d'un développeur.
      Le document part d'un exemple fictif d'un morceau de législation, et donne les éléments conceptuelles
      et meilleures méthodes pour annoter la loi avec du code Catala.
      `
  />,
}

let tutorial_fr_card: Utils.presentation_card = {
  title: <Lang.String
    english="French tutorial for Catala developers"
    french=`Catala: tutoriel pour programmeurs francophones`
  />,
  action: Some((
    [Elements.home, Elements.examples, Elements.tutorial_fr_example],
    <Lang.String english="See the tutorial" french=`Voir le tutoriel` />,
  )),
  icon: None,
  quote: None,
  content: <Lang.String
    english="This tutorial is an opportunity to discover Catala from a developer's point of view.
    The document goes over a fictional legislative example and give insights and tips about how annotate the
    law with Catala code."
    french=`Ce tutoriel est le meilleur moyen de découvrir Catala de la perspective d'un développeur.
      Le document part d'un exemple fictif d'un morceau de législation, et donne les éléments conceptuelles
      et meilleures méthodes pour annoter la loi avec du code Catala.
      `
  />,
}

@react.component
let make = () => <>
  <Utils.PageTitle>
    <Lang.String english="Catala examples" french=`Exemples de programmes Catala` />
  </Utils.PageTitle>
  <Utils.PresentationCards
    cards=[tutorial_en_card, tutorial_fr_card, family_benefits_card, english_card, french_card]
  />
</>
