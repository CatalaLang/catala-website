let goToUrl = (url: string, _) => ReasonReactRouter.push(url);

let page_title = (title: string) => <h1> {title |> React.string} </h1>;

let presentation_card =
    (
      ~title: string,
      ~icon: option(string)=?,
      ~quote: option(string)=?,
      ~action: option((string, string))=?,
      content: React.element,
    ) => {
  let action =
    switch (action) {
    | None => <div />
    | Some((url, action)) =>
      <div className=[%tw "border-solid border-t-2 border-primary pt-2"]>
        <a onClick={goToUrl(url)} className=[%tw "cursor-pointer uppercase text-primary"]>
          {action |> React.string}
        </a>
      </div>
    };
  let quote =
    switch (quote) {
    | Some(quote) =>
      <blockquote className=[%tw "text-primary pb-4"]>
        <strong> {quote |> React.string} </strong>
      </blockquote>
    | None => <div />
    };
  let icon =
    switch (icon) {
    | Some(icon) => <i className="float-left pr-2 material-icons"> {icon |> React.string} </i>
    | None => <span />
    };
  <div className=[%tw "w-full lg:w-1/2"]>
    <div className=[%tw "p-4 h-full"]>
      <div className=[%tw "bg-tertiary h-full overflow-hidden shadow-lg"]>
        <div className=[%tw "flex flex-col justify-between h-full px-6 py-4 text-white"]>
          <div>
            <div className=[%tw "text-xl pb-2 font-bold"]> icon {title |> React.string} </div>
            quote
            <p className=[%tw "pb-4"]> content </p>
          </div>
          action
        </div>
      </div>
    </div>
  </div>;
};
