let github_link = "https://github.com/CatalaLang/catala";

[@react.component]
let make = () => {
  <main>
    <div className="row">
      <div className="col s10 offset-s1 m8 offset-m2 xl6 offset-xl3">
        <div className="center-align">
          <p className="flow-text">
            {React.string(
               "Catala is a domain-specific programming Language design for deriving correct-by-construction
          implementations from legislative texts and offical rules.",
             )}
          </p>
        </div>
      </div>
    </div>
    <div className="row center">
      <a
        className="waves-effect waves-light btn-large primary-color"
        href=github_link>
        {React.string([@reason.preserve_braces] "Get started")}
        <i className="material-icons right"> {React.string("code")} </i>
      </a>
    </div>
    <div className="row">
      <div className="col s12 l6">
        <div className="card secondary-color">
          <div className="card-content white-text">
            <span className="card-title">
              {React.string("Close to the source of truth")}
            </span>
            <p>
              <strong>
                {React.string(
                   "A program supposed to stick to the law, should reside next to the law.",
                 )}
              </strong>
            </p>
            <blockquote> {React.string("Coucou")} </blockquote>
          </div>
        </div>
      </div>
      <div className="col s12 l6">
        <div className="card secondary-color">
          <div className="card-content white-text">
            <span className="card-title"> {React.string("Card Title")} </span>
            <p>
              {React.string(
                 "I am a very simple card. I am good at containing small bits of information.
             I am convenient because I require little markup to use effectively.",
               )}
            </p>
          </div>
        </div>
      </div>
      <div className="col s12 l6">
        <div className="card secondary-color">
          <div className="card-content white-text">
            <span className="card-title"> {React.string("Card Title")} </span>
            <p>
              {React.string(
                 "I am a very simple card. I am good at containing small bits of information.
             I am convenient because I require little markup to use effectively.",
               )}
            </p>
          </div>
        </div>
      </div>
      <div className="col s12 l6">
        <div className="card secondary-color">
          <div className="card-content white-text">
            <span className="card-title"> {React.string("Card Title")} </span>
            <p>
              {React.string(
                 "I am a very simple card. I am good at containing small bits of information.
             I am convenient because I require little markup to use effectively.",
               )}
            </p>
          </div>
        </div>
      </div>
    </div>
  </main>;
};
