type lang =
  | French
  | English

let lang_num = (l: lang): int =>
  switch l {
  | French => 0
  | English => 1
  }

let lang_url = (l: lang): string =>
  switch l {
  | French => "fr"
  | English => "en"
  }

module LangCmp = Belt.Id.MakeComparable({
  type t = lang
  let cmp = (a, b) => lang_num(a) - lang_num(b)
})

type i18n_str = Belt.Map.t<lang, string, LangCmp.identity>

let make_i18_str = (~french: string, ~english: string): i18n_str => {
  let m = Belt.Map.make(~id=module(LangCmp))
  let m = Belt.Map.set(m, French, french)
  Belt.Map.set(m, English, english)
}

let langContext = React.createContext((English, () => ()))

module Context = {
  let makeProps = (~value: (lang, unit => unit), ~children, ()) =>
    {
      "value": value,
      "children": children,
    }

  let make = React.Context.provider(langContext)
}

let new_lang_from_old_lang = (old_lang: lang): lang =>
  if old_lang == English {
    French
  } else {
    English
  }

module Element = {
  @react.component
  let make = (~french: React.element, ~english: React.element) => {
    let (lang, _setLang) = React.useContext(langContext)
    switch lang {
    | French => french
    | English => english
    }
  }
}

module String = {
  @react.component
  let make = (~french: string, ~english: string) => {
    let str = make_i18_str(~french, ~english)
    let (lang, _setLang) = React.useContext(langContext)
    switch Belt.Map.get(str, lang) {
    | None =>
      let (_, x) = Belt.List.headExn(Belt.Map.toList(str))
      x
    | Some(str) => str
    }->React.string
  }
}
