/*
  This module provides a functor to build a log event visualizer from a React
  component able to set an array of [LogEvent.event].
*/

open LogEvent

/*
  Module signature for the React component argument.
*/
module type LOGGABLE = {
  /* The page title of the visualizer. */
  let pageTitle: React.element

  @react.component
  let make: (~setEventsOpt: (option<array<event>> => option<array<event>>) => unit) => React.element
}

/*
  Functor to build a log event visualizer from a React component. It creates a
  page with the [Simulator.pageTitle] as the title and use the [Simulator]
  component to retrieves the events -- most likely from a form.
*/
module Make: (Simulator: LOGGABLE) =>
{
  @react.component
  let make: unit => React.element
}
