import { HomeSubpageBasePropT } from ".";
import React, { useEffect, useState } from "react";
import useAPI from "../../hooks/useAPI";
import { listToUrlEncoded } from "../../functions";
import { faSpinner, faTrash } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import AsyncBtn from "../AsyncBtn";

const statusToColour = {
  1: "secondary", // Submitted
  2: "info", // Running
  3: "warning", // Terminated by user
  4: "danger", // Terminated by admin
  5: "success", // Done
  6: "danger", // Exception
};

export default function Runs({ user }: HomeSubpageBasePropT) {
  const [data, setData] = useState<Run[]>();
  const { get, post, apiReady } = useAPI();
  const [deletingRun, setDeletingRun] = useState(false);

  useEffect(() => {
    if (apiReady) {
      if (user.mzn_instances.length > 0)
        get<Run[]>(`runs?${listToUrlEncoded(user.runs, "run_ids")}`, (r) => {
          setData(r);
        });
      else {
        setData([]);
      }
    }
  }, [apiReady]);

  function deleteRun(run: Run) {
    setDeletingRun(true);
    post(`/runs/delete/${run.id}`, "", (r) => {
      if (r.success) {
        setData((v) => {
          if (!v) return v;
          return v.filter((i) => i.id !== run.id);
        });
        user.removeRun(run.id);
      } else {
        alert("Couldn't delete run");
      }
      setDeletingRun(false);
    });
  }

  return (
    <div className="d-flex flex-column align-items-center w-100">
      <table className="table table-striped table-hover">
        <thead>
          <tr>
            <td>Status</td>
            <td>ID</td>
            <td>Minizinc</td>
            <td>Data</td>
            <td>Start time</td>
            <td>End time</td>
            <td>Execution time</td>
            <td>MZN status</td>
            <td>Result</td>
            <th></th>
          </tr>
        </thead>
        <tbody>
          {data === undefined ? (
            <tr>
              <td colSpan={10} className="text-center">
                <FontAwesomeIcon icon={faSpinner} spin />
              </td>
            </tr>
          ) : data.length > 0 ? (
            data.map((e) => (
              <tr key={e.id} style={{ lineHeight: "31px" }}>
                <td>
                  <span
                    className={`badge fw-bold upper bg-${
                      statusToColour[e.status.id]
                    }`}
                    style={{ textTransform: "uppercase" }}
                  >
                    <small>{e.status.name}</small>
                  </span>
                </td>
                <td>{e.id}</td>
                <td>{e.mzn_instance.friendly_name}</td>
                <td>{e.dzn_instance?.friendly_name ?? "No data"}</td>
                <td>{e.start_time ?? "Not started"}</td>
                <td>{e.end_time ?? "Not done"}</td>
                <td>
                  {e.execution_time ?? "Not done"}{" "}
                  {e.execution_time ? <>&micro;s</> : ""}
                </td>
                <td>{e.mzn_status ?? "Not done"}</td>
                <td>{e.result ?? "..."}</td>
                <td>
                  <div className="btn-group btn-group-sm">
                    <AsyncBtn
                      kind="danger"
                      className=""
                      loading={deletingRun}
                      outline
                      onClick={() => deleteRun(e)}
                    >
                      <FontAwesomeIcon icon={faTrash} />
                    </AsyncBtn>
                  </div>
                </td>
              </tr>
            ))
          ) : (
            <tr>
              <td colSpan={10} className="text-center">
                You haven&apos;t made any runs yet, why don&apos;t you create
                one?
              </td>
            </tr>
          )}
        </tbody>
      </table>
    </div>
  );
}
