open PageComponents
let pageTitle =
  <Lang.String
    english="French housing benefits computation" french={`Calcul des aides au logement`}
  />

let catalaCodeHTML = %raw(`require("../../assets/aides_logement.html")`)
let frenchUiSchema = %raw(`require("../../assets/aides_logement_ui_fr.schema.js")`)
let englishUiSchema = %raw(`require("../../assets/aides_logement_ui_en.schema.js")`)

module FormInfos = {
  let englishSchema = %raw(`require("../../assets/aides_logement_schema_en.json")`)
  let frenchSchema = %raw(`require("../../assets/aides_logement_schema_fr.json")`)

  let frenchUiSchema = Js.Dict.unsafeGet(frenchUiSchema, "uiSchema")

  let englishUiSchema = Js.Dict.unsafeGet(englishUiSchema, "uiSchema")

  let resultLabel =
    <Lang.String
      english="Housing benefits gross monthly amount:"
      french={`Montant mensuel brut des aides au logement :`}
    />

  let initFormData = Some(
    %raw(`
{
    "menageIn": {
        "prestationsRecues": [],
        "logement": {
            "residencePrincipale": true,
            "estEhpadOuMaisonAutonomieL31312Asf": false,
            "modeOccupation": {
                "kind": "Locataire",
                "payload": {
                    "bailleur": {
                      "kind": "BailleurPrive"
                    },
                    "beneficiaireAideAdulteOuEnfantHandicapes": false,
                    "logementEstChambre": false,
                    "colocation": false,
                    "ageesOuHandicapAdultesHebergeesOnereuxParticuliers": false,
                    "reductionLoyerSolidarite": 0,
                    "logementMeubleD8422": false,
                    "changementLogementD8424": {
                        "kind": "PasDeChangement",
                        "payload": null
                    },
                    "loyerPrincipal": 450
                }
            },
            "proprietaire": {
                "kind": "Autre",
                "payload": null
            },
            "loueOuSousLoueADesTiers": {
                "kind": "Non"
            },
            "usufruit": {
                "kind": "Autre",
                "payload": null
            },
            "logementDecentL89462": true,
            "zone": {
                "kind": "Zone2"
            },
            "surfaceMCarres": 65
        },
        "personnesACharge": [
            {
                "kind": "EnfantACharge",
                "payload": {
                    "beneficieTitrePersonnelAidePersonnelleLogement": false,
                    "aDejaOuvertDroitAuxAllocationsFamiliales": true,
                    "remunerationMensuelle": 0,
                    "obligationScolaire": {
                        "kind": "Pendant"
                    },
                    "situationGardeAlternee": {
                        "kind": "PasDeGardeAlternee"
                    },
                    "dateDeNaissance": "2015-01-01",
                    "identifiant": 0
                }
            },
            {
                "kind": "EnfantACharge",
                "payload": {
                    "beneficieTitrePersonnelAidePersonnelleLogement": false,
                    "aDejaOuvertDroitAuxAllocationsFamiliales": true,
                    "remunerationMensuelle": 0,
                    "obligationScolaire": {
                        "kind": "Pendant"
                    },
                    "situationGardeAlternee": {
                        "kind": "PasDeGardeAlternee"
                    },
                    "dateDeNaissance": "2016-01-01",
                    "identifiant": 1
                }
            }
        ],
        "nombreAutresOccupantsLogement": 0,
        "situationFamiliale": {
            "kind": "Concubins",
            "payload": null
        },
        "conditionRattacheFoyerFiscalParentIfi": false,
        "nombreEnfantsANaitreApresTroisiemeMoisGrossesse": 0,
    },
    "demandeurIn": {
        "nationalite": {
            "kind": "Francaise"
        },
        "patrimoine": {
            "produisantRevenuPeriodeR82233R8224": 0,
            "neProduisantPasRevenuPeriodeR82233R8224": 0
        },
        "personneHebergeeCentreSoinLL162223SecuriteSociale": false,
        "dateNaissance": "1992-01-01"
    },
    "dateCouranteIn": "2022-05-01",
    "ressourcesMenagePrisesEnCompteIn": 11500
}
`),
  )
  // This function automatically assigns numerical ID to kids so we don't
  // have to ask the question in the form
  let formDataPostProcessing = %raw(`
function (data) {
  var i = 0;
  for (var pac of data.menageIn.personnesACharge) {
    if (pac.kind == "EnfantACharge") {
      pac.payload.identifiant = i;
      i++;
    }
  }
  return data;
}`)

