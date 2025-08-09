module Html = {
  let files: Dict.t<unit => promise<string>> = Vite.Import.Meta.globWithOpts(
    "../../assets/**/*.html",
    {as_: "raw"},
  )

  let getExn = (file: string): promise<string> => {
    let path = `../../assets/${file}`
    let import = Dict.get(files, path)->Option.getExn
    import()
  }
}

%%raw("import _catala_logo from '../../assets/logo.png'")
external _catala_logo: string = "_catala_logo"

%%raw("import _inria_logo from '../../assets/inr_logo_rouge.svg'")
external _inria_logo: string = "_inria_logo"

%%raw("import _oecd_logo from '../../assets/OECD_logo.svg'")
external _oecd_logo: string = "_oecd_logo"

%%raw("import _dinum_logo from '../../assets/Logo_DINUM_2020_RVB.png'")
external _dinum_logo: string = "_dinum_logo"

%%raw("import _pair_programming_compr from '../../assets/pair_programming_compr.jpg'")
external _pair_programming_compr: string = "_pair_programming_compr"

%%raw("import _literate_programming from '../../assets/ScreenShotVSCode.png'")
external _literate_programming: string = "_literate_programming"

%%raw("import _cnaf_logo from '../../assets/logo-cnaf.jpg'")
external _cnaf_logo: string = "_cnaf_logo"

%%raw("import _dgfip_logo from '../../assets/Logo_DGFP-fr.svg'")
external _dgfip_logo: string = "_dgfip_logo"

module Image = {
  let logo_catala: string = _catala_logo
  let logo_inria: string = _inria_logo
  let logo_oecd: string = _oecd_logo
  let logo_dinum: string = _dinum_logo
  let logo_cnaf: string = _cnaf_logo
  let logo_dgfip: string = _dgfip_logo
  let pair_programming_compr: string = _pair_programming_compr
  let literate_programming: string = _literate_programming
}
