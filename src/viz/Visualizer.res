// open PageComponents
// open CatalaRuntime

/*
  React component used to navigate through an array of [event]. Furthermore, it
  stores already visited [var_def] -- via a setter in props.
*/
// module EventNavigator = {
//   type index =
//     | Prev(int)
//     | Next(int)

//   let getIndex = idx => {
//     switch idx {
//     | Next(idx) | Prev(idx) => idx
//     }
//   }

//   let buttonStyle = %twc(
//     "inline-flex justify-center text-gray_dark border text-base border-secondary font-semibold bg-gray shadow-sm hover:bg-gray_medium hover:shadow ease-out duration-150"
//   )

//   /* React component used to increase or decrease the navitgator index. */
//   module Navigation = {
//     @react.component
//     let make = React.memo((~index, ~setIndex, ~maxIndex) => {
//       let idx = index->getIndex
//       <>
//         <div
//           className=%twc("inline-flex flex-row justify-center content-center text-base font-sans")>
//           <button
//             className={buttonStyle ++ %twc(" rounded-l-lg pr-2")}
//             onClick={_ => setIndex(_ => Prev(idx > 1 ? idx - 1 : 0))}>
//             <Icon className=%twc("h-4") name="arrow_left" />
//             {"Prev"->React.string}
//           </button>
//           <button className={buttonStyle ++ " px-2"} onClick={_ => setIndex(_ => Prev(0))}>
//             {((idx + 1)->string_of_int ++ "/" ++ maxIndex->string_of_int)->React.string}
//           </button>
//           <button
//             className={buttonStyle ++ %twc(" rounded-r-lg pl-2")}
//             onClick={_ => setIndex(_ => Next(idx < maxIndex - 1 ? idx + 1 : 0))}>
//             {"Next"->React.string}
//             <Icon name="arrow_right" />
//           </button>
//         </div>
//       </>
//     })
//   }

//   @react.component
//   let make = (~events, ~eventToComponent: event => React.element, ~setVarDefs=?) => {
//     let (index, setIndex) = React.useState(_ => Next(0))
//     let nbEvents = events->Belt.Array.length
//     let idx = index->getIndex
//     React.useEffect1(_ => {
//       setVarDefs->Belt.Option.forEach(set =>
//         set(
//           _ =>
//             events
//             ->Belt.Array.keepWithIndex(
//               (e, i) => {
//                 switch e {
//                 | VarComputation(_) => i < idx
//                 | _ => false
//                 }
//               },
//             )
//             ->Belt.Array.map(
//               e =>
//                 switch e {
//                 | VarComputation(v) => v
//                 | _ => Js.Exn.raiseError("unreachable")
//                 },
//             ),
//         )
//       )
//       None
//     }, [index])
//     <>
//       <Navigation index setIndex maxIndex={nbEvents} />
//       {switch events->Belt.Array.get(idx) {
//       | Some(event) => event->eventToComponent
//       | _ => <> </>
//       }}
//     </>
//   }
// }

// /*
//   [scrollToAndHighlightLineNum(parentElem, ids)] scrolls into the corresponding
//   Catala code line of [ids] inside the [parentElem] DOM element and highlight the
//   line numbers.
//  */
// let scrollToAndHighlightLineNum: (Dom.element, array<string>) => unit = %raw(`
//   function(parentElem, ids) {
//     if (null != parent) {
//       let id = ids[Math.floor(ids.length/2)]
//       let idEscaped = id.replaceAll(/\./g, "\\\.").replaceAll(/\//g, "\\\/")

//       console.log(idEscaped)
//       let lineToScroll = parentElem.querySelector("#" + idEscaped)
//       if (null != lineToScroll) {
//         let parent = lineToScroll.parentNode;
//         while (null != parent) {
//           if ('DETAILS' == parent.nodeName) {
//             parent.setAttribute("open", true);
//             parent = null;
//           }
//           else {
//             parent = parent.parentNode;
//           }
//         }
//         lineToScroll.scrollIntoView({block: "center"});
//         lineToScroll.className = "selected";
//         var links = lineToScroll.parentNode.parentNode.parentNode.parentNode.firstChild.firstChild.firstChild.getElementsByTagName('A');
//         for (var i = 0; i < links.length; i++) {
//           if (ids.some(id => links[i].href.includes(id))) {
//             links[i].className = "selected"
//           } else {
//             links[i].className = ""
//           }
//         }
//       }
//     }
//   }
// `)

