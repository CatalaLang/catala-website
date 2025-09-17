open PageComponents

@react.component
let make = () => {
  let code_screenshot_asset = Lang.getCurrent(
    ~french=Assets.Image.literate_programming_fr,
    ~english=Assets.Image.literate_programming_en,
  )

  <>
    <section className="px-8 my-16">
      <Title>
        <Lang.String english="Features" french={`Fonctionnalités`} />
      </Title>
    </section>
    <section className="border-y border-border bg-primary_light/5 p-8">
      <h2 id="core-principles" className="">
        <a href={"#core-principles"}>
          <Lang.String
            english="Two core principles: literate programming and pair programming"
            french={`Deux principes fondamentaux : la programmation littéraire et la programmation en binôme`}
          />
        </a>
      </h2>
      <section className="border border-border">
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8 bg-white p-8">
          <div className="flex flex-col h-full">
            <h3 className="inline-flex gap-2 items-center mb-4">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
                className="lucide lucide-book-open-text-icon lucide-book-open-text">
                <path d="M12 7v14" />
                <path d="M16 12h2" />
                <path d="M16 8h2" />
                <path
                  d="M3 18a1 1 0 0 1-1-1V4a1 1 0 0 1 1-1h5a4 4 0 0 1 4 4 4 4 0 0 1 4-4h5a1 1 0 0 1 1 1v13a1 1 0 0 1-1 1h-6a3 3 0 0 0-3 3 3 3 0 0 0-3-3z"
                />
                <path d="M6 12h2" />
                <path d="M6 8h2" />
              </svg>
              <Lang.String english="Literate programming" french={`Programmation littéraire`} />
            </h3>
            <p className="font-semibold mb-4">
              <TextHighlight>
                <Lang.String
                  english="Create a direct correspondence between the specification and the code"
                  french={`Créer une correspondance directe entre la spécification et le code`}
                />
              </TextHighlight>
            </p>
            <div className="mb-4 lg:hidden max-w-2/3 mx-auto">
              <Figure
                src={code_screenshot_asset}
                altEn="Screenshot from the file us_tax_code/section_132.catala_en"
                altFr={`Capture d'écran du fichier prestations_familiales/sécurité_sociale_R.catala_fr`}
              />
            </div>
            <p>
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
            <Link.Internal target=[Nav.home, Nav.doc, Nav.examples] className="mt-2 italic w-fit">
              <Lang.String english="See the examples" french={`Voir les exemples`} />
            </Link.Internal>
          </div>
          <div className="not-lg:hidden">
            <Figure
              src={code_screenshot_asset}
              altEn="Screenshot from the file us_tax_code/section_132.catala_en"
              altFr={`Capture d'écran du fichier prestations_familiales/sécurité_sociale_R.catala_fr`}
            />
          </div>
        </div>
        <div
          className="grid grid-cols-1 lg:grid-cols-2 gap-8 bg-white border-t border-dashed border-border p-8">
          <div className="flex flex-col h-min">
            <h3 className="inline-flex gap-2 items-center mb-4">
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
                className="lucide lucide-users-icon lucide-users">
                <path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2" />
                <path d="M16 3.128a4 4 0 0 1 0 7.744" />
                <path d="M22 21v-2a4 4 0 0 0-3-3.87" />
                <circle cx="9" cy="7" r="4" />
              </svg>
              <Lang.String english="Pair programming" french={`Programmation en binôme`} />
            </h3>
            <p className="font-semibold mb-4">
              <TextHighlight>
                <Lang.String
                  english="Speed up development by having lawyers and programmers talk to each other"
                  french={`Accélerer le développement en faisant se parler juristes et programmeur·e·s`}
                />
              </TextHighlight>
            </p>
            <div className="mb-4 lg:hidden mx-auto">
              <Figure
                src={Assets.Image.pair_programming_compr}
                height=""
                width="300px"
                altEn="Photo credits: Marie Alauzen"
                altFr={`Crédits photo : Marie Alauzen`}
              />
            </div>
            <p>
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
            <Link.Text
              target="https://book.catala-lang.org/3-5-lawyers-agile.html"
              className="mt-2 italic w-fit">
              <Lang.String english="Read more" french={`En savoir plus`} />
            </Link.Text>
          </div>
          <div className="mx-auto not-lg:hidden">
            <Figure
              src={Assets.Image.pair_programming_compr}
              height=""
              width="350px"
              altEn="Photo credits: Marie Alauzen"
              altFr={`Crédits photo : Marie Alauzen`}
            />
          </div>
        </div>
      </section>
    </section>
    <section id="proof-of-concepts" className="my-16 !px-0">
      <h2 className="px-8 !mt-0">
        <a href={"#proof-of-concepts"}>
          <Lang.String
            english="A tool tried and tested by French administrations"
            french={`Un outil mis à l'épreuve par les administrations publiques`}
          />
        </a>
      </h2>
      <p className="px-8 mb-6">
        <Lang.String
          english="Several proofs of concept have been made for French public
          administrations. This demonstrates the ability of Catala to provide
          tooling for "
          french={`Plusieurs démonstrateurs ont été réalisés pour le compte
          d'administrations publiques françaises, démontrant la capacité de Catala
          à `}
        />
        <TextHighlight>
          <Lang.String
            english="first-class computation engines at the national level"
            french={`outiller des moteurs de calcul de premier plan au niveau national`}
          />
        </TextHighlight>
        <Lang.String
          english=", with realistic operational conditions and "
          french={`, dans des conditions d'exploitations réalistes et `}
        />
        <TextHighlight>
          <Lang.String
            english="a high level of assurance." french={`avec un haut niveau d'assurance.`}
          />
        </TextHighlight>
      </p>
      <div className="grid grid-cols-1 md:grid-cols-2 border-y border-border bg-white">
        <Highlight.Large src=Assets.Image.logo_dgfip>
          <Link.Text target="https://gitlab.adullact.net/dgfip/ir-catala">
            <Lang.String
              english="\"Income tax computation (deductions, deficit)"
              french={`Calcul de l'impôt sur le revenu (abattements, déficit)`}
            />
          </Link.Text>
        </Highlight.Large>
        <Highlight.Large src=Assets.Image.logo_cnaf>
          <Lang.String
            english="Computation and orchestration of three benefits (AF, RSA, AVVC)"
            french={`Calcul et orchestration de trois allocations (AF, RSA, AVVC)`}
          />
        </Highlight.Large>
      </div>
    </section>
    <section id="workflow" className="my-16 border-y border-border bg-primary_light/5 py-8">
      <h2 className="px-8 !mt-0">
        <a href={"#workflow"}>
          <Lang.String
            english="An innovative programming language that fits into your existing workflow"
            french={`Un langage de programmation innovant qui s'intègre dans vos pratiques habituelles`}
          />
        </a>
      </h2>
      <p className="px-8 text-lg">
        <Lang.String
          english="You maintain a legacy ditigal app, packaging a computation engine
          specified by the law ? Catala allows you to plan ahead your upgrade with serenity."
          french={`Vous maintenez une application informatique patrimoniale, embarquant un moteur
de calcul spécifié par du droit ? Catala vous permet d'envisager sereinement votre future modernisation.`}
        />
      </p>
      <div className="text-base sm:text-lg pb-10 pt-4">
        <Card.Presentation.FromList
          cards=[
            {
              title: <Lang.String
                english="Use your favorite IDE" french={`Utilisez votre IDE favori`}
              />,
              icon: Some(
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  className="lucide lucide-wrench-icon lucide-wrench">
                  <path
                    d="M14.7 6.3a1 1 0 0 0 0 1.4l1.6 1.6a1 1 0 0 0 1.4 0l3.106-3.105c.32-.322.863-.22.983.218a6 6 0 0 1-8.259 7.057l-7.91 7.91a1 1 0 0 1-2.999-3l7.91-7.91a6 6 0 0 1 7.057-8.259c.438.12.54.662.219.984z"
                  />
                </svg>,
              ),
              quote: Some(
                <Lang.String
                  english="Standard, integrated software engineering tooling"
                  french={`Des outils d'ingénierie logicielle standards et intégrés`}
                />,
              ),
              action: Some((
                External("https://marketplace.visualstudio.com/items?itemName=catalalang.catala"),
                <Lang.String
                  english="Get VSCode extension" french={`Obtenir l'extension VSCode`}
                />,
              )),
              content: <p>
                <Lang.String
                  english="A Catala source file is a text file. Version control, syntax
                highlighting, compiler error reporting, debugging, continuous integration:
                you can do it all from the command line or from your favorite IDE
                with the language server."
                  french={`Un fichier source Catala est un fichier texte. Versionnage des source,
                coloration syntaxique, rapports des erreurs du compilateur, débogage,
                intégration continue : vous pouvez tout faire depuis la ligne de commande ou bien depuis
                votre IDE favori avec le serveur de langage.`}
                />
              </p>,
            },
            {
              title: <Lang.String
                english="Reuse your application, as they are"
                french={`Réutilisez vos application, telles quelles`}
              />,
              icon: Some(
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  className="lucide lucide-recycle-icon lucide-recycle">
                  <path
                    d="M7 19H4.815a1.83 1.83 0 0 1-1.57-.881 1.785 1.785 0 0 1-.004-1.784L7.196 9.5"
                  />
                  <path
                    d="M11 19h8.203a1.83 1.83 0 0 0 1.556-.89 1.784 1.784 0 0 0 0-1.775l-1.226-2.12"
                  />
                  <path d="m14 16-3 3 3 3" />
                  <path d="M8.293 13.596 7.196 9.5 3.1 10.598" />
                  <path
                    d="m9.344 5.811 1.093-1.892A1.83 1.83 0 0 1 11.985 3a1.784 1.784 0 0 1 1.546.888l3.943 6.843"
                  />
                  <path d="m13.378 9.633 4.096 1.098 1.097-4.096" />
                </svg>,
              ),
              quote: Some(
                <Lang.String
                  english="Simply swap the rules engine"
                  french={`Remplacez simplement le moteur de règles`}
                />,
              ),
              action: Some((
                External("https://github.com/CatalaLang/catala/tree/master/runtimes"),
                <Lang.String english="Explore the runtimes" french={`Explorer les runtimes`} />,
              )),
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
                english="Avoid vendor lock-in"
                french={`Évitez d'être captif de votre fournisseur`}
              />,
              icon: Some(
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  className="lucide lucide-piggy-bank-icon lucide-piggy-bank">
                  <path
                    d="M11 17h3v2a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1v-3a3.16 3.16 0 0 0 2-2h1a1 1 0 0 0 1-1v-2a1 1 0 0 0-1-1h-1a5 5 0 0 0-2-4V3a4 4 0 0 0-3.2 1.6l-.3.4H11a6 6 0 0 0-6 6v1a5 5 0 0 0 2 4v3a1 1 0 0 0 1 1h2a1 1 0 0 0 1-1z"
                  />
                  <path d="M16 10h.01" />
                  <path d="M2 8v1a2 2 0 0 0 2 2h1" />
                </svg>,
              ),
              quote: Some(
                <Lang.String
                  english="An open-source and future-proof compiler"
                  french={`Un compilateur open-source et pérenne`}
                />,
              ),
              action: Some((
                External("https://apollo.inria.fr/"),
                <Lang.String
                  english="Know more about the Apollo program"
                  french={`En savoir plus sur le programme Apollo`}
                />,
              )),
              content: <p>
                <Lang.String
                  english="The tooling of Catala is distributed under a permissive open-source licence (Apache2).
                No single company has the exclusivity to maintaining it, and the "
                  french={`L'outillage Catala est diffusé sous licence open-source permissive (Apache2).
                Aucune entreprise ne possède l'exclusivité de sa maintenance, et
                le `}
                />
                <Lang.String
                  english="Apollo program managed by Inria"
                  french={`programme Apollo piloté par Inria`}
                />
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
              icon: Some(
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="24"
                  height="24"
                  viewBox="0 0 24 24"
                  fill="none"
                  stroke="currentColor"
                  strokeWidth="2"
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  className="lucide lucide-mountain-snow-icon lucide-mountain-snow">
                  <path d="m8 3 4 8 5-5 5 15H2L8 3z" />
                  <path d="M4.14 15.08c2.62-1.57 5.24-1.43 7.86.42 2.74 1.94 5.49 2 8.23.19" />
                </svg>,
              ),
              quote: Some(
                <Lang.String
                  english="Modularity and exception management"
                  french={`Modularité et gestion des exceptions`}
                />,
              ),
              action: Some((
                External("https://book.catala-lang.org/2-0-tutorial.html"),
                <Lang.String
                  english="Get started with the tutorial" french={`Démarrer avec le tutoriel`}
                />,
              )),
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
    </section>
    <section id="alternatives">
      <h2 className="px-8 !mt-0">
        <a href={"#alternatives"}>
          <Lang.String
            english="Should I use Catala or something else?"
            french={`Devrais-je utiliser Catala ou quelque chose d'autre ?`}
          />
        </a>
      </h2>
      <p className="text-lg px-8">
        <Lang.String
          english="You have heard about other similar technologies and hesistate
          with Catala? This non-exhaustive list should help you choose."
          french={`Vous avez entendu parler d'autre technologies similaires et
          hésitez avec Catala ? Cette liste non-exhaustive devrait vous aider à choisir.`}
        />
      </p>
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
            content: <>
              <p className="mb-4">
                <Lang.String
                  english="You are an economist and you wish to model the effects
              of a socio-fiscal reform over a population? You want to ship a
              simulateur to quickly estimate the eligibility and amount
              of several benefits? OpenFisca is the most adapted tool, thanks
              to its community-maintained codebase elaborated since 2014 that
              models the taxes and benefits in several countries."
                  french={`Vous êtes économiste et vous souhaitez
            modéliser les effets d'une réforme socio-fiscale sur la population?
            Vous voulez lancer un simulateur permettant d'estimer rapidement l'éligibilité
            et le montant de plusieurs aides ? OpenFisca est alors l'outil le plus adapté,
            grâce à sa base de code communautaire élaborée depuis 2014, modélisant les impôts et aides
            sociales dans plusieurs pays.`}
                />
              </p>
              <Lang.String
                english="But you should use
              Catala, which is a better designed programming language with more exhaustive
              tooling, if you want to re-write your codebase yourself. This can happen
              for instance because the OpenFisca codebase only deals with the most simple
              legal rules compatible with the approximations of micro-economists."
                french={`Cependant, Catala est plus adapté
            si vous voulez re-développer vous-même votre base de code.
            Par exemple, parce que celle d'OpenFisca ne gère que les cas
            simples du droit, compatibles avec les approximations des micro-économistes.`}
              />
            </>,
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
            content: <>
              <p className="mb-4">
                <Lang.String
                  english="You are an innovative public digital service and want to
              quickly spin up a Web simulator with a good user experience, on top
              of an easy-to-read rule base? Publicodes is the most adapted tool,
              thanks to its very good integration of computation rules and
              user-facing display."
                  french={`Vous êtes une start-up d'État et vous voulez
lancer rapidement un simulateur Web avec une bonne expérience utilisateur, par dessus
une base de règles facile à lire? Publicodes est alors l'outil le plus adapté,
grâce à sa très bonne intégration entre règles de calcul et affichage
de l'interface utilisateur.`}
                />
              </p>
              <p>
                <Lang.String
                  english="But you should use Catala, that separates
              computation engine and user interface, and thus reaches better
              raw computation performances, if you need to perform batch
              computations beyon the Web simulator."
                  french={`Cependant, Catala sépare
 moteur de calcul et interface utilisateur, et ainsi affiche de meilleures
 performances en calcul pur, ce qui est important si vous devez faire du calcul en masse au delà
 d'un simulateur Web.`}
                />
              </p>
            </>,
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
            content: <>
              <p className="mb-4">
                <Lang.String
                  english="Vous want to build a formal
            ontology of a law or a regulation? You want to harmonize the
            writing of the law or automatically analyse the relationships between
            objects described by the law? LegalRuleML is the most adapted tool,
            since it is an internationally-managed XML standard of modeling for
            legal objects."
                  french={`Vous voulez construire une ontologie
            formelle d'une loi ou d'un règlement ? Vous souhaitez uniformiser l'écriture
            du droit ou analyser automatiquement les relations entre objets décrits
            par le droit ? LegalRuleML est alors l'outil le plus adapté, étant un
            standard mondial de représentation XML des objets juridiques.`}
                />
              </p>
              <p>
                <Lang.String
                  english="But you should use Catala is you simply want to program
                a computation and then run it."
                  french={`Mais Catala est plus adapté si vous voulez simplement programmer un calcul et ensuite
              pouvoir l'exécuter.`}
                />
              </p>
            </>,
          },
          {
            title: <Link.Text target="https://documentation.dcr.design/">
              <Lang.String english="DCR Graphs" french={`DCR Graphs`} />
            </Link.Text>,
            icon: None,
            quote: Some(
              <Lang.String
                english="Modelling and executing multi-actor processes"
                french={`Modéliser et exécuter des processus multi-acteurs`}
              />,
            ),
            action: None,
            content: <>
              <p className="mb-4">
                <Lang.String
                  english="You are designing a new administrative process implicating
                exchanges of information and documents between multiple actors? Or
                you want to dectect optimisation opportunities within your existing processes?
                DCR Graphs is the most adapted tool, since it can model, execute and
                analyse communication protocols and generate automatically user interfaces."
                  french={`Vous voulez concevoir une nouvelle formalité administrative
              impliquant des échanges de documents et d'informations entre plusieurs
              acteurs ? Ou bien détecter des opportunités d'optimisation
              de vos formalités existantes ? DCR Graphs est l'outil le plus adapté,
              puisqu'il permet de modéliser, exécuter et analyser des protocoles
              de communication et générer des interfaces utilisateurs automatiquement.`}
                />
              </p>
              <p>
                <Lang.String
                  english="But you should use Catala if
              you just want to compute an amount from informations already
              given by users, without back-and-forth in the decision process."
                  french={`Néanmoins, Catala est plus adapté s'il s'agit simplement de calculer un montant à partir d'informations
              déjà communiquées par les usagers, sans allers-retour dans le
              processus de décision.`}
                />
              </p>
            </>,
          },
        ]
      />
    </section>
    <section id="science" className="mt-16 !px-0 bg-primary_light/5 py-8 border-y border-border">
      <h2 className="px-8">
        <a href={"#science"}>
          <Lang.String
            english="A solution founded on solid science"
            french={`Une solution fondée sur un socle scientifique solide`}
          />
        </a>
      </h2>
      <p className="px-8 mb-6 text-lg">
        <Lang.String
          english="Discover the rigourous scientific work behind the project."
          french={`Découvrez le travail de recherche rigoureux à l'origine du projet.`}
        />
      </p>
      <Card.Presentation.FromList
        cards=[
          {
            title: <Lang.String
              english="Interdisciplinary scientific collaboration"
              french={`Collaboration scientifique interdisciplinaire`}
            />,
            icon: Some(
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
                className="lucide lucide-messages-square-icon lucide-messages-square">
                <path
                  d="M16 10a2 2 0 0 1-2 2H6.828a2 2 0 0 0-1.414.586l-2.202 2.202A.71.71 0 0 1 2 14.286V4a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"
                />
                <path
                  d="M20 9a2 2 0 0 1 2 2v10.286a.71.71 0 0 1-1.212.502l-2.202-2.202A2 2 0 0 0 17.172 19H10a2 2 0 0 1-2-2v-1"
                />
              </svg>,
            ),
            quote: Some(
              <Lang.String
                english="An award-winning project in formal methods and digital law"
                french={`Un projet primé en méthodes formelles et droit du numérique`}
              />,
            ),
            action: Some((
              Internal([Nav.home, Nav.about]),
              <Lang.String
                english="Discover the origin of the project"
                french={`Découvrir l'origine du projet`}
              />,
            )),
            content: <p>
              <Lang.String
                english="Catala is born out the PhD work of Denis Merigoux "
                french={`Catala est le fruit du travail doctoral de Denis Merigoux `}
              />
              <Link.Text
                target="https://archive.socinfo.fr/2022/12/recherche-prix-de-these-gilles-kahn-laureats-2022/">
                <Lang.String
                  english="(Gilles Kahn prize 2022)" french={`(prix Gilles Kahn 2022)`}
                />
              </Link.Text>
              <Lang.String
                english=" in formal methods, and Liane Huttner "
                french={` en méthodes formelles, et de Liane Huttner `}
              />
              <Link.Text
                target="https://recherche.pantheonsorbonne.fr/actualite/trois-theses-en-droit-et-science-politique-primees-par-chancellerie-universites-paris">
                <Lang.String
                  english="(Sorbonne Chancellery prize 2023)"
                  french={`(prix de la Chancellerie 2023)`}
                />
              </Link.Text>
              <Lang.String
                english=" in digital law. It also follows the footsteps of the research
                of Marie Alauzen in Sociology of the State and STS. The dialogue between
                these three researchers guided the design decisions of Catala, based on
                an exhaustive review of the state of the art between Law and Computer Science."
                french={` en droit du numérique. Il s'inscrit aussi dans
              la ligne des recherches de Marie Alauzen en sociologie de l'État et en STS.
              C'est le dialogue entre ces trois chercheur·e·s qui a permis de prendre
              les bonnes décisions de conception pour Catala, s'appuyant sur une analyse
              exhaustive de l'état de l'art de l'intersection entre droit et informatique.`}
              />
            </p>,
          },
          {
            title: <Lang.String
              english="An active research subject" french={`Un sujet de recherche actif`}
            />,
            icon: Some(
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round"
                className="lucide lucide-microscope-icon lucide-microscope">
                <path d="M6 18h8" />
                <path d="M3 22h18" />
                <path d="M14 22a7 7 0 1 0 0-14h-1" />
                <path d="M9 14h2" />
                <path d="M9 12a2 2 0 0 1-2-2V6h6v4a2 2 0 0 1-2 2Z" />
                <path d="M12 6V3a1 1 0 0 0-1-1H9a1 1 0 0 0-1 1v3" />
              </svg>,
            ),
            quote: Some(
              <Lang.String
                english="A community of researchers regularly contributes to the project"
                french={`Une communauté de chercheur·e·s contribue régulièrement au projet`}
              />,
            ),
            action: Some((
              Internal([Nav.home, Nav.doc, Nav.publications]),
              <Lang.String english="Read the publications" french={`Lire les publications`} />,
            )),
            content: <p>
              <Lang.String
                english="Beyond their support of the industrialization of Catala,
                Inria continues to foster research in formal methods on the language with "
                french={`Au delà de son soutien à l'industrialisation de Catala,
              Inria continue de soutenir la recherche en méthodes formelles sur le langage avec `}
              />
              <Link.Text target="https://www.inria.fr/fr/avocat">
                <Lang.String
                  english="the AVoCat exploratory action" french={`l'action exploratoire AVoCat`}
                />
              </Link.Text>
              <Lang.String
                english=". On the other hand, a fruitful collaboration on reasearch and teaching has been establish with
                "
                french={`. D'autre part, une fructueuse collaboration de recherche et d'enseignement
              a été nouée avec `}
              />
              <Link.Text
                target="https://www.u-pec.fr/fr/formation/master-droit-du-numerique-parcours-informatique-et-droit">
                <Lang.String
                  english="the Paris-Est Créteil university"
                  french={`l'université Paris-Est Créteil`}
                />
              </Link.Text>
              <Lang.String
                english=" and its master in digital Law. The research on Catala is also international
                with an active group at the "
                french={` et son master en droit du numérique. La recherche sur Catala est également internationale avec un groupe actif au sein de `}
              />
              <Link.Text target="https://law.illinois.edu/">
                <Lang.String
                  english="University of Illinois at Urbana-Champaign"
                  french={`University of Illinois at Urbana-Champaign`}
                />
              </Link.Text>
              <Lang.String english="." french={`.`} />
            </p>,
          },
        ]
      />
    </section>
  </>
}
