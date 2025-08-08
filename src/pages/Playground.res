// %bs.raw(`require("../ace-editor/src-min-noconflict/ace.js")`)
// %bs.raw(`require("../ace-editor/src-min-noconflict/theme-monokai.js")`)
// %bs.raw(`require("../assets/playground/mode-catala_en.js")`)
// %bs.raw(`require("../assets/playground/mode-catala_fr.js")`)
// let catala = %bs.raw(`require("../assets/playground/catala_web.bc.js")`)

// let catala_exe: (string, React.ref<Js.Nullable.t<Dom.element>>, string, bool) => string = %bs.raw(`
//   function(contents, scope, lang, trace) {
//     var oldLog = console.log;
//     var oldError = console.error;
//     var out = [];
//     var AU = require('ansi_up');
//     var ansi_up = new AU.default;
//     console.log = function(message) {
//       out.push(ansi_up.ansi_to_html(message.toString().trim()));
//     };
//     console.error = function(message) {
//       out.push(ansi_up.ansi_to_html(message.toString().trim()));
//     };
//     try {
//       catala.interpret(contents, scope.current.value, lang, trace);
//     } catch (error) {
//       return "<pre>"+out.join('<br/>')+"</pre>"+"<pre><span style='font-weight:bold;color:rgb(187,0,0)'>[ERROR] </span>"+error+"</pre>";
//     }
//     console.log = oldLog;
//     console.error = oldError;
//     return "<pre>"+out.join('<br/>')+"</pre>";
//   }
// `)

// type editor

// let init_editor: unit => editor = %bs.raw(` function () {
//   var editor = ace.edit("editor");
//   editor.setTheme("ace/theme/monokai");
//   editor.session.setTabSize(2);
//   document.getElementById('editor').style.fontSize='16px';
//   return editor;
//   }`)

// let tutorial_en_content: React.element = %bs.raw(`require("../assets/playground/tutorial_en.catala_en")`)
// let tutorial_fr_content: React.element = %bs.raw(`require("../assets/playground/tutoriel_fr.catala_fr")`)

// let allocations_familiales_fr_content: React.element = %bs.raw(`require("../assets/playground/allocations_familiales.catala_fr")`)

// type syn_lang =
//   | French
//   | English

// type catala_module = {
//   title: React.element,
//   content: React.element,
//   lang: syn_lang,
// }

// let tutorial_en: catala_module = {
//   title: <Lang.String english="English tutorial" french=`Tutoriel anglophone` />,
//   content: tutorial_en_content,
//   lang: English,
// }

// let allocations_familiales_fr: catala_module = {
//   title: <Lang.String english="French family benefits" french=`Allocations familiales` />,
//   content: allocations_familiales_fr_content,
//   lang: French,
// }

// let tutorial_fr: catala_module = {
//   title: <Lang.String english="French tutorial" french=`Tutoriel francophone` />,
//   content: tutorial_fr_content,
//   lang: French,
// }

// let starter: catala_module = {
//   title: <Lang.String english="Starter" french=`Démarrage` />,
//   content: %bs.raw(`{default: "Hello, world!"}`),
//   lang: English,
// }

// let available_modules = [tutorial_en, tutorial_fr, allocations_familiales_fr]

// let set_editor_content: (editor, React.element, string) => unit = %bs.raw(`
//   function (editor, new_content, mode) {
//     editor.session.setMode(mode);
//     editor.setValue(new_content.default);
//     editor.clearSelection();
//     var row = editor.session.getLength() - 1;
//     var column = editor.session.getLine(row).length; // or simply Infinity
//     editor.gotoLine(row + 1, column);
//   }
//   `) // or simply Infinity

// let get_editor_content: editor => string = %bs.raw(`
//   function (editor) {
//     var contents = editor.getValue().slice();
//     return contents;
//   }
//   `)

// let set_module = (editor: editor, modu: catala_module): unit =>
//   set_editor_content(
//     editor,
//     modu.content,
//     switch modu.lang {
//     | English => "ace/mode/catala_en"
//     | French => "ace/mode/catala_fr"
//     },
//   )

// let null_object = %bs.raw(`{}`)

