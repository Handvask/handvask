import { getCookie, hasCookie, setCookie } from "cookies-next";
import { useEffect, useMemo, useState } from "react";
import useAPI from "./useAPI";
import useToken from "./useToken";

export type ExpandedUser = {
  addMzn: (id: number) => void;
  addDzn: (id: number) => void;
  removeMzn: (id: number) => void;
  removeDzn: (id: number) => void;
} & User;

export default function useUser() {
  const token = useToken();
  const [user, setUser] = useState<User>();
  const hasUserCookie = hasCookie("handvask_tmp_user");

  const { get } = useAPI();

  const expandedUser = useMemo<ExpandedUser | undefined>(() => {
    if (!user) return undefined;
    return {
      ...user,
      addMzn(id) {
        setUser((v) => {
          if (!v) return v;
          return {
            ...v,
            mzn_instances: [...v.mzn_instances.filter((i) => i != id), id],
          };
        });
      },
      addDzn(id) {
        setUser((v) => {
          if (!v) return v;
          return {
            ...v,
            dzn_instances: [...v.dzn_instances.filter((i) => i != id), id],
          };
        });
      },
      removeMzn(id) {
        setUser((v) => {
          if (!v) return v;
          return {
            ...v,
            mzn_instances: [...v.mzn_instances.filter((i) => i != id)],
          };
        });
      },
      removeDzn(id) {
        setUser((v) => {
          if (!v) return v;
          return {
            ...v,
            dzn_instances: [...v.dzn_instances.filter((i) => i != id)],
          };
        });
      },
    } as ExpandedUser;
  }, [user]);

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

  return expandedUser;
}
