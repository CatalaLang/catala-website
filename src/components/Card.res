module Basic = {
  @react.component
  let make = (~children) => {
    <div className="text-background my-4 p-1 border bg-gray_light border-gray rounded shadow-sm">
      <div className="overflow-x-auto"> children </div>
    </div>
  }
}
module Presentation = {
  type action =
    | Internal(array<Nav.navElem>)
    | External(string)

  type t = {
    title: React.element,
    icon: option<string>,
    quote: option<React.element>,
    action: option<(action, React.element)>,
    content: React.element,
  }

  let renderPresentationCard = (lang, card: t, id: string) => {
    let buttonStyle = "cursor-pointer bg-button_bg py-2 px-4 text-button_fg text-base inline-flex items-center rounded font-semibold font-sans hover:bg-button_bg_hover hover:text-button_fg_hover ease-in duration-100"
    let action = switch card.action {
    | None => <div />
    | Some((Internal(navs), text)) =>
      <button className=buttonStyle onClick={_ => Nav.goTo(navs, lang)}>
        <Icon className="pr-2" name="double_arrow" />
        text
      </button>
    | Some((External(url), text)) =>
      <Link.Button className=buttonStyle target=url>
        <Icon className="pr-2" name="double_arrow" />
        text
      </Link.Button>
    }
    let quote = switch card.quote {
    | Some(quote) =>
      <blockquote className="text-green pb-4">
        <strong> quote </strong>
      </blockquote>
    | None => <div />
    }
    let icon = switch card.icon {
    | Some(icon) => <Icon className="pr-4" name=icon />
    | None => <span />
    }
    <div className="w-full lg:w-1/2" key=id>
      <div className="p-4 h-full">
        <div
          className="bg-white h-full overflow-hidden shadow-sm border-solid border-gray border rounded">
          <div className="flex flex-col justify-between h-full px-6 py-4  ">
            <div
              className=" flex flex-row flex-nowrap items-center text-xl sm:text-2xl pb-2 font-bold">
              icon
              card.title
            </div>
            quote
            <div className="text-base grow sm:text-lg pb-4"> card.content </div>
            <div className="flex justify-end"> action </div>
          </div>
        </div>
      </div>
    </div>
  }

  module FromList = {
    @react.component
    let make = (~cards: array<t>) => {
      let (lang, _) = React.useContext(Lang.langContext)
      <div className="flex flex-row flex-wrap items-stretch">
        {cards
        ->Belt.Array.mapWithIndex((i, card) => renderPresentationCard(lang, card, string_of_int(i)))
        ->React.array}
      </div>
    }
  }
}
