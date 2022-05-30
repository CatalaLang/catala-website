@react.component
let make = (~className="", ~name: string) => {
  <i className={"material-icons " ++ className}> {name->React.string} </i>
}