  let computeAndPrintResult = (input: Js.Json.t): React.element => <>
    <span className=%twc("text-mb font-mono")>
      {input->FrenchLaw.computeAidesAuLogement->React.float}
    </span>
    {React.string(` €`)}
  </>
}

module Form = Form.Make(FormInfos)

module Visualizer = Visualizer.Make({
  let pageTitle = pageTitle
  let catalaCodeHTML = catalaCodeHTML
  let resetLog = FrenchLaw.resetLog

  include Form
})

let card: Card.Presentation.t = {
  title: <Lang.String english="French housing benefits" french="Aides au logement" />,
  action: Some((
    Internal([Nav.home, Nav.examples, Nav.frenchHousingBenefitsExample]),
    <Lang.String english="See example" french={`Voir l'exemple`} />,
  )),
  icon: None,
  quote: None,
  content: <>
    <Lang.String
      english="The content of the example is generated by the Catala compiler from the "
      french={`Le contenu de cet exemple est généré par le compilateur Catala à partir des `}
    />
    <Link.Text target="https://github.com/CatalaLang/catala/tree/master/examples/aides_logement">
      <Lang.String english="source code files of the example" french={`sources de l'exemple`} />
    </Link.Text>
    <Lang.String
      english=". The code, like the legislative text it follows, is written in French." french="."
    />
  </>,
}

@react.component
let make = () => {
  <>
    <Title> pageTitle </Title>
    <p>
      <Lang.String
        english="The source code for this example is available "
        french={`Le code source de cet exemple est disponible `}
      />
      <Link.Text target="https://github.com/CatalaLang/catala/tree/master/examples/aides_logement">
        <Lang.String english="here" french={`ici`} />
      </Link.Text>
      <Lang.String
        english=". What you can see here is the \"weaved\" output of the source files processed by the Catala compiler.
        Weaving is a concept from "
        french={`. Ce que vous pouvez voir en dessous est la version "tissée" des fichiers sources transformés par le compilateur Catala.
        Le tissage est un concept issu de la `}
      />
      <Link.Text target="https://en.wikipedia.org/wiki/Literate_programming#Workflow">
        <Lang.String english="literate programming" french={`programmation littéraire`} />
      </Link.Text>
      <Lang.String
        english=" corresponding to the action of interleaving together the code and its textual documentation
         as to produce a reviewable and comprehensive document. Please refer to the tutorial for a hands-on introduction
          on how to read this document."
        french={` , qui correspond à l'action d'entremêler le code et sa documentation textuelle dans un document
         complet et lisible. Veuillez vous réferer au tutoriel pour savoir comment lire ce document.`}
      />
    </p>
    <Section title={<Lang.String english="Online computation" french={`Calculateur en ligne`} />}>
      <div className=%twc("inline-flex justify-end")>
        <Button.Internal
          target={[Nav.home, Nav.examples, Nav.frenchHousingBenefitsExample, Nav.visualization]}>
          <Icon className=%twc("pr-2") name="explore" />
          <Lang.String
            english="Switch to detailed explanation mode"
            french={`Basculer vers le mode explications détaillées`}
          />
        </Button.Internal>
      </div>
      <Form setEventsOpt={_ => ()} collapsible=true />
    </Section>
    <Section title={<Lang.String english="Source code" french={`Code source`} />}>
      <CatalaCode.DangerouslySetInnerHtml html=catalaCodeHTML />
    </Section>
  </>
}
