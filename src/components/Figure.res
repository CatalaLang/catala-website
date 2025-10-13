@react.component
let make = (~src, ~altFr="", ~altEn="", ~className="", ~width="auto", ~height="auto") => {
  <figure className="w-fit">
    <img src width height alt={altEn} className="border border-border p-2 bg-stone-50" />
    <figcaption
      className="w-full italic text-xs text-left p-1.5 px-2 border-x border-b border-border bg-stone-50 rounded-b-sm text-stone-700">
      <Lang.String english=altEn french=altFr />
    </figcaption>
  </figure>
}
