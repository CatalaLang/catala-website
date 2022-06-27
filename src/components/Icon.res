@react.component
let make = React.memo((~className="", ~name: string) => {
  <i className={"material-icons " ++ className}> {name->React.string} </i>
})
