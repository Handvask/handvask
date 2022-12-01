export type ButtonPropT = {
  kind:
    | "primary"
    | "secondary"
    | "success"
    | "danger"
    | "warning"
    | "info"
    | "light"
    | "dark"
    | "link";
  outline?: boolean;
  disabled?: boolean;
  large?: boolean;
  small?: boolean;
  onClick?: (e: React.MouseEvent<HTMLButtonElement, MouseEvent>) => void;
  className?: string;
  children?: React.ReactNode;
  type?: "button" | "submit" | "reset";
  style?: React.CSSProperties;
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
}: ButtonPropT) {
  return (
    <button
      type={type}
      className={`btn btn-${outline ? "outline-" : ""}${kind} ${
        disabled ? "disabled" : ""
      } ${large ? "btn-lg" : ""} ${small ? "btn-sm" : ""} ${className}`}
      onClick={onClick}
      disabled={disabled}
      style={style}
    >
      {children}
    </button>
  );
}
