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

// Function to download or import a JSON object
@val external downloadJSONstring: string => unit = "downloadJSONstring"
%%raw(`
const downloadJSONstring = (data) => {
  const blob = new Blob([data],{type:'application/json'});
  const href = URL.createObjectURL(blob);
  const link = document.createElement('a');
  link.href = href;
  link.download = "data.json";
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
};
`)

// Function to read a file and get its contents as string
@val external readFileAsJSON: (Js.Json.t, Js.Json.t => 'a) => unit = "readFileAsJSON"
%%raw(`
const readFileAsJSON = (file, callback) => {
  var reader = new FileReader();
  var contents = ""
  reader.onload = function(evt) {
    contents = evt.target.result;
    var json;
    try {
      json = JSON.parse(contents)
    } catch (error) {
      console.log(error)
      json = null;
    }
    callback(json);
  };
  reader.readAsText(file);
};
`)

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
    let formDataPostProcessing: option<Js.Json.t => Js.Json.t>
    let computeAndPrintResult: Js.Json.t => React.element
  },
) => {
  @react.component
  let make = (
    ~setEventsOpt: (option<array<LogEvent.event>> => option<array<LogEvent.event>>) => unit,
    ~collapsible: bool,
  ) => {
    let (formData, setFormData) = React.useState(_ => {
      FormInfos.initFormData
    })
    React.useEffect2(() => {
      setEventsOpt(_ => {
        let logs = {
          try {FrenchLaw.retrieveEventsSerialized()->CatalaRuntime.deserializedEvents} catch {
          | _ => []
          }
        }
        if 0 == logs->Belt.Array.size {
          None
        } else {
          Some(logs)
        }
      })
      None
    }, (formData, setEventsOpt))
    let (uploadedFile, setUploadedFile) = React.useState(_ => {
      Js.Json.object_(Js.Dict.empty())
    })
    let fileChangeHandler = (_event: ReactEvent.Form.t) => {
      setUploadedFile(%raw(`_event.target.files[0]`))
    }
    let retrieveFileContents = _ => {
      if %raw(`uploadedFile instanceof File`) {
        readFileAsJSON(uploadedFile, form_data => setFormData(_ => Some(form_data)))
      }
    }
    let divider =
      <div className=%twc("mt-4 mb-4 w-full border-2 border-solid rounded-full border-tertiary") />
    let form_and_display =
      <>
        <p className=%twc("mt-4 italic")>
          <Lang.String
            english="The data collected by this form is not sent anywhere, and is managed by your web browser. \
          The data is processed locally by a Javascript program that has been transmitted along with the rest of the Catala website. \
          Hence, the Catala website does not collect any data from its users."
            french={`Les données collectées par ce formulaire ne sont envoyées nulle part, et sont gérées uniquement par votre navigateur internet. \
            Les données sont traitées localement par un programme Javascript qui a été transmis avec le reste du site de Catala. \
            Ainsi, le site de Catala ne collecte aucune donnée de ses utilisateurs.`}
          />
        </p>
        {if !collapsible {
          <div className=%twc("flex flex-wrap w-full justify-around gap-4 mt-4")>
            <Button.Small
              onClick={_ => {
                let data_str = Js.Json.stringify(formData->Belt.Option.getWithDefault(Js.Json.null))
                downloadJSONstring(data_str)
              }}
              style=%twc("py-2 px-4")>
              <Lang.String
                french={`Exporter les données au format JSON`} english="Export data to JSON format"
              />
            </Button.Small>
            <Button.Small
              onClick={_ => {
                setFormData(_ => None)
              }}
              style=%twc("py-2 px-4")>
              <Lang.String french={`Réinitialiser le formulaire`} english="Reset the form" />
            </Button.Small>
            <Button.Small onClick={retrieveFileContents} style=%twc("py-2 px-4")>
              <div className=%twc("grid grid-cols-1 gap-2 justify-items-center")>
                <input type_="file" name="file" onChange=fileChangeHandler />
                <div>
                  <Lang.String
                    french={`Importer les données au format JSON`}
                    english="Import data to JSON format"
                  />
                </div>
              </div>
            </Button.Small>
          </div>
        } else {
          <> </>
        }}
        divider
        <FromJSONSchema
          schema={Lang.getCurrent(~english=FormInfos.englishSchema, ~french=FormInfos.frenchSchema)}
          uiSchema={Lang.getCurrent(
            ~english=FormInfos.englishUiSchema,
            ~french=FormInfos.frenchUiSchema,
          )}
          formData={formData->Belt.Option.getWithDefault(Js.Json.null)}
          onSubmit={t =>
            setFormData(_ => {
              let formData = t->Js.Dict.get("formData")
              switch (FormInfos.formDataPostProcessing, formData) {
              | (Some(f), Some(formData)) => {
                  let newFormData = f(formData)
                  Some(newFormData)
                }

              | _ => formData
              }
            })}
        />
        <div
          className=%twc(
            "w-full inline-flex flex-col flex-wrap justify-center place-items-center my-4 border border-gray border-solid rounded p-4 shadow-sm bg-gray_light text-gray_dark shadow"
          )>
          {switch formData {
          | None =>
            <div className=%twc("font-bold")>
              <Lang.String
                english="Waiting for the form data to be submitted..."
                french={`En attente de la confirmation du formulaire...`}
              />
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
                <Lang.String english="Computation error: " french={`Erreur de calcul : `} />
                {err
                ->Js.Exn.asJsExn
                ->Belt.Option.map(Js.Exn.message)
                ->Belt.Option.getWithDefault(Some(""))
                ->Belt.Option.getWithDefault("unknwon error, please retry the computation")
                ->React.string}
              </p>
            }
          }}
        </div>
      </>

    {
      if collapsible {
        <Box.Collapsible> form_and_display </Box.Collapsible>
      } else {
        form_and_display
      }
    }
  }
}
