let url = "/";

let github_link = "https://github.com/CatalaLang/catala";

[@react.component]
let make = () => {
  <>
    <div className=[%tw "flex flex-col items-center"]>
      <div className=[%tw "text-center text-xl italic py-8 max-w-lg"]>
        <p>
          {"Catala is a domain-specific programming language design for deriving correct-by-construction
          implementations from legislative texts."
           |> React.string}
        </p>
      </div>
      <div className=[%tw "bg-primary shadow  py-4 px-4"]>
        <a className=[%tw " cursor-pointer uppercase text-lg text-white"] href=github_link>
          {"Get started" |> React.string}
          <i className="float-right pl-2 material-icons"> {"code" |> React.string} </i>
        </a>
      </div>
    </div>
    <div className=[%tw "py-10"]>
      <div className=[%tw "flex flex-row flex-wrap items-stretch"]>
        {Utils.presentation_card(
           ~title="Closer to the source of truth",
           ~icon="check",
           ~quote="A program that should to stick to the law, should reside next to the law.",
           ~action=(Examples.url, "Catala program examples"),
           {
             "Implementations derived from legislative texts are hard to get right.
           The specification for how one quantity is computed may be scattered accross various places in your
           legislative source. Catala addressess this problem by interleaving the legislative source with the
           code that models it. To implement your program, just follow what the law says!"
             |> React.string;
           },
         )}
        {Utils.presentation_card(
           ~title="One code, multiple execution targets",
           ~icon="device_hub",
           ~quote="Simple code should be executed simply",
           ~action=(Doc.url, "Documentation"),
           {
             "Code derived from legislation generally uses basic programming concepts, that are present
       in every programming language. Why would you need a complex rules engine or runtime to execute that code?
       Catala uses a fully-fledged compiler to bring you the code you need, in the programming language you need.
       That also include legacy environments used in large organizations."
             |> React.string;
           },
         )}
        {Utils.presentation_card(
           ~title="Validation from legal",
           ~icon="work",
           ~quote="Legislative code should be reviewed by legislative experts",
           ~action=(Guide.url, "A lawyer's guide to Catala code validation"),
           {
             "For programs derived from legislation, validation relies on lawyers who generally write
           test cases by hand. Maintaining a large test base is costly in a context of fast-paced legislative reforms,
           as it is difficult to predict which tests will be affected by the changes. Catala is designed with
           law professionals to ensure that the code itself is reviewable by domain experts, increasing the
           level of assurance for no additional cost."
             |> React.string;
           },
         )}
        {Utils.presentation_card(
           ~title="Solid foundations",
           ~icon="functions",
           ~quote="A programming language made by programming language specialists",
           ~action=(Formalization.url, "Formalized specification"),
           {
             <>
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
             </>;
           },
         )}
      </div>
    </div>
  </>;
};
