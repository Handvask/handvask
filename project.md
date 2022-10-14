The aim of this project is to create a system that is able to solve optimization
problems in the cloud. A users should be able to submit an optimization problem to
be solved, select one or more solvers to use to solve it in parallel,
and get the answer using the solver that return a solution first.

The optimization problems are expected to be defined using the [MiniZinc
language](http://www.minizinc.org/). The MiniZinc language is a defacto standard
(no need to study it if you have not seen it, you just have to use it) and when
you have a problem defined in MiniZinc there are plenty of solver that can be
chosen to solve the problem. Clearly, every solver comes with some peculiarities
and they have different performance (see for example the solver used in the
[MiniZinc challenge](https://www.minizinc.org/challenge.html)).

In the MiniZinc language, problems are usually specified in two files:

- a model file with extension .mzn (mandatory)
- a data file with extension .dzn (optional)
  Examples of problems are available at https://github.com/MiniZinc/minizinc-examples

It is possible to assume that the solvers, and the problems submitted by the
users satisfy the [rules of the MiniZinc
challenge](https://www.minizinc.org/challenge2022/rules2022.html).
In particular you can assume that the options
that the solver support are:

- "--output-objective" to include in the output a variable \_objective that contains
  the value of the metric;
- "--output-mode json" to print every solution in JSON;
- "-p <n>" to use n processors in parallel;
- "-a" to output all solutions/intermediate solutions.

The output is a text presenting a sequence of solutions that are increasing better.
Ten consecutive minus signs mark the end of a solution: "----------". When the
solvers has finish and prove that the last solution is the optimal one, it will
print 10 consecutive equal symbols "==========".

For example, you can invoke the solver Chuffed
(one of the default solvers of the [MiniZincIDE](https://www.minizinc.org/))
on the problem gfd-schedule (one of the problems of the MiniZinc challenge available at
[https://www.minizinc.org/challenge2022/mznc2022_probs.tar.gz](https://www.minizinc.org/challenge2022/mznc2022_probs.tar.gz)) as follows:

```
minizinc \
  --solver chuffed \
  --output-objective \
  --output-mode json \
  -p 2 \
  gfd-schedule2.mzn \
  n55f2d50m30k3_10124.dzn
```

The output will look like the following

```
...
{
  "assignedGroup" : [1, 1, ...],
  ...
  "nGroups" : 10,
  "deadLinePenalty" : 0,
  "objective" : 10,
  "_objective" : 10
}
----------
{
  "assignedGroup" : [1, 1, 35, ...],
  ...
  "nGroups" : 9,
  "deadLinePenalty" : 0,
  "objective" : 9,
  "_objective" : 9
}
----------
==========
```

The assignment requires the implementation of the following tasks.

By using a programmatic RESTful API the user should be able to:

- create its own profile that can be access with a username and password
- Create, read, update and delete a .mzn instance
- Create, read, update and delete a .dzn instance
- list the name of the solvers supported
- trigger the execution of one or more solvers (to be executed in a concurrent way)
  giving the id of the mzn and dzn instances (only mzn if dzn is not needed),
  selecting the solvers to use and their options,
  the timeout, maximal amount of memory that can be used, number of vCPUs to use.
  When the first solver terminates finding the optimal value, all the other solver in parallel
  must be terminated
- monitor the termination state of the solver execution returning if one of the
  solvers have found the optimum, if a solution has been found but the solvers are
  still trying to prove the optimality (i.e., no "==========" in the solution) or
  if the solvers are running but they did not even found a solution
  (i.e., no "----------" in the solution)
- given a computaton request, retrieve its result if terminated, what solver
  manage to solve it first and the time it took to solve it
- cancel the execution of a computation request (terminate all the solvers
  running for the request, delete the result otherwise)
- stop a solver for a specific request (e.g., if a request required to use solver
  A and B, you can stop to execute solver A letting B to continue)
- minimal GUI support

The administrator of the framework should be able to:

- monitor and log the platform using a dashboard
- kill all solver executions started by a user
- set resources quota to users (e.g., no more than 6 vCPUs in total for user X)
- delete a user and all his/her data
- deploy the system and add new computing nodes in an easy way
- add or remove a solver. It is possible to assume that the solver to add
  satisfy the submission rules of the MiniZinc challenge (note also that you have to handle
  the case when a users asks to use a removed solver)

A user should have a maximal predefined amount of computational resources that
he or she can use (e.g., 6 vCPUs). When this threashold is passed, requests
should be serialized instead of all running in parallel. If the maximal amount
of computational resources will not allow to execute a request (e.g., asking to
solve a problem with 7 different solvers in prallel when he or she can use only
6 vCPUs) then the request should not be accepted.

The developer of the systems have to:

- Use continuous integration and deployment
- Infrastructure as a Code with an automatic DevOps pipeline
- scalable, supporting multiple users exploiting if needed more resources in the
  cloud (note: vcpus allocated to a run depending on the parameter "-p")
- have tests to test the system (unit test, integration, ...)
- security (proper credential management and common standard security practices
  enforced)
- provide user stories to explain how the system is intended to be use
- provide minimal documentation to deploy and run the system
- fairness: if the resources do not allow to run all the solvers at the same time
  the jobs should be delayed and executed fairly (e.g. FIFO).
  User should therefore not wait indefinitely to run their jobs (optional).

Notes:

- the possibility to deploy on multi-clouds and avoid vendor lock-in is a plus
  (maybe https://cloud.sdu.dk/ can be used: it is "free" but is limited w.r.t.
  commercial cloud solutions)
- a proper team organization and team work management are a plus
