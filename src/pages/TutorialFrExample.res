open PageComponents

let card: Card.Presentation.t = {
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
  <Title>
    <Lang.String
      english="French tutorial for Catala developers"
      french=`Catala: tutoriel pour programmeurs francophones`
    />
  </Title>
  <div
    className="catala-code"
    dangerouslySetInnerHTML={
      "__html": %raw(`require("../../assets/tutoriel_fr.html")`),
    }
  />
</>
