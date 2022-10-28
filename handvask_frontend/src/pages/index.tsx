import Head from "next/head";
import { useState } from "react";

export default function Home() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");

  function handleLogin(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    alert(`User ${username} wants to login using the password ${password}`);
    return false;
  }
  return (
    <>
      <Head>
        <title>Handvask homepage</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <div className="vw-100 vh-100 d-flex justify-content-center align-items-center bg-light">
        <div className="card shadow">
          <form onSubmit={handleLogin}>
            <div className="card-body d-flex flex-column align-items-center">
              <div className="form-floating mb-3">
                <input
                  type="text"
                  className="form-control"
                  id="userInput"
                  value={username}
                  onChange={(e) => setUsername(e.target.value)}
                />
                <label htmlFor="passwordInput">Username</label>
              </div>
              <div className="form-floating mb-3">
                <input
                  type="password"
                  className="form-control"
                  id="passwordInput"
                  value={password}
                  onChange={(e) => setPassword(e.target.value)}
                />
                <label htmlFor="passwordInput">Password</label>
              </div>
              <button type="submit" className="btn btn-primary w-100">
                Login
              </button>
            </div>
          </form>
        </div>
      </div>
    </>
  );
}
