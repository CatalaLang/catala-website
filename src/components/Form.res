module Input = {
  let flexColStyle = %twc("flex flex-col items-start mx-4")
  let fieldStyle = %twc(
    "font-sans font-semibold text-gray_dark px-2 my-1 \
    bg-gray_light border-solid border-2 border-gray rounded \
    hover:border-gray_dark \
    focus:outline-none focus:border-gray_dark \
    ease-in duration-100"
  )
  let labelStyle = %twc("text-background text-center font-sans text-sm font-semibold")

  module Num = {
    @react.component
    let make = (~label, ~onChange) => {
      <div className=flexColStyle>
        <label className=labelStyle> label </label>
        <input type_="number" className=fieldStyle onChange />
      </div>
    }
  }

  module Browsers = {
    @react.component
    let make = (~label, ~onChange, ~options) => {
      <div className=flexColStyle>
        <label className=labelStyle> label </label>
        <select list="browsers" className=fieldStyle onChange>
          {options
          ->Belt.Array.mapWithIndex((i, option) => {
            <option key={"browser-option-" ++ i->string_of_int} value=option>
              {option->React.string}
            </option>
          })
          ->React.array}
        </select>
      </div>
    }
  }

  module Date = {
    @react.component
    let make = (~label, ~onChange) => {
      <div className=flexColStyle>
        <label className=labelStyle> label </label>
        <input className=fieldStyle type_="date" onChange />
      </div>
    }
  }

  module CheckBox = {
    @react.component
    let make = (~label, ~onChange) => {
      <div className=%twc("flex flex-row items-center mx-4")>
        <label className=labelStyle> label </label>
        <input className=%twc("ml-2") type_="checkbox" onChange />
      </div>
    }
  }
}
