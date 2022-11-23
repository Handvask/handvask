from datetime import datetime
from os.path import dirname

import jwt
from bcrypt import checkpw, gensalt, hashpw
from fastapi import APIRouter, Depends, Form, HTTPException
from fastapi.security import OAuth2PasswordBearer, OAuth2PasswordRequestForm
from pony.orm import db_session, select

from ..Models import SuccessT, User


# Util
def hash_password(passwd: str) -> str:
    return hashpw(passwd, gensalt())


router = APIRouter(
    prefix="/auth", tags=["Auth"], responses={404: {"Description": "Not found"}}
)


@router.post("/register", response_model=SuccessT)
@db_session
def register_user(username: str = Form(), password: str = Form()):
    # Check if user already exists
    existing_user = select(u for u in User if u.username == username)[:]
    if len(existing_user) != 0:
        raise HTTPException(status_code=400, detail="Username already exists")
    if len(password.strip()) == 0:
        raise HTTPException(status_code=400, detail="Password not set")

    User(
        username=username,
        password=hash_password(password.encode("utf-8")).decode("utf-8"),
    )
    return {"success": True}


class LoginRespT(SuccessT):
    access_token: str | None
    token_type: str | None
oauth2_scheme = OAuth2PasswordBearer(tokenUrl="auth/login")
@router.post("/login", response_model=LoginRespT)
@db_session()
def login(form_data: OAuth2PasswordRequestForm = Depends()):
    user = select(u for u in User if u.username == form_data.username)[:]
    if len(user) == 0:
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    user: User = user[0]
    if not checkpw(form_data.password.encode("utf-8"), user.password.encode("utf-8")):
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    with open(f"{dirname(__file__)}/../../jwtRS256.key", "r") as f:
        token = jwt.encode(
            {
                "user_id": user.id,
                "is_sys_admin": True if user.sys_admin else False,
                "exp": datetime.now().timestamp() + 86400,
            },
            f.read(),
            algorithm="RS256",
        )
        return {"success": True, "access_token": token, "token_type": "bearer"}

    # Some kind of error occoured
    return {"success": False, "access_token": None, "token_type": None}

@router.post("/createMzn", response_model=Mzn_instanceT)
@db_session
def createMznInstance(form_mzn: Mzn_instanceT = Depends()):
    Mzn_instance(
        name=form_mzn.name,
        description=form_mzn.description,
        mzn=form_mzn.mzn,
        dzn=form_mzn.dzn,
        user_id=form_mzn.user_id,
    )
    return {"success": True}
