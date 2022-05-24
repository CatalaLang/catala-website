%raw(`require("../../assets/catala_code.css")`)

open PageComponents

@react.component
let make = () => <>
  <Title> <Lang.String english="Catala examples" french=`Exemples de programmes Catala` /> </Title>
  <Card.Presentation.FromList
    cards=[
      TutorialEnExample.card,
      TutorialFrExample.card,
      FrenchFamilyBenefitsExample.card,
      USTaxCodeExample.card,
    ]
  />
</>
