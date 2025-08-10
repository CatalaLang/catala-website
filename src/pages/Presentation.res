let bookLink = "https://book.catala-lang.org"
let githubLink = "https://github.com/CatalaLang/catala"
let githubLinkLatestRelease = "https://github.com/CatalaLang/catala/releases/latest"
let zulipLink = "https://zulip.catala-lang.org/"
let apolloLink = "https://apollo.inria.fr"
let inriaLink = "https://inria.fr"
let demoLink = "https://code.gouv.fr/demos/catala"

// Dans about : narration du projet (histoire)
// Features: réécrire

@react.component
let make = () => {
  <div className="flex flex-col gap-24">
    <section className="px-8 flex flex-col">
      <h1 className="text-3xl max-w-3xl mt-32 mb-16 font-serif leading-tight">
        <Lang.String
          english="A domain-specific language designed by researchers in "
          french={`Un langage spécifique conçu par des chercheur·euses en `}
        />
        <span className="bg-primary_light/10 px-2">
          <Lang.String english="Computer Science and Law" french={`informatique et en droit`} />
        </span>
        <Lang.String
          english=", for precisely deriving algorithms "
          french={`, pour l'écriture précise d'algorithmes `}
        />
        <span className="bg-primary_light/10 px-2">
          <Lang.String
            english="producing automated legal decisions"
            french={`appliquant automatiquement du droit`}
          />
        </span>
      </h1>
      <div
        className="text-center text-2xl sm:text-4xl text-background italic font-sans font-semibold max-w-2xl sm:max-w-3xl"
      />
      // <div className="inline-flex flex-row content-center text-xl font-semibold">
      //   <Link.Internal
      //     className="cursor-pointer text-primary_dark hover:text-button_fg_hover pr-4 text-center"
      //     target={[Nav.home, Nav.about]}>
      //     <Lang.String english="Who are we?" french={`Qui sommes-nous?`} />
      //   </Link.Internal>
      //   <Link.Text
      //     className="cursor-pointer text-primary_dark hover:text-button_fg_hover pl-4 text-center"
      //     target=zulipLink>
      //     <Lang.String english="Contact us on Zulip" french={`Contactez-nous sur Zulip`} />
      //   </Link.Text>
      // </div>
      <div className="inline-flex flex-col gap-4 mb-4">
        <Link.Button.Internal target=[Nav.home, Nav.doc]>
          <Lang.String english="Read the documentation" french={`Lire la documentation`} />
        </Link.Button.Internal>
        <div className="inline-flex gap-4">
          <Link.Button target={demoLink}>
            <Lang.String english="See the demo" french={`Voir la démo`} />
          </Link.Button>
          <Link.Button target={githubLink}>
            <Lang.String english="Get started on GitHub" french={`Démarrer sur GitHub`} />
          </Link.Button>
        </div>
      </div>
      <div>
        <Lang.String english="Apache-2.0 License" french={`Licence Apache-2.0`} />
        <Link.Text className="ml-2" target={githubLinkLatestRelease}>
          <Lang.String english="GitHub v1.0.0-alpha" french={`GitHub v1.0.0-alpha`} />
        </Link.Text>
      </div>
    </section>
    <div
      className="w-full border-y py-2 border-border bg-primary_light/5 inline-flex flex-row flex-wrap items-center justify-center">
      <p className="text-center">
        <Lang.String
          english="Made with ❤️ within the "
          french={`Développé avec ❤️ dans le cadre du `}
        />
        <Link.Text target=apolloLink>
          <Lang.String english="Apollo program" french={`programme Apollo`} />
        </Link.Text>
        <Lang.String english=", managed by" french={`, piloté par`} />
      </p>
      <Link.Text target=inriaLink className="no-underline" internal=true>
        <img className="ml-3 h-8 pb-2" src={Assets.Image.logo_inria} />
      </Link.Text>
    </div>
    <section className="px-8 flex flex-row gap-8 items-start">
      <div className="flex flex-col gap-8 flex-2/3">
        <h2>
          <Lang.String
            english="What does Catala look like?" french={`À quoi ressemble Catala ?`}
          />
        </h2>
        <div>
          <p className="mb-4 max-w-2xl">
            <Lang.String
              english="Catala works by annotating legislative texts with their code translation,
            by a programmer and a lawyer pair-programming together."
              french={`Le principe de Catala est d'annoter directement les textes législatifs ou règlementaires
            avec leur traduction en termes algorithmique, grâce à la collaboration en temps réel entre un·e programmeur·e
            et un·e juriste.`}
            />
          </p>
          <Link.Internal target=[Nav.home, Nav.features] className="italic">
            <Lang.String
              english="Discover the features" french={`Découvrir les fonctionnalités`}
            />
          </Link.Internal>
          // <Link.Button.Internal.Small target=[Nav.home, Nav.features]>
          //   <Lang.String
          //     english="Discover the features" french={`Découvrir les fonctionnalités`}
          //   />
          // </Link.Button.Internal.Small>
        </div>
      </div>
      <div className="max-w-1/2">
        <Lang.Element
          french={<CatalaCode.DangerouslySetInnerHtml htmlFile="french_homepage.html" />}
          english={<CatalaCode.DangerouslySetInnerHtml htmlFile="english_homepage.html" />}
        />
        <p
          className="italic text-sm p-2 px-4 border-x border-b border-border bg-stone-100 rounded-b-sm text-stone-600">
          <Lang.String
            english="Example of Catala code from the US Tax Code."
            french={`Example de code Catala tiré du code de la sécurité sociale.`}
          />
        </p>
      </div>
    </section>
  </div>
}
