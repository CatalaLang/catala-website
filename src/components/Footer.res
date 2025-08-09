let github_link = "https://github.com/CatalaLang/catala-website/issues"
let catala_book_link = "https://book.catala-lang.org"
let zulip_link = "https://zulip.catala-lang.org/"
let calinou_link = "TODO"

@react.component
let make = React.memo(() => {
  let footerInternalLinkStyle = "text-sm !text-gray_dark hover:!text-button_fg_hover border-b border-transparent hover:border-primary_dark cursor-pointer w-fit"
  <footer className="py-8 max-w-6xl mx-auto font-sans flex justify-between">
    <div className="inline-flex flex-col gap-4 max-w-xl">
      <div className="text-gray_dark pb-2 text-sm">
        <Lang.String
          english="The content and hosting of this site are managed by "
          french={`Le contenu et l'hébergement de ce site sont gérés par `}
        />
        <Link.Internal
          className="cursor-pointer text-primary_dark hover:text-button_fg_hover hover:border-b border-solid border-primary_dark "
          target={[Nav.home, Nav.about]}>
          <Lang.String english="the Catala team" french={`l'équipe Catala`} />
        </Link.Internal>
        <Lang.String
          english=". The design and development were done by "
          french={`. Le design et le développement ont été réalisés par `}
        />
        <Link.Text target=calinou_link>
          <Lang.String english="Calinou" french={`Calinou`} />
        </Link.Text>
        {"."->React.string}
      </div>
      <div className="inline-flex flex-row gap-4 items-center">
        <span className="text-gray_dark text-sm">
          {
            let today = Js.Date.now()->Js.Date.fromFloat->Js.Date.getFullYear->Js.String2.make
            React.string("© " ++ today ++ " Inria — ")
          }
        </span>
        <img className="h-10" src={Assets.Image.logo_catala} />
        <img className="h-10" src={Assets.Image.logo_inria} />
      </div>
    </div>
    <div className="inline-flex flex-row gap-8">
      <div className="inline-flex flex-col">
        <p className="font-semibold text-stone-800 pb-2 font-serif">
          <Lang.String english="Ressources" french={`Ressources`} />
        </p>
        <Link.Internal className=footerInternalLinkStyle target={[Nav.home, Nav.doc]}>
          <Lang.String english="About" french={`À propos`} />
        </Link.Internal>
        <Link.Internal className=footerInternalLinkStyle target={[Nav.home, Nav.doc]}>
          <Lang.String english="Documentation" french={`Documentation`} />
        </Link.Internal>
        <Link.Internal className=footerInternalLinkStyle target={[Nav.home, Nav.features]}>
          <Lang.String english="Features" french={`Fonctionnalités`} />
        </Link.Internal>
        <Link.Internal className=footerInternalLinkStyle target={[Nav.home, Nav.features]}>
          <Lang.String english="Seminaires" french={`Seminars`} />
        </Link.Internal>
        <Link.Text className=footerInternalLinkStyle target=catala_book_link>
          <Lang.String english="The Language Book" french={`Le livre du langage`} />
        </Link.Text>
      </div>
      <div className="inline-flex flex-col">
        <p className="font-semibold text-stone-800 pb-2 font-serif">
          <Lang.String english="Social" french={`Communauté`} />
        </p>
        <Link.Text className=footerInternalLinkStyle target=github_link>
          <Lang.String english="GitHub" french={`GitHub`} />
        </Link.Text>
        <Link.Text className=footerInternalLinkStyle target=zulip_link>
          <Lang.String english="Zulip" french={`Zulip`} />
        </Link.Text>
      </div>
    </div>
  </footer>
})
