import { getCookie, hasCookie } from "cookies-next";
import { useRouter } from "next/router";
import { useEffect, useState } from "react";
import { httpGet } from "../functions";

export default function useUser() {
  const router = useRouter();
  const hasToken = hasCookie("handvask_api_token");
  const [token, setToken] = useState<string>("");
  const [user, setUser] = useState<User>();

  useEffect(() => {
    if (hasToken === false) {
      router.replace("/login");
    } else if (hasToken === true) {
      setToken(getCookie("handvask_api_token") as string);
    }
  }, [hasToken]);

  useEffect(() => {
    if (token.length > 0) {
      httpGet<User>("users/get", (r) => {
        setUser(r);
      });
    }
  }, [token]);

  return user;
}
