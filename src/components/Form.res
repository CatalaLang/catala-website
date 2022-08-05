/*
  Binding for the React component [JSONSchemaForm.default] of the package
  [react-jsonschema-form].

  The component is capable of building HTML forms out of a JSON schema.
*/
module FromJSONSchema = {
  @react.component @module("@rjsf/core")
  external make: (
    ~onChange: Js.Dict.t<Js.Json.t> => unit=?,
    ~onSubmit: Js.Dict.t<Js.Json.t> => unit=?,
    ~onError: _ => unit=?,
    ~schema: Js.Json.t,
    ~uiSchema: Js.Json.t=?,
    ~formData: Js.Json.t=?,
  ) => React.element = "default"
}

/*
  Builds a React component from provided information.
*/
module Make = (
  FormInfos: {
    let englishSchema: Js.Json.t
    let englishUiSchema: Js.Json.t
    let frenchSchema: Js.Json.t
    let frenchUiSchema: Js.Json.t
    let resultLabel: React.element

    let initFormData: option<Js.Json.t>

    let computeAndPrintResult: Js.Json.t => React.element
  },
) => {
  @react.component
  let make = (
    ~setEventsOpt: (option<array<LogEvent.event>> => option<array<LogEvent.event>>) => unit,
  ) => {
    let (formData, setFormData) = React.useState(_ => {
      FormInfos.initFormData
    })

    React.useEffect2(() => {
      setEventsOpt(_ => {
        let logs = FrenchLaw.retrieveEventsSerialized()->LogEvent.deserializedEvents
        if 0 == logs->Belt.Array.size {
          None
        } else {
          Some(logs)
        }
      })
      None
    }, (formData, setEventsOpt))

    <>
      <Box.Collapsible>
        <FromJSONSchema
          schema={Lang.getCurrent(~english=FormInfos.englishSchema, ~french=FormInfos.frenchSchema)}
          uiSchema={Lang.getCurrent(
            ~english=FormInfos.englishUiSchema,
            ~french=FormInfos.frenchUiSchema,
          )}
          formData={formData->Belt.Option.getWithDefault(Js.Json.null)}
          onSubmit={t => setFormData(_ => t->Js.Dict.get("formData"))}
        />
      </Box.Collapsible>
      <div
        className=%twc(
          "w-full inline-flex flex-col flex-wrap justify-center place-items-center \
          my-4 border border-gray border-solid rounded p-4 shadow-sm \
          bg-gray_light text-gray_dark shadow"
        )>
        {switch formData {
        | None =>
          <div className=%twc("font-bold")>
            <Lang.String english="Input not complete" french=`Entrée non complète` />
          </div>
        | Some(formData) =>
          try {
            <>
              <div className=%twc("pr-2 font-semibold")> {FormInfos.resultLabel} </div>
              <div className=%twc("flex flex-row justify-center")>
                <div className=%twc("font-bold whitespace-nowrap")>
                  {FormInfos.computeAndPrintResult(formData)}
                </div>
              </div>
            </>
          } catch {
          | err =>
            Js.log(err)
            <p className=%twc("font-bold break-all")>
              <Lang.String english="Computation error: " french=`Erreur de calcul : ` />
              {err
              ->Js.Exn.asJsExn
              ->Belt.Option.map(Js.Exn.message)
              ->Belt.Option.getWithDefault(Some(""))
              ->Belt.Option.getExn
              ->React.string}
            </p>
          }
        }}
      </div>
    </>
  }
}
