open PageComponents

@react.component
let make = () => <>
  <Title>
    <Lang.String english="Catala examples" french={`Exemples de programmes Catala`} />
  </Title>
  <Card.Presentation.FromList
    cards=[
      FrenchFamilyBenefitsExample.card,
      FrenchHousingBenefitsExample.card,
      USTaxCodeExample.card,
      IRcatala.card,
    ]
  />
</>
