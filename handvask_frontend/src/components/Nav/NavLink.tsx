import Link from "next/link";
import { useRouter } from "next/router";
import React from "react";

type NavLinkPropT = {
  children: React.ReactNode;
  className: string;
  href: string;
};

export default function NavLink({ children, className, href }: NavLinkPropT) {
  const router = useRouter();
  return (
    <Link
      href={href}
      className={`${className} ${router.pathname == href ? "active" : ""}`}
      {...(router.pathname == href ? { "aria-current": "page" } : {})}
    >
      {children}
    </Link>
  );
}