// module MakeLogEventComponent = (
//   Infos: {
//     let catalaCodeHTML: string
//   },
// ) => {
//   /*
//   React component to render an [event].

//   Use internal React components for rendering specific event types:
//   [VarComputation], [FunCall] and [SubScopeCall].
// */
//   module rec LogEventComponent: {
//     module VarComputation: {
//       @react.component
//       let make: (
//         ~varDef: var_def,
//         ~printHeadings: bool=?,
//         ~kindIcon: React.element=?,
//       ) => React.element
//     }
//     module FunCall: {
//       @react.component
//       let make: (~funCall: fun_call) => React.element
//     }
//     @react.component
//     let make: (~event: event) => React.element
//   } = {
//     /* Base React component used to render collapsible item. */
//     module CollapsibleItem = {
//       @react.component
//       let make = (
//         // optional array of ids used to highlight the corresponding code lines.
//         ~idsOpt=None,
//         // content of the header -- always visible.
//         ~headerContent,
//         // optional value to display below the [headerContent].
//         ~headerValueOpt=None,
//         // optional React element to display to the top-right corner of the item.
//         ~kindIcon=<> </>,
//         // content of the item -- visible only when the item is expanded.
//         ~children,
//       ) => {
//         let (isOpen, setIsOpen) = React.useState(_ => false)
//         let parentDomElemRef = React.useRef(Js.Nullable.null)
//         React.useEffect2(() => {
//           if isOpen {
//             switch (parentDomElemRef.current->Js.Nullable.toOption, idsOpt) {
//             | (Some(parentDomElem), Some(ids)) => parentDomElem->scrollToAndHighlightLineNum(ids)
//             | _ => ()
//             }
//           }
//           None
//         }, (isOpen, idsOpt))
//         let toggleStyle = %twc(
//           "ml-2 cursor-pointer rounded hover:bg-secondary hover:text-gray_light ease-out duration-150"
//         )

//         <div className=%twc("w-full") ref={ReactDOM.Ref.domRef(parentDomElemRef)}>
//           <Flex.Column.AlignLeft
//             style=%twc(
//               "border-solid border-secondary border rounded mt-4 hover:border-gray_dark shadow"
//             )>
//             <Flex.Column.AlignLeft
//               style={%twc("w-full py-2 bg-gray_2 text-gray_dark font-semibold rounded-t border-secondary
//               ") ++ if !isOpen {
//                 %twc(" rounded-b")
//               } else {
//                 %twc(" border-b")
//               }}>
//               <Flex.Row.AlignTop style=%twc("w-full justify-between pr-2")>
//                 <Flex.Row.AlignTop style=%twc("w-full")>
//                   <a
//                     className=%twc("cursor-pointer rounded") onClick={_ => setIsOpen(_ => !isOpen)}>
//                     {if isOpen {
//                       <Icon className=toggleStyle name="arrow_drop_down" />
//                     } else {
//                       <Icon className=toggleStyle name="arrow_right" />
//                     }}
//                   </a>
//                   headerContent
//                 </Flex.Row.AlignTop>
//                 kindIcon
//               </Flex.Row.AlignTop>
//               {switch headerValueOpt {
//               | Some(headerValue) => <div className=%twc("px-4")> headerValue </div>
//               | None => <> </>
//               }}
//             </Flex.Column.AlignLeft>
//             {if isOpen {
//               children
//             } else {
//               <> </>
//             }}
//           </Flex.Column.AlignLeft>
//         </div>
//       }
//     }

//     /*
//     React component used to render variable computation which includes:
//     variable definitions, subscope and function input/output definitions.
//  */
//     module VarComputation = {
//       @react.component
//       let make = React.memo((// variable definition to render
//       ~varDef: var_def,
//       // whether to print all law headings or not
//       ~printHeadings=true,
//       // optional React element to display to the top-right corner of the item -- see [CollapsibleItem].
//       ~kindIcon=?) => {
//         let (allHeadings, idsOpt) = switch varDef.pos {
//         | Some(pos) =>
//           let ids = {
//             if pos.start_line != pos.end_line {
//               Belt.Array.makeBy(pos.end_line - pos.start_line + 1, lnum => {
//                 pos.filename ++ "-" ++ (pos.start_line + lnum)->string_of_int
//               })
//             } else {
//               [pos.filename ++ "-" ++ pos.start_line->string_of_int]
//             }
//           }

