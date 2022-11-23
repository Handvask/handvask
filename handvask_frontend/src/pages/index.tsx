import React, { useEffect } from "react";
import Base from "../components/Base";
import { httpGet } from "../functions";
import useUser from "../hooks/useUser";
import Table from 'react-bootstrap/Table';
import 'bootstrap/dist/css/bootstrap.min.css';
const divStyle_welcomeMessage = {
  height: '100%',
  width: '100%',
  display: 'flex',
  justifyContent: 'center',
  alignItems: 'center',
  fontSize: '2rem',
  fontWeight: 'bold',
};
export default function Home() {
  const user = useUser();
  const data = user?.mzn_instances;
  const tableRows =
    <tr>
      <td>{user?.dzn_instances}</td>
      <td>{user?.mzn_instances}</td>
      <td>{user?.runs}</td>
    </tr>
  return ( <Base>
    <div>
      <h1 style={divStyle_welcomeMessage}>Welcome {user?.username}! </h1>

      <Table hover>
        <thead>
          <tr>
            <th> Dzn instances</th>
            <th> Mzn Instances</th>
            <th> Runs</th>
          </tr>
        </thead>
        <tbody>
          {tableRows}
        </tbody>
      </Table>

    </div>
  </Base>
  )
}
function App() {
  return (
    <div className="App">
      <div>
        <h1 style={{ color: 'green' }}>GeeksforGeeks</h1>
        <h3>Rendering Array of Objects</h3>
        <br></br>
      </div>
    </div>
  );
}