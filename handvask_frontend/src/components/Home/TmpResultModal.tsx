import { useState } from "react";
import useAPI from "../../hooks/useAPI";
import AsyncBtn from "../AsyncBtn";
import Button from "../Button";
import Modal from "../Modal";
import React from "react";

type TmpResultModalPropT = {
  onClose: () => void;
  run: Run;
};
export default function TmpResultModal({ onClose, run }: TmpResultModalPropT) {
  return (
    <Modal
      title={`Inspect intermediary results for run ${run.id}`}
      onClose={onClose}
      show={true}
      footer={
        <>
          <Button kind="secondary" onClick={onClose}>
            Close
          </Button>
        </>
      }
    >
      <div className="accordion" id="tmpResultAccordion">
        {run.solvers.map((runSolver) => (
          <div className="accordion-item" key={runSolver.id}>
            <h2 className="accordion-header" id={`#accHeader_${runSolver.id}`}>
              <button
                className="accordion-button"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target={`#accItem_${runSolver.id}`}
                aria-controls={`#accItem_${runSolver.id}`}
              >
                <div
                  className={`bg-${
                    runSolver.progress
                      ? "success"
                      : runSolver.terminated
                      ? "danger"
                      : "info"
                  } rounded me-2`}
                  style={{ width: 20, height: 20 }}
                />
                {runSolver.solver.name}
              </button>
            </h2>
            <div
              id={`accItem_${runSolver.id}`}
              className="accordion-collapse collapse"
              aria-labelledby={`#accHeader_${runSolver.id}`}
              data-bs-parent="#tmpResultAccordion"
            >
              <div className="accordion-body">
                <pre>
                  <code>{runSolver.progress}</code>
                </pre>
              </div>
            </div>
          </div>
        ))}
      </div>
    </Modal>
  );
}
