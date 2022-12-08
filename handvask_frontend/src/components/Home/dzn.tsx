<<<<<<< HEAD
import { faFile, faSpinner, faTrash } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { useEffect, useState } from "react";
import { HomeSubpageBasePropT } from ".";
import { listToUrlEncoded, SuccessResponse } from "../../functions";
import useAPI from "../../hooks/useAPI";
import AsyncBtn from "../AsyncBtn";
import Button from "../Button";
import InstanceModal from "./InstanceModal";
import React from "react";

export default function Dzn({ user }: HomeSubpageBasePropT) {
  const [data, setData] = useState<DznInstance[]>();
  const { get, apiReady, post } = useAPI();
  const [showInstanceModal, setShowInstanceModal] = useState(false);
  const [selectedDzn, setSelectedDzn] = useState<DznInstance>();
  const [addingDzn, setAddingDzn] = useState(false);
  const [deletingDzn, setDeletingDzn] = useState(false);
  function onUpdate(id: number, newName: string, newContents: string) {
    setData((v) => {
      if (!v) return v;
      const x = [...v];
      x[v.findIndex((instance) => instance.id == id)].contents = newContents;
      x[v.findIndex((instance) => instance.id == id)].friendly_name = newName;

      return x;
    });
  }

  function addDzn() {
    setAddingDzn(true);
    post<DznInstance>(`/instances/create_dzn`, "", (r) => {
      setData((v) => {
        if (!v) return v;
        return [...v, r];
      });
      user.addDzn(r.id);
      setAddingDzn(false);
    });
  }

  function deleteDzn(instance: DznInstance) {
    setDeletingDzn(true);
    post(`/instances/delete_dzn/${instance.id}`, "", (r) => {
      if (r.success) {
        setData((v) => {
          if (!v) return v;
          return v.filter((i) => i.id !== instance.id);
        });
        user.removeDzn(instance.id);
      } else {
        alert("Couldn't delete dzn");
      }
      setDeletingDzn(false);
    });
  }

  function onCloseModal() {
    setSelectedDzn(undefined);
    setShowInstanceModal(false);
  }

  function handleOpenDzn(instance: DznInstance) {
    setShowInstanceModal(true);
    setSelectedDzn(instance);
  }

  useEffect(() => {
    if (apiReady) {
      if (user.dzn_instances.length > 0) {
        get<DznInstance[]>(
          `instances/dzn?${listToUrlEncoded(
            user.dzn_instances,
            "instance_ids"
          )}`,
          (r) => {
            setData(r);
          }
        );
      } else {
        setData([]);
      }
    }
  }, [apiReady]);
  return (
    <>
      <div className="d-flex flex-column align-items-center w-100">
        <AsyncBtn
          kind="success"
          loading={addingDzn}
          className="mb-3 fs-5"
          onClick={addDzn}
        >
          Add new instance!
        </AsyncBtn>
        <table className="table table-striped table-hover">
          <thead>
            <tr>
              <td>ID</td>
              <td>Name</td>
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
                  <td>{e.friendly_name}</td>
                  <td className="text-end">
                    <div className="btn-group btn-group-sm">
                      <Button
                        kind="dark"
                        className=""
                        outline
                        onClick={() => handleOpenDzn(e)}
                      >
                        <FontAwesomeIcon icon={faFile} />
                      </Button>
                      <AsyncBtn
                        kind="danger"
                        className=""
                        loading={deletingDzn}
                        outline
                        onClick={() => deleteDzn(e)}
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
                  You don't have any Dzn instances yet, why don't you add one?
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
      {showInstanceModal && selectedDzn ? (
        <InstanceModal
          onClose={onCloseModal}
          originalContents={selectedDzn.contents ?? ""}
          originalName={selectedDzn.friendly_name}
          id={selectedDzn.id}
          type="dzn"
          onUpdate={onUpdate}
        />
      ) : null}
    </>
  );
}
=======
import { faFile, faSpinner, faTrash } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { useEffect, useState } from "react";
import { HomeSubpageBasePropT } from ".";
import { listToUrlEncoded, SuccessResponse } from "../../functions";
import useAPI from "../../hooks/useAPI";
import AsyncBtn from "../AsyncBtn";
import Button from "../Button";
import InstanceModal from "./InstanceModal";
import React from "react";