// @react.component
// let make = () => {
//   let (editor, setEditor) = React.useState(_ => null_object)
//   let (modu, setModule) = React.useState(_ => null_object)
//   let scope_name = React.useRef(Js.Nullable.null)
//   React.useEffect0(() => {
//     let editor = init_editor()
//     set_module(editor, starter)
//     setModule(_ => tutorial_en)
//     setEditor(_ => editor)
//     Some(() => ())
//   })
//   let render_module_select = (modu: catala_module, id: string): React.element =>
//     <div key=id>
//       <button
//         onClick={_ => {
//           setEditor(editor => {
//             set_module(editor, modu)
//             editor
//           })
//           setModule(_ => modu)
//         }}
//         className=%twc("bg-secondary shadow text-white px-4 py-2 mt-1 uppercase")>
//         modu.title
//       </button>
//     </div>
//   let exec_catala_and_retrieve_output = (
//     content: string,
//     scope: React.ref<Js.Nullable.t<Dom.element>>,
//     language: string,
//     trace: bool,
//   ): unit => {
//     let output = catala_exe(content, scope, language, trace)
//     switch ReactDOM.querySelector("#catala-output") {
//     | Some(id) => ReactDOM.render(<div dangerouslySetInnerHTML={"__html": output} />, id)
//     | None => ()
//     }
//   }
//   <>
//     <div className=%twc("flex flex-col grow")>
//       <Utils.PageTitle>
//         <Lang.String english="Online playground" french=`Bac à sable en ligne` />
//       </Utils.PageTitle>
//       <p>
//         <Lang.String
//           english="Welcome to the Catala online playground! This page lets
//         you use the Catala interpreter right inside your browser, without having
//         to install anything. You can write your program in the editor, then
//         type the name of the scope you wish to interpret in the input form and
//         click RUN."
//           french=`Bienvenue dans le bac à sable en ligne de Catala! Cette page
//         vous permet d'utiliser l'interpréteur de Catala dans votre navigateur,
//         sans avoir à installer quoique ce soit. Vous pouvez écrire votre programme
//         dans l'éditeur, puis taper le nom du champ d'application à exécuter
//         dans le formulaire et cliquer sur EXÉCUTER.`
//         />
//       </p>
//       <p>
//         <Lang.String
//           english="Note that this playground has limited support
//         and functionalities compared to writing Catala using a real IDE. Please
//         refer to "
//           french=`Les fonctionnalités de ce bac à sable sont limitées
//         par rapport à l'écriture de programme Catala dans un vrai environnement
//         de développement intégré. Veuillez vous référer à `
//         />
//         <Utils.TextLink target="https://github.com/CatalaLang/catala">
//           <Lang.String
//             english="the readmes of the GitHub repository" french=`aux lisez-moi du dépôt GitHub`
//           />
//         </Utils.TextLink>
//         <Lang.String
//           english=" for complete instructions on how
//       to set up your IDE."
//           french=` pour plus d'information sur comment
//       configurer votre EDI.`
//         />
//       </p>
//       <p>
//         <Lang.String
//           english="You can preload the code of the tutorial as a
//       starting point by clicking the buttons below."
//           french=`Vous pouvez
//       pré-charger le code du tutoriel à la manière d'un point de départ en
//       cliquant sur les boutons ci-dessous.`
//         />
//       </p>
//       <div className=%twc("flex flex-col grow mt-8")>
//         <div className=%twc("flex flex-row flex-wrap justify-around")>
//           {available_modules
//           ->Belt.Array.mapWithIndex((i, modu) => render_module_select(modu, string_of_int(i)))
//           ->React.array}
//         </div>
//         <div id="editor" className=%twc("grow my-4 w-full min-h-screen")>
//           {"Hello, world!" |> React.string}
//         </div>
//         <div className=%twc("flex flex-row flex-wrap justify-center p-2 bg-secondary shadow")>
//           <div className=%twc("pr-4 text-white my-1")>
//             <Lang.String english="Scope to execute:" french=`Champ d'application à exécuter :` />
//           </div>
//           <input
//             ref={ReactDOM.Ref.domRef(scope_name)}
//             type_="text"
//             className=%twc("border-solid border-2 border-tertiary my-1")
//           />
//           <button
//             className=%twc("ml-4 px-4 bg-tertiary text-white uppercase my-1")
//             onClick={_ =>
//               exec_catala_and_retrieve_output(
//                 get_editor_content(editor),
//                 scope_name,
//                 switch modu.lang {
//                 | English => "en"
//                 | French => "fr"
//                 },
//                 true,
//               )}>
//             <Lang.String english="Run" french=`Exécuter` />
//           </button>
//         </div>
//         <div
//           id="catala-output"
//           className=%twc("my-4 overflow-x-auto border-tertiary border-solid border-2 p-2")>
//           <pre> {"Click on RUN to launch the interpreter!" |> React.string} </pre>
//         </div>
//       </div>
//     </div>
//   </>
// }

