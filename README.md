<h1 style="text-align: center;">Handvask minizinc - A microservice of the Handvask project</h1>

<img
    style="display: block; 
           margin-left: auto;
           margin-right: auto;
           width: 30%;"
    src="./favicon.ico"
    alt="Our logo">
</img>

The aim of this project is to create a system that is able to solve optimization
problems in the cloud. A users should be able to submit an optimization problem to
be solved, select one or more solvers to use to solve it in parallel,
and get the answer using the solver that return a solution first.

## Website

The website can be found at [Handvask](https://handvask.tech).

# How to run the project

If you want to run the project locally, you will have to do the following:

1. First create .env files in the following directories:

   execute the local-run.sh script in the root directory of the project. This will create the .env files for you.
   This file should be provided in the hand-in or in the discord channel.

```bash
chmod +x local_run.sh
./local_run.sh
```

if these are not created, the project will not run. Env for the cloud is much more sophisticated, i'll try to explain how to run the cloud version later.

## Backend

Starting the backend

The backend is a [FastAPI](https://fastapi.tiangolo.com/) application. To start it, run:

Stay in the handvask directory (home directory for the repository) and run the following commands:

1. If .env is not created create a file called `~/python_backend/.env` and add the following content, The content of these files are secret, so you will have to ask someone to get them. They will either be provided in the hand-in or in the discord channel:

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

5. Running the backend in the cloud is allready done, so you don't have to do anything. If you would like to Integrate a new version and deploy, all you will have to do is make a change and push it to the github main branch. Github workflow will then integrate and then deploy the new version to the cloud.

## Starting the frontend

The frontend is a [React](https://reactjs.org/) and [Next](https://nextjs.org/) application. To start it, run:

Go to the directory `/handvask_frontend` and run:

```bash
npm install
npx next start
```

If it doesn't work, try npx next dev.
This will start the frontend on port 3000.

### Demo

You can either go to the [Handvask](http://127.0.0.1:3000),
or you can go to the [FastAPI](http://localhost:8080/docs) to see the API documentation.

## The deadlines

The deadlines can be found in the github.com/handvask/wiki.
I would encourage you to read the wiki, and the project.md file again and then come with suggestion
with what you can do until the next deadline.

If you hit problem with the problem you want to fix, please post it in the discord channel,
and we will try to help you.
