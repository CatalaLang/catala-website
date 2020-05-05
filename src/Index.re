[%bs.raw {|require("materialize-css/dist/js/materialize.min.js")|}];
[%bs.raw {|require("materialize-css/dist/css/materialize.min.css")|}];
[%bs.raw {|require("./index.css")|}];

ReactDOMRe.renderToElementWithId(<Nav />, "nav");
ReactDOMRe.renderToElementWithId(<Presentation />, "presentation");
