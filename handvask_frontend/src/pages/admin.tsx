import React, { ChangeEvent, useEffect, useState } from "react";
import Base from "../components/Base";
import useAPI from "../hooks/useAPI";
import useUser from "../hooks/useUser";
import AsyncBtn from "../components/AsyncBtn";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faBan,
  faRotate,
  faSpinner,
  faTrash,
} from "@fortawesome/free-solid-svg-icons";
import Button from "../components/Button";
import PageLoader from "../components/PageLoader";
import { SuccessResponse } from "../functions";

type CustomUserT = Omit<User, "runs"> & { runs: Run[] };

export default function Admin() {
  const { get, apiReady, post } = useAPI();
  const user = useUser();
  const [data, setUsers] = useState<CustomUserT[]>();
  const [deletingUser, setDeletingUser] = useState(false);
  const [updatingUser, setUpdatingUser] = useState(false);
  const [stoppingSolvers, setStoppingSolvers] = useState(false);
  const [loadingUsers, setLoadingUsers] = useState(false);

  function getAllUsers() {
    setLoadingUsers(true);
    get<CustomUserT[]>(`users/getall`, (r) => {
      setLoadingUsers(false);
      setUsers(r);
    });
  }

  function handleUserCPUChange(user: CustomUserT, new_max: number) {
    if (data) {
      setUsers((v) => {
        if (!v) {
          return;
        }
        const tmp = [...v];
        tmp[tmp.findIndex((u) => u.id === user.id)].max_cpu =
          new_max >= 0 ? new_max : 0;
        return tmp;
      });
    }
  }

  function updateUserMaxCPU(
    user: CustomUserT,
    event: ChangeEvent<HTMLInputElement>
  ) {
    const new_max = Number(event.target.value);
    if (new_max !== user.max_cpu) {
      setUpdatingUser(true);
      post(`/admin/user_quota/${user.id}`, { max_cpu: new_max }, (r) => {
        if (r.success) {
          handleUserCPUChange(user, new_max);
        }
      });
      setUpdatingUser(false);
    }
  }

  function handleUserPermissionChange(user: CustomUserT) {
    if (data) {
      setUsers((v) => {
        if (!v) {
          return;
        }
        const tmp = [...v];
        tmp[tmp.findIndex((u) => u.id === user.id)].sys_admin =
          user.sys_admin !== null ? null : { id: 2, user: "a" };
        return tmp;
      });
    }
  }

  function updatePermissions(user: CustomUserT) {
    setUpdatingUser(true);
    post(`/admin/user_permission/${user.id}`, {}, (r) => {
      if (r.success) {
        handleUserPermissionChange(user);
      }
    });

    setUpdatingUser(false);
  }
  function deleteUser(user_tbd: CustomUserT) {
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

  function stopAllUserSolvers(user: CustomUserT) {
    setStoppingSolvers(true);
    user.runs
      .filter((run) => [2, 7].includes(run.status.id))
      .forEach((run) => {
        post<SuccessResponse>(
          `/runs/terminate`,
          { user_id: user.id, run_id: run.id, solver_ids: null },
          (r) => {
            if (r.success) {
              setUsers((v) => {
                if (!v) {
                  return;
                }
                const tmp = [...v];
                tmp[tmp.findIndex((u) => u.id === user.id)].runs = tmp[
                  tmp.findIndex((u) => u.id === user.id)
                ].runs.filter((value) => value.id != run.id);
                return tmp;
              });
            }
          }
        );
      });
    setStoppingSolvers(false);
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
        <div className="d-flex flex-column align-items-center container-fluid">
          <AsyncBtn
            onClick={getAllUsers}
            kind={"primary"}
            className="mt-4 mb-2"
            loading={loadingUsers}
          >
            <FontAwesomeIcon icon={faRotate} />
          </AsyncBtn>
          <table className="table table-striped table-hover">
            <thead>
              <tr>
                <th>ID</th>
                <th>Username</th>
                <th>vCPU</th>
                <th>Is Admin</th>
                <th>Permissions</th>
                <th>Stop solvers</th>
                <th />
              </tr>
            </thead>
            <tbody>
              {data === undefined ? (
                <tr>
                  <td colSpan={7} className="text-center">
                    <FontAwesomeIcon icon={faSpinner} spin />
                  </td>
                </tr>
              ) : data.length > 0 ? (
                data.map((e) => (
                  <tr key={e.id} style={{ lineHeight: "31px" }}>
                    <td>{e.id}</td>
                    <td>{e.username}</td>
                    <td>
                      <div>
                        <input
                          id="max_cpu"
                          type="number"
                          min="0"
                          defaultValue={e.max_cpu}
                          onBlur={(event) => updateUserMaxCPU(e, event)}
                        />
                      </div>
                    </td>

                    {e.sys_admin !== null ? <td> Yes </td> : <td> No </td>}
                    {e.sys_admin !== null ? (
                      <td>
                        <div className="btn-group btn-group-sm">
                          <AsyncBtn
                            kind="danger"
                            className=""
                            loading={deletingUser}
                            outline
                            onClick={() => updatePermissions(e)}
                          >
                            Demote
                          </AsyncBtn>
                        </div>
                      </td>
                    ) : (
                      <td>
                        <div className="btn-group btn-group-sm">
                          <AsyncBtn
                            kind="success"
                            className=""
                            loading={updatingUser}
                            outline
                            onClick={() => updatePermissions(e)}
                          >
                            Promote
                          </AsyncBtn>
                        </div>
                      </td>
                    )}
                    <td>
                      <div className="btn-group btn-group-sm">
                        <AsyncBtn
                          kind="danger"
                          className=""
                          loading={stoppingSolvers}
                          outline
                          onClick={() => stopAllUserSolvers(e)}
                        >
                          Runs in progress:{" "}
                          {
                            e.runs.filter((run) =>
                              [2, 7].includes(run.status.id)
                            ).length
                          }{" "}
                          <FontAwesomeIcon icon={faBan} />
                        </AsyncBtn>
                      </div>
                    </td>
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