//           (
//             <Flex.Row.Wrap>
//               {pos.law_headings
//               ->Belt.Array.reverse
//               ->Belt.Array.mapWithIndex((i, h) =>
//                 <Flex.Row.Center key={"law-heading-" ++ i->string_of_int}>
//                   {if i < pos.law_headings->Belt.Array.length - 1 {
//                     <>
//                       <p> {h->React.string} </p>
//                       <Icon name="chevron_right" />
//                     </>
//                   } else {
//                     <p className=%twc("font-bold")> {h->React.string} </p>
//                   }}
//                 </Flex.Row.Center>
//               )
//               ->React.array}
//             </Flex.Row.Wrap>,
//             Some(ids),
//           )
//         | None => (<> </>, None)
//         }

//         let headerValue =
//           <CatalaCode>
//             <CatalaCode.Ids ids={varDef.name->Belt.List.toArray} />
//             <CatalaCode.Op op={" = "} />
//             <LogEvent.LoggedValue val={varDef.value} />
//           </CatalaCode>

//         let headerValueOpt = if printHeadings {
//           Some(headerValue)
//         } else {
//           None
//         }

//         let headerContent = if printHeadings {
//           allHeadings
//         } else {
//           headerValue
//         }

//         let kindIO = if varDef.io.io_output {
//           <Lang.String english={`output`} french={`sortie`} />
//         } else {
//           switch varDef.io.io_input {
//           | NoInput => <Lang.String english={`internal`} french={`interne`} />
//           | _ => <Lang.String english={`input`} french={`entrée`} />
//           }
//         }

//         let kindIcon = switch kindIcon {
//         | Some(icon) => icon
//         | None =>
//           <div
//             className={%twc("px-2 font-semibold italic border rounded whitespace-nowrap") ++ if (
//               varDef.fun_calls->Belt.Option.isSome
//             ) {
//               %twc(" text-rainforest border-rainforest bg-rainforest_50")
//             } else {
//               %twc(" text-orange border-orange bg-orange_50")
//             }}>
//             <Lang.String english={`definition`} french={`définition`} />
//             <Lang.String english={` `} french={` `} />
//             kindIO
//           </div>
//         }

//         <CollapsibleItem idsOpt headerContent headerValueOpt kindIcon>
//           <Flex.Column.AlignLeft>
//             <div className=%twc("max-h-80 overflow-y-scroll rounded-b")>
//               <CatalaCode.DangerouslySetInnerHtml html=Infos.catalaCodeHTML />
//             </div>
//             {varDef.fun_calls->Belt.Option.mapWithDefault(<> </>, funCalls => {
//               <div className=%twc("w-full px-4 pb-4 border border-gray border-t")>
//                 <CollapsibleItem
//                   headerContent={<p className=%twc("w-full text-gray_dark font-bold pr-4")>
//                     <Lang.String
//                       english="Computed from ..." french={`Calculée à partir de ...`}
//                     />
//                   </p>}>
//                   <Flex.Column.AlignLeft
//                     style=%twc("w-full max-h-screen overflow-y-scroll px-4 pb-4")>
//                     {funCalls
//                     ->Belt.List.toArray
//                     ->Belt.Array.mapWithIndex(
//                       (i, funCall) =>
//                         <LogEventComponent.FunCall key={"fun-call-" ++ i->string_of_int} funCall />,
//                     )
//                     ->React.array}
//                   </Flex.Column.AlignLeft>
//                 </CollapsibleItem>
//               </div>
//             })}
//           </Flex.Column.AlignLeft>
//         </CollapsibleItem>
//       })
//     }

