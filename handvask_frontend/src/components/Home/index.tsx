import React, { useEffect, useState } from "react";
import useUser, { ExpandedUser } from "../../hooks/useUser";
import "bootstrap/dist/css/bootstrap.min.css";
import Button from "../Button";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faBars, faTimes } from "@fortawesome/free-solid-svg-icons";
import Base from "../Base";
import SideBarButton from "../SideBarButton";
import Runs from "./runs";
import Dzn from "./dzn";
import Mzn from "./mzn";
import CreateRun from "./CreateRun";

export type HomeSubpageBasePropT = {
  user: ExpandedUser;
};

export default function Home() {
  const [sideOpen, setSideOpen] = useState(true);
  const user = useUser();
  const [currentPage, setCurrentPage] = useState<string>("runs");
  const [notification, setNotification] = useState<{
    message: string;
    kind: bootstrapColours;
  } | null>(null);

  return (
    <Base>
      {(user && (
        <div className="d-flex w-100">
          <div
            className="position-relative"
            style={{
              transition: "all .3s",
              width: sideOpen ? 150 : 0,
            }}
          >
            <Button
              className="position-absolute top-0 end-0 w-2 h-2 border-none"
              kind={"dark"}
              style={{
                transform: "translateX(100%)",
                borderRadius: "0 .375rem .375rem 0",
              }}
              onClick={() => setSideOpen((v) => !v)}
            >
              <FontAwesomeIcon icon={faBars} />
            </Button>
            <div
              className={`d-flex justify-content-start flex-column align-items-left bg-light pt-5 border-end px-4`}
              style={{
                height: "calc(100vh - 56px)",
                opacity: sideOpen ? 1 : 0,
                transform: sideOpen ? "translateX(0)" : "translateX(-100%)",
                transition: "all .2s",
                whiteSpace: "nowrap",
              }}
            >
              <SideBarButton
                name="Runs"
                active={currentPage == "runs"}
                trigger={() => setCurrentPage("runs")}
              />
              <SideBarButton
                name="Create new run"
                active={currentPage == "createRun"}
                trigger={() => setCurrentPage("createRun")}
              />
              <SideBarButton
                name=".mzn instances"
                active={currentPage == "mzn"}
                trigger={() => setCurrentPage("mzn")}
              />
              <SideBarButton
                name=".dzn instances"
                active={currentPage == "dzn"}
                trigger={() => setCurrentPage("dzn")}
              />
            </div>
          </div>
          <div
            className={`container-fluid d-flex justify-content-center align-items-start shadow-sm p-5`}
            style={{
              transition: "all .3s",
              width: sideOpen ? "calc(100% - 150px)" : "100%",
            }}
          >
            {(currentPage == "runs" && (
              <Runs user={user} setNotification={setNotification} />
            )) ||
              (currentPage == "dzn" && <Dzn user={user} />) ||
              (currentPage == "mzn" && <Mzn user={user} />) ||
              (currentPage == "createRun" && (
                <CreateRun
                  user={user}
                  setCurrentPage={setCurrentPage}
                  setNotification={setNotification}
                />
              )) ||
              null}
          </div>
        </div>
      )) ||
        null}
      {notification ? (
        <div
          className="toast show position-fixed"
          style={{ right: 15, bottom: 15 }}
          role="alert"
          aria-live="assertive"
          aria-atomic="true"
        >
          <div className="toast-header d-flex align-items-center">
            <div
              className={`bg-${notification.kind} rounded me-2`}
              style={{ width: 20, height: 20 }}
            />
            <strong className="me-auto">Create run result</strong>
            <Button kind="light" small onClick={() => setNotification(null)}>
              <FontAwesomeIcon icon={faTimes} />
            </Button>
          </div>
          <div className="toast-body">{notification.message}</div>
        </div>
      ) : null}
    </Base>
  );
}
