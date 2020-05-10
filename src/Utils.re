let goToUrl = (url: string, _) => ReasonReactRouter.push(url);

let noop = "javascript:void(0)";

let presentation_card =
    (
      title: string,
      quote: string,
      content: React.element,
      action: option((string, string)),
    ) => {
  let action =
    switch (action) {
    | None => <div />
    | Some((url, action)) =>
      <div className="">
        <a onClick={goToUrl(url)} href=noop className="">
          {React.string(action)}
        </a>
      </div>
    };
  <div className="">
    <div className="">
      <div className="">
        <span className=""> {React.string(title)} </span>
        <blockquote className="">
          <strong> {React.string(quote)} </strong>
        </blockquote>
        <p> content </p>
      </div>
      action
    </div>
  </div>;
};
