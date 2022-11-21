# Handvask minizinc - A microservice of the Handvask project

The aim of this project is to create a system that is able to solve optimization
problems in the cloud. A users should be able to submit an optimization problem to
be solved, select one or more solvers to use to solve it in parallel,
and get the answer using the solver that return a solution first.



## How to run the project

### env files and the database
The database is already running in the cloud, and the information is posted in the discord channel.
just follow the env file, and you should be good to go.

###
 Starting the backend

The backend is a [FastAPI](https://fastapi.tiangolo.com/) application. To start it, run:

Go to the directory `/python_backend` and run:
```bash
sudo apt install mysql-server
pip3 install -r requirements.txt
uvicorn main:app --reload
```
This will start the backend on port 8000.
There might be problem, if there is just follow the error codes, and do not 
build docker image. It's not necessary atm.

### Starting the frontend
The frontend is a [React](https://reactjs.org/) and [Next](https://nextjs.org/) application. To start it, run:

Go to the directory `/handvask_frontend` and run:
```bash
npm install
npm run dev
```
If it doesn't work, try npx next dev.
This will start the frontend on port 3000.

### Demo
You can either go to the [Handvask](http://127.0.0.1:3000),
or you can go to the [FastAPI](http://localhost:8000/docs) to see the API documentation.

## The deadlines
The deadlines can be found in the github.com/handvask/wiki.
I would encourage you to read the wiki, and the project.md file again and then come with suggestion
with what you can do until the next deadline. 

If you hit problem with the problem you want to fix, please post it in the discord channel,
and we will try to help you.