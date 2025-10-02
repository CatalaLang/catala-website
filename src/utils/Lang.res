type lang =
  | French
  | English

let toNum = (l: lang): int =>
  switch l {
  | French => 0
  | English => 1
  }

let toUrl = (l: lang): string =>
  switch l {
  | French => "fr"
  | English => "en"
  }

let fromUrl = (s: string): option<lang> => {
  if s == toUrl(English) {
    Some(English)
  } else if s == toUrl(French) {
    Some(French)
  } else {
    None
  }
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

let newLangFromOldLang = (old_lang: lang): lang =>
  if old_lang == English {
    French
  } else {
    English
  }

let getCurrent = (~french: 'a, ~english: 'a): 'a => {
  let (lang, _) = React.useContext(langContext)
  switch lang {
  | French => french
  | English => english
  }
}

module Element = {
  @react.component
  let make = React.memo((~french: React.element, ~english: React.element) => {
    let (lang, _) = React.useContext(langContext)
    switch lang {
    | French => french
    | English => english
    }
  })
}

module String = {
  @react.component
  let make = React.memo((~french: string, ~english: string) => {
    let (lang, _) = React.useContext(langContext)
    switch lang {
    | French => french
    | English => english
    }->React.string
  })
}
