module Row = {
  module Center = {
    @react.component
    let make = (~style="", ~children) => {
      <div className={%twc("flex flex-row justify-center items-center") ++ " " ++ style}>
        children
      </div>
    }
  }
}

@react.component
let make = (~style="", ~children) => {
  <div className={%twc("flex") ++ " " ++ style}> children </div>
}
