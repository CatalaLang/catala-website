open PageComponents
open Form

let frenchLaw = %raw(`require("../../assets/french_law.js")`)

let title =
  <Lang.String
    english="French family benefits computation" french=`Calcul des allocations familiales`
  />

type childInput = {
  birthDate: option<Js.Date.t>,
  id: int,
  monthlyIncome: option<int>,
  priseEnCharge: option<string>,
  aDejaOuvertDroitAllocationsFamiliales: option<bool>,
}

let emptyChild = i => {
  birthDate: None,
  id: i,
  monthlyIncome: None,
  priseEnCharge: None,
  aDejaOuvertDroitAllocationsFamiliales: None,
}

type allocationsFamilialesInput = {
  currentDate: option<Js.Date.t>,
  numChildren: option<int>,
  children: array<childInput>,
  income: option<int>,
  residence: option<string>,
  avaitEnfantAChargeAvant1erJanvier2012: option<bool>,
}

type childInputValidated = {
  dateNaissance: Js.Date.t,
  id: int,
  remunerationMensuelle: int,
  priseEnCharge: string,
  aDejaOuvertDroitAuxAllocationsFamiliales: bool,
}

type allocationsFamilialesInputValidated = {
  currentDate: Js.Date.t,
  children: array<childInputValidated>,
  income: int,
  residence: string,
  personneQuiAssumeLaChargeEffectivePermanenteEstParent: bool,
  personneQuiAssumeLaChargeEffectivePermanenteRemplitConditionsTitreISecuriteSociale: bool,
  avaitEnfantAChargeAvant1erJanvier2012: bool,
}

type sourcePosition = {
  fileName: string,
  startLine: int,
  endLine: int,
  startColumn: int,
  endColumn: int,
  lawHeadings: array<string>,
}

type logEventRaw = {
  eventType: string,
  information: array<string>,
  sourcePosition: Js.Nullable.t<sourcePosition>,
  loggedValueJson: string,
}

type allocationsFamilialesOutput =
  | Result(float)
  | Error(React.element)

