import useUser from "../hooks/useUser";
import Nav from "./Nav";
import PageLoader from "./PageLoader";

type BasePropT = {
  children: React.ReactNode;
};
export default function Base({ children }: BasePropT) {
  const user = useUser();
  return (
    (user && (
      <>
        <Nav user={user}></Nav>
        {children}
      </>
    )) || <PageLoader />
  );
}
