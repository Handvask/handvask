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

export default function Mzn({ user }: HomeSubpageBasePropT) {
  const [data, setData] = useState<MznInstance[]>();
  const { get, apiReady, post } = useAPI();
  const [showInstanceModal, setShowInstanceModal] = useState(false);
  const [selectedMzn, setSelectedMzn] = useState<MznInstance>();
  const [addingMzn, setAddingMzn] = useState(false);
  const [deletingMzn, setDeletingMzn] = useState(false);
  function onUpdate(id: number, newName: string, newContents: string) {
    setData((v) => {
      if (!v) return v;
      const x = [...v];
      x[v.findIndex((instance) => instance.id == id)].contents = newContents;
      x[v.findIndex((instance) => instance.id == id)].friendly_name = newName;

      return x;
    });
  }

  function addMzn() {
    setAddingMzn(true);
    post<MznInstance>(`/instances/create_mzn`, "", (r) => {
      setData((v) => {
        if (!v) return v;
        return [r, ...v];
      });
      user.addMzn(r.id);
      setAddingMzn(false);
      setSelectedMzn(r);
      setShowInstanceModal(true);
    });
  }

  function deleteMzn(instance: MznInstance) {
    setDeletingMzn(true);
    post(`/instances/delete_mzn/${instance.id}`, "", (r) => {
      if (r.success) {
        setData((v) => {
          if (!v) return v;
          return v.filter((i) => i.id !== instance.id);
        });
        user.removeMzn(instance.id);
      } else {
        alert("Couldn't delete mzn");
      }
      setDeletingMzn(false);
    });
  }

  function onCloseModal() {
    setSelectedMzn(undefined);
    setShowInstanceModal(false);
  }

  function handleOpenMzn(instance: MznInstance) {
    setShowInstanceModal(true);
    setSelectedMzn(instance);
  }

  useEffect(() => {
    if (apiReady) {
      if (user.mzn_instances.length > 0)
        get<MznInstance[]>(
          `instances/mzn?${listToUrlEncoded(
            user.mzn_instances,
            "instance_ids"
          )}`,
          (r) => {
            setData(r);
          }
        );
      else {
        setData([]);
      }
    }
  }, [apiReady]);
  return (
    <>
      <div className="d-flex flex-column align-items-center w-100">
        <AsyncBtn
          kind="success"
          loading={addingMzn}
          className="mb-3 fs-5"
          onClick={addMzn}
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
                        onClick={() => handleOpenMzn(e)}
                      >
                        <FontAwesomeIcon icon={faFile} />
                      </Button>
                      <AsyncBtn
                        kind="danger"
                        className=""
                        loading={deletingMzn}
                        outline
                        onClick={() => deleteMzn(e)}
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
                  You don&apos;t have any mzn instances yet, why don&apos;t you
                  add one?
                </td>
              </tr>
            )}
          </tbody>
        </table>
      </div>
      {showInstanceModal && selectedMzn ? (
        <InstanceModal
          onClose={onCloseModal}
          originalContents={selectedMzn.contents ?? ""}
          originalName={selectedMzn.friendly_name}
          id={selectedMzn.id}
          type="mzn"
          onUpdate={onUpdate}
        />
      ) : null}
    </>
  );
}
