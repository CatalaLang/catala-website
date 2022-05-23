open PageComponents

let frenchLaw = %raw(`require("../../assets/french_law.js")`)

type childInput = {
  birthDate: option<Js.Date.t>,
  id: int,
  monthlyIncome: option<int>,
  priseEnCharge: option<string>,
  aDejaOuvertDroitAllocationsFamiliales: option<bool>,
}

let empty_child = i => {
  birthDate: None,
  id: i,
  monthlyIncome: None,
  priseEnCharge: None,
  aDejaOuvertDroitAllocationsFamiliales: None,
}

type allocations_familiales_input = {
  currentDate: option<Js.Date.t>,
  numChildren: option<int>,
  children: array<childInput>,
  income: option<int>,
  residence: option<string>,
  avaitEnfantAChargeAvant1erJanvier2012: option<bool>,
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
  avaitEnfantAChargeAvant1erJanvier2012: bool,
}

type source_position = {
  fileName: string,
  startLine: int,
  endLine: int,
  startColumn: int,
  endColumn: int,
  lawHeadings: array<string>,
}

@decco.decode
type rec logged_value =
  | Unit
  | Bool(bool)
  | Integer(int)
  // NOTE: a lost of precision could be a problem here
  | Money(float)
  | Decimal(float)
  | Date(string)
  | Duration(string)
  | Enum(list<string>, (string, logged_value))
  | Struct(list<string>, list<(string, logged_value)>)
  | Array(array<logged_value>)
  | Unembeddable

let rec log_val = (val: logged_value, tab: int) => {
  Js.log(Js.String.repeat(tab, "\t"))
  switch val {
  | Unit => Js.log("Unit")
  | Bool(b) => Js.log("Bool: " ++ string_of_bool(b))
  | Money(f) => Js.log("Money: " ++ Js.Float.toString(f))
  | Integer(i) => Js.log("Integer: " ++ string_of_int(i))
  | Decimal(f) => Js.log("Decimal: " ++ Js.Float.toString(f))
  | Date(d) => Js.log("Date: " ++ d)
  | Duration(d) => Js.log("Duration: " ++ d)
  | Enum(ls, (s, vals)) =>
    Js.log("Enum[" ++ String.concat(",", ls) ++ "]:" ++ s ++ "\n")
    vals->log_val(tab + 1)
  | _ => Js.log("Other")
  }
}

type log_event = {
  eventType: string,
  information: array<string>,
  sourcePosition: Js.Nullable.t<source_position>,
  loggedValueJson: string,
}

type allocations_familiales_output =
  | Result(float)
  | Error(React.element)

