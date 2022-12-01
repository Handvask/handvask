import { deleteCookie } from "cookies-next";
import { useRouter } from "next/router";
import { useEffect } from "react";

export default function Logout() {
  deleteCookie("handvask_api_token");
  deleteCookie("handvask_tmp_user");
  const router = useRouter();

  useEffect(() => {
    router.replace("/login");
  }, []);
  return "";
}
