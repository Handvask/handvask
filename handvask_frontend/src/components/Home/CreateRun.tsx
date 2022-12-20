import { HomeSubpageBasePropT } from ".";
import React, { useEffect, useMemo, useState } from "react";
import Button from "../Button";
import Select from "react-select";
import useAPI from "../../hooks/useAPI";
import { listToUrlEncoded, SuccessResponse } from "../../functions";
import PageLoader from "../PageLoader";
import type { SingleValue, MultiValue } from "react-select";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faBullseye,
  faCalculator,
  faChevronLeft,
  faChevronRight,
  faFileCode,
  faListCheck,
  faMinus,
  faPlus,
} from "@fortawesome/free-solid-svg-icons";
import AsyncBtn from "../AsyncBtn";

export default function CreateRun({
  user,
  setCurrentPage,
  setNotification,
}: HomeSubpageBasePropT & {
  setCurrentPage: (page: string) => void;
  setNotification: (notification: {
    message: string;
    kind: bootstrapColours;
  }) => void;
}) {
  const [mznInstances, setMznInstances] = useState<MznInstance[]>();
  const [dznInstances, setDznInstances] = useState<DznInstance[]>();
  const [solvers, setSolvers] = useState<Solver[]>();
  const { get, post, apiReady } = useAPI();
  const [step, setStep] = useState(1);
  const [selectedMzn, setSelectedMzn] = useState<MznInstance | null>(null);
  const [selectedDzn, setSelectedDzn] = useState<DznInstance | null>(null);
  const [selectedSolvers, setSelectedSolvers] = useState<number[]>([]);
  const [creatingRun, setCreatingRun] = useState(false);
  const [flagAll, setFlagAll] = useState(false);
  const [flagObjective, setFlagObjective] = useState(false);
  const [flagJson, setFlagJson] = useState(false);
  const [flagProcessors, setFlagProcessors] = useState(1);

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
    if (!selectedMzn || selectedSolvers.length === 0) return;
    setCreatingRun(true);
    post<SuccessResponse & { id: number }>(
      "/runs/create",
      {
        mzn_id: selectedMzn.id,
        dzn_id: selectedDzn?.id ?? null,
        solvers: selectedSolvers,
        flag_json: flagJson,
        flag_objective: flagObjective,
        flag_all: flagAll,
        flag_processors: flagProcessors,
      },
      (r) => {
        setCreatingRun(false);
        if (Object.prototype.hasOwnProperty.call(r, "id")) {
          user.addRun(r.id);
        }
        if (r.success) {
          setCurrentPage("runs");
          setNotification({
            message: "Succesfully created run! 🤝",
            kind: "success",
          });
        } else {
          setNotification({
            message: "Something went wrong with creating your run. 😭",
            kind: "danger",
          });
        }
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
              You don&apos;t have any mzn instances yet, why don&apos;t your
              create some?
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
                  disabled={selectedSolvers.length === 0}
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
          (step === 4 && selectedMzn && selectedSolvers.length > 0 && (
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
                <div>
                  {user.max_cpu < selectedSolvers.length * flagProcessors ? (
                    <span className="badge bg-danger me-2">
                      ! Your selected processor and solver count is too big !
                    </span>
                  ) : null}
                  <AsyncBtn
                    kind="success"
                    className="px fw-bold"
                    onClick={submitRun}
                    loading={creatingRun}
                    disabled={
                      user.max_cpu < selectedSolvers.length * flagProcessors
                    }
                  >
                    <FontAwesomeIcon icon={faCalculator} />
                  </AsyncBtn>
                </div>
              </div>
              <div className="card-body">
                <div className="w-100 d-flex justify-content-center">
                  <Button
                    className="me-5"
                    kind={flagJson ? "success" : "danger"}
                    onClick={() => setFlagJson((v) => !v)}
                    tooltip="--json"
                  >
                    <FontAwesomeIcon icon={faFileCode} />
                  </Button>
                  <Button
                    className="me-5"
                    kind={flagAll ? "success" : "danger"}
                    onClick={() => setFlagAll((v) => !v)}
                    tooltip={"--all"}
                  >
                    <FontAwesomeIcon icon={faListCheck} />
                  </Button>
                  <Button
                    className="me-5"
                    kind={flagObjective ? "success" : "danger"}
                    onClick={() => setFlagObjective((v) => !v)}
                    tooltip={"--objective"}
                  >
                    <FontAwesomeIcon icon={faBullseye} />
                  </Button>
                  <div className="d-flex">
                    <Button
                      kind={"primary"}
                      onClick={() =>
                        setFlagProcessors((v) => Math.max(1, v - 1))
                      }
                      style={{ height: 44 }}
                      disabled={flagProcessors <= 1}
                      tooltip="Decrease processor count for each solver"
                    >
                      <FontAwesomeIcon icon={faMinus} />
                    </Button>
                    <span
                      className="badge bg-dark"
                      style={{ padding: "16px 17px" }}
                    >
                      {flagProcessors}
                    </span>
                    <Button
                      kind={"primary"}
                      onClick={() => setFlagProcessors((v) => v + 1)}
                      style={{ height: 44 }}
                      tooltip="Increase processor count for each solver"
                    >
                      <FontAwesomeIcon icon={faPlus} />
                    </Button>
                  </div>
                </div>
                <hr />
                <h5 className="text-center mb-3">Review selections</h5>
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
                  <div className="accordion-item">
                    <h2 className="accordion-header" id="reviewSolverHeader">
                      <button
                        className="accordion-button"
                        type="button"
                        data-bs-toggle="collapse"
                        data-bs-target="#reviewSolverBody"
                        aria-controls="reviewSolverBody"
                      >
                        {selectedSolvers.length} Solver
                        {selectedSolvers.length > 1 ? "s" : ""} selected
                      </button>
                    </h2>
                    <div
                      id="reviewSolverBody"
                      className="accordion-collapse collapse"
                      aria-labelledby="reviewSolverHeader"
                      data-bs-parent="#reviewRunAccordion"
                    >
                      <div className="accordion-body">
                        <ul>
                          {selectedSolvers.map((i) => (
                            <li key={i}>
                              {solvers?.find((solver) => solver.id === i)
                                ?.name ?? ""}
                            </li>
                          ))}
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </>
          ))}
      </div>
    </div>
  );
}
