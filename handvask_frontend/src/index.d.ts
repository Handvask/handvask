type User = {
  id: number;
  username: string;
  dzn_instances: number[];
  mzn_instances: number[];
  runs: number[];
  sys_admin: {
    id: number;
    user: string;
  } | null;
  max_cpu: number;
};

type MznInstance = {
  id: number;
  user: number;
  friendly_name: string;
  contents: string | null;
};

type DznInstance = {
  id: number;
  user: number;
  friendly_name: string;
  contents: string | null;
};

type Solver = {
  id: number;
  name: string;
};

type Run = {
  id: number;
  user: number;
  submit_time: string;
  start_time: string;
  end_time: string;
  result: string;
  solvers: Solver[];
  mzn_instance: Omit<MznInstance, "runs">;
  dzn_instance: Omit<DznInstance, "runs">;
  status: {
    id: 1 | 2 | 3 | 4 | 5 | 6;
    name: string;
  };
  execution_time: string;
  mzn_status: string;
};

type bootstrapColours =
  | "primary"
  | "secondary"
  | "success"
  | "danger"
  | "warning"
  | "info"
  | "light"
  | "dark";