//     /* React component used to render subscope calls. */
//     module SubScopeCall = {
//       @react.component
//       let make = React.memo((~subScopeCall: sub_scope_call) => {
//         // Stores all already visited variables definitions in the current subscope call.
//         let (varDefs, setVarDefs) = React.useState(_ => [])
//         let headerContent =
//           <CatalaCode>
//             <CatalaCode.Ids ids={subScopeCall.sname->Belt.List.toArray} />
//           </CatalaCode>
//         let iconStyle = %twc(
//           "px-2 font-semibold text-purple_text border border-purple_text rounded bg-purple_bg"
//         )
//         let kindIcon = <div className={iconStyle ++ %twc(" italic")}> {"scope"->React.string} </div>

//         let getHeaderContent = (label: React.element) => {
//           <Flex.Row.Center>
//             <p className=%twc("w-full text-gray_dark font-bold pr-4")> label </p>
//             <div className=%twc("opacity-70")> headerContent </div>
//           </Flex.Row.Center>
//         }

//         let inputHeaderContent = getHeaderContent(
//           <Lang.String english="Definitions of" french={`Définitions de`} />,
//         )

//         let contentHeaderContent = getHeaderContent(
//           <Lang.String english="Content of" french={`Contenu de`} />,
//         )

//         <CollapsibleItem headerContent kindIcon>
//           <div className=%twc("w-full px-4 pb-4")>
//             <CollapsibleItem headerContent={contentHeaderContent}>
//               <Flex.Column.Center style=%twc("max-h-screen overflow-y-scroll w-full p-4")>
//                 <EventNavigator
//                   events={subScopeCall.sbody->Belt.List.toArray}
//                   eventToComponent={event => <LogEventComponent event />}
//                   setVarDefs
//                 />
//               </Flex.Column.Center>
//             </CollapsibleItem>
//             <CollapsibleItem headerContent=inputHeaderContent>
//               <Flex.Column.AlignLeft
//                 style=%twc(
//                   "w-full max-h-screen overflow-y-scroll px-4 pb-4 border-t border-b border-gray bg-gray_light"
//                 )>
//                 {// Already visited variables definitions rendered in a compact format.
//                 varDefs
//                 ->Belt.Array.reverse
//                 ->Belt.Array.mapWithIndex((i, varDef) =>
//                   <LogEventComponent.VarComputation
//                     key={"varcomp-def-" ++ i->string_of_int} varDef printHeadings=false
//                   />
//                 )
//                 ->React.array}
//                 {// Subscope input variables definitions.
//                 subScopeCall.inputs
//                 ->Belt.List.toArray
//                 ->Belt.Array.mapWithIndex((i, varDef) =>
//                   <LogEventComponent.VarComputation
//                     key={"varcomp-subscope-input-" ++ i->string_of_int}
//                     varDef
//                     kindIcon={<div
//                       className=%twc(
//                         "px-2 font-semibold italic text-purple_text border border-purple_text rounded bg-purple_bg"
//                       )>
//                       <Lang.String english="input" french={`entrée`} />
//                     </div>}
//                   />
//                 )
//                 ->React.array}
//               </Flex.Column.AlignLeft>
//             </CollapsibleItem>
//           </div>
//         </CollapsibleItem>
//       })
//     }

//     /* React component used to function calls. */
//     module FunCall = {
//       @react.component
//       let make = React.memo((~funCall: fun_call) => {
//         let iconStyle = %twc(
//           "px-2 font-semibold text-rainforest border border-rainforest rounded bg-rainforest_50"
//         )
//         let kindIcon =
//           <div className={iconStyle ++ %twc(" italic")}>
//             {<Lang.String english="function" french={`fonction`} />}
//           </div>

//         let headerContent =
//           <CatalaCode>
//             <CatalaCode.Ids ids={funCall.fun_name->Belt.List.toArray} />
//           </CatalaCode>

//         let functionInput =
//           // Function input doesn't have source code position, so we use a custom React element.
//           <Flex.Column.AlignLeft
//             style=%twc(
//               "border-solid border-secondary border rounded mt-4 hover:border-gray_dark shadow"
//             )>
//             <Flex.Column.AlignLeft
//               style=%twc("w-full bg-gray_2 text-gray_dark font-semibold py-2 rounded pr-2")>
//               <Flex.Row.AlignTop style=%twc("w-full justify-between pl-2")>
//                 {funCall.fun_inputs
//                 ->Belt.List.toArray
//                 ->Belt.Array.map(input =>
//                   <CatalaCode>
//                     <CatalaCode.Ids ids={input.name->Belt.List.toArray} />
//                     <CatalaCode.Op op={" : "} />
//                     <LogEvent.LoggedValue val={input.value} />
//                   </CatalaCode>
//                 )
//                 ->React.array}
//                 <div
//                   className=%twc(
//                     "px-2 font-semibold italic text-rainforest border border-rainforest rounded bg-rainforest_50"
//                   )>
//                   <Lang.String english="input" french={`entrée`} />
//                 </div>
//               </Flex.Row.AlignTop>
//             </Flex.Column.AlignLeft>
//           </Flex.Column.AlignLeft>

