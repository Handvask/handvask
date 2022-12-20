import React, { useEffect, useState } from "react";
import { guuid } from "../functions";

export type ButtonPropT = {
  kind: bootstrapColours | "link";
  outline?: boolean;
  disabled?: boolean;
  large?: boolean;
  small?: boolean;
  onClick?: (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => void;
  className?: string;
  children?: React.ReactNode;
  type?: "button" | "submit" | "reset";
  style?: React.CSSProperties;
  tooltip?: string;
};

export default function Button({
  kind,
  outline = false,
  disabled = false,
  large = false,
  small = false,
  onClick = (e) => null,
  className = "",
  children = "",
  type,
  style = {},
  tooltip,
}: ButtonPropT) {
  const [id, _] = useState("id-" + guuid());
  // Initialise tooltip
  useEffect(() => {
    if (typeof window !== "undefined" && tooltip && !disabled) {
      import("bootstrap/js/dist/tooltip").then((Tooltip) => {
        const el = document.querySelector(`#${id}`);
        if (el) new Tooltip.default(el);
      });
    }
  }, [tooltip, disabled]);

  useEffect(() => {
    if (typeof window !== "undefined" && tooltip && disabled) {
      import("bootstrap/js/dist/tooltip").then((Tooltip) => {
        Tooltip.default.getInstance(`#${id}`)?.dispose();
      });
    }
  }, [disabled]);
  return (
    <button
      id={id}
      type={type}
      className={`btn btn-${outline ? "outline-" : ""}${kind} ${
        disabled ? "disabled" : ""
      } ${large ? "btn-lg" : ""} ${small ? "btn-sm" : ""} ${className}`}
      onClick={onClick}
      disabled={disabled}
      style={style}
      {...(tooltip
        ? {
            "data-bs-toggle": "tooltip",
            "data-bs-title": tooltip,
            tabIndex: 0,
            "data-bs-trigger": "hover",
          }
        : {})}
    >
      {children}
    </button>
  );
}
