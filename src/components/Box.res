module Collapsible = {
  @react.component
  let make = (
    ~labelExpand=<Lang.String english="Open" french={`Ouvrir`} />,
    ~labelCollapse=<Lang.String english="Close" french={`Fermer`} />,
    ~children,
  ) => {
    let iconStyle = "float-left text-gray_dark"
    let labelStyle = "text-base font-sans font-bold text-gray_dark hover:text-green"
    let (visible, setVisible) = React.useState(_ => false)
    <div
      className="text-background my-4 p-2 border bg-gray_light border-gray rounded shadow-sm overflow-y-auto max-h-128">
      {if visible {
        <>
          <div className=labelStyle>
            <a className="cursor-pointer" onClick={_ => setVisible(_ => false)}>
              <Icon className=iconStyle name="expand_less" />
              labelCollapse
            </a>
          </div>
          <div className="overflow-x-auto"> children </div>
        </>
      } else {
        <div className=labelStyle>
          <a className="cursor-pointer" onClick={_ => setVisible(_ => true)}>
            <Icon className=iconStyle name="expand_more" />
            labelExpand
          </a>
        </div>
      }}
    </div>
  }
}
