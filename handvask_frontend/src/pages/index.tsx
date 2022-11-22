import React, { useEffect } from "react";
import Base from "../components/Base";
import useUser from "../hooks/useUser";
export default function Home() {
  const user = useUser();

  useEffect(() => {
    if (user) {
      console.log(user);
    }
  }, [user]);
  return <Base>Hello, World!</Base>;
}
