let github_link = "https://github.com/CatalaLang/catala-website/issues"

// Needed to make internal links work in Firefox.
let windowOnLoad: unit => unit = %raw(`
  window.onload = function() {
  if (location.hash){
    var elId = location.hash.replace('#','');
    var scrollToEl = document.getElementById(elId);
    if (scrollToEl) {
      scrollToEl.scrollIntoView({block: "center"});
    }
  }
}
`)

@react.component
let make = () => {
  windowOnLoad()
  <footer className=%twc("pt-2 font-sans text-center")>
    <div className=%twc("text-gray_dark pb-2 text-xs font-semibold")>
      {
        let today = Js.Date.now()->Js.Date.fromFloat->Js.Date.getFullYear->Js.String2.make
        React.string("Copyright " ++ today ++ " Inria")
      }
    </div>
    <div className=%twc("bg-red pb-1")>
      <span>
        <a className=%twc("w-auto h-full text-background text-xs") href=github_link>
          <Icon className="float-left pl-4 pt-1" name="warning" />
          <Lang.String
            english="This website is under construction, click here to give some feedback"
            french=`Ce site Internet est en cours de construction. Cliquez ici pour faire parvenir vos remarques et commentaires.`
          />
          <Icon className="float-right pr-4 pt-1" name="warning" />
        </a>
      </span>
    </div>
  </footer>
}
