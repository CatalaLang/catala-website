let goToUrl = (url: string, _) => ReasonReactRouter.push(url);

let noop = "javascript:void(0)";

let presentation_card =
    (title: string, quote: string, content: React.element, action: option((string, string))) => {
  let action =
    switch (action) {
    | None => <div />
    | Some((url, action)) =>
      <div className="card-action">
        <a onClick={goToUrl(url)} href=noop className="primary-color-text">
          {React.string(action)}
        </a>
      </div>
    };
  <div className="col s12 xl6 presentation-card">
    <div className="card tertiary-color">
      <div className="card-content white-text">
        <span className="card-title"> {React.string(title)} </span>
        <blockquote className="primary-color-text">
          <strong> {React.string(quote)} </strong>
        </blockquote>
        <p> content </p>
      </div>
      action
    </div>
  </div>;
};
