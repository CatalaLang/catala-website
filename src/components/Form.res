/*
  Binding for the React component [JSONSchemaForm.default] of the package
  [react-jsonschema-form].

  The component is capable of building HTML forms out of a JSON schema.
*/

module FromJSONSchema = {
  @react.component @module("@rjsf/material-ui")
  external make: (
    ~onChange: Js.Json.t => unit=?,
    ~onSubmit: Js.Json.t => unit=?,
    ~onError: Js.Json.t => unit=?,
    ~schema: Js.Json.t,
    ~uiSchema: Js.Json.t=?,
    ~formData: Js.Json.t=?,
  ) => React.element = "default"
}
