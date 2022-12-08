<<<<<<< HEAD
import React from "react";

type SideBarButtonPropT = {
  name: string;
  active: boolean;
  trigger: () => void;
};
export default function SideBarButton({
  name,
  active,
  trigger,
}: SideBarButtonPropT) {
  return (
    <div>
      <p
        className={`${active ? "" : "text-opacity-75"} text-dark`}
        style={{ cursor: "pointer" }}
        onClick={trigger}
      >
        {name}
      </p>
    </div>
  );
}
=======
import React from "react";

type SideBarButtonPropT = {
  name: string;
  active: boolean;
  trigger: () => void;
};
export default function SideBarButton({
  name,
  active,
  trigger,
}: SideBarButtonPropT) {
  return (
    <div>
      <p
        className={`${active ? "" : "text-opacity-75"} text-dark`}
        style={{ cursor: "pointer" }}
        onClick={trigger}
      >
        {name}
      </p>
    </div>
  );
}
>>>>>>> 749ccb08d1ffccb8ddf699f3fe16b88da0b335ed
