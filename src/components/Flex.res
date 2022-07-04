module Row = {
  module Center = {
    @react.component
    let make = (~style="", ~children) => {
      <div className={%twc("flex flex-row justify-center items-center") ++ " " ++ style}>
        children
      </div>
    }
  }

  module AlignTop = {
    @react.component
    let make = (~style="", ~children) => {
      <div className={%twc("flex flex-row justify-start items-start") ++ " " ++ style}>
        children
      </div>
    }
  }

  module Wrap = {
    @react.component
    let make = (~style="", ~children) => {
      <div className={%twc("flex flex-row flex-wrap justify-start items-start") ++ " " ++ style}>
        children
      </div>
    }
  }

  @react.component
  let make = (~style="", ~children) => {
    <div className={%twc("flex flex-row") ++ " " ++ style}> children </div>
  }
}

module Column = {
  module Center = {
    @react.component
    let make = (~style="", ~children) => {
      <div className={%twc("flex flex-col justify-center items-center shadow") ++ " " ++ style}>
        children
      </div>
    }
  }

  module AlignLeft = {
    @react.component
    let make = (~style="", ~children) => {
      <div className={%twc("flex flex-col justify-start items-start") ++ " " ++ style}>
        children
      </div>
    }
  }
}

@react.component
let make = (~style="", ~children) => {
  <div className={%twc("flex") ++ " " ++ style}> children </div>
}
