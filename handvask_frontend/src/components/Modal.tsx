import { useEffect, useMemo, useState } from "react";
import { guuid } from "../functions";

type modalProps = {
  show?: boolean;
  title: React.ReactNode;
  children: React.ReactNode;
  footer?: React.ReactNode;
  onClose: () => void;
};

export default function Modal({
  show = false,
  title,
  children,
  footer,
  onClose,
}: modalProps) {
  const [id, setId] = useState<string>();

  useEffect(() => {
    setId(guuid());
  }, []);

  function handleKey(e: KeyboardEvent) {
    if (e.keyCode == 27) {
      onClose();
    }
  }

  useEffect(() => {
    document.addEventListener("keydown", handleKey);
    return () => document.removeEventListener("keydown", handleKey);
  }, []);

  const dClass = useMemo(() => {
    return show ? { display: "flex" } : {};
  }, [show]);

  return (
    <div
      className={`modal  fade${show ? " show" : ""}`}
      id={id}
      tabIndex={-1}
      data-bs-backdrop="static"
      data-bs-keyboard="false"
      role="dialog"
      aria-labelledby={id + "_title"}
      aria-hidden="true"
      style={{ ...dClass }}
    >
      <div
        className="modal-backdrop-custom bg-dark bg-opacity-50 vw-100 vh-100 position-fixed"
        onClick={onClose}
       />
      <div
        className="modal-dialog modal-xl modal-dialog-scrollable modal-dialog-centered modal-sm"
        role="document"
      >
        <div className="modal-content">
          <div className="modal-header">
            <h5 className="modal-title" id={id + "_title"}>
              {title}
            </h5>
            <button
              type="button"
              className="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
              onClick={onClose}
             />
          </div>
          <div className="modal-body">{children}</div>
          {(footer && <div className="modal-footer">{footer}</div>) || <></>}
        </div>
      </div>
    </div>
  );
}
