import Head from "next/head";
import { useEffect, useState } from "react";
import { httpPost } from "../functions";
import { useRouter } from "next/router";
import { setCookie, hasCookie } from "cookies-next";

export default function Login() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [hadError, setHadError] = useState(false);
  const [hasToken, setHasToken] = useState(false);
  const router = useRouter();

  useEffect(() => {
    if (hasToken === true) {
      router.replace("/");
    }
  }, [hasToken]);

  useEffect(() => {
    setHasToken(hasCookie("handvask_api_token"));
  }, []);

  function handleLogin(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    httpPost<{
      detail?: string;
      access_token?: string;
      token_type?: string;
      success?: boolean;
    }>(
      "/auth/login",
      { username, password },
      (r) => {
        if (r.detail) {
          setHadError(true);
        } else {
          setCookie("handvask_api_token", r.access_token);
          router.replace("/");
        }
      },
      false
    );
    return false;
  }
  return (
    <>
      <Head>
        <title>Handvask login page</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <div className="vw-100 vh-100 d-flex justify-content-center align-items-center bg-light">
        <div className="card shadow">
          <form onSubmit={handleLogin}>
            <div className="card-body d-flex flex-column align-items-center">
              <div className="form-floating mb-3">
                <input
                  type="text"
                  className={`form-control ${hadError ? "is-invalid" : ""}`}
                  id="userInput"
                  value={username}
                  placeholder=" "
                  onChange={(e) => setUsername(e.target.value)}
                />
                <label htmlFor="passwordInput">Username</label>
              </div>
              <div className="form-floating mb-3">
                <input
                  type="password"
                  className={`form-control ${hadError ? "is-invalid" : ""}`}
                  id="passwordInput"
                  value={password}
                  placeholder=" "
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
