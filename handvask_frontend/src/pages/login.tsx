import Head from "next/head";
import { useEffect, useState } from "react";
import { useRouter } from "next/router";
import { setCookie, hasCookie } from "cookies-next";
import useAPI from "../hooks/useAPI";
import AsyncBtn from "../components/AsyncBtn";
import Link from "next/link";
import React from "react";

export default function Login() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [hadError, setHadError] = useState(false);
  const [hasToken, setHasToken] = useState(false);
  const [formLoading, setFormLoading] = useState(false);
  const router = useRouter();

  const { post } = useAPI();

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
    setFormLoading(true);
    post<{
      detail?: string;
      access_token?: string;
      token_type?: string;
      success?: boolean;
    }>(
      "/auth/login",
      { username, password },
      (r) => {
        setFormLoading(false);
        if (r.detail) {
          setHadError(true);
        } else {
          setCookie("handvask_api_token", r.access_token, {
            maxAge: 86400,
          });
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
      <div className="vw-100 vh-100 d-flex flex-column justify-content-around align-items-center bg-light px-5">
        <h1 className="display-1 fw-bold">HANDVASK</h1>
        <div className="vw-100 d-flex justify-content-center align-items-center bg-light px-5">
          <div className="card shadow">
            <form onSubmit={handleLogin}>
              <div className="card-body d-flex flex-column align-items-center">
                <div className="form-floating mb-3 w-100">
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
                <div className="form-floating mb-3 w-100">
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
                <AsyncBtn
                  type="submit"
                  loading={formLoading}
                  kind="primary"
                  className="w-100"
                >
                  Login
                </AsyncBtn>
                <Link href="/register" className="mt-2">
                  I don't have an account yet
                </Link>
              </div>
            </form>
          </div>
        </div>
        <div />
      </div>
    </>
  );
}
