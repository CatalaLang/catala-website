module Basic = {
  @react.component
  let make = (~collapsible: bool, ~children) => {
    let (visible, setVisible) = React.useState(() => false)
    <div className=%twc("bg-tertiary text-white my-4 p-4 shadow-lg")>
      {if !collapsible || visible {
        if collapsible {
          <>
            <div className=%twc("text-xl pb-2 font-bold")>
              <a className=%twc("cursor-pointer") onClick={_ => setVisible(_ => false)}>
                <i className="float-left pr-1 text-white material-icons">
                  {"expand_less" |> React.string}
                </i>
                {"Collapse" |> React.string}
              </a>
            </div>
            <div className=%twc("overflow-x-auto")> children </div>
          </>
        } else {
          <div className=%twc("overflow-x-auto")> children </div>
        }
      } else {
        <div className=%twc("text-xl pb-2 font-bold")>
          <a className=%twc("cursor-pointer") onClick={_ => setVisible(_ => true)}>
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
    action: option<(array<Nav.navElem>, React.element)>,
    content: React.element,
  }

  let render_presentation_card = (card: t, id: string) => {
    let action = switch card.action {
    | None => <div />
    | Some((navs, action)) => <Link.Internal.WithIcon target=navs> action </Link.Internal.WithIcon>
    }
    let quote = switch card.quote {
    | Some(quote) =>
      <blockquote className=%twc("text-primary pb-4")> <strong> quote </strong> </blockquote>
    | None => <div />
    }
    let icon = switch card.icon {
    | Some(icon) => <Icon className="pr-4" name=icon />
    | None => <span />
    }
    <div className=%twc("w-full lg:w-1/2") key=id>
      <div className=%twc("p-4 h-full")>
        <div className=%twc("bg-tertiary h-full overflow-hidden shadow-lg")>
          <div className=%twc("flex flex-col justify-between h-full px-6 py-4 text-white")>
            <div>
              <div
                className=%twc(
                  " flex flex-row flex-nowrap items-center text-2xl md:text-xl lg:text-lg pb-2 font-bold"
                )>
                icon card.title
              </div>
              quote
              <p className=%twc("pb-4")> card.content </p>
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
      <div className=%twc("flex flex-row flex-wrap items-stretch")>
        {cards
        ->Belt.Array.mapWithIndex((i, card) => render_presentation_card(card, string_of_int(i)))
        ->React.array}
      </div>
    }
  }
}
