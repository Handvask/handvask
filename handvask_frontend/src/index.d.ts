type User = {
  id: number;
  username: string;
  dzn_instances: number[];
  mzn_instances: number[];
  runs: number[];
  sys_admin: {
    id: number;
    user: string;
  };
  max_cpu: number;
};

type MznInstance = {
  id: number;
  user: number;
  friendly_name: string;
  contents: string | null;
};
