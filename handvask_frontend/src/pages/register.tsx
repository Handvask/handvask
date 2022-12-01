import Head from "next/head";
import { useEffect, useState } from "react";
import { useRouter } from "next/router";
import { hasCookie } from "cookies-next";
import useAPI from "../hooks/useAPI";
import AsyncBtn from "../components/AsyncBtn";
import Link from "next/link";
import React from "react";

export default function Register() {
  const [username, setUsername] = useState("");
  const [password, setPassword] = useState("");
  const [confirmPassword, setConfirmPassword] = useState("");
  const [hasPasswordError, setHaspasswordError] = useState(false);
  const [hadUsernameError, setHadUsernameError] = useState(false);
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

  function handleRegister(e: React.FormEvent<HTMLFormElement>) {
    e.preventDefault();
    setFormLoading(true);
    post<{
      detail?: string;
      success?: boolean;
    }>(
      "/auth/register",
      { username, password },
      (r) => {
        setFormLoading(false);
        if (r.detail) {
          setHadUsernameError(true);
        } else {
          router.replace("/login");
        }
      },
      false
    );
    return false;
  }
  return (
    <>
      <Head>
        <title>Handvask register page</title>
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <div className="vw-100 vh-100 d-flex flex-column justify-content-around align-items-center bg-light px-5">
        <h1 className="display-1 fw-bold">HANDVASK</h1>
        <div className="vw-100 d-flex justify-content-center align-items-center bg-light px-5">
          <div className="card shadow">
            <form onSubmit={handleRegister}>
              <div className="card-body d-flex flex-column align-items-center">
                <div className="form-floating mb-3 w-100">
                  <input
                    type="text"
                    className={`form-control ${
                      hadUsernameError ? "is-invalid" : ""
                    }`}
                    id="userInput"
                    value={username}
                    placeholder=" "
                    onChange={(e) => {
                      setUsername(e.target.value);
                      setHadUsernameError(false);
                    }}
                  />
                  <label htmlFor="passwordInput">Username</label>
                </div>
                <div className="form-floating mb-3 w-100">
                  <input
                    type="password"
                    className={`form-control ${
                      hasPasswordError ? "is-invalid" : ""
                    }`}
                    id="passwordInput"
                    value={password}
                    placeholder=" "
                    onChange={(e) => {
                      setPassword(e.target.value);
                      setHaspasswordError(e.target.value !== confirmPassword);
                    }}
                    autoComplete="new-password"
                  />
                  <label htmlFor="passwordInput">Password</label>
                </div>
                <div className="form-floating mb-3 w-100">
                  <input
                    type="password"
                    className={`form-control ${
                      hasPasswordError ? "is-invalid" : ""
                    }`}
                    id="confirmPasswordInput"
                    value={confirmPassword}
                    placeholder=" "
                    onChange={(e) => {
                      setConfirmPassword(e.target.value);
                      setHaspasswordError(e.target.value !== password);
                    }}
                    autoComplete="new-password"
                  />
                  <label htmlFor="passwordInput">Confirm password</label>
                </div>
                <AsyncBtn
                  type="submit"
                  loading={formLoading}
                  kind="primary"
                  className="w-100"
                  disabled={hasPasswordError}
                >
                  Register
                </AsyncBtn>
                <Link href="/login" className="mt-2">
                  I already have an account
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
