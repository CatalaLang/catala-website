module Collapsible = {
  @react.component
  let make = (
    ~labelExpand=<Lang.String english="Open" french={`Ouvrir`} />,
    ~labelCollapse=<Lang.String english="Close" french={`Fermer`} />,
    ~className="",
    ~children,
  ) => {
    let iconStyle = "float-left"
    let labelStyle = "text-base font-sans hover:text-button_fg p-0"
    let (visible, setVisible) = React.useState(_ => false)
    <div className={"mt-4 border border-border p-2 bg-primary_light/5 " ++ className}>
      {if visible {
        <>
          <div className=labelStyle>
            <a
              className="cursor-pointer flex items-center gap-2"
              onClick={_ => setVisible(_ => false)}>
              <svg
                xmlns="http://www.w3.org/2000/svg"
                width="24"
                height="24"
                viewBox="0 0 24 24"
                fill="none"
                stroke="currentColor"
                strokeWidth="2"
                strokeLinecap="round"
                strokeLinejoin="round">
                <path d="m18 15-6-6-6 6" />
              </svg>
              labelCollapse
            </a>
          </div>
          <div className="overflow-x-auto"> children </div>
        </>
      } else {
        <div className=labelStyle>
          <a
            className="cursor-pointer flex gap-2 items-center" onClick={_ => setVisible(_ => true)}>
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
              className="">
              <path d="m6 9 6 6 6-6" />
            </svg>
            labelExpand
          </a>
        </div>
      }}
    </div>
  }
}
