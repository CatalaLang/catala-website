@react.component
let make = (~htmlFile, ~className) => {
  let (htmlState, setHtmlState) = React.useState(_ => None)
  React.useEffect(() => {
    // This assumes MathJax to be loaded in the page. Necessary for the
    // LaTeX components of the Catala code to be typeset after any
    // change in the collapsible structure of the page.
    Assets.Html.getExn(htmlFile)
    ->Promise.thenResolve(html => setHtmlState(_ => Some(html)))
    ->Promise.done
    None
  })

  {
    switch htmlState {
    | Some(html) =>
      <div
        className={className}
        dangerouslySetInnerHTML={
          "__html": html,
        }
      />
    | None => <div className={className}> {"Loading..."->React.string} </div>
    }
  }
}
