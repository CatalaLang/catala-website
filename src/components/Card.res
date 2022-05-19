module Basic = {
  @react.component
  let make = (~collapsible: bool, ~children) => {
    let (visible, setVisible) = React.useState(() => false)
    <div className=%tw("bg-tertiary text-white my-4 p-4 shadow-lg")>
      {if !collapsible || visible {
        if collapsible {
          <>
            <div className=%tw("text-xl pb-2 font-bold")>
              <a className=%tw("cursor-pointer") onClick={_ => setVisible(_ => false)}>
                <i className="float-left pr-1 text-white material-icons">
                  {"expand_less" |> React.string}
                </i>
                {"Collapse" |> React.string}
              </a>
            </div>
            <div className=%tw("overflow-x-auto")> children </div>
          </>
        } else {
          <div className=%tw("overflow-x-auto")> children </div>
        }
      } else {
        <div className=%tw("text-xl pb-2 font-bold")>
          <a className=%tw("cursor-pointer") onClick={_ => setVisible(_ => true)}>
            <i className="float-left pr-1 text-white material-icons">
              {"expand_more" |> React.string}
            </i>
            {"Expand" |> React.string}
          </a>
        </div>
      }}
    </div>
  }
}
module Presentation = {
  type t = {
    title: React.element,
    icon: option<string>,
    quote: option<React.element>,
    action: option<(array<Elements.navigation_element>, React.element)>,
    content: React.element,
  }

  let render_presentation_card = (card: t, lang: Lang.lang, id: string) => {
    let action = switch card.action {
    | None => <div />
    | Some((navs, action)) =>
      <a
        className=%tw("cursor-pointer border-solid border-t-2 border-primary pt-2")
        onClick={Elements.goToElement(navs, lang)}>
        <div className=%tw("flex flex-row flex-nowrap items-center")>
          <i className="pr-2 material-icons text-primary"> {"double_arrow" |> React.string} </i>
          <span className=%tw("uppercase text-primary border-solid border-secondary border-b")>
            action
          </span>
        </div>
      </a>
    }
    let quote = switch card.quote {
    | Some(quote) =>
      <blockquote className=%tw("text-primary pb-4")> <strong> quote </strong> </blockquote>
    | None => <div />
    }
    let icon = switch card.icon {
    | Some(icon) => <i className="pr-4 material-icons"> {icon |> React.string} </i>
    | None => <span />
    }
    <div className=%tw("w-full lg:w-1/2") key=id>
      <div className=%tw("p-4 h-full")>
        <div className=%tw("bg-tertiary h-full overflow-hidden shadow-lg")>
          <div className=%tw("flex flex-col justify-between h-full px-6 py-4 text-white")>
            <div>
              <div
                className=%tw(
                  " flex flex-row flex-nowrap items-center text-2xl md:text-xl lg:text-lg pb-2 font-bold"
                )>
                icon card.title
              </div>
              quote
              <p className=%tw("pb-4")> card.content </p>
            </div>
            action
          </div>
        </div>
      </div>
    </div>
  }

  module FromList = {
    @react.component
    let make = (~cards: array<t>) => {
      let (lang, _) = React.useContext(Lang.langContext)
      <div className=%tw("flex flex-row flex-wrap items-stretch")>
        {cards
        ->Belt.Array.mapWithIndex((i, card) =>
          render_presentation_card(card, lang, string_of_int(i))
        )
        ->React.array}
      </div>
    }
  }
}
