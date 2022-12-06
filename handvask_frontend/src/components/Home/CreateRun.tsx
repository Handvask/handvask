import { HomeSubpageBasePropT } from ".";
import React, { useEffect, useMemo, useState } from "react";
import Button from "../Button";
import Select from "react-select";
import useAPI from "../../hooks/useAPI";
import { listToUrlEncoded } from "../../functions";
import PageLoader from "../PageLoader";
import type { SingleValue, MultiValue } from "react-select";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faCalculator,
  faChevronLeft,
  faChevronRight,
} from "@fortawesome/free-solid-svg-icons";

export default function CreateRun({ user }: HomeSubpageBasePropT) {
  const [mznInstances, setMznInstances] = useState<MznInstance[]>();
  const [dznInstances, setDznInstances] = useState<DznInstance[]>();
  const [solvers, setSolvers] = useState<Solver[]>();
  const { get, post, apiReady } = useAPI();
  const [step, setStep] = useState(1);
  const [selectedMzn, setSelectedMzn] = useState<MznInstance | null>(null);
  const [selectedDzn, setSelectedDzn] = useState<DznInstance | null>(null);
  const [selectedSolvers, setSelectedSolvers] = useState<number[]>([]);

  const mznOptions = useMemo(() => {
    if (mznInstances) {
      return mznInstances.map((instance) => {
        return {
          label: instance.friendly_name,
          value: instance.id,
        };
      });
    }
  }, [mznInstances]);

  const dznOptions = useMemo(() => {
    if (dznInstances) {
      return dznInstances.map((instance) => {
        return {
          label: instance.friendly_name,
          value: instance.id,
        };
      });
    }
  }, [dznInstances]);

  const solverOptions = useMemo(() => {
    if (solvers) {
      return solvers.map((solver) => {
        return { label: solver.name, value: solver.id };
      });
    }
  }, [solvers]);

  function handleMznSelectChange(
    e: SingleValue<{
      label: string;
      value: number;
    }>
  ) {
    if (!mznInstances) return;
    setSelectedMzn(
      mznInstances?.find((instance) => instance.id == e?.value) as MznInstance
    );
  }

  function handleDznSelectChange(
    e: SingleValue<{
      label: string;
      value: number;
    }>
  ) {
    if (!dznInstances) return;
    setSelectedDzn(
      dznInstances?.find((instance) => instance.id == e?.value) as DznInstance
    );
  }

  function handleSolverSelectChange(
    e: MultiValue<{ label: string; value: number }>
  ) {
    setSelectedSolvers(e.map((solver) => solver.value));
  }

  useEffect(() => {
    if (apiReady) {
      if (user.mzn_instances.length > 0) {
        get<MznInstance[]>(
          `instances/mzn?${listToUrlEncoded(
            user.mzn_instances,
            "instance_ids"
          )}`,
          (r) => {
            setMznInstances(r);
          }
        );
      } else {
        setMznInstances([]);
      }
      if (user.dzn_instances.length > 0) {
        get<DznInstance[]>(
          `instances/dzn?${listToUrlEncoded(
            user.dzn_instances,
            "instance_ids"
          )}`,
          (r) => {
            setDznInstances(r);
          }
        );
      } else {
        setDznInstances([]);
      }
      get<Solver[]>("/solvers", (r) => {
        setSolvers(r);
      });
    }
  }, [apiReady]);

  function submitRun() {
    if (!selectedMzn) return;
    post(
      "/runs/create",
      { mzn: selectedMzn.id, dzn: selectedDzn?.id ?? null },
      (r) => {
        console.log(r);
      }
    );
  }

  return (
    <div className="container-fluid">
      <div className="card shadow-sm">
        {(step === 1 &&
          (mznInstances == undefined ? (
            <PageLoader />
          ) : mznInstances.length == 0 ? (
            <p>
              You don't have any mzn instances yet, why don't your create some?
            </p>
          ) : (
            <>
              <div className="card-header d-flex justify-content-center">
                <p className="m-0 fw-bold">Select your minizinc file</p>
              </div>
              <div className="card-header">
                <Select
                  options={mznOptions}
                  onChange={handleMznSelectChange}
                  value={
                    selectedMzn
                      ? mznOptions?.find(
                          (instance) => instance.value == selectedMzn.id
                        )
                      : null
                  }
                />
              </div>
              <div className="card-header d-flex justify-content-end">
                <Button
                  kind="primary"
                  className="px fw-bold"
                  onClick={() => setStep(2)}
                  disabled={selectedMzn === null}
                >
                  <FontAwesomeIcon icon={faChevronRight} />
                </Button>
              </div>
              <div className="card-body">
                {(selectedMzn && (
                  <pre>
                    <code>{selectedMzn.contents}</code>
                  </pre>
                )) || <small>Nothing selected</small>}
              </div>
            </>
          ))) ||
          (step === 2 && (
            <>
              <div className="card-header">
                <Select
                  options={dznOptions}
                  onChange={handleDznSelectChange}
                  value={
                    selectedDzn
                      ? dznOptions?.find(
                          (instance) => instance.value == selectedDzn.id
                        )
                      : null
                  }
                  isClearable
                />
              </div>
              <div className="card-header d-flex justify-content-center">
                <p className="m-0 fw-bold">
                  Select your data file, if you need one
                </p>
              </div>
              <div className="card-header d-flex justify-content-between">
                <Button
                  kind="danger"
                  className="px fw-bold"
                  onClick={() => setStep(1)}
                >
                  <FontAwesomeIcon icon={faChevronLeft} />
                </Button>
                <Button
                  kind="primary"
                  className="px fw-bold"
                  onClick={() => setStep(3)}
                >
                  <FontAwesomeIcon icon={faChevronRight} />
                </Button>
              </div>
              <div className="card-body">
                {(selectedDzn && (
                  <pre>
                    <code>{selectedDzn.contents}</code>
                  </pre>
                )) || <small>Nothing selected</small>}
              </div>
            </>
          )) ||
          (step === 3 && (
            <>
              <div className="card-header d-flex justify-content-center">
                <p className="m-0 fw-bold">Select solver(s)</p>
              </div>
              <div className="card-header d-flex justify-content-between">
                <Button
                  kind="danger"
                  className="px fw-bold"
                  onClick={() => setStep(2)}
                >
                  <FontAwesomeIcon icon={faChevronLeft} />
                </Button>
                <Button
                  kind="primary"
                  className="px fw-bold"
                  onClick={() => setStep(4)}
                >
                  <FontAwesomeIcon icon={faChevronRight} />
                </Button>
              </div>
              <div className="card-body">
                <Select
                  options={solverOptions}
                  isMulti
                  value={solverOptions?.filter((solver) =>
                    selectedSolvers?.includes(solver.value)
                  )}
                  onChange={handleSolverSelectChange}
                />
              </div>
            </>
          )) ||
          (step === 4 && selectedMzn && (
            <>
              <div className="card-header d-flex justify-content-center">
                <p className="m-0 fw-bold">Solve it!</p>
              </div>
              <div className="card-header d-flex justify-content-between">
                <Button
                  kind="danger"
                  className="px fw-bold"
                  onClick={() => setStep(3)}
                >
                  <FontAwesomeIcon icon={faChevronLeft} />
                </Button>
                <Button
                  kind="success"
                  className="px fw-bold"
                  onClick={submitRun}
                >
                  <FontAwesomeIcon icon={faCalculator} />
                </Button>
              </div>
              <div className="card-body">
                <p>Review selections</p>
                <div className="accordion" id="reviewRunAccordion">
                  <div className="accordion-item">
                    <h2 className="accordion-header" id="reviewMznHeader">
                      <button
                        className="accordion-button"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#reviewMznBody"
                        aria-controls="reviewMznBody"
                      >
                        <span className="badge bg-secondary">
                          {selectedMzn.id}
                        </span>
                        <span className="ms-2">
                          {selectedMzn.friendly_name}
                        </span>
                        <small className="text-muted">.mzn</small>
                      </button>
                    </h2>
                    <div
                      id="reviewMznBody"
                      className="accordion-collapse collapse"
                      aria-labelledby="reviewMznHeader"
                      data-bs-parent="#reviewRunAccordion"
                    >
                      <div className="accordion-body">
                        <pre>
                          <code>{selectedMzn.contents}</code>
                        </pre>
                      </div>
                    </div>
                  </div>
                  {selectedDzn ? (
                    <div className="accordion-item">
                      <h2 className="accordion-header" id="reviewDznHeader">
                        <button
                          className="accordion-button"
                          type="button"
                          data-bs-toggle="collapse"
                          data-bs-target="#reviewDznBody"
                          aria-controls="reviewDznBody"
                        >
                          <span className="badge bg-secondary">
                            {selectedDzn.id}
                          </span>
                          <span className="ms-2">
                            {selectedDzn.friendly_name}
                          </span>
                          <small className="text-muted">.dzn</small>
                        </button>
                      </h2>
                      <div
                        id="reviewDznBody"
                        className="accordion-collapse collapse"
                        aria-labelledby="reviewDznHeader"
                        data-bs-parent="#reviewRunAccordion"
                      >
                        <div className="accordion-body">
                          <pre>
                            <code>{selectedDzn.contents}</code>
                          </pre>
                        </div>
                      </div>
                    </div>
                  ) : null}
                </div>
              </div>
            </>
          ))}
      </div>
    </div>
  );
}
