module Basic = {
  @react.component
  let make = (~children) => {
    <div
      className=%twc(
        "text-background my-4 p-1 border bg-gray_light border-gray rounded \
        shadow-sm"
      )>
      <div className=%twc("overflow-x-auto")> children </div>
    </div>
  }
}
module Presentation = {
  type t = {
    title: React.element,
    icon: option<string>,
    quote: option<React.element>,
    action: option<(array<Nav.navElem>, React.element)>,
    content: React.element,
  }

  let render_presentation_card = (card: t, id: string) => {
    let action = switch card.action {
    | None => <div />
    | Some((navs, text)) =>
      let lang = Lang.getCurrentLang()
      <button
        className=%twc(
          "cursor-pointer bg-button_bg py-2 px-4 text-button_fg text-base inline-flex items-center rounded font-semibold font-sans hover:bg-button_bg_hover hover:text-button_fg_hover"
        )
        onClick={_ => Nav.goTo(navs, lang)}>
        <Icon className=%twc("pr-2") name="double_arrow" /> text
      </button>
    }
    let quote = switch card.quote {
    | Some(quote) =>
      <blockquote className=%twc("text-green pb-4")> <strong> quote </strong> </blockquote>
    | None => <div />
    }
    let icon = switch card.icon {
    | Some(icon) => <Icon className="pr-4" name=icon />
    | None => <span />
    }
    <div className=%twc("w-full lg:w-1/2") key=id>
      <div className=%twc("p-4 h-full")>
        <div
          className=%twc(
            "bg-white h-full overflow-hidden shadow-sm border-solid border-gray border rounded"
          )>
          <div className=%twc("flex flex-col justify-between h-full px-6 py-4 text-background ")>
            <div>
              <div
                className=%twc(
                  " flex flex-row flex-nowrap items-center text-3xl md:text-xl lg:text-lg pb-2 font-bold"
                )>
                icon card.title
              </div>
              quote
              <p className=%twc("pb-4")> card.content </p>
            </div>
            <div className=%twc("inline-flex justify-end")> action </div>
          </div>
        </div>
      </div>
    </div>
  }

  module FromList = {
    @react.component
    let make = (~cards: array<t>) => {
      <div className=%twc("flex flex-row flex-wrap items-stretch")>
        {cards
        ->Belt.Array.mapWithIndex((i, card) => render_presentation_card(card, string_of_int(i)))
        ->React.array}
      </div>
    }
  }
}
