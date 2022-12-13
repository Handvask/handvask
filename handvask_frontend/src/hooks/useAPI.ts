import { useRouter } from "next/router";
import { useMemo, useState } from "react";
import { httpGet, httpPost, SuccessResponse } from "../functions";
import useToken from "./useToken";

export default function useAPI() {
  const baseURL = process.env.NEXT_PUBLIC_API_URL;
  const token = useToken();
  const [apiReady, setReady] = useState(false);
  const router = useRouter();

  const authHeader = useMemo(() => {
    if (token.length === 0) return {};
    setReady(true);
    return {
      Authorization: `Bearer ${token}`,
    };
  }, [token]) as Record<string, string>;

  function get<T = SuccessResponse>(
    url: string,
    callback?: (x: T) => void,
    headers: Record<string, string> = {}
  ) {
    console.log(baseURL);
    console.log(baseURL + url.replace(/^\//, ""));
    httpGet<T>(
      baseURL + url.replace(/^\//, ""),
      (resp, code) => {
        if (code === 401) {
          router.replace("/logout");
        }
        if (callback) callback(resp);
      },
      {
        ...authHeader,
        ...headers,
      }
    );
  }

  function post<T = SuccessResponse>(
    url: string,
    data: Record<string, unknown> | string,
    callback?: (x: T) => void,
    useJson = true,
    headers: Record<string, string> = {}
  ) {
    httpPost<T>(
      baseURL + url.replace(/^\//, ""),
      data,
      (resp, code) => {
        if (code === 401) {
          router.replace("/logout");
        }
        if (callback) callback(resp);
      },
      useJson,
      {
        ...authHeader,
        ...headers,
      }
    );
  }

  return { get, post, apiReady };
}
