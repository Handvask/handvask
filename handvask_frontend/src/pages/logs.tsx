import React from "react";
import Base from "../components/Base";
import useUser from "../hooks/useUser";
import PageLoader from "../components/PageLoader";
export default function logs() {
  const user = useUser();

  if (user === undefined) {
    return <PageLoader />;
  }

  if (user.sys_admin) {
    return <Base>Logs page</Base>;
  }
  return <Base>Access denied</Base>;
}
