import { faSpinner } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import Button, { ButtonPropT } from "./Button";
import React from "react";

type AsyncBtnPropT = {
  loading: boolean;
} & ButtonPropT;

export default function AsyncBtn({
  loading = false,
  children = "",
  ...rest
}: AsyncBtnPropT) {
  return (
    <Button {...rest}>
      {(loading && <FontAwesomeIcon icon={faSpinner} spin />) || children}
    </Button>
  );
}
