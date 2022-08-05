open PageComponents

@react.component
let make = () => <>
  <Title> <Lang.String english="Catala examples" french=`Exemples de programmes Catala` /> </Title>
  <Card.Presentation.FromList
    cards=[
      TutorialEnExample.card,
      TutorialFrExample.card,
      FrenchFamilyBenefitsExample.card,
      FrenchHousingBenefitsExample.card,
      USTaxCodeExample.card,
    ]
  />
</>