export default function Dzn({ user }: HomeSubpageBasePropT) {
  const [data, setData] = useState<DznInstance[]>();
  const { get, apiReady, post } = useAPI();
  const [showInstanceModal, setShowInstanceModal] = useState(false);
  const [selectedDzn, setSelectedDzn] = useState<DznInstance>();
  const [addingDzn, setAddingDzn] = useState(false);
  const [deletingDzn, setDeletingDzn] = useState(false);
  function onUpdate(id: number, newName: string, newContents: string) {
    setData((v) => {
      if (!v) return v;
      const x = [...v];
      x[v.findIndex((instance) => instance.id == id)].contents = newContents;
      x[v.findIndex((instance) => instance.id == id)].friendly_name = newName;

      return x;
    });
  }

  function addDzn() {
    setAddingDzn(true);
    post<DznInstance>(`/instances/create_dzn`, "", (r) => {
      setData((v) => {
        if (!v) return v;
        return [...v, r];
      });
      user.addDzn(r.id);
      setAddingDzn(false);
    });
  }

  function deleteDzn(instance: DznInstance) {
    setDeletingDzn(true);
    post(`/instances/delete_dzn/${instance.id}`, "", (r) => {
      if (r.success) {
        setData((v) => {
          if (!v) return v;
          return v.filter((i) => i.id !== instance.id);
        });
        user.removeDzn(instance.id);
      } else {
        alert("Couldn't delete dzn");
      }
      setDeletingDzn(false);
    });
  }

  function onCloseModal() {
    setSelectedDzn(undefined);
    setShowInstanceModal(false);
  }

  function handleOpenDzn(instance: DznInstance) {
    setShowInstanceModal(true);
    setSelectedDzn(instance);
  }

  useEffect(() => {
    if (apiReady) {
      if (user.dzn_instances.length > 0) {
        get<DznInstance[]>(
          `instances/dzn?${listToUrlEncoded(
            user.dzn_instances,
            "instance_ids"
          )}`,
          (r) => {
            setData(r);
          }
        );
      } else {
        setData([]);
      }
    }
  }, [apiReady]);
  return (
    <>
      <div className="d-flex flex-column align-items-center w-100">
        <AsyncBtn
          kind="success"
          loading={addingDzn}
          className="mb-3 fs-5"
          onClick={addDzn}
        >
          Add new instance!
        </AsyncBtn>
        <table className="table table-striped table-hover">
          <thead>
            <tr>
              <td>ID</td>
              <td>Name</td>
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
                  <td>{e.friendly_name}</td>
                  <td className="text-end">
                    <div className="btn-group btn-group-sm">
                      <Button
                        kind="dark"
                        className=""
                        outline
                        onClick={() => handleOpenDzn(e)}
                      >
                        <FontAwesomeIcon icon={faFile} />
                      </Button>
                      <AsyncBtn
                        kind="danger"
                        className=""
                        loading={deletingDzn}
                        outline
                        onClick={() => deleteDzn(e)}
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
                  You don't have any Dzn instances yet, why don't you add one?
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
      {showInstanceModal && selectedDzn ? (
        <InstanceModal
          onClose={onCloseModal}
          originalContents={selectedDzn.contents ?? ""}
          originalName={selectedDzn.friendly_name}
          id={selectedDzn.id}
          type="dzn"
          onUpdate={onUpdate}
        />
      ) : null}
    </>
  );
}
>>>>>>> 749ccb08d1ffccb8ddf699f3fe16b88da0b335ed
