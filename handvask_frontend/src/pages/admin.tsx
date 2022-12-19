import React, { useEffect, useState } from "react";
import Base from "../components/Base";
import useAPI from "../hooks/useAPI";
import useUser from "../hooks/useUser";
import AsyncBtn from "../components/AsyncBtn";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faRotate,
  faSpinner,
  faTrash,
} from "@fortawesome/free-solid-svg-icons";
import Button from "../components/Button";
import PageLoader from "../components/PageLoader";
import { SuccessResponse } from "../functions";
export default function Admin() {
  const { get, apiReady, post } = useAPI();
  const user = useUser();
  const [data, setUsers] = useState<User[]>();
  const [deletingUser, setDeletingUser] = useState(false);

  function getAllUsers() {
    get<User[]>(`users/getall`, (r) => {
      setUsers(r);
    });
  }

  function deleteUser(user_tbd: User) {
    setDeletingUser(true);
    post<SuccessResponse>(`users/delete_user/${user_tbd.id}`, "", (r) => {
      if (r.success) {
        setUsers((v) => {
          if (!v) return v;
          return v.filter((i) => i.id !== user_tbd.id);
        });
      }
      setDeletingUser(false);
    });
  }
  useEffect(() => {
    if (user) getAllUsers();
  }, [user]);

  if (user === undefined) {
    return <PageLoader />;
  }

  if (user.sys_admin) {
    return (
      <Base>
        <Button onClick={getAllUsers} kind={"link"}>
          <FontAwesomeIcon icon={faRotate} />
        </Button>
        <div className="d-flex flex-column align-items-center w-100">
          <table className="table table-striped table-hover">
            <thead>
              <tr>
                <td>ID</td>
                <td>Username</td>
                <td />
              </tr>
            </thead>
            <tbody>
              {data === undefined ? (
                <tr>
                  <td colSpan={3} className="text-center">
                    <FontAwesomeIcon icon={faSpinner} spin />
                  </td>
                </tr>
              ) : data.length > 0 ? (
                data.map((e) => (
                  <tr key={e.id} style={{ lineHeight: "31px" }}>
                    <td>{e.id}</td>
                    <td>{e.username}</td>
                    <td className="text-end">
                      <div className="btn-group btn-group-sm">
                        <AsyncBtn
                          kind="danger"
                          className=""
                          loading={deletingUser}
                          outline
                          onClick={() => deleteUser(e)}
                        >
                          <FontAwesomeIcon icon={faTrash} />
                        </AsyncBtn>
                      </div>
                    </td>
                  </tr>
                ))
              ) : (
                <tr>
                  <td colSpan={3} className="text-center">
                    No users loaded?
                  </td>
                </tr>
              )}
            </tbody>
          </table>
        </div>
      </Base>
    );
  }
  return <Base>Access denied</Base>;
}
