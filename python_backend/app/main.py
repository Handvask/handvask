from os import getenv
from os.path import dirname

from dotenv import load_dotenv
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from .Models import make_conn
from .routes import auth, instances, users

load_dotenv(dirname(__file__) + "/../.env")

origins = [getenv("HANDVASK_FRONTEND_ORIGIN")]

if __name__ == "__main__":
    make_conn()


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


@app.get("/")
def root():
    return {"message": "Hello From Handvask Backend!"}