//         let functionOutput =
//           <LogEventComponent.VarComputation
//             varDef={funCall.output}
//             kindIcon={<div
//               className=%twc(
//                 "px-2 font-semibold italic text-rainforest border border-rainforest rounded bg-rainforest_50"
//               )>
//               <Lang.String english="output" french="sortie" />
//             </div>}
//           />

//         <CollapsibleItem headerContent kindIcon>
//           <div className=%twc("w-full px-4 pb-4")>
//             functionInput
//             functionOutput
//             {if 0 < funCall.body->Belt.List.length {
//               <CollapsibleItem headerContent>
//                 <Flex.Column.AlignLeft
//                   style=%twc(
//                     "w-full max-h-screen overflow-y-scroll px-4 pb-4 border-t border-b border-gray bg-gray_light"
//                   )>
//                   {funCall.body
//                   ->Belt.List.toArray
//                   ->Belt.Array.mapWithIndex((i, event) =>
//                     <LogEventComponent key={"funcall-item-" ++ i->string_of_int} event />
//                   )
//                   ->React.array}
//                 </Flex.Column.AlignLeft>
//               </CollapsibleItem>
//             } else {
//               <> </>
//             }}
//           </div>
//         </CollapsibleItem>
//       })
//     }

//     @react.component
//     let make = React.memo((~event: event) => {
//       switch event {
//       | VarComputation(var_def) => <VarComputation varDef={var_def} />
//       | FunCall(fun_call) => <FunCall funCall={fun_call} />
//       | SubScopeCall(sub_scope_call) => <SubScopeCall subScopeCall={sub_scope_call} />
//       }
//     })
//   }

//   @react.component
//   let make = (~event: event) => {
//     <LogEventComponent event />
//   }
// }

// module Make = (
//   Form: {
//     let pageTitle: React.element
//     let catalaCodeHTML: string
//     let resetLog: unit => unit

//     @react.component
//     let make: (
//       ~setEventsOpt: (option<array<event>> => option<array<event>>) => unit,
//       ~collapsible: bool,
//     ) => React.element
//   },
// ) => {
//   @react.component
//   let make = () => {
//     module LogEventComponent = MakeLogEventComponent(Form)
//     let (eventsOpt: option<array<event>>, setEventsOpt) = React.useState(_ => None)

//     React.useEffect0(() => {
//       // Reset the log when the page is loaded.
//       Form.resetLog()
//       None
//     })

//     <>
//       <Title>
//         Form.pageTitle
//         <p
//           className=%twc(
//             "text-2xl font-semibold italic font-sans rounded bg-purple_bg text-purple_text px-2 ml-2 shadow-sm "
//           )>
//           {"Viz"->React.string}
//         </p>
//       </Title>
//       <Section title={<Lang.String english="Form" french={`Formulaire`} />}>
//         <Form setEventsOpt={setEventsOpt} collapsible=false />
//       </Section>
//       <div className=%twc("w-full h-full")>
//         <Section title={<Lang.String english="Log events" french={`Évènements de log`} />}>
//           <Flex.Column.Center
//             style=%twc("border-solid max-h-full border border-gray rounded p-4 bg-gray_light")>
//             {switch eventsOpt {
//             | Some(logEvents) =>
//               <EventNavigator
//                 events={logEvents} eventToComponent={event => <LogEventComponent event />}
//               />
//             | _ =>
//               <p className=%twc("font-bold text-gray_dark")>
//                 <Lang.String
//                   english="No events to explore..." french={`Pas d'évènements à explorer...`}
//                 />
//               </p>
//             }}
//           </Flex.Column.Center>
//         </Section>
//       </div>
//     </>
//   }
// }

