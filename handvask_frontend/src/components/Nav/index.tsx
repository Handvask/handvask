import NavLink from "./NavLink";
import useUser from "../../hooks/useUser";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faSink, faUser, faUserNinja } from "@fortawesome/free-solid-svg-icons";

type NavPropT = {
  user: User;
};

export default function Nav({ user }: NavPropT) {
  return (
    <nav className="navbar navbar-expand-lg navbar-light bg-light">
      <div className="container-fluid">
        <NavLink className="navbar-brand" href="/">
          <FontAwesomeIcon icon={faSink} size={"lg"} />
        </NavLink>
        <button
          className="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span className="navbar-toggler-icon"></span>
        </button>
        <div className="collapse navbar-collapse">
          <ul className="navbar-nav me-auto mb-2 mb-lg-0">
            <li className="nav-item">
              <NavLink className="nav-link" href="/">
                Home
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink className="nav-link" href="/page1">
                page1
              </NavLink>
            </li>
            <li className="nav-item">
              <NavLink className="nav-link" href="/page2">
                page2
              </NavLink>
            </li>
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
                <FontAwesomeIcon icon={user.sys_admin ? faUserNinja : faUser} />{" "}
                {user.username}
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
