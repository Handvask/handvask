import { useEffect, useMemo, useState } from "react";
import useAPI from "../../hooks/useAPI";
import AsyncBtn from "../AsyncBtn";
import Button from "../Button";
import Modal from "../Modal";
import React from "react";

type DeleteRunModalPropT = {
  onClose: () => void;
  terminateSolvers: (run: Run, solver_ids: number[] | null) => void;
  stopping: boolean;
  run: Run;
};
export default function DeleteRunModal({
  onClose,
  run,
  stopping,
  terminateSolvers,
}: DeleteRunModalPropT) {
  const [selectedForDeletion, setSelectedForDeletion] = useState<
    Record<number, boolean>
  >({});

  useEffect(() => {
    const tmp: Record<number, boolean> = {};
    run.solvers.forEach((runSolver) => {
      if (!runSolver.terminated) tmp[runSolver.solver.id] = false;
    });
    
    setSelectedForDeletion(tmp);
  }, [run]);

  const selectedSolverIds = useMemo(() => {
    return Object.keys(selectedForDeletion)
      .filter(
        (solver) => selectedForDeletion[Number(solver as unknown as number)]
      )
      .map(Number);
  }, [selectedForDeletion]);

  return (
    <Modal
      title={`Stopping solver(s) for run ${run.id}`}
      onClose={onClose}
      show
      footer={
        <>
          <AsyncBtn
            kind="danger"
            onClick={() => terminateSolvers(run, selectedSolverIds)}
            disabled={selectedSolverIds.length === 0}
            loading={stopping}
          >
            Stop
          </AsyncBtn>
          <Button kind="secondary" onClick={onClose}>
            Close
          </Button>
        </>
      }
    >
      <table className="table table-striped table-compact">
        <thead>
          <tr>
            <th>Solver name</th>
            <th>Stop?</th>
          </tr>
        </thead>
        <tbody>
          {run.solvers
            .filter((runSolver) => !runSolver.terminated)
            .map((runSolver) => (
              <tr key={runSolver.id}>
                <td>{runSolver.solver.name}</td>
                <td>
                  <input
                    className="form-check-input mt-0"
                    type="checkbox"
                    value=""
                    aria-label="Checkbox for following text input"
                    checked={selectedForDeletion[runSolver.solver.id] ?? false}
                    onChange={() =>
                      setSelectedForDeletion((v) => {
                        return {
                          ...v,
                          [runSolver.solver.id]:
                            !selectedForDeletion[runSolver.solver.id],
                        };
                      })
                    }
                  />
                </td>
              </tr>
            ))}
        </tbody>
      </table>
    </Modal>
  );
}
