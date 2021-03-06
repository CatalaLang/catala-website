let github_link = "https://github.com/CatalaLang/catala-website/issues"

@react.component
let make = () =>
  <footer className=%tw("bg-secondary pt-4")>
    <div className=%tw("text-white pb-4 pr-6 text-right")>
      {React.string("Copyright 2020 Inria")}
    </div>
    <div className=%tw("bg-yellow text-center")>
      <span>
        <i className="float-left pl-4 material-icons"> {React.string("warning")} </i>
        <a className=%tw("w-auto") href=github_link>
          <Lang.String
            english="This website is under construction, click here to give some feedback"
            french=`Ce site Internet est en cours de construction. Cliquez ici pour faire parvenir vos remarques et commentaires.`
          />
          <i className="float-right pr-4 material-icons"> {React.string("warning")} </i>
        </a>
      </span>
    </div>
  </footer>
