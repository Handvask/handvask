import { useState } from "react";
import useAPI from "../../hooks/useAPI";
import AsyncBtn from "../AsyncBtn";
import Button from "../Button";
import Modal from "../Modal";
import React from "react";

type FinalResultModalPropT = {
  onClose: () => void;
  run: Run;
};
export default function FinalResultModal({
  onClose,
  run,
}: FinalResultModalPropT) {
  return (
    <Modal
      title={`Viewing final results for run ${run.id}`}
      onClose={onClose}
      show
      footer={
        <>
          <Button kind="secondary" onClick={onClose}>
            Close
          </Button>
        </>
      }
    >
      <p>Best solver: {run.best_solver.name} </p>
      <hr />
      <pre>
        <code>{run.result}</code>
      </pre>
    </Modal>
  );
}
