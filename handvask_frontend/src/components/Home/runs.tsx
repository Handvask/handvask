import { HomeSubpageBasePropT } from ".";
import React, { useEffect, useState } from "react";
import useAPI from "../../hooks/useAPI";
import { listToUrlEncoded } from "../../functions";
import {
  faBullseye,
  faFileCode,
  faListCheck,
  faSpinner,
  faStop,
  faTrash,
} from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import AsyncBtn from "../AsyncBtn";
import Button from "../Button";
import TmpResultModal from "./TmpResultModal";
import FinalResultModal from "./FinalResultModal";
import DeleteRunModal from "./DeleteRunModal";

const statusToColour = {
  1: "secondary", // Submitted
  2: "info", // Running
  3: "warning", // Terminated by user
  4: "danger", // Terminated by admin
  5: "success", // Done
  6: "danger", // Exception
  7: "info", // Proving Optimality
};

export default function Runs({
  user,
  setNotification,
}: HomeSubpageBasePropT & {
  setNotification: (notification: {
    message: string;
    kind: bootstrapColours;
  }) => void;
}) {
  const [data, setData] = useState<Run[]>();
  const { get, post, apiReady } = useAPI();
  const [deletingRun, setDeletingRun] = useState(false);
  const [viewingTmpResults, setViewingTmpResults] = useState(false);
  const [viewingFinalResults, setViewingFinalResults] = useState(false);
  const [viewingDeleteRun, setViewingDeleteRun] = useState(false);
  const [tmpRunSelected, setTmpRunSelected] = useState<Run | null>(null);
  const [finalRunSelected, setFinalRunSelected] = useState<Run | null>(null);
  const [deleteRunTarget, setDeleteRunTarget] = useState<Run | null>(null);
  const [refreshDisabled, setRefreshDisabled] = useState(false);

  useEffect(() => {
    if (apiReady) {
      refreshData();
    }
  }, [apiReady]);

  function refreshData() {
    if (refreshDisabled) return;
    if (user.mzn_instances.length > 0) {
      setRefreshDisabled(true);
      get<Run[]>(`runs?${listToUrlEncoded(user.runs, "run_ids")}`, (r) => {
        setData(r);
        setTimeout(() => setRefreshDisabled(false), 3000);
      });
    } else {
      setData([]);
    }
  }

  function handleStopRun(run: Run) {
    if (run.solvers.length < 2) {
      terminateSolvers(run);
    } else {
      setDeleteRunTarget(run);
      setViewingDeleteRun(true);
    }
  }

  function terminateSolvers(run: Run, solver_ids: number[] | null = null) {
    setDeletingRun(true);
    post(`/runs/terminate`, { solver_ids, run_id: run.id }, (r) => {
      if (r.success) {
        setViewingDeleteRun(false);
        setData((v) => {
          if (!v) return v;
          const tmp = [...v];
          tmp[tmp.findIndex((r) => r.id === run.id)].solvers = tmp[
            tmp.findIndex((r) => r.id === run.id)
          ].solvers.filter(
            (solver) =>
              !(
                solver_ids === null ||
                solver_ids.length === 0 ||
                solver_ids.includes(solver.solver.id)
              )
          );
          return tmp;
        });
        get<Run[]>(`runs?${listToUrlEncoded([run.id], "run_ids")}`, (r) => {
          setData((v) => {
            if (!v) return v;
            const tmp = [...v];
            tmp[tmp.findIndex((innerRun) => innerRun.id === run.id)] = r[0];
            return tmp;
          });
        });
      } else {
        alert("Couldn't terminate solvers");
      }
      setNotification({
        message: "Solver stopped. 🛑",
        kind: "danger",
      });
      setDeletingRun(false);
    });
  }

  function deleteRun(run: Run, solver_ids: number[] | null = null) {
    setDeletingRun(true);
    post(`/runs/delete/${run.id}`, "", (r) => {
      if (r.success) {
        setData((v) => {
          if (!v) return v;
          return v.filter((i) => i.id !== run.id);
        });
        user.removeRun(run.id);
        setNotification({ message: "Run deleted. 👋", kind: "danger" });
      } else {
        alert("Couldn't delete run");
      }
      setDeletingRun(false);
    });
  }

  return (
    <>
      <div className="d-flex flex-column align-items-center w-100">
        <Button kind="primary" onClick={refreshData} disabled={refreshDisabled}>
          Refresh runs
        </Button>
        <table className="table table-striped table-hover">
          <thead>
            <tr>
              <td>Status</td>
              <td>ID</td>
              <td>Minizinc</td>
              <td>Data</td>
              <td>Flags</td>
              <td>Start time</td>
              <td>End time</td>
              <td>Execution time</td>
              <td>MZN status</td>
              <td>Result</td>
              <th />
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
                  <td>
                    <span
                      className={`badge me-1 bg-${
                        e.flag_json ? "success" : "danger"
                      }`}
                    >
                      <FontAwesomeIcon icon={faFileCode} />
                    </span>
                    <span
                      className={`badge me-1 bg-${
                        e.flag_all ? "success" : "danger"
                      }`}
                    >
                      <FontAwesomeIcon icon={faListCheck} />
                    </span>
                    <span
                      className={`badge me-1 bg-${
                        e.flag_objective ? "success" : "danger"
                      }`}
                    >
                      <FontAwesomeIcon icon={faBullseye} />
                    </span>
                  </td>
                  <td>{e.start_time ?? "Not started"}</td>
                  <td>{e.end_time ?? "Not done"}</td>
                  <td>
                    {e.execution_time ?? "Not done"}{" "}
                    {e.execution_time ? <>&micro;s</> : ""}
                  </td>
                  <td>{e.mzn_status ?? "Not done"}</td>
                  <td>
                    {e.status.id === 7 ? (
                      <Button
                        kind="primary"
                        small
                        onClick={() => {
                          setTmpRunSelected(e);
                          setViewingTmpResults(true);
                        }}
                      >
                        Intermediary results ready
                      </Button>
                    ) : e.result ? (
                      <Button
                        kind="primary"
                        small
                        onClick={() => {
                          setFinalRunSelected(e);
                          setViewingFinalResults(true);
                        }}
                      >
                        Show results
                      </Button>
                    ) : (
                      "..."
                    )}
                  </td>
                  <td>
                    <div className="btn-group btn-group-sm">
                      {e.status.id === 2 || e.status.id === 7 ? (
                        <AsyncBtn
                          kind="danger"
                          className=""
                          loading={deletingRun}
                          outline
                          onClick={() => handleStopRun(e)}
                        >
                          <FontAwesomeIcon icon={faStop} />
                        </AsyncBtn>
                      ) : (
                        <AsyncBtn
                          kind="danger"
                          className=""
                          loading={deletingRun}
                          outline
                          onClick={() => deleteRun(e)}
                        >
                          <FontAwesomeIcon icon={faTrash} />
                        </AsyncBtn>
                      )}
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
      {viewingTmpResults && tmpRunSelected ? (
        <TmpResultModal
          onClose={() => setViewingTmpResults(false)}
          run={tmpRunSelected}
        />
      ) : null}
      {viewingFinalResults && finalRunSelected ? (
        <FinalResultModal
          onClose={() => setViewingFinalResults(false)}
          run={finalRunSelected}
        />
      ) : null}
      {viewingDeleteRun && deleteRunTarget ? (
        <DeleteRunModal
          onClose={() => setViewingDeleteRun(false)}
          run={deleteRunTarget}
          terminateSolvers={terminateSolvers}
          stopping={deletingRun}
        />
      ) : null}
    </>
  );
}
