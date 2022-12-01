// Add bootstrap
import "bootstrap/dist/css/bootstrap.css";

// Add fontawesome
import "@fortawesome/fontawesome-svg-core/styles.css";

import "../styles/globals.css";
import type { AppProps } from "next/app";
import Head from "next/head";
import { useEffect } from "react";

export default function App({ Component, pageProps }: AppProps) {
  // Only load bootstrap js on client side
  useEffect(() => {
    require("bootstrap/dist/js/bootstrap.bundle.min.js");
  }, []);

  return (
    <>
      <Head>
        <meta
          name="viewport"
          content="width=device-width, initial-scale=1"
        ></meta>
      </Head>
      <Component {...pageProps} />
    </>
  );
}
