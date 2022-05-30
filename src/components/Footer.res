let github_link = "https://github.com/CatalaLang/catala-website/issues"

@react.component
let make = () =>
  <footer className=%twc("bg-secondary pt-4")>
    <div className=%twc("text-white pb-4 pr-6 text-right")>
      {React.string("Copyright 2020 Inria")}
    </div>
    <div className=%twc("bg-yellow text-center")>
      <span>
        <Icon className="float-left pl-4" name="warning" />
        <a className=%twc("w-auto") href=github_link>
          <Lang.String
            english="This website is under construction, click here to give some feedback"
            french=`Ce site Internet est en cours de construction. Cliquez ici pour faire parvenir vos remarques et commentaires.`
          />
          <Icon className="float-right pr-4" name="warning" />
        </a>
      </span>
    </div>
  </footer>
