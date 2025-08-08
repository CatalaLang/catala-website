let github_link = "https://github.com/CatalaLang/catala-website/issues"

@react.component
let make = React.memo(() => {
  <footer className="pt-2 font-sans text-center">
    <div className="text-gray_dark pb-2 text-xs font-semibold">
      {
        let today = Js.Date.now()->Js.Date.fromFloat->Js.Date.getFullYear->Js.String2.make
        React.string("© " ++ today ++ " Inria — ")
      }
      <Lang.String
        english="Website managed by the Catala team"
        french={`Ce site est géré par l'équipe de Catala`}
      />
    </div>
  </footer>
})
