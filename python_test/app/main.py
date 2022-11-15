from fastapi import FastAPI
from .Models import make_conn
from .routes import users, auth

make_conn()


app = FastAPI()

app.include_router(users.router)
app.include_router(auth.router)
