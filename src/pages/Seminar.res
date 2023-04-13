open PageComponents
open People
open About

type seminar = {
  date: Js.Date.t,
  title: React.element,
  abstract: React.element,
  presenter: string,
  presenter_page_url: string,
}

module Seminar = {
  @react.component
  let make = (~seminar: seminar) =>
    <li className=%twc("pl-6 pb-4")>
      <span className=%twc("italic")>
        {Js.Date.toLocaleDateString(seminar.date) ++ ":" |> React.string}
      </span>
      <Link.Text className=%twc("pl-2") target=seminar.presenter_page_url>
        {React.string(seminar.presenter)}
      </Link.Text>
      <span> {" — " |> React.string} </span>
      <span className=%twc("font-bold")> {seminar.title} </span>
      <span> {" — " |> React.string} </span>
      <span> {seminar.abstract} </span>
    </li>
}

let seminar_2023_04_24 = {
  date: Js.Date.makeWithYMD(~year=2023.0, ~month=03.0, ~date=24.0, ()),
  title: <Lang.String english="Title to come" french={`Titre à venir`} />,
  presenter: "?",
  presenter_page_url: "/#",
  abstract: <Lang.String english="Abstract to come" french={`Résumé à venir`} />,
}

let seminar_2023_06_05 = {
  date: Js.Date.makeWithYMD(~year=2023.0, ~month=05.0, ~date=05.0, ()),
  title: <Lang.String english="Title to come" french={`Titre à venir`} />,
  presenter: "Didier Torny",
  presenter_page_url: "https://cv.hal.science/didier-torny",
  abstract: <Lang.String english="Abstract to come" french={`Résumé à venir`} />,
}

let seminar_2023_07_03 = {
  date: Js.Date.makeWithYMD(~year=2023.0, ~month=06.0, ~date=03.0, ()),
  title: <Lang.String english="Title to come" french={`Titre à venir`} />,
  presenter: "?",
  presenter_page_url: "/#",
  abstract: <Lang.String english="Abstract to come" french={`Résumé à venir`} />,
}

@react.component
let make = () => <>
  <Title>
    <Lang.String english="Seminar" french={`Séminaire`} />
  </Title>
  <div className=%twc("flex flex-col justify-center items-center")>
    <p>
      <Lang.String
        english="The Catala team hosts seminars at Inria Paris one Monday per month, from 17:00 to 18:30. The seminar happens in room Gilles Khan on the ground floor of the Inria Paris building located at 2 rue Simone Iff 75012."
        french={`L'équipe Catala organise des séminaires à l'Inria Paris un lundi par mois de 17:00 à 18:30. Le séminaire se tient dans la salle Gilles Khan au rez-de-chaussée du bâtiment de l'Inria Paris situé au 2 rue Simone Iff 75012.`}
      />
    </p>
    <Link.Button target={"https://sympa.inria.fr/sympa/subscribe/seminaire-catala"}>
      <Lang.String
        english="Subscribe to the seminar mailing list"
        french={`S'incrire à la newsletter du séminaire`}
      />
    </Link.Button>
  </div>
  <Section title={<Lang.String english="Upcoming seminars" french={`Séminaires à venir`} />}>
    <ul className=%twc("list-disc list-inside")>
      <Seminar seminar=seminar_2023_04_24 />
      <Seminar seminar=seminar_2023_06_05 />
      <Seminar seminar=seminar_2023_07_03 />
    </ul>
  </Section>
  <Section title={<Lang.String english="Organizers" french={`Organisateurs`} />}>
    <ul className=%twc("list-disc list-inside")>
      <Person person=marieAlauzen />
      <Person person=lianeHuttner />
      <Person person=denisMerigoux />
    </ul>
  </Section>
</>
