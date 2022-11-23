import { faSpinner } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";

export default function PageLoader() {
  return (
    <div className="vw-100 vh-100 d-flex justify-content-center align-items-center fixed">
      <h1 className="display-1">
        <FontAwesomeIcon icon={faSpinner} spin></FontAwesomeIcon>
      </h1>
    </div>
  );
}