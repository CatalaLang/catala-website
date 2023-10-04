let pageTitle =
  <Lang.String
    english="French Income Tax"
    french=`Code de l'impôt sur le revenu`
  />

let card: Card.Presentation.t = {
  title: pageTitle,
  action: Some((
    Internal([Nav.home, Nav.ir_catala]),
    <Lang.String english="View the PDF" french=`Voir le PDF` />,
  )),
  icon: None,
  quote: None,
  content: <>
    <Lang.String
      english="This is a proof of concept for the implementation of the French income tax in Catala. "
      french={`Ceci est une preuve de concept d'implémentation de l'impôt sur le revenu français en Catala. `}
    />
    <Link.Text
      target="https://gitlab.adullact.net/dgfip/ir-catala">
      <Lang.String english="source code of the example" french={`sources de l'exemple`} />
    </Link.Text>
    <Lang.String
      english=". The code, like the legislative text it follows, is written in French." french="."
    />
  </>,
}


%%raw(`
function fetch_unzip_and_show_pdf(url, filename, id) {
  fetch(url)
  .then(response => response.arrayBuffer())
  .then(buf => {
    let buf8 = new Uint8Array(buf);
    let varlen = buf8[26] + buf8[28];
    return new Blob([buf8.slice(30 + varlen, buf.byteLength - varlen - 84)]).stream()
  })
  .then(zip => zip.pipeThrough(new DecompressionStream("deflate-raw")))
  .then(pdf => new Response(pdf).blob())
  .then(pdf =>
    document.getElementById(id)
      .setAttribute(
        "data",
        URL.createObjectURL(new File([pdf], filename, {type: "application/pdf"})))
  )
}
`)

external fetch_unzip_and_show_pdf:
  (~url: string, ~filename: string, ~id: string) => unit
  = "fetch_unzip_and_show_pdf"

@react.component
let make = () => {
  let obj = <object
    id="ir-catala-pdf"
    style=
      ReactDOM.Style.make(
        ~position="fixed",
        ~left="0",
        ~height="calc(100vh - 1.5rem)",
        ~maxWidth="none",
        ~width="100%",
        ())
  />
  fetch_unzip_and_show_pdf(
    ~url="https://gitlab.adullact.net/api/v4/projects/1378/jobs/artifacts/main/download?job=pdf",
    ~filename="impot_revenu.pdf",
    ~id="ir-catala-pdf");
  obj
}
