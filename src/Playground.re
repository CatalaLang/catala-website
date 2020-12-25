[%bs.raw {|require("../ace-editor/src-min-noconflict/ace.js")|}];
[%bs.raw {|require("../ace-editor/src-min-noconflict/theme-monokai.js")|}];
[%bs.raw {|require("../assets/playground/mode-catala_en.js")|}];
[%bs.raw {|require("../assets/playground/mode-catala_fr.js")|}];

type editor;

let init_editor: unit => editor = [%bs.raw
  {| function () {
  var editor = ace.edit("editor");
  editor.setTheme("ace/theme/monokai");
  editor.session.setTabSize(2);
  document.getElementById('editor').style.fontSize='16px';
  return editor;
  }|}
];

type raw_object;
let tutorial_en_content: raw_object = [%bs.raw
  {|require("../assets/playground/tutorial_en.catala_en")|}
];
let tutorial_fr_content: raw_object = [%bs.raw
  {|require("../assets/playground/tutoriel_fr.catala_fr")|}
];

type syn_lang =
  | French
  | English;

type catala_module = {
  title: React.element,
  content: raw_object,
  lang: syn_lang,
};

let tutorial_en: catala_module = {
  title:
    <Lang.String
      english="English tutorial"
      french={js|Tutoriel anglophone|js}
    />,
  content: tutorial_en_content,
  lang: English
};


let tutorial_fr: catala_module = {
  title:
    <Lang.String
      english="French tutorial"
      french={js|Tutoriel francophone|js}
    />,
  content: tutorial_fr_content,
  lang: French
};

let available_modules = [| tutorial_en, tutorial_fr |];

let set_editor_content: (editor, raw_object, string) => unit = [%bs.raw
  {|
  function (editor, new_content, mode) {
    editor.session.setMode(mode);
    editor.setValue(new_content.default);
    editor.clearSelection();
  }
  |}
];

let set_module = (editor: editor, modu: catala_module): unit =>
  set_editor_content(editor, modu.content,
    switch (modu.lang) { 
      | English => "ace/mode/catala_en"
      | French => "ace/mode/catala_fr"
    }
  );



[@react.component]
let make = () => {
  let (editor, setEditor) = React.useState(_ => [%bs.raw {|{}|}]);
  React.useEffect0(() => {
    let editor = init_editor();
    set_module(editor, tutorial_fr);
    setEditor(_ => editor);
    Some(() => ());
  });
  let render_module_select = (editor: editor, modu: catala_module): React.element => 
  <div className=[%tw ""]> 
    <button onClick={_ => setEditor(editor => {set_module(editor, modu); editor})}> 
      modu.title 
    </button>
  </div>;
  <>
    <div className=[%tw "flex flex-col flex-grow"]>
      <Utils.PageTitle>
        <Lang.String
          english="Online playground"
          french={js|Bac à sable en ligne|js}
        />
      </Utils.PageTitle>
      <div className=[%tw "flex flex-col flex-grow"]>
        <div className=[%tw "flex flex-row justify-around"]>
        {available_modules
          ->Belt.Array.map(modu =>
              render_module_select(editor, modu)
            )
          ->React.array}
        </div>
        <div id="editor" className=[%tw "flex-grow my-4 w-full"]>
          {"Hello, world!" |> React.string}
        </div>
        <div className=[%tw "flex flex-row"]>
          {"Running Catala UI" |> React.string}
        </div>
      </div>
    </div>
  </>;
};
