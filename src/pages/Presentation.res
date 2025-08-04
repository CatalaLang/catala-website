let bookLink = "https://book.catala-lang.org"
let githubLink = "https://github.com/CatalaLang/catala"
let githubLinkLatestRelease = "https://github.com/CatalaLang/catala/releases/latest"
let zulipLink = "https://zulip.catala-lang.org/"
let apolloLink = "https://apollo.inria.fr"
let inriaLink = "https://inria.fr"
let demoLink = "https://code.gouv.fr/demos/catala"

type imgLocation = {default: string}

let inria_logo: imgLocation = %raw("require('../../assets/inr_logo_rouge.svg')")

let frenchHomepage: string = %raw(`require("../../assets/french_homepage.html")`)

let englishHomepage: string = %raw(`require("../../assets/english_homepage.html")`)

// Dans about : narration du projet (histoire)
// Features: réécrire

@react.component
let make = () => {
  <div className=%twc("flex flex-col gap-32")>
    <div className=%twc("flex flex-col justify-center items-center")>
      <div
        className=%twc(
          "pt-32 pb-16 text-center text-2xl sm:text-4xl text-background italic font-sans font-semibold max-w-2xl sm:max-w-3xl"
        )>
        <p>
          <Lang.String english="A domain-specific language" french={`Un langage spécifique`} />
        </p>
        <p>
          <Lang.String english="designed by researchers" french={`conçu par des chercheurs`} />
        </p>
        <p>
          <Lang.String
            english="in Computer Science and Law," french={`en informatique et en droit,`}
          />
        </p>
        <p>
          <Lang.String
            english="for precisely deriving algorithms"
            french={`pour l'écriture précise d'algorithmes`}
          />
        </p>
        <p>
          <Lang.String
            english="producing automated legal decisions."
            french={`appliquant automatiquement du droit.`}
          />
        </p>
      </div>
      <div
        className=%twc("inline-flex flex-row justify-between content-center text-xl font-semibold")>
        <Link.Internal
          className=%twc("cursor-pointer text-green hover:text-button_fg_hover pr-4 text-center")
          target={[Nav.home, Nav.about]}>
          <Lang.String english="Who are we?" french={`Qui sommes-nous?`} />
        </Link.Internal>
        <Link.Text
          className=%twc("cursor-pointer text-green hover:text-button_fg_hover pl-4 text-center")
          target=zulipLink>
          <Lang.String english="Contact us on Zulip" french={`Contactez-nous sur Zulip`} />
        </Link.Text>
      </div>
      <div className=%twc("inline-flex flex-row gap-4")>
        <Link.Button.Internal target=[Nav.home, Nav.doc]>
          <Lang.String english="Read the documentation" french={`Lire la documentation`} />
        </Link.Button.Internal>
        <Link.Button target={demoLink}>
          <Lang.String english="See the demo" french={`Voir la démo`} />
        </Link.Button>
        <Link.Button target={githubLink}>
          <Lang.String english="Get started on GitHub" french={`Démarrer sur GitHub`} />
        </Link.Button>
      </div>
      <div className=%twc("text-base font-sans")>
        <Lang.String english="Apache-2.0 License" french={`Licence Apache-2.0`} />
        <Link.Text
          className=%twc("cursor-pointer text-green hover:text-button_fg_hover pl-2 font-semibold")
          target={githubLinkLatestRelease}>
          <Lang.String english="GitHub v1.0.0-alpha" french={`GitHub v1.0.0-alpha`} />
        </Link.Text>
      </div>
      <div
        className=%twc("inline-flex flex-row flex-wrap mt-16 mb-16 items-end place-content-center")>
        <p className=%twc("text-center")>
          <Lang.String
            english="Made with ❤️ by the " french={`Développé avec ❤️ par le `}
          />
          <Link.Text target=apolloLink>
            <Lang.String english="Apollo program" french={`programme Apollo`} />
          </Link.Text>
          <Lang.String english=", managed by" french={`, piloté par`} />
        </p>
        <Link.Text target=inriaLink className=%twc("no-underline")>
          <img className=%twc("ml-4 mt-2 w-48") src={inria_logo.default} />
        </Link.Text>
      </div>
    </div>
    <div className=%twc("flex flex-col flex-wrap content-center justify-center items-center mb-32")>
      <div className=%twc("w-full lg:w-3/5 text-background text-center text-3xl font-bold pb-4")>
        <Lang.String english="What does Catala look like?" french={`À quoi ressemble Catala ?`} />
      </div>
      <div className=%twc("w-full lg:w-3/5 border-solid mb-4")>
        <p className=%twc("text-base sm:text-lg my-4 italic")>
          <Lang.String
            english="Catala works by annotating legislative texts with their code translation,
            by z programmer and a lawyer pair-programming together.
            For instance, from the US Tax Code:"
            french={`Le principe de Catala est d'annoter directement les textes législatifs ou règlementaires
            avec leur traduction en termes algorithmique, grâce à la collaboration en temps réel entre un·e programmeur·e
            et un·e juriste. Par exemple, à partir
            du code de la sécurité sociale :`}
          />
        </p>
        <Lang.Element
          french={<CatalaCode.DangerouslySetInnerHtml html=frenchHomepage />}
          english={<CatalaCode.DangerouslySetInnerHtml html=englishHomepage />}
        />
      </div>
      <Link.Button.Internal target=[Nav.home, Nav.features]>
        <Lang.String english="Discover the features" french={`Découvrir les fonctionnalités`} />
      </Link.Button.Internal>
    </div>
  </div>
}
