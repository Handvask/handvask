import { getCookie, hasCookie } from "cookies-next";
import { useRouter } from "next/router";
import { useEffect, useState } from "react";

export default function useToken() {
  const router = useRouter();
  const hasToken = hasCookie("handvask_api_token");
  const [token, setToken] = useState<string>("");

  useEffect(() => {
    if (
      hasToken === false &&
      router.pathname !== "/login" &&
      router.pathname !== "/register"
    ) {
      router.replace("/login");
    } else if (hasToken === true) {
      setToken(getCookie("handvask_api_token") as string);
    }
  }, [hasToken]);

  return token;
}
