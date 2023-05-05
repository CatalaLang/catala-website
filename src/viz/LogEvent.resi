module LoggedValue: {
  type t = CatalaRuntime.LoggedValue.t
  /* React component for displaying a [LoggedValue]. */
  @react.component
  let make: (~depth: int=?, ~val: t) => React.element
}

type event = CatalaRuntime.event