let validateInput = (input: allocationsFamilialesInput) => {
  switch (input.currentDate, input.numChildren, input.income, input.residence) {
  | (Some(currentDate), Some(_numChildren), Some(income), Some(residence)) =>
    let childrenValidated = input.children->Belt.Array.map(child => {
      switch (child.birthDate, child.monthlyIncome) {
      | (Some(birthDate), Some(monthlyIncome)) =>
        Some({
          dateNaissance: birthDate,
          id: child.id,
          remunerationMensuelle: monthlyIncome,
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
      Belt.Array.length(childrenValidated) == 0 ||
        childrenValidated->Belt.Array.every(child => {
          switch child {
          | None => false
          | Some(_) => true
          }
        })
    ) {
      let childrenValidated = childrenValidated->Belt.Array.map(Belt.Option.getExn)
      Some({
        currentDate: currentDate,
        income: income,
        residence: residence,
        children: childrenValidated,
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

let allocationsFamilialesExe: allocationsFamilialesInputValidated => float = %raw(`
  function(input) {
    frenchLaw.resetLog(0);
    return frenchLaw.computeAllocationsFamiliales(input);
  }
`)

let retrieveRawEventsSerialized: unit => array<LogEvent.Raw.eventSerialized> = %raw(`
  function() {
    return frenchLaw.retrieveRawEvents(0);
  }
`)

let retrieveEventsSerialized: unit => array<LogEvent.eventSerialized> = %raw(`
  function() {
    return frenchLaw.retrieveEvents(0);
  }
`)

let computeAllocationsFamiliales = (
  input: option<allocationsFamilialesInputValidated>,
): allocationsFamilialesOutput => {
  switch input {
  | None => Error(<Lang.String english="Input not complete" french=`Entrée non complète` />)
  | Some(new_input) =>
    try {
      Result(allocationsFamilialesExe(new_input))
    } catch {
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
    Internal([Nav.home, Nav.examples, Nav.frenchFamilyBenefitsExample]),
    <Lang.String english="See example" french=`Voir l'exemple` />,
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

module Simulator = {
  let pageTitle = title

  module Form = {
    @react.component
    let make = (~setFormOutput: ('a => option<allocationsFamilialesInputValidated>) => unit) => {
      let (allocFamInput, setAllocFamInput) = React.useState(_ => {
        currentDate: None,
        numChildren: None,
        income: None,
        children: [],
        residence: Some(`Métropole`),
        avaitEnfantAChargeAvant1erJanvier2012: None,
      })
      let updateCurrentState = (newInput: allocationsFamilialesInput) => {
        setAllocFamInput(_ => newInput)
        setFormOutput(_ => validateInput(newInput))
      }
      let value = (event: ReactEvent.Form.t) => {
        event->ReactEvent.Form.preventDefault
        (event->ReactEvent.Form.target)["value"]
      }
      <>
        <Section title={<Lang.String english="Simulator" french=`Simulateur` />}>
          <p>
            <Lang.String
              english="This simulator is powered with the Catala program compiled from the source code below."
              french=`Ce simulateur utilise un programme Catala compilé à partir du code source ci-dessous.`
            />
          </p>
          <div
            className=%twc(
              "flex flex-row flex-wrap justify-around rounded border border-gray shadow-sm \
               bg-gray_light py-4 mt-4"
            )>
            <div className=%twc("flex flex-col mx-4")>
              <Input.Num
                label={<Lang.String
                  english=`Yearly household income (€)`
                  french=`Ressources annuelles du ménage (€)`
                />}
                onChange={(event: ReactEvent.Form.t) => {
                  updateCurrentState({
                    ...allocFamInput,
                    income: Some(int_of_string(event->value)),
                  })
                }}
              />
            </div>
            <div className=%twc("flex flex-col mx-4")>
              <Input.Browsers
                label={<Lang.String french=`Résidence du ménage` english=`Household residence` />}
                onChange={(event: ReactEvent.Form.t) => {
                  updateCurrentState({
                    ...allocFamInput,
                    residence: event->value,
                  })
                }}
                options={[
                  `Métropole`,
                  `Guyane`,
                  `Guadeloupe`,
                  `La Réunion`,
                  `Martinique`,
                  `Mayotte`,
                  `Saint Barthélemy`,
                  `Saint Martin`,
                  `Saint Pierre et Miquelon`,
                ]}
              />
            </div>
            <div className=%twc("flex flex-col mx-4")>
              <Input.Date
                label={<Lang.String english="Date of the computation" french=`Date du calcul` />}
                onChange={(event: ReactEvent.Form.t) => {
                  updateCurrentState({
                    ...allocFamInput,
                    currentDate: Some(event->value->Js.Date.fromString),
                  })
                }}
              />
            </div>
            <div className=%twc("flex flex-col mx-4")>
              <Input.CheckBox
                label={<Lang.String
                  english="Rights open before 2021" french=`Droits ouverts avant 2012`
                />}
                onChange={_ => {
                  updateCurrentState({
                    ...allocFamInput,
                    avaitEnfantAChargeAvant1erJanvier2012: switch allocFamInput.avaitEnfantAChargeAvant1erJanvier2012 {
                    | None | Some(false) => Some(true)
                    | Some(true) => Some(false)
                    },
                  })
                }}
              />
            </div>
            <div className=%twc("flex flex-col mx-4")>
              <Input.Num
                label={<Lang.String english="Number of children" french=`Nombre d'enfants` />}
                onChange={(event: ReactEvent.Form.t) => {
                  let value = event->value
                  updateCurrentState({
                    ...allocFamInput,
                    numChildren: value,
                    children: if value <= 0 {
                      []
                    } else {
                      Array.init(value, i => {
                        if i >= Array.length(allocFamInput.children) {
                          emptyChild(i)
                        } else {
                          allocFamInput.children[i]
                        }
                      })
                    },
                  })
                }}
              />
            </div>
            {React.array(
              allocFamInput.children->Belt.Array.mapWithIndex((i, _) => {
                <div
                  className=%twc(
                    "flex flex-col border-gray shadow-sm border border-solid rounded py-2 my-2"
                  )
                  key={"child-input-" ++ string_of_int(i)}>
                  <Input.Date
                    label={<>
                      <Lang.String english=`Child n°` french=`Enfant n°` />
                      {React.string(string_of_int(i + 1))}
                      <Lang.String english=": birthdate" french=` : date de naissance` />
                    </>}
                    onChange={(event: ReactEvent.Form.t) => {
                      let children = allocFamInput.children
                      children[i] = {
                        ...children[i],
                        birthDate: Some(event->value->Js.Date.fromString),
                      }
                      updateCurrentState({...allocFamInput, children: children})
                    }}
                  />
                  <Input.Browsers
                    label={<>
                      <Lang.String english=`Child n°` french=`Enfant n°` />
                      {React.string(string_of_int(i + 1))}
                      <Lang.String english=": custody" french=` :prise en charge` />
                    </>}
                    onChange={(event: ReactEvent.Form.t) => {
                      let children = allocFamInput.children
                      children[i] = {
                        ...children[i],
                        priseEnCharge: Some(event->value),
                      }
                      updateCurrentState({...allocFamInput, children: children})
                    }}
                    options={[
                      `Effective et permanente`,
                      `Garde alternée, allocataire unique`,
                      `Garde alternée, partage des allocations`,
                      `Confié aux service sociaux, allocation versée à la famille`,
                      `Confié aux service sociaux, allocation versée aux services sociaux`,
                    ]}
                  />
                  <Input.Num
                    label={<>
                      <Lang.String english=`Child n°` french=`Enfant n°` />
                      {React.string(string_of_int(i + 1))}
                      <Lang.String
                        english=`: monthly income (€)` french=` : rémunération mensuelle (€)`
                      />
                    </>}
                    onChange={(event: ReactEvent.Form.t) => {
                      let children = allocFamInput.children
                      children[i] = {
                        ...children[i],
                        monthlyIncome: Some(int_of_string(event->value)),
                      }
                      updateCurrentState({...allocFamInput, children: children})
                    }}
                  />
                  <Input.CheckBox
                    label={<>
                      <Lang.String english=`Child n°` french=`Enfant n°` />
                      {React.string(string_of_int(i + 1))}
                      <Lang.String
                        english=": has already been eligible for benefits"
                        french=` : a déjà ouvert des droits aux allocations`
                      />
                    </>}
                    onChange={_ => {
                      let children = allocFamInput.children
                      children[i] = {
                        ...children[i],
                        aDejaOuvertDroitAllocationsFamiliales: switch children[i].aDejaOuvertDroitAllocationsFamiliales {
                        | None | Some(false) => Some(true)
                        | Some(true) => Some(false)
                        },
                      }
                      updateCurrentState({...allocFamInput, children: children})
                    }}
                  />
                </div>
              }),
            )}
          </div>
        </Section>
      </>
    }
  }

  module ComputationResult = {
    @react.component
    let make = (
      ~formOutput: option<allocationsFamilialesInputValidated>,
      ~setEventsOpt: (option<array<LogEvent.event>> => option<array<LogEvent.event>>) => unit,
    ) => {
      {
        React.useEffect2(() => {
          setEventsOpt(_ => {
            let logs = retrieveEventsSerialized()->LogEvent.deserializedEvents
            if 0 == logs->Belt.Array.size {
              None
            } else {
              Some(logs)
            }
          })
          None
        }, (formOutput, setEventsOpt))
      }

      <div
        className=%twc(
          "inline-flex flex-col justify-center place-items-center \
          my-4 border border-gray border-solid rounded p-4 shadow-sm \
          bg-gray_light text-gray_dark"
        )>
        {switch computeAllocationsFamiliales(formOutput) {
        | Error(msg) => <div className=%twc("font-bold")> msg </div>
        | Result(amount) => <>
            <div className=%twc("pr-2 font-semibold")>
              <Lang.String
                english="Family benefits monthly amount:"
                french=`Montant mensuel des allocations familiales :`
              />
            </div>
            <div className=%twc("flex flex-row justify-center")>
              <div className=%twc("font-bold whitespace-nowrap")>
                <span className=%twc("text-mb font-mono")> {React.float(amount)} </span>
                {React.string(` €`)}
              </div>
            </div>
          </>
        }}
      </div>
    }
  }

  @react.component
  let make = (
    ~setEventsOpt: (option<array<LogEvent.event>> => option<array<LogEvent.event>>) => unit,
  ) => {
    let (formOutput, setFormOutput) = React.useState(_ => {
      None
    })

    <> <Form setFormOutput /> <ComputationResult formOutput setEventsOpt /> </>
  }
}

module Visualizer = Visualization.Make(Simulator)

@react.component
let make = () => {
  <>
    <Title> title </Title>
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
    <Simulator setEventsOpt={_ => ()} />
    <div className=%twc("inline-flex justify-end")>
      <Button.Internal
        target={[Nav.home, Nav.examples, Nav.frenchFamilyBenefitsExample, Nav.visualization]}>
        <Icon className=%twc("pr-2") name="explore" />
        <Lang.String
          english="Explore the execution trace" french=`Explorer la trace d'exécution`
        />
      </Button.Internal>
    </div>
    <Section title={<Lang.String english="Source code" french=`Code source` />}>
      <CatalaCode.DangerouslySetInnerHtml
        html=%raw(`require("../../assets/allocations_familiales.html")`)
      />
    </Section>
  </>
}
