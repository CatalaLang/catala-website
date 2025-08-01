open PageComponents

type imgLocation = {default: string}

let pair_programming_image: imgLocation = %raw("require('../../assets/pair_programming_compr.jpg')")
let literate_programming_image: imgLocation = %raw("require('../../assets/ScreenShotVSCode.png')")

@react.component
let make = () => <>
  <Title>
    <Lang.String english="Features" french={`Fonctionnalités`} />
  </Title>
  <Section
    id="core-principles"
    title={<Lang.String
      english="Two core principles: literate programming and pair programming"
      french={`Deux principes fondamentaux : la programmation littéraire et la programmation en binôme`}
    />}>
    <Card.Presentation.FromList
      cards=[
        {
          title: <Lang.String
            english="Literate programming" french={`Programmation littéraire`}
          />,
          icon: Some("menu_book"),
          quote: Some(
            <Lang.String
              english="Create a direct correspondence between the specification and the code"
              french={`Créer une correspondance directe entre la spécification et le code`}
            />,
          ),
          action: Some((
            Internal([Nav.home, Nav.doc, Nav.examples]),
            <Lang.String english="See the examples" french={`Voir les exemples`} />,
          )),
          content: {
            <div className=%twc("flex flex-col justify-around h-full")>
              <figure className=%twc("flex flex-col m-4 items-center")>
                <img className=%twc("w-96 max-h-64") src={literate_programming_image.default} />
              </figure>
              <p className=%twc("flex-shrink")>
                <Lang.String
                  english="One line of law, one line of code, everything in the same document.
                  Programming while systematically following the structure of the legal text
                  minimizes translation errors. Moreover, it makes updating the code very
                  easy; if you know where the legal text has been changed, you just need
                  to change the code snippet just below."
                  french={`Une ligne de loi, une ligne de code, le tout dans le même document.
                  Programmer en suivant systématiquement la structure du texte de droit
                  minimise les erreurs de traduction et, surtout, rend les évolutions
                  très pratique. Si l'on sait où le droit change avec une réforme, il suffit de modifier
                  le bout de code juste en dessous.`}
                />
              </p>
            </div>
          },
        },
        {
          title: <Lang.String english="Pair programming" french={`Programmation en binôme`} />,
          icon: Some("group"),
          quote: Some(
            <Lang.String
              english="Speed up development by having lawyers and programmers talk to each other"
              french={`Accélerer le développement en faisant se parler juristes et programmeur·e·s`}
            />,
          ),
          action: Some((
            External("https://book.catala-lang.org/3-5-lawyers-agile.html"),
            <Lang.String english="Read more" french={`En savoir plus`} />,
          )),
          content: {
            <div className=%twc("flex flex-col justify-around h-full")>
              <figure className=%twc("flex flex-col m-4 items-center")>
                <img className=%twc("w-64 max-h-64") src={pair_programming_image.default} />
                <figcaption className=%twc("text-sm md:text-xs text-center pt-4 italic")>
                  <Lang.String
                    english="Photo credits: Marie Alauzen" french={`Crédits photo : Marie Alauzen`}
                  />
                </figcaption>
              </figure>
              <p className=%twc("flex-shrink")>
                <Lang.String
                  english="Writing huge specification lends to ambiguities and Chinese whisper games.
                  Beyond test cases, the lawyers must understand the logic of the code to
                  program the correct interpretations and detect problematic cases. A pair
                  programming session is often more productive than a long chain of emails."
                  french={`Écrire de volumineuses spécifications expose aux ambiguités et au jeu du téléphone arabe.
                  Au delà des cas de tests, les juristes doivent comprendre la logique du code pour programmer
                  les bonnes interprétations et détecter les cas problématiques. Une séance de programmation
                  en binôme est souvent plus productive qu'une longue chaîne de courriels.`}
                />
              </p>
            </div>
          },
        },
      ]
    />
  </Section>
  <Section
    id="proof-of-concepts"
    title={<Lang.String
      english="A tool tried and tested by French administrations"
      french={`Un outil mis à l'épreuve par les administrations publiques`}
    />}>
    {<> </>}
  </Section>
  <Section
    id="workflow"
    title={<Lang.String
      english="A programming language that fits into your existing workflow"
      french={`Un langage de programmation qui ne bouscule pas vos habitudes`}
    />}>
    <div className=%twc("flex flex-col items-center")>
      <p className=%twc("text-lg sm:text-xl italic text-center max-w-2xl")>
        <Lang.String
          english="You maintain a legacy ditigal app, packaging a computation engine
          specified by the law ? Catala allows you to plan ahead your upgrade with serenity."
          french={`Vous maintenez une application informatique patrimoniale, embarquant un moteur
de calcul spécifié par du droit ? Catala vous permet d'envisager sereinement votre future modernisation.`}
        />
      </p>
    </div>
    <div className=%twc("text-base sm:text-lg pb-10 pt-4")>
      <Card.Presentation.FromList
        cards=[
          {
            title: <Lang.String
              english="Use your favorite IDE" french={`Utilisez votre IDE favori`}
            />,
            icon: Some("build"),
            quote: Some(
              <Lang.String
                english="Standard, integrated software engineering tooling"
                french={`Des outils d'ingénierie logicielle standards et intégrés`}
              />,
            ),
            action: None,
            content: <p>
              <Lang.String
                english="A Catala source file is a text file. Version control, syntax
                highlighting, compiler error reporting, debugging, continuous integration:
                you can do it all from the command line or from your favorite IDE
                with the language server. In particular, VSCode benefits from an "
                french={`Un fichier source Catala est un fichier texte. Versionnage des source,
                coloration syntaxique, rapports des erreurs du compilateur, débogage,
                intégration continue : vous pouvez tout faire depuis la ligne de commande ou bien depuis
                votre IDE favori avec le serveur de langage. En particulier, VSCode bénéficie
                 d'une `}
              />
              <Link.Text
                target="https://marketplace.visualstudio.com/items?itemName=catalalang.catala">
                <Lang.String english="official extension" french={`extension officielle`} />
              </Link.Text>
              <Lang.String english="." french={`.`} />
            </p>,
          },
          {
            title: <Lang.String
              english="Reuse your application, as they are"
              french={`Réutilisez vos application, telles quelles`}
            />,
            icon: Some("recycling"),
            quote: Some(
              <Lang.String
                english="Simply swap the rules engine"
                french={`Remplacez simplement le moteur de règles`}
              />,
            ),
            action: None,
            content: <p>
              <Lang.String
                english="You Catala programs are compiled to the programming
                language of your existing app (Java, C, Python, Javascript,...).
                You can then just call the source library generated by Catala instead
                of your old rules engine. You can then carry on an incremental migration
                without outages."
                french={`Vos programmes Catala sont compilés le langage de programmation
                de votre application existante (Java, C, Python, Javascript,...). Il vous suffit
                alors d'appeler la bibliothèque de code source généré par Catala plutôt
                que votre ancien moteur de règles. Vous pouvez ainsi poursuivre
                une migration incrémentale sans interruption de service.`}
              />
            </p>,
          },
          {
            title: <Lang.String
              english="Avoid vendor lock-in" french={`Évitez d'être captif de votre fournisseur`}
            />,
            icon: Some("savings"),
            quote: Some(
              <Lang.String
                english="An open-source and future-proof compiler"
                french={`Un compilateur open-source et pérenne`}
              />,
            ),
            action: None,
            content: <p>
              <Lang.String
                english="The tooling of Catala is distributed under a permissive open-source licence (Apache2).
                No single company has the exclusivity to maintaining it, and the "
                french={`L'outillage Catala est diffusé sous licence open-source permissive (Apache2).
                Aucune entreprise ne possède l'exclusivité de sa maintenance, et
                le `}
              />
              <Link.Text target="https://apollo.inria.fr/">
                <Lang.String
                  english="Apollo program managed by Inria"
                  french={`programme Apollo piloté par Inria`}
                />
              </Link.Text>
              <Lang.String
                english=" organizes an ecosystem of digital services companies qualified for the software. And in the worst case,
                you can maintain the generated code without the compiler."
                french={` organise un écosystème d'entreprises de services numériques compétentes sur le logiciel. Et au pire,
                vous pouvez maintenir le code généré sans le compilateur.`}
              />
            </p>,
          },
          {
            title: <Lang.String
              english="Scale to real-world legal rule sets"
              french={`Passez à l'échelle du droit du monde réel`}
            />,
            icon: Some("landscape"),
            quote: Some(
              <Lang.String
                english="Modularity and exception management"
                french={`Modularité et gestion des exceptions`}
              />,
            ),
            action: None,
            content: <p>
              <Lang.String
                english="A rules engine without functions nor modules becomes unmanageable
                after 1,000 lines of code. With its reusable scopes, its modules and its
                unique system of base cases and exceptions, Catala can deal with
                all the edge cases and arcane rules of the national taxes and social benefits
                computations of a developed country."
                french={`Un moteur de règles sans
              fonction ni modules devient ingérable au bout de 1000 lignes de code.
              Avec ses champs d'applications réutilisables, ses modules, et son système
              unique de cas de base et d'exceptions, Catala peut gérer, avec tous les
              cas tordus et règles obscures, les calculs d'impôts ou de prestation
              sociales nationales d'un pays développé.`}
              />
            </p>,
          },
        ]
      />
    </div>
  </Section>
  <Section
    id="alternatives"
    title={<Lang.String
      english="Should I use Catala or something else?"
      french={`Devrais-je utiliser Catala ou quelque chose d'autre ?`}
    />}>
    <Card.Presentation.FromList
      cards=[
        {
          title: <Link.Text target="https://openfisca.org/">
            <Lang.String english="OpenFisca" french={`OpenFisca`} />
          </Link.Text>,
          icon: None,
          quote: Some(
            <Lang.String
              english="A mature community-based economic micro-simulation framework"
              french={`Un framework mature pour la micro-simulation basé sur une communauté`}
            />,
          ),
          action: None,
          content: <p>
            <Lang.String
              english="You are an economist and you wish to model the effects
              of a socio-fiscal reform over a population? You want to ship a
              simulateur to quickly estimate the eligibility and amount
              of several benefits? OpenFisca is the most adapted tool, thanks
              to its community-maintained codebase elaborated since 2014 that
              models the taxes and benefits in several countries. However,
              this Python-based system can only interoperate through a Web API
              and the community codebase does not contain exhaustive implementations
              of taxes and social benefits that guarantees an identical result
              to the decisions of the administrations, in all cases."
              french={`Vous êtes économiste et vous souhaitez
            modéliser les effets d'une réforme socio-fiscale sur la population?
            Vous voulez lancer un simulateur permettant d'estimer rapidement l'éligibilité
            et le montant de plusieurs aides ? OpenFisca est alors l'outil le plus adapté,
            grâce à sa base de code communautaire élaborée depuis 2014, modélisant les impôts et aides
            sociales dans plusieurs pays. Par contre, ce système en Python
            ne peut intéropérer que par API Web et la base de code communautaire
            ne contient pas d'implémentation exhaustive des impôts et prestations sociales
            qui garantisse un résultat identique aux décisions des administrations dans
            tous les cas.`}
            />
          </p>,
        },
        {
          title: <Link.Text target="https://publi.codes/">
            <Lang.String english="Publicodes" french={`Publicodes`} />
          </Link.Text>,
          icon: None,
          quote: Some(
            <Lang.String
              english="Ergonomic Web simulators from simple rules"
              french={`Des simulateurs Web ergonomiques à partir de règles simples`}
            />,
          ),
          action: None,
          content: <p>
            <Lang.String english="" french={``} />
          </p>,
        },
        {
          title: <Link.Text
            target="https://www.oasis-open.org/committees/tc_home.php?wg_abbrev=legalruleml">
            <Lang.String english="LegalRuleML" french={`LegalRuleML`} />
          </Link.Text>,
          icon: None,
          quote: Some(
            <Lang.String
              english="A world standard to model the computational content of a law"
              french={`Un standard mondial pour modéliser le contenu calculatoire d'une loi`}
            />,
          ),
          action: None,
          content: <p>
            <Lang.String english="" french={``} />
          </p>,
        },
        {
          title: <Link.Text target="https://documentation.dcr.design/">
            <Lang.String english="DCR" french={`DCR`} />
          </Link.Text>,
          icon: None,
          quote: Some(
            <Lang.String
              english="Modelling and executing multi-actor processes"
              french={`Modéliser et exécuter des processus multi-acteurs`}
            />,
          ),
          action: None,
          content: <p>
            <Lang.String english="" french={``} />
          </p>,
        },
      ]
    />
  </Section>
  <Section
    id="science"
    title={<Lang.String
      english="A solution founded on solid science"
      french={`Une solution fondée sur un socle scientifique solide`}
    />}>
    {<> </>}
  </Section>
</>
