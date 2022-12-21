# By using a programmatic RESTful API the user should be able to:

- [X] <ins>create its own profile that can be access with a username and password</ins>
    - The `POST /auth/register` endpoint allows the user to create their user, they can decide for themselves which username and password to use
    - The `POST /auth/login` endpoint can be used to log in, if they already have a username and password.
    - _Note that these two endpoints are the only ones that are NOT secured by token based authentication (other than the hello world endpoint `/`)_
- [X] <ins>Create, read, update and delete a .mzn instance</ins>
    - The `GET /instances/mzn` endpoint can be used to request multiple mzn files at once
    - The `POST /instances/mzn/{instance_id}` can be used to modify the name and contents of an owned mzn instance.
    - The `POST /instances/delete_mzn/{instance_id}` can be used to delete owned mzn instances.
    - The `POST /instances/create_mzn` can be used to create a new mzn instance.
- [X] <ins>Create, read, update and delete a .dzn instance</ins>
    - The `GET /instances/dzn` endpoint can be used to request multiple dzn files at once
    - The `POST /instances/dzn/{instance_id}` can be used to modify the name and contents of an owned dzn instance.
    - The `POST /instances/delete_dzn/{instance_id}` can be used to delete owned dzn instances.
    - The `POST /instances/create_dzn` can be used to create a new dzn instance.
- [X] <ins>list the name of the solvers supported</ins>
    - The `GET /solvers` can be used to fetch a list of the supported solvers.
- [X] <ins>trigger the execution of one or more solvers (to be executed in a concurrent way) giving the id of the mzn and dzn instances (only mzn if dzn is not needed), selecting the solvers to use and their options, the timeout, maximal amount of memory that can be used, number of vCPUs to use. When the first solver terminates finding the optimal value, all the other solver in parallel must be terminated</ins>
    - _Since we only completed some of the goals specified in this task, we have split it up here in smaller subtasks._
    - [X] trigger the execution of one or more solvers (to be executed in a concurrent way) giving the id of the mzn and dzn instances (only mzn if dzn is not needed), selecting the solvers to use and their options
        - The `POST /runs/create` endpoint supports this action.
    - [ ] Specifying timeout
        - **Not supported**
    - [ ] Specifying maximum memory
        - **Not supported**
    - [X] When the first solver terminates finding the optimal value, all the other solver in parallel must be terminated.
        - This functionality is automatically handled by our `minizinc-app` service.
- [X] <ins>monitor the termination state of the solver execution returning if one of the solvers have found the optimum, if a solution has been found but the solvers are still trying to prove the optimality (i.e., no "==========" in the solution) or if the solvers are running but they did not even found a solution (i.e., no "----------" in the solution)</ins>
    - The `GET /runs` endpoints allows the user to fetch one or more runs at once, returning all available information on the selected run. This of course includes the current status, intermediary results (if any) as well as final results once it terminates.
- [X] <ins>given a computaton request, retrieve its result if terminated, what solver manage to solve it first and the time it took to solve it</ins>
    - This information is included in the `GET /runs` endpoint.
- [X] <ins>cancel the execution of a computation request (terminate all the solvers running for the request, delete the result otherwise)</ins>
    - This functionality is split into two endpoints. Calling the `POST /runs/delete/{run_id}` endpoint will stop and delete the request, while the `POST /runs/terminate` endpoint will just cancel the execution.
- [X] <ins>stop a solver for a specific request (e.g., if a request required to use solver A and B, you can stop to execute solver A letting B to continue)</ins>
    - The `POST /runs/terminate` endpoint also supports this.
- [X] <ins>minimal GUI support</ins>
    - This is implemented in the form of our Next.JS frontend, currently available publicly on [handvask.tech](https://handvask.tech).


# The administrator of the framework should be able to:

- [ ] <ins>monitor and log the platform using a dashboard</ins>
    - Not supported :(
- [X] <ins>kill all solver executions started by a user</ins>
    - While a bit cumbersome, an administrator can start by fetching all the runs belonging to a user, and then sending individual `POST /runs/terminate` requests for each of them. This can for instance be seen in action on the `admin` page in the frontend, that has a button that does exactly this.
- [X] <ins>set resources quota to users (e.g., no more than 6 vCPUs in total for user X)</ins>
    - The `POST /admin/user_quota/{user_id}` endpoint allows this action.
- [X] <ins>delete a user and all his/her data</ins>
    - The `POST /users/delete_user/{user_id}` endpoint allows this action.
- [X] <ins>deploy the system and add new computing nodes in an easy way</ins>
    - We use auto scaling.
- [ ] <ins>add or remove a solver. It is possible to assume that the solver to add satisfy the submission rules of the MiniZinc challenge (note also that you have to handle the case when a users asks to use a removed solver)</ins>
    - Not supported.
- [ ] <ins>A user should have a maximal predefined amount of computational resources that he or she can use (e.g., 6 vCPUs). When this threashold is passed, requests should be serialized instead of all running in parallel. If the maximal amount of computational resources will not allow to execute a request (e.g., asking to solve a problem with 7 different solvers in prallel when he or she can use only 6 vCPUs) then the request should not be accepted.</ins>
    - _Since we only completed some of the goals specified in this task, we have split it up here in smaller subtasks._
    - [ ] A user should have a maximal predefined amount of computational resources that he or she can use (e.g., 6 vCPUs). When this threashold is passed, requests should be serialized instead of all running in parallel.
    - [X] If the maximal amount of computational resources will not allow to execute a request (e.g., asking to solve a problem with 7 different solvers in prallel when he or she can use only 6 vCPUs) then the request should not be accepted.

# The developer of the systems have to:

- [X] <ins>Use continuous integration and deployment</ins>
    - Github Action
- [X] <ins>Infrastructure as a Code with an automatic DevOps pipeline</ins>
    - Github Action, kubernetes deployment and services yaml specs.
- [X] <ins>scalable, supporting multiple users exploiting if needed more resources in the cloud (note: vcpus allocated to a run depending on the parameter "-p")</ins>
    - Auto scaling in gcloud
- [X] <ins>have tests to test the system (unit test, integration, ...)</ins>
    - Unit testing for backend
    - Integration testing for frontend
    - **NOTE!** There is NO testing for the minizinc services.
- [X] <ins>security (proper credential management and common standard security practices enforced)</ins>
    - Modern standards enforced, such as JWT based authentication, password salting/hashing, `minizinc-app` service and database not publicly accesible.
- [X] <ins>provide user stories to explain how the system is intended to be use</ins>
- [ ] <ins>provide minimal documentation to deploy and run the system</ins>
- [X] <ins>fairness: if the resources do not allow to run all the solvers at the same time the jobs should be delayed and executed fairly (e.g. FIFO). User should therefore not wait indefinitely to run their jobs (optional).</ins>
    - All requests are added as jobs, fairness is handled by the kubernetes cluster