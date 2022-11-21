import React, { useEffect } from "react";
import { httpGet } from "../functions";
import useUser from "../hooks/useUser";
export default function Home() {
  const user = useUser();
  useEffect(() => {
    httpGet("users/get", (r) => {
      console.log(r);
    });
  }, []);
  return "Hello, World!";
}
