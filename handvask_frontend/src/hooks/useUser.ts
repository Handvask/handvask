import { getCookie, hasCookie, setCookie } from "cookies-next";
import { useEffect, useState } from "react";
import useAPI from "./useAPI";
import useToken from "./useToken";

export default function useUser() {
  const token = useToken();
  const [user, setUser] = useState<User>();
  const hasUserCookie = hasCookie("handvask_tmp_user");

  const { get } = useAPI();

  useEffect(() => {
    let loaded = false;
    if (hasUserCookie) {
      const cached = JSON.parse(getCookie("handvask_tmp_user") as string) as [
        User,
        string
      ];
      if (cached[1] === token) {
        loaded = true;
        setUser(cached[0]);
      }
    }
    if (!loaded && token.length > 0) {
      get<User>("users/get", (r) => {
        setUser(r);
        setCookie("handvask_tmp_user", JSON.stringify([r, token]), {
          maxAge: 60,
        });
      });
    }
  }, [token]);

  return user;
}
