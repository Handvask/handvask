import { useState } from "react";
import useAPI from "../../hooks/useAPI";
import AsyncBtn from "../AsyncBtn";
import Button from "../Button";
import Modal from "../Modal";
import React from "react";

type InstanceModalPropT = {
  onClose: () => void;
  originalContents: string;
  originalName: string;
  id: number;
  type: "mzn" | "dzn";
  onUpdate: (id: number, newName: string, newContents: string) => void;
};
export default function InstanceModal({
  onClose,
  originalContents,
  originalName,
  id,
  type,
  onUpdate,
}: InstanceModalPropT) {
  const [contents, setContents] = useState(originalContents);
  const [name, setName] = useState(originalName);
  const [saving, setSaving] = useState(false);
  const { post } = useAPI();

  function handleSave() {
    setSaving(true);
    post(
      `/instances/${type}/${id}`,
      { contents: contents, friendly_name: name },
      (r) => {
        if (r.success) {
          onUpdate(id, name, contents);
          onClose();
        }
        setSaving(false);
      }
    );
  }

  return (
    <Modal
      title="Edit instance"
      onClose={onClose}
      show={true}
      footer={
        <>
          <Button kind="secondary" onClick={onClose}>
            Cancel
          </Button>
          <AsyncBtn kind="success" onClick={handleSave} loading={saving}>
            Save
          </AsyncBtn>
        </>
      }
    >
      <div className="form-floating mb-3 w-100">
        <input
          type="string"
          className={`form-control`}
          id="nameInput"
          value={name}
          placeholder=" "
          onChange={(e) => setName(e.target.value)}
        />
        <label htmlFor="nameInput">Name</label>
      </div>
      <textarea
        className="form-control"
        style={{ minWidth: "50vw", minHeight: 200 }}
        value={contents}
        onChange={(e) => setContents(e.target.value)}
      />
    </Modal>
  );
}
