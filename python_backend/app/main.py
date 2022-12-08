from os import getenv
from os.path import dirname

from dotenv import load_dotenv
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from .Models import DBHandler
from .routes import auth, instances, runs, solvers, users

load_dotenv(dirname(__file__) + "/../.env")

origins = [getenv("HANDVASK_FRONTEND_ORIGIN")]

dbh = DBHandler()
dbh.make_conn()
dbh.make_conn()


app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


app.include_router(users.router)
app.include_router(auth.router)
app.include_router(instances.router)
app.include_router(runs.router)
app.include_router(solvers.router)


@app.get("/")
def root():
    return {"message": "Hello From Morten Skal i Seng!"}
