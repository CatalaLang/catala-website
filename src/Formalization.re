let grammar = [%bs.raw {|require("../assets/grammar.html")|}];

[@react.component]
let make = () => {
  <>
    <Utils.PageTitle>
      <Lang.String english="Formalization" french="Formalisation" />
    </Utils.PageTitle>
    <Utils.PageSection
      title={
        <Lang.String
          english="Surface syntax"
          french={js|Syntaxe du langage de surface|js}
        />
      }>
      <p>
        <Lang.String
          english="The syntax of the langage is derived from the "
          french={js|La syntaxe du langage est générée à partir du |js}
        />
        <Utils.TextLink
          target="https://github.com/CatalaLang/catala/blob/master/src/catala/parsing/parser.mly">
          <Lang.String
            english="parser source file"
            french={js|fichier source du parseur|js}
          />
        </Utils.TextLink>
        <Lang.String english=" using " french={js| grâce à  |js} />
        <Utils.TextLink target="https://github.com/Lelio-Brun/Obelisk">
          <Lang.String english="Obelisk" french={js|Obelisk|js} />
        </Utils.TextLink>
        <Lang.String
          english=". This syntax is language-agnostic, meaning that it is valid for both English and French versions
        of Catala. Indeed, the language only affects the tokens, not their order."
          french={js|. Cette syntaxe est indépendante de la langue d'entrée, c'est-à-dire qu'elle est valable pour les versions
        française et anglaise de Catala. En effet, la langue d'entrée n'affecte que la création des jetons du parseur, pas leur ordre.|js}
        />
      </p>
      <Utils.Card collapsible=true>
        <div
          className=[%tw "font-mono"]
          dangerouslySetInnerHTML={"__html": grammar}
        />
      </Utils.Card>
    </Utils.PageSection>
    <Utils.PageSection
      title={
        <Lang.String
          english="Core semantics"
          french={js|Sémantique du cœur du langage|js}
        />
      }>
      <p>
        {"Catala's unique feature is the possibility to give multiple definitions to the same variable,
    each definition being conditionned to a logical guard. If the guard is true, then the definition
    is applicable. This behavior is adapted to the style in which legal statutes are redacted. In the
    case of multiple guards being true at the same time, the definition is picked according to a
    precedence in the definitions that is specified in the source code."
         |> React.string}
      </p>
      <p className="pt-6"> {"More details coming soon..." |> React.string} </p>
    </Utils.PageSection>
  </>;
};
