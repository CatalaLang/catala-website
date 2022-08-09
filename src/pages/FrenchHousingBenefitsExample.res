open PageComponents
let pageTitle =
  <Lang.String
    english="French housing benefits computation" french={`Calcul des aides au logement`}
  />

let catalaCodeHTML = %raw(`require("../../assets/aides_logement.html")`)

module FormInfos = {
  let englishSchema = %raw(`require("../../assets/aides_logement_schema_en.json")`)
  let frenchSchema = %raw(`require("../../assets/aides_logement_schema_fr.json")`)

  let englishUiSchema = %raw(`require("../../assets/aides_logement_ui_schema_en.json")`)
  let frenchUiSchema = %raw(`require("../../assets/aides_logement_ui_schema_fr.json")`)

  let resultLabel =
    <Lang.String
      english="Housing benefits monthly amount:" french={`Montant mensuel des aides au logement :`}
    />

  let initFormData = Some(
    Js.Json.parseExn(`
  {
  "dateCouranteIn": "2022-01-01",
  "menageIn": {
    "prestationsRecues": [
      {"kind": "AllocationSoutienEnfantHandicape", "payload": null},
      {"kind": "ComplementFamilial", "payload": null},
      {"kind": "AllocationsFamiliales", "payload": null}
    ],
    "situationFamiliale": {
      "kind": "Maries",
      "payload": "2010-11-26"
    },
    "personnesACharge": [
      {
        "kind": "EnfantACharge",
        "payload": {
          "beneficieTitrePersonnelAidePersonnelleLogement": false,
          "priseEnCharge": {"kind": "EffectiveEtPermanente", "payload": null},
          "age": 19,
          "identifiant": 0,
          "aDejaOuvertDroitAuxAllocationsFamiliales": true,
          "dateDeNaissance": "2003-01-01",
          "remunerationMensuelle": 0,
          "obligationScolaire": {"kind": "Apres", "payload": null},
          "situationGardeAlternee": {
            "kind": "GardeAlterneeCoefficientPriseEnCharge",
            "payload": 0.5
          }
        }
      },
      {
        "kind": "EnfantACharge",
        "payload": {
          "beneficieTitrePersonnelAidePersonnelleLogement": false,
          "priseEnCharge": {"kind": "EffectiveEtPermanente", "payload": null},
          "age": 11,
          "identifiant": 1,
          "aDejaOuvertDroitAuxAllocationsFamiliales": true,
          "dateDeNaissance": "2011-01-01",
          "remunerationMensuelle": 0,
          "obligationScolaire": {"kind": "Pendant", "payload": null},
          "situationGardeAlternee": {
            "kind": "PasDeGardeAlternee",
            "payload": null
          }
        }
      },
      {
        "kind": "EnfantACharge",
        "payload": {
          "beneficieTitrePersonnelAidePersonnelleLogement": false,
          "priseEnCharge": {"kind": "EffectiveEtPermanente", "payload": null},
          "age": 8,
          "identifiant": 2,
          "aDejaOuvertDroitAuxAllocationsFamiliales": true,
          "dateDeNaissance": "2014-01-01",
          "remunerationMensuelle": 0,
          "obligationScolaire": {"kind": "Pendant", "payload": null},
          "situationGardeAlternee": {
            "kind": "PasDeGardeAlternee",
            "payload": null
          }
        }
      }
    ],
    "logement": {
      "zone": {"kind": "Zone1", "payload": null},
      "residencePrincipale": true,
      "estEhpadOuMaisonAutonomieL31312Asf": false,
      "modeOccupation": {
        "kind": "Locataire",
        "payload": {
          "bailleur": {
            "typeBailleur": {"kind": "BailleurPrive", "payload": null},
            "respecteConventionTitreV": true,
            "respecteConventionTitreII": true,
            "construitAmelioreConditionsL83114": false,
            "acquisitionAidesEtatPretTitreIIOuLivreIII": false
          }
        }
      },
      "proprietaire": {"kind": "Autre", "payload": null},
      "loueOuSousLoueADesTiers": {"kind": "Non", "payload": null},
      "usufruit": {"kind": "Autre", "payload": null},
      "logementDecentL89462": true,
      "loyersL8233": 700,
      "surfaceMCarres": 80,
      "estAncienL8312": false,
      "situeCommuneDesequilibreL8312": false
    },
    "nombreAutresOccupantsLogement": 1,
    "conditionRattacheFoyerFiscalParentIfi": false,
    "nombreEnfantsANaitreApresTroisiemeMoisGrossesse": 0,
    "enfantANaitreApresQuatriemeMoisGrossesse": false,
    "dateNaissanceTroisiemeEnfantOuDernierSiPlus": {
      "kind": "PlusDeTroisEnfants",
      "payload": {
        "kind": "DateDeNaissance",
        "payload": "2014-09-15"
      }
    }
  },
  "demandeurIn": {
    "personneHebergeeCentreSoinLL162223SecuriteSociale": false,
    "satisfaitConditionsL5122CodeSecuriteSociale": true,
    "ageDemandeur": 52,
    "dateNaissance": "1970-05-02",
    "contratDeTravail": {"kind": "CDI", "payload": null},
    "nationalite": {"kind": "Francaise", "payload": null},
    "patrimoine": {
      "produisantRevenuPeriodeR82233R8224": 0,
      "neProduisantPasRevenuPeriodeR82233R8224": 0
    }
  },
  "informationsCalculIn": {
    "kind": "InfosLocatif",
    "payload": {
      "loyerPrincipal": 1700,
      "beneficiaireAideAdulteOuEnfantHandicapes": false,
      "logementEstChambre": false,
      "colocation": false,
      "ageesOuHandicapAdultesHebergeesOnereuxParticuliers": false,
      "reductionLoyerSolidarite": 0,
      "logementMeubleD8422": false,
      "changementLogementD8424": {
        "kind": "PasDeChangement",
        "payload": null
      }
    }
  },
  "ressourcesMenagePrisesEnCompteIn": 20000
}`),
  )

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
      <Form setEventsOpt={_ => ()} />
    </Section>
    <Section title={<Lang.String english="Source code" french={`Code source`} />}>
      <CatalaCode.DangerouslySetInnerHtml html=catalaCodeHTML />
    </Section>
  </>
}
