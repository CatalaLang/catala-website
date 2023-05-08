module rec LoggedValue: {
  type t = CatalaRuntime.LoggedValue.t

  @react.component
  let make: (~depth: int=?, ~val: t) => React.element
} = {
  type t = CatalaRuntime.LoggedValue.t

  @react.component
  let make = (~depth=1, ~val: t) => {
    switch val {
    | Unit => <CatalaCode.Span kind="nc" code={"()"} />
    | Bool(b) => <CatalaCode.Span kind="mb" code={b->string_of_bool} />
    | Integer(i) => <CatalaCode.Span kind="mi" code={i->string_of_int} />
    | Money(m) =>
      <>
        <CatalaCode.Span kind="mf" code={m->Js.Float.toString} />
        <CatalaCode.Op op={` €`} />
      </>
    | Decimal(d) => <CatalaCode.Span kind="mf" code={d->Js.Float.toString} />
    | Date(d) => <CatalaCode.Span kind="mi" code=d />
    | Duration(d) => <CatalaCode.Span kind="mi" code=d />
    | Enum(_, (s, Unit)) =>
      <>
        <CatalaCode.Ids ids={[s]} />
      </>
    | Enum(_, (s, val)) =>
      <>
        <CatalaCode.Ids ids={[s]} />
        <CatalaCode.Op op=" = " />
        <LoggedValue depth={depth + 1} val />
      </>
    | Struct(ls, attributes) =>
      <CatalaCode.Collapsible
        start={<>
          <CatalaCode.Ids ids={ls->Belt.List.toArray} />
          <CatalaCode.Op op=" = {" />
        </>}
        end={<>
          <CatalaCode.Op op="}" />
        </>}>
        {attributes
        ->Belt.List.toArray
        ->Belt.Array.map(attribute => {
          let (id, val) = attribute
          <span key=id>
            <CatalaCode.Op op={Js.String.repeat(depth * 2, " ")} />
            <CatalaCode.Op op=" -- " />
            <CatalaCode.Ids ids={[id]} />
            <CatalaCode.Op op=" = " />
            <LoggedValue depth={depth + 1} val />
            <CatalaCode.Op op=", " />
            <br />
          </span>
        })
        ->React.array}
        <CatalaCode.Op op={Js.String.repeat((depth - 1) * 2, " ")} />
      </CatalaCode.Collapsible>
    | Array(vals) =>
      <CatalaCode.Collapsible start={<CatalaCode.Op op="[" />} end={<CatalaCode.Op op="]" />}>
        {vals
        ->Belt.Array.mapWithIndex((i, val) =>
          <span key={i->string_of_int}>
            <CatalaCode.Op op={Js.String.repeat(depth * 2, " ")} />
            <LoggedValue depth={depth + 1} val />
            <CatalaCode.Op op="," />
            <br />
          </span>
        )
        ->React.array}
        <CatalaCode.Op op={Js.String.repeat((depth - 1) * 2, " ")} />
      </CatalaCode.Collapsible>
    | Unembeddable => <> {"Unembeddable"->React.string} </>
    }
  }
}

type event = CatalaRuntime.event
