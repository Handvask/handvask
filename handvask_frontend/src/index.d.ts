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

type RunSolver = {
  id: number;
  run: number;
  solver: Solver;
  terminated: boolean;
  progress: string;
};

type Run = {
  id: number;
  user: number;
  submit_time: string;
  start_time: string;
  end_time: string;
  result: string;
  solvers: RunSolver[];
  mzn_instance: Omit<MznInstance, "runs">;
  dzn_instance: Omit<DznInstance, "runs">;
  status: {
    id: 1 | 2 | 3 | 4 | 5 | 6 | 7;
    name: string;
  };
  execution_time: string;
  best_solver: Solver;
  mzn_status: string;
  flag_json: boolean;
  flag_objective: boolean;
  flag_all: boolean;
  flag_processors: boolean;
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
