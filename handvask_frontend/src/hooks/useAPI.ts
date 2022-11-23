import { useMemo } from "react";
import { httpGet, httpPost, SuccessResponse } from "../functions";
import useToken from "./useToken";

export default function useAPI() {
  const baseURL = process.env.NEXT_PUBLIC_API_URL;
  const token = useToken();

  const authHeader = useMemo(() => {
    if (token.length === 0) return {};

    return {
      Authorization: `Bearer ${token}`,
    };
  }, [token]) as Record<string, string>;

  function get<T = SuccessResponse>(
    url: string,
    callback?: (x: T) => void,
    headers: Record<string, string> = {}
  ) {
    httpGet(baseURL + url.replace(/^\//, ""), callback, {
      ...authHeader,
      ...headers,
    });
  }

  function post<T = SuccessResponse>(
    url: string,
    data: Record<string, unknown>,
    callback?: (x: T) => void,
    useJson = true,
    headers: Record<string, string> = {}
  ) {
    httpPost(baseURL + url.replace(/^\//, ""), data, callback, useJson, {
      ...authHeader,
      ...headers,
    });
  }

  return { get, post };
}