let validate_input = (input: allocations_familiales_input) => {
  switch (input.currentDate, input.numChildren, input.income, input.residence) {
  | (Some(current_date), Some(_num_children), Some(income), Some(residence)) =>
    let children_validated = Belt.Array.map(input.children, child => {
      switch (child.birthDate, child.monthlyIncome) {
      | (Some(birth_date), Some(monthly_income)) =>
        Some({
          dateNaissance: birth_date,
          id: child.id,
          remunerationMensuelle: monthly_income,
          priseEnCharge: {
            switch child.priseEnCharge {
            | None => "Effective et permanente"
            | Some(s) => s
            }
          },
          aDejaOuvertDroitAuxAllocationsFamiliales: {
            switch child.aDejaOuvertDroitAllocationsFamiliales {
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
        avaitEnfantAChargeAvant1erJanvier2012: switch input.avaitEnfantAChargeAvant1erJanvier2012 {
        | None => false
        | Some(x) => x
        },
      })
    } else {
      None
    }
  | _ => None
  }
}

let allocations_familiales_exe: allocations_familiales_input_validated => float = %raw(`
  function(input) {
    return frenchLaw.computeAllocationsFamiliales(input);
  }
`)

let incomplete_input = Error(
  <Lang.String english="Input not complete" french=`Entrée non complète` />,
)

let compute_allocations_familiales = (input: allocations_familiales_input) => {
  switch validate_input(input) {
  | None => incomplete_input
  | Some(new_input) =>
    try {Result(allocations_familiales_exe(new_input))} catch {
    | err =>
      Js.log(err)
      Error(<>
        <Lang.String
          english="Computation error: check that the current date is between May 2019 and December 2021"
          french=`Erreur de calcul : vérifiez que la date du calcul est entre mai 2019 et décembre 2021`
        />
      </>)
    }
  }
}

let card: Card.Presentation.t = {
  title: <Lang.String english="French family benefits" french="Allocations familiales" />,
  action: Some((
    [Nav.home, Nav.examples, Nav.frenchFamilyBenefitsExample],
    <Lang.String english="see example" french=`Voir l'exemple` />,
  )),
  icon: None,
  quote: None,
  content: <>
    <Lang.String
      english="The content of the example is generated by the Catala compiler from the "
      french=`Le contenu de cet exemple est généré par le compilateur Catala à partir des `
    />
    <Link.Text
      target="https://github.com/CatalaLang/catala/tree/master/examples/allocations_familiales">
      <Lang.String english="source code files of the example" french=`sources de l'exemple` />
    </Link.Text>
    <Lang.String
      english=". The code, like the legislative text it follows, is written in French." french="."
    />
  </>,
}

@react.component
let make = () => {
  let (af_input, set_af_input) = React.useState(_ => {
    currentDate: None,
    numChildren: None,
    income: None,
    children: [],
    residence: Some(`Métropole`),
    avaitEnfantAChargeAvant1erJanvier2012: None,
  })
  let (af_output, set_af_output) = React.useState(_ => {
    incomplete_input
  })
  <>
    <Title>
      <Lang.String
        english="French family benefits computation" french=`Calcul des allocations familiales`
      />
    </Title>
    <p>
      <Lang.String
        english="The source code for this example is available "
        french=`Le code source de cet exemple est disponible `
      />
      <Link.Text
        target="https://github.com/CatalaLang/catala/tree/master/examples/allocations_familiales">
        <Lang.String english="here" french=`ici` />
      </Link.Text>
      <Lang.String
        english=". What you can see here is the \"weaved\" output of the source files processed by the Catala compiler.
        Weaving is a concept from "
        french=`. Ce que vous pouvez voir en dessous est la version "tissée" des fichiers sources transformés par le compilateur Catala.
        Le tissage est un concept issu de la `
      />
      <Link.Text target="https://en.wikipedia.org/wiki/Literate_programming#Workflow">
        <Lang.String english="literate programming" french=`programmation littéraire` />
      </Link.Text>
      <Lang.String
        english=" corresponding to the action of interleaving together the code and its textual documentation
         as to produce a reviewable and comprehensive document. Please refer to the tutorial for a hands-on introduction
          on how to read this document."
        french=` , qui correspond à l'action d'entremêler le code et sa documentation textuelle dans un document
         complet et lisible. Veuillez vous réferer au tutoriel pour savoir comment lire ce document.`
      />
    </p>
    <Section title={<Lang.String english="Simulator" french=`Simulateur` />}>
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
              english=`Yearly household income (€)` french=`Ressources annuelles du ménage (€)`
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
              set_af_output(_ => compute_allocations_familiales(new_input))
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
              set_af_output(_ => compute_allocations_familiales(new_input))
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
                currentDate: Some(Js.Date.fromString(value)),
              }
              set_af_input(_ => new_input)
              set_af_output(_ => compute_allocations_familiales(new_input))
            }}
          />
        </div>
        <div className=%tw("flex flex-col mx-4")>
          <label className=%tw("text-white text-center")>
            <Lang.String english="Rights open before 2021" french=`Droits ouverts avant 2012` />
          </label>
          <input
            className=%tw("border-solid border-2 border-tertiary m-1 px-2")
            type_="checkbox"
            onChange={_ => {
              let new_input = {
                ...af_input,
                avaitEnfantAChargeAvant1erJanvier2012: switch af_input.avaitEnfantAChargeAvant1erJanvier2012 {
                | None | Some(false) => Some(true)
                | Some(true) => Some(false)
                },
              }
              set_af_input(_ => new_input)
              set_af_output(_ => compute_allocations_familiales(new_input))
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
                numChildren: value,
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
              set_af_output(_ => compute_allocations_familiales(new_input))
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
                      birthDate: Some(Js.Date.fromString(value)),
                    }
                    let new_input = {...af_input, children: children}
                    set_af_input(_ => new_input)
                    set_af_output(_ => compute_allocations_familiales(new_input))
                  }}
                  className=%tw("border-solid border-2 border-tertiary m-1 px-2")
                  type_="date"
                />
              </div>
              <div key={"custody_" ++ string_of_int(i)} className=%tw("flex flex-col mx-4")>
                <label
                  key={"custody_label" ++ string_of_int(i)} className=%tw("text-white text-center")>
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
                      priseEnCharge: Some(value),
                    }
                    let new_input = {...af_input, children: children}
                    set_af_input(_ => new_input)
                    set_af_output(_ => compute_allocations_familiales(new_input))
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
                key={"monthly_income_div" ++ string_of_int(i)} className=%tw("flex flex-col mx-4")>
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
                      monthlyIncome: Some(int_of_string(value)),
                    }
                    let new_input = {...af_input, children: children}
                    set_af_input(_ => new_input)
                    set_af_output(_ => compute_allocations_familiales(new_input))
                  }}
                  className=%tw("border-solid border-2 border-tertiary m-1 px-2")
                  type_="number"
                />
              </div>
              <div key={"already_used_key" ++ string_of_int(i)} className=%tw("flex flex-col mx-4")>
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
                      aDejaOuvertDroitAllocationsFamiliales: switch children[i].aDejaOuvertDroitAllocationsFamiliales {
                      | None | Some(false) => Some(true)
                      | Some(true) => Some(false)
                      },
                    }
                    let new_input = {...af_input, children: children}
                    set_af_input(_ => new_input)
                    set_af_output(_ => compute_allocations_familiales(new_input))
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
    </Section>
    <Section title={<Lang.String english="Execution trace" french=`Trace d'exécution` />}>
      {
        let logs: array<log_event> = %raw(`frenchLaw.retrieveLog(0)`)
        let logs_len = Belt.Array.length(logs)
        if 0 < logs_len {
          React.array(
            Belt.Array.map(logs, log => {
              Js.log("JSON received as a string: " ++ log.loggedValueJson)
              try {
                let loggedValue = logged_value_decode(Js.Json.parseExn(log.loggedValueJson))
                switch loggedValue {
                | Ok(val) => val->log_val(0)
                | Error(_decodeError) => Js.log("Error: ")
                }
              } catch {
              | Js.Exn.Error(obj) =>
                switch Js.Exn.message(obj) {
                | Some(m) => Js.log("Caught a JS exception! Message: " ++ m)
                | None => ()
                }
              }
              <div>
                <div className=%tw("font-bold")> {React.string(log.eventType)} </div>
                <div className=%tw("font-semibold")>
                  {React.string(
                    0 < Js.Array.length(log.information)
                      ? Js.Array.joinWith("/", log.information) ++ ` = `
                      : ``,
                  )}
                  <span className=%tw("text-base") />
                </div>
              </div>
            }),
          )
        } else {
          {React.string(`No logs`)}
        }
      }
    </Section>
    <Section title={<Lang.String english="Source code" french=`Code source` />}>
      <div
        className="catala-code"
        dangerouslySetInnerHTML={
          "__html": %raw(`require("../../assets/allocations_familiales.html")`),
        }
      />
    </Section>
  </>
}
