let grammar = %bs.raw(`require("../assets/grammar.html")`)

@react.component
let make = () => <>
  <Utils.PageTitle>
    <Lang.String english="Formalization" french="Formalisation" />
  </Utils.PageTitle>
  <Utils.PageSection
    title={<Lang.String english="Surface syntax" french=`Syntaxe du langage de surface` />}>
    <p>
      <Lang.String
        english="The syntax of the langage is derived from the "
        french=`La syntaxe du langage est générée à partir du `
      />
      <Utils.TextLink
        target="https://github.com/CatalaLang/catala/blob/master/src/catala/surface/parser.mly">
        <Lang.String english="parser source file" french=`fichier source du parseur` />
      </Utils.TextLink>
      <Lang.String english=" using " french=` grâce à  ` />
      <Utils.TextLink target="https://github.com/Lelio-Brun/Obelisk">
        <Lang.String english="Obelisk" french=`Obelisk` />
      </Utils.TextLink>
      <Lang.String
        english=". This syntax is language-agnostic, meaning that it is valid for both English and French versions
        of Catala. Indeed, the language only affects the tokens, not their order."
        french=`. Cette syntaxe est indépendante de la langue d'entrée, c'est-à-dire qu'elle est valable pour les versions
        française et anglaise de Catala. En effet, la langue d'entrée n'affecte que la création des jetons du parseur, pas leur ordre.`
      />
    </p>
    <Utils.Card collapsible=true>
      <div className=%tw("font-mono") dangerouslySetInnerHTML={"__html": grammar} />
    </Utils.Card>
    <p>
      <Lang.String
        english="To complement this formal description of the syntax, a cheat sheet is also available
        and is probably more practical to satisfy your hands-on syntax curiosity."
        french=`En complément de cette description formelle de la syntaxe, un pense-bête est également
        disponible. Celui-ci est probablement plus utile pour satisfaire votre curiosité opérationnelle
        vis-à-vis de la syntaxe de Catala.`
      />
    </p>
    <div className=%tw("flex flex-row justify-center")>
      <div className=%tw("mx-8 my-4")>
        <a
          className=%tw("cursor-pointer uppercase text-white")
          href="https://github.com/CatalaLang/catala/raw/master/doc/syntax/syntax.pdf"
          target="_blank">
          <div className=%tw("bg-secondary shadow text-2xl md:text-xl lg:text-lg py-4 px-4")>
            <div className=%tw("flex flex-row flex-nowrap items-center")>
              <Lang.String
                english="Access the syntax cheat sheet" french=`Accéder au pense-bête syntaxique`
              />
              <i className="pl-4 material-icons"> {"description" |> React.string} </i>
            </div>
          </div>
        </a>
      </div>
    </div>
  </Utils.PageSection>
  <Utils.PageSection
    title={<Lang.String english="Core semantics" french=`Sémantique du cœur du langage` />}>
    <p>
      <Lang.String
        english="Catala's unique feature is the possibility to give multiple definitions to the same variable,
    each definition being conditionned to a logical guard. If the guard is true, then the definition
    is applicable. This behavior is adapted to the style in which legal statutes are redacted. In the
    case of multiple guards being true at the same time, the definition is picked according to a
    precedence in the definitions that is specified in the source code."
        french=`La fonctionnalité inédite de Catala est la possiblité de donner plusieurs définitions à
           la même variable, chaque définition étant conditionnée par une garde logique. Si la garde est vraie,
           alors la définition est applicable. Ce comportement est adapté au style dans lequel sont écrits les
           textes législatifs et règlementaire. Si plusieurs définitions sont applicables en même temps, alors
           le choix s'effectue selon des règles de précédences spécifiées dans le code source.`
      />
    </p>
    <div className=%tw("flex flex-row justify-center")>
      <div className=%tw("mx-8 my-4")>
        <a
          className=%tw("cursor-pointer uppercase text-white")
          href="https://arxiv.org/abs/2103.03198"
          target="_blank">
          <div className=%tw("bg-secondary shadow text-2xl md:text-xl lg:text-lg py-4 px-4")>
            <div className=%tw("flex flex-row flex-nowrap items-center")>
              <Lang.String
                english="Access the complete formalization paper"
                french=`Accéder à l'article contenant la formalisation`
              />
              <i className="pl-4 material-icons"> {"description" |> React.string} </i>
            </div>
          </div>
        </a>
      </div>
    </div>
  </Utils.PageSection>
</>
