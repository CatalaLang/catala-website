let github_link = "https://github.com/CatalaLang/catala";

let catala_presentation_card =
    (title: string, content: React.element, action: option(React.element)) => {
  let action =
    switch (action) {
    | None => <div />
    | Some(action) => <div className="card-action"> action </div>
    };
  <div className="col s12 xl6 presentation-card">
    <div className="card secondary-color">
      <div className="card-content white-text">
        <span className="card-title"> {React.string(title)} </span>
        content
      </div>
      action
    </div>
  </div>;
};

let literate_progrmming_content =
  <>
    <blockquote>
      <strong>
        {React.string("A program that should to stick to the law, should reside next to the law.")}
      </strong>
    </blockquote>
    <p>
      {React.string(
         "Implementations derived from legislative texts are hard to get right.
      The specification for how one quantity is computed may be scattered accross various places in your
      legislative source. Catala addressess this problem by interleaving the legislative source with the
      code that models it. To implement your program, just follow what the law says!",
       )}
    </p>
  </>;

let literate_programming_action =
  <a href="#"> {React.string("Example: French family benefits computation")} </a>;

let multiple_targets_content =
  <>
    <blockquote>
      <strong> {React.string("Simple code should be executed simply")} </strong>
    </blockquote>
    <p>
      {React.string(
         "Code derived from legislation generally uses basic programming concepts, that are present
  in every programming language. Why would you need a complex rules engine or runtime to execute that code?
  Catala uses a fully-fledged compiler to bring you the code you need, in the programming language you need.
  That also include legacy environments used in large organizations.",
       )}
    </p>
  </>;

let multiple_targets_action = <a href="#"> {React.string("Compiler documentation")} </a>;

let legal_validation_content = {
  <>
    <blockquote>
      <strong>
        {React.string("Legislative code should be reviewed by legislative experts")}
      </strong>
    </blockquote>
    <p>
      {React.string(
         "For programs derived from legislation, validation relies on lawyers who generally write
    test cases by hand. Maintaining a large test base is costly in a context of fast-paced legislative reforms,
    as it is difficult to predict which tests will be affected by the changes. Catala is designed with
    law professionals to ensure that the code itself is reviewable by domain experts, increasing the
    level of assurance for no additional cost.",
       )}
    </p>
  </>;
};

let legal_validation_action =
  <a href="#"> {React.string("A lawyer's guide to Catala code validation")} </a>;

let solid_foundations_content = {
  <>
    <blockquote>
      <strong>
        {React.string("A programming language made by programming language specialists")}
      </strong>
    </blockquote>
    <p>
      {React.string("Catala originates from ")}
      <a href="https://inria.fr"> {React.string("Inria")} </a>
      {React.string(
         ", the French National Institute for Computer Science Research.
    The language has been designed according to state-of-the-art programming languages design principles.
    Inspired from the ML language, Catala features an unique default logic mechanism based on ",
       )}
      <a href="https://papers.ssrn.com/sol3/papers.cfm?abstract_id=3088206">
        {React.string("the work of Sarah Lawsky")}
      </a>
      {React.string(".")}
    </p>
  </>;
};

let solid_foundations_action = <a href="#"> {React.string("Formalized specification")} </a>;

[@react.component]
let make = () => {
  <main className="container">
    <div className="row">
      <div className="col s12 m10 offset-m1 xl8 offset-xl2">
        <div className="center-align">
          <p className="flow-text">
            <strong>
              {React.string(
                 "Catala is a domain-specific programming Language design for deriving correct-by-construction
          implementations from legislative texts.",
               )}
            </strong>
          </p>
        </div>
      </div>
    </div>
    <div className="row center">
      <a className="waves-effect waves-light btn-large primary-color" href=github_link>
        {React.string([@reason.preserve_braces] "Get started")}
        <i className="material-icons right"> {React.string("code")} </i>
      </a>
    </div>
    <br />
    <br />
    <div className="row ">
      {catala_presentation_card(
         "Closer to the source of truth",
         literate_progrmming_content,
         Some(literate_programming_action),
       )}
      {catala_presentation_card(
         "One code, multiple execution targets",
         multiple_targets_content,
         Some(multiple_targets_action),
       )}
    </div>
    <div className="row">
      {catala_presentation_card(
         "Validation from legal",
         legal_validation_content,
         Some(legal_validation_action),
       )}
      {catala_presentation_card(
         "Solid foundations",
         solid_foundations_content,
         Some(solid_foundations_action),
       )}
    </div>
  </main>;
};
