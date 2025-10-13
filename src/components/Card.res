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
    icon: option<React.element>,
    quote: option<React.element>,
    action: option<(action, React.element)>,
    content: React.element,
  }

  let renderPresentationCard = (card: t, id: string) => {
    let action = switch card.action {
    | None => <div />
    | Some((Internal(navs), text)) =>
      <Link.Internal target=navs className="text-base italic"> text </Link.Internal>
    | Some((External(url), text)) =>
      <Link.Text target=url className="italic text-base"> text </Link.Text>
    }
    let quote = switch card.quote {
    | Some(quote) =>
      <blockquote className="w-fit mb-4 text-base font-medium">
        <TextHighlight> quote </TextHighlight>
      </blockquote>
    | None => <div />
    }
    let icon = switch card.icon {
    | Some(icon) => <span className="pr-2"> icon </span>
    | None => <span />
    }
    <div
      id
      className="border bg-white h-full overflow-hidden nth-[n]:border-r border-border nth-[2n+1]:border-b">
      <div className="flex flex-col h-full">
        <div
          className="border-b border-border border-dashed inline-flex p-4 flex-row flex-nowrap items-center text-xl font-serif font-semibold">
          icon
          card.title
        </div>
        <div className="flex flex-col h-full justify-between">
          <div className="p-4">
            <div> quote </div>
            <div className="text-base"> card.content </div>
          </div>
          {Option.isSome(card.action)
            ? <div className="border-t border-border border-dashed px-4 py-2 "> action </div>
            : <div />}
        </div>
      </div>
    </div>
  }

  module FromList = {
    @react.component
    let make = (~cards: array<t>) => {
      <div className="grid grid-cols-1 lg:grid-cols-2 gap-4 mx-4 md:mx-8 mt-8">
        {cards
        ->Belt.Array.mapWithIndex((i, card) => renderPresentationCard(card, string_of_int(i)))
        ->React.array}
      </div>
    }
  }
}
