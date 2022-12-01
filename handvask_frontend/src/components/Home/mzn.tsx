import { faFile, faSpinner, faTrash } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { useEffect, useState } from "react";
import { HomeSubpageBasePropT } from ".";
import { listToUrlEncoded } from "../../functions";
import useAPI from "../../hooks/useAPI";
import Button from "../Button";
import InstanceModal from "./InstanceModal";

export default function Mzn({ user }: HomeSubpageBasePropT) {
  const [data, setData] = useState<MznInstance[]>();
  const { get, apiReady } = useAPI();
  const [showInstanceModal, setShowInstanceModal] = useState(false);
  const [selectedMzn, setSelectedMzn] = useState<MznInstance>();
  function onUpdate(id: number, newName: string, newContents: string) {
    setData((v) => {
      if (!v) return v;
      const x = [...v];
      x[v.findIndex((instance) => instance.id == id)].contents = newContents;
      x[v.findIndex((instance) => instance.id == id)].friendly_name = newName;

      console.log(x);
      return x;
    });
  }

  useEffect(() => {
    if (apiReady) {
      get<MznInstance[]>(
        `instances/mzn?${listToUrlEncoded(user.mzn_instances, "instance_ids")}`,
        (r) => {
          setData(r);
        }
      );
    }
  }, [apiReady]);
  return (
    <>
      <table className="table table-striped table-hover table-">
        <thead>
          <tr>
            <td>ID</td>
            <td>Name</td>
            <td></td>
          </tr>
        </thead>
        <tbody>
          {data == undefined ? (
            <tr>
              <td colSpan={3} className="text-center">
                <FontAwesomeIcon icon={faSpinner} spin></FontAwesomeIcon>
              </td>
            </tr>
          ) : (
            data.map((e, i) => (
              <tr key={i} style={{ lineHeight: "31px" }}>
                <td>{e.id}</td>
                <td>{e.friendly_name}</td>
                <td className="text-end">
                  <div className="btn-group btn-group-sm">
                    <Button
                      kind="dark"
                      className=""
                      outline
                      onClick={() => {
                        setShowInstanceModal(true);
                        setSelectedMzn(e);
                      }}
                    >
                      <FontAwesomeIcon icon={faFile} />
                    </Button>
                    <Button kind="danger" className="" outline>
                      <FontAwesomeIcon icon={faTrash} />
                    </Button>
                  </div>
                </td>
              </tr>
            ))
          )}
        </tbody>
      </table>
      {showInstanceModal && selectedMzn ? (
        <InstanceModal
          onClose={() => {
            setSelectedMzn(undefined);
            setShowInstanceModal(false);
          }}
          originalContents={selectedMzn.contents ?? ""}
          originalName={selectedMzn.friendly_name}
          id={selectedMzn.id}
          type="mzn"
          onUpdate={onUpdate}
        />
      ) : (
        <></>
      )}
    </>
  );
}
