import NavLink from "./NavLink";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faSink, faUser, faUserNinja } from "@fortawesome/free-solid-svg-icons";
import React from "react";
import useUser from "../../hooks/useUser";

type NavPropT = {
  user: User;
};

export default function Nav() {
  const user = useUser();
  function load_admin_button() {
    if (user !== undefined && user.sys_admin) {
      return (
        <li className="nav-item">
          <NavLink className="nav-link" href="/admin">
            Admin
          </NavLink>
        </li>
      );
    }
  }
  return (
    <nav
      className="navbar navbar-expand-lg navbar-light bg-light shadow-sm"
      style={{ zIndex: 99 }}
    >
      <div className="container-fluid">
        <NavLink className="navbar-brand" href="/">
          <FontAwesomeIcon icon={faSink} size={"lg"} />
        </NavLink>
        <button
          className="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#mainNavbar"
          aria-controls="mainNavbar"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span className="navbar-toggler-icon" />
        </button>
        <div className="collapse navbar-collapse" id="mainNavbar">
          <ul className="navbar-nav me-auto mb-2 mb-lg-0">
            <li className="nav-item">
              <NavLink className="nav-link" href="/">
                Home
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink className="nav-link" href="/handvask">
                Minizinc
              </NavLink>
            </li>
            {load_admin_button()}
          </ul>
          <ul className="navbar-nav ms-auto mb-2 mb-lg-0">
            <li className="nav-item dropdown" id="userDropdownMenu">
              <a
                className="nav-link dropdown-toggle"
                href="#"
                id="navbarDropdown"
                role="button"
                data-bs-toggle="dropdown"
                aria-expanded="false"
                onClick={(e) => e.preventDefault()}
              >
                <FontAwesomeIcon
                  icon={user?.sys_admin ? faUserNinja : faUser}
                />{" "}
                {user?.username}
              </a>
              <ul
                className="dropdown-menu dropdown-menu-end"
                aria-labelledby="userDropdownMenu"
              >
                <NavLink className="dropdown-item" href="/logout">
                  Log out
                </NavLink>
              </ul>
            </li>
          </ul>
        </div>
      </div>
    </nav>
  );
}
