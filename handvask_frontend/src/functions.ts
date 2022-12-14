export type SuccessResponse = { success: boolean };

export function guuid() {
  let d = new Date().getTime(),
    d2 = (performance && performance.now && performance.now() * 1000) || 0;
  return "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx".replace(/[xy]/g, (c) => {
    let r = Math.random() * 16;
    if (d > 0) {
      r = (d + r) % 16 | 0;
      d = Math.floor(d / 16);
    } else {
      r = (d2 + r) % 16 | 0;
      d2 = Math.floor(d2 / 16);
    }
    return (c == "x" ? r : (r & 0x7) | 0x8).toString(16);
  });
}

export function objToUrlEncoded(obj: Record<string, unknown>) {
  return Object.keys(obj)
    .map(
      (k) => encodeURIComponent(k) + "=" + encodeURIComponent(obj[k] as string)
    )
    .join("&");
}

export function listToUrlEncoded(arr: (string | number)[], name: string) {
  return `${name}=` + arr.join(`&${name}=`);
}

export function http<T = SuccessResponse>(
  request: Request,
  callback?: (x: T, code: number) => void
) {
  fetch(request)
    .then((r) => r.json().then((data) => ({ data, code: r.status })))
    .then(({ data, code }) => {
      if (Object.prototype.hasOwnProperty.call(data, "dd")) {
        window.dispatchEvent(new CustomEvent("__dd", { detail: data.dd }));
      } else if (Object.prototype.hasOwnProperty.call(data, "whoops")) {
        window.dispatchEvent(
          new CustomEvent("__whoops", { detail: data.whoops })
        );
      } else if (Object.prototype.hasOwnProperty.call(data, "redirect")) {
        if (callback) {
          callback(data, code);
        }
        document.location = data.redirect;
      } else if (callback) {
        callback(data, code);
      }
    });
}

export async function asyncHttp<T = SuccessResponse>(request: Request) {
  return fetch(request)
    .then((r) => r.json())
    .then((data) => {
      if (Object.prototype.hasOwnProperty.call(data, "dd")) {
        window.dispatchEvent(new CustomEvent("__dd", { detail: data.dd }));
      } else if (Object.prototype.hasOwnProperty.call(data, "whoops")) {
        window.dispatchEvent(
          new CustomEvent("__whoops", { detail: data.whoops })
        );
      } else if (Object.prototype.hasOwnProperty.call(data, "redirect")) {
        document.location = data.redirect;
      }
      return data as T;
    });
}

export function httpGet<T = SuccessResponse>(
  url: string,
  callback?: (x: T, code: number) => void,
  headers: Record<string, string> = {}
) {
  const r = new Request(url, {
    method: "GET",
    headers: {
      "X-Requested-With": "XMLHttpRequest",
      ...headers,
    },
  });
  http<T>(r, callback);
}

export function httpPost<T = SuccessResponse>(
  url: string,
  data: Record<string, unknown> | string,
  callback?: (x: T, code: number) => void,
  useJson = true,
  headers: Record<string, string> = {}
) {
  const r = new Request(url, {
    method: "POST",
    headers: {
      "Content-Type": useJson
        ? "application/json"
        : "application/x-www-form-urlencoded",
      "X-Requested-With": "XMLHttpRequest",
      ...headers,
    },
    body: useJson
      ? JSON.stringify(data)
      : typeof data === "string"
      ? data
      : objToUrlEncoded(data),
  });
  http<T>(r, callback);
}

export async function asyncHttpGet<T = SuccessResponse>(url: string) {
  const r = new Request(url, {
    method: "GET",
    headers: {
      "X-Requested-With": "XMLHttpRequest",
    },
  });
  return asyncHttp<T>(r);
}

export async function asyncHttpPost<T = SuccessResponse>(
  url: string,
  data: Record<string, unknown>
) {
  const r = new Request(url, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
      "X-Requested-With": "XMLHttpRequest",
    },
    body: JSON.stringify(data),
  });
  return asyncHttp<T>(r);
}
