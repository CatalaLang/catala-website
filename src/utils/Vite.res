module Import = {
  module Meta = {
    type opts = {@as("as") as_?: string, import?: string}

    @scope("import.meta")
    external glob: string => Dict.t<unit => promise<'a>> = "glob"

    @scope("import.meta")
    external globWithOpts: (string, opts) => Dict.t<unit => promise<'a>> = "glob"

    @scope("import.meta")
    external env: 'a = "env"
  }
}

external import: string => promise<'a> = "import"
