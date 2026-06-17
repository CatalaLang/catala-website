module ArrowIcon = {
  @react.component
  let make = (~className="") =>
    <svg
      className={"inline-block " ++ className}
      xmlns="http://www.w3.org/2000/svg"
      viewBox="0 0 24 24"
      fill="none"
      stroke="currentColor"
      strokeWidth="1.5">
      <path d="M5 12h14" />
      <path d="m12 5 7 7-7 7" />
    </svg>
}

module Text = {
  let baseClassName = "cursor-pointer text-primary_dark hover:text-button_fg_hover border-b border-transparent hover:border-button_fg_hover "
  @react.component
  let make = (~className="", ~target: string, ~children, ~internal=false) =>
    <a className={baseClassName ++ className} href=target target="_blank">
      children
      {if internal {
        <span />
      } else {
        <span className="inline-flex items-center pl-1 mt-2">
          <ArrowIcon className="w-3 h-3" />
        </span>
      }}
    </a>
}

module Button = {
  module Small = {
    @react.component
    let make = (
      ~className="text-base cursor-pointer border border-button_fg/50 px-4 py-1.5 text-button_fg font-medium inline-flex items-center font-sans hover:bg-primary_light/50 hover:text-button_fg_hover ease-in duration-100 bg-white",
      ~target: string,
      ~children,
    ) => {
      <a className href=target target="_blank">
        children
        <span className="inline-flex items-center pl-2">
          <ArrowIcon className="w-3 h-3" />
        </span>
      </a>
    }
  }

  @react.component
  let make = (
    ~className="cursor-pointer border border-button_fg/50 px-8 py-2 text-button_fg font-medium inline-flex items-center font-sans hover:bg-primary_light/50 hover:text-button_fg_hover ease-in duration-100 w-fit",
    ~target: string,
    ~children,
  ) => {
    <a className href=target target="_blank">
      children
      <span className="inline-flex items-center pl-2">
        <ArrowIcon className="w-5 h-5" />
      </span>
    </a>
  }

  module Primary = {
    @react.component
    let make = (
      ~className="cursor-pointer border bg-primary_light/80 px-4 sm:px-8 py-2 text-button_fg font-medium  inline-flex items-center border-button_fg/30 font-sans hover:bg-primary_light hover:text-button_fg_hover ease-in duration-100 w-fit ",
      ~target: string,
      ~children,
    ) => {
      <a className href=target target="_blank">
        children
        <span className="inline-flex items-center pl-2">
          <ArrowIcon className="w-5 h-5" />
        </span>
      </a>
    }
  }

  module Internal = {
    let baseClassName = "cursor-pointer border bg-primary_light/80 px-8 py-2 text-button_fg font-medium  inline-flex items-center border-button_fg/50 font-sans hover:bg-primary_light hover:text-button_fg_hover ease-in duration-100 w-fit "

    @react.component
    let make = (~className="", ~target: array<Nav.navElem>, ~children) => {
      let (lang, _) = React.useContext(Lang.langContext)
      <a className={baseClassName ++ className} onClick={_ => Nav.goTo(target, lang)}> children </a>
    }

    module Small = {
      @react.component
      let make = (
        ~className="cursor-pointer border bg-primary_light/80 px-4 py-2 text-button_fg text-sm inline-flex items-center border-button_fg/50 font-sans hover:bg-primary_light hover:text-button_fg_hover ease-in duration-100 w-fit ",
        ~target: array<Nav.navElem>,
        ~children,
      ) => {
        let (lang, _) = React.useContext(Lang.langContext)
        <a className onClick={_ => Nav.goTo(target, lang)}> children </a>
      }
    }
  }
}

module Internal = {
  module WithIcon = {
    @react.component
    let make = (
      ~className="cursor-pointer pt-2",
      ~name="double_arrow",
      ~target: array<Nav.navElem>,
      ~children,
    ) => {
      let (lang, _) = React.useContext(Lang.langContext)
      <a className onClick={_ => Nav.goTo(target, lang)}>
        <div className="flex flex-row flex-nowrap items-center text-green">
          <Icon className="pr-2" name />
          <span className="uppercase hover:text-secondary"> children </span>
        </div>
      </a>
    }
  }

  let baseClassName = "text-primary_dark cursor-pointer border-b border-transparent hover:border-button_fg/50 "
  @react.component
  let make = (~className="", ~target: array<Nav.navElem>, ~children) => {
    let (lang, _) = React.useContext(Lang.langContext)
    <a className={baseClassName ++ className} onClick={_ => Nav.goTo(target, lang)}> children </a>
  }
}
