import { HomeSubpageBasePropT } from ".";
import React, { useEffect, useState } from "react";
import useAPI from "../../hooks/useAPI";
import { listToUrlEncoded } from "../../functions";
import { faSpinner } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

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
  const { get, apiReady, post } = useAPI();

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
  return (
    <>
      <div className="d-flex flex-column align-items-center w-100">
        <table className="table table-striped table-hover">
          <thead>
            <tr>
              <td>Status</td>
              <td>ID</td>
              <td>Minizinc</td>
              <td>Data</td>
              <td>Submit time</td>
              <td>Start time</td>
              <td>End time</td>
              <td>Result</td>
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
                  <td>{e.dzn_instance.friendly_name}</td>
                  <td>{e.submit_time}</td>
                  <td>{e.start_time ?? "Not started"}</td>
                  <td>{e.end_time ?? "Not done"}</td>
                  <td>{e.result ?? "..."}</td>
                </tr>
              ))
            ) : (
              <tr>
                <td colSpan={3} className="text-center">
                  You haven't made any runs yet, why don't you create one?
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
    </>
  );
}
