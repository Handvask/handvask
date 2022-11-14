from fastapi import FastAPI, HTTPException
from Models import make_conn, UserT, User
from pony.orm import db_session, select

app = FastAPI()

make_conn()


@app.get("/")
def root():
    return "Hello, World"


@app.get("/users/{user_id}", response_model=UserT)
@db_session
def get_user(user_id: int):
    user = select(u for u in User if u.id == user_id)[:]
    if len(user) == 0:
        raise HTTPException(status_code=404, detail="User not found")
    user: User = user[0]
    return user.to_dict(with_collections=True)
