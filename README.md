<h1 style="text-align: center;">Handvask minizinc - A microservice of the Handvask project</h1>

<img
    style="display: block; 
           margin-left: auto;
           margin-right: auto;
           width: 30%;"
    src="images/favicon.ico"
    alt="Our logo">
</img>

This project aims to create a system that can solve optimization
problems in the cloud. Users should be able to submit an optimization problem to
be solved, select one or more solvers to use to solve it in parallel and get the answer using the solver that returns a solution first.

## Website

The website can be found at [Handvask](https://handvask.tech).

# How to run the project

If you want to run the project locally, you will have to do the following:

1. First create .env files in the following directories:

   execute the local-run.sh script in the root directory of the project. This will create the .env files for you.
   This file should be provided in the hand-in or the discord channel.

```bash
chmod +x local_run.sh
./local_run.sh
```

if these are not created, the project will not run. Env for the cloud is much more sophisticated, I'll try to explain how to run the cloud version later.

## Backend

Starting the backend

The backend is a [FastAPI](https://fastapi.tiangolo.com/) application. To start it, run:

Stay in the handvask directory (the home directory for the repository) and run the following commands:

1. If .env is not created create a file called `~/python_backend/.env` and add the following content, The content of these files is secret, so you will have to ask someone to get them. They will either be provided in the hand-in or the discord channel:

   1. export DB_HOST="127.0.0.1"
   2. export DB_USER="username"
   3. export DB_PASS="password"
   4. export DB_NAME="database"
   5. export HANDVASK_FRONTEND_ORIGIN="\*"
   6. export MZN_API_KEY="1234"
   7. export MZN_MN_HOST="http://localhost:8383"

2. Run the following commands:

```bash
source /python_backend/.env
sudo apt install mysql-server
pip3 install -r requirements.txt
uvicorn python_backend.app.main:app --reload
```

3. [localhost_backend](http://localhost:8080/docs) here you can see the API documentation.

4. If you rather want to run the backend in a docker container, run the following commands:

```bash
cd python_backend
docker compose build
docker compose up
```

5. Running the backend in the cloud is already done, so you don't have to do anything. If you would like to Integrate a new version and deploy it, all you will have to do is make a change and push it to the GitHub main branch. GitHub workflow will then integrate and then deploy the new version to the cloud.

## Starting the frontend

The frontend is a [React](https://reactjs.org/) and [Next](https://nextjs.org/) application. To start it, run:

Go to the directory `/handvask_frontend` and run:

```bash
npm install
npm next build
npx next start
```

If it doesn't work, try npx next dev.
This will start the frontend on port 3000.

## Starting the minizinc.

First, you'll have to go into the directory /minizinc and run the following commands:
```bash
docker compose build
```
This will build the two images needed for the minizinc.
After that, you'll need to have minikube running. If you don't have minikube installed, you can find it here: [minikube](https://minikube.sigs.k8s.io/docs/start/).<br />
If minikube is not running, run the following command:
```bash
minikube start
```
After minikube has started, run the following command:
```bash  
minikube load image handvask-minizinc-image && 
minikube load image handvask-minizinc-solver-image
```
These two commands make the images available to the minikube cluster.
If this is not done the deployment will not work.
```bash
kubectl apply -f k8s/ 
&& 
minikube tunnel
```
This will spawn the deployment, the clusterrole, clusterrolebinding, and the service.<br/>
Let the minikube tunnel run in the background, you might have to put in your password for it to be running.
Just wait for it to prompt the "enter your password" message.

# Demo

You can either go to the [Handvask](http://127.0.0.1:3000),
or you can go to the [FastAPI](http://localhost:8080/docs) to see the API documentation.


## Deploy pipeline

The deploy pipeline is done using GitHub actions. The pipeline is triggered when a change is pushed to the main branch. The pipeline will then build the docker images for the backend and the frontend. It will then push the images to the docker hub. The pipeline will then deploy the images to the cloud.

The pipeline is split into four workflows

1. Pull-request 

Whether a local branch change is done, the responsible person for the branch creates a pull request to the main branch. The pull request will then be reviewed by the responsible person for the main branch.
The pull request will also trigger the pipeline to run. It will build the docker images for which where changes were made.<br/>
If only changes were made in the handvask_frontend, the pipeline will catch this in:

```yaml
      - name: Control if changes in handvask_frontend been made
        uses: dorny/paths-filter@v2
        id: changes
        with:
          filters: |
            backend:
              - 'handvask_frontend/**'
```
This is to ensure that we dont use unnecessary resources and make the pull request faster.
If the build doesn't fail, the pull request will be review by a member of the group and then merged to the main branch.

2. Integration

Next up whenever a pull-request is approved and merge into main branch, the integration workflow will run. This workflow will build the docker images for the frontend and the backend. It will then push the images to the docker hub. The images will then be deployed to the cloud.

The integration part have the same constraint just as above, if we dont see any changes in the handvask_frontend, the pipeline will not build the image for the frontend, but if we do see changes, it will build the image for the frontend.
The integration in yaml format is in the file .github/workflows/frontend_CI-CD.yml<br/>
The integration part is the second block of the image called frontend image build.

![Handvask CI/CD for Frontend](images/Udklip_af_CI_og_CD.JPG)

3. Deploy

The deploy workflow needs the CI part of the pipeline to finish. The deploy workflow will then deploy the images to the cloud. The deploy workflow is in the file .github/workflows/frontend_CI-CD.yml


## How does the application work overview?

The application is split into three parts, the frontend, the backend, and the minizinc.
The frontend is the part that the user interacts with. The backend is the part that handles the communication between the frontend and the minizinc.
The minizinc is the part that handles the solving of the optimization problems.

What happens when a user submits a problem to be solved?

1. The user submits the problem to the frontend.
2. The frontend sends the problem to the backend.
3. The backend sends the problem to the minizinc.
4. The minizinc starts a job with the specified problem and the solver sends from the backend,
which the backend received from the frontend. It will start a job for every solver specified.
5. When a solver has found a solution, the minizinc sends the result back to the backend.
Whether it is the optimal solution or not.
6. The frontend will then request updated information from the backend.

## How does the application work in detail?

<!-- // TODO -->

