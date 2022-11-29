import { HomeSubpageBasePropT } from ".";

export default function Runs({ user }: HomeSubpageBasePropT) {
  return (
    <h1 className="display-5 text-center fw-bold mb-5">
      Welcome {user?.username}!
    </h1>
  );
}
