<<<<<<< HEAD
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
    """Registers a new user

    Args:
        username (str, optional): The username of the user..
        password (str, optional): The password of the user.

    Raises:
        HTTPException: Username already exists
        HTTPException: Passowrd not set

    Returns:
        dict: A simple dictionary with the property "success": true
    """
    # print([user.to_dict() for user in select(u for u in User)[:]])
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
@db_session
def login(form_data: OAuth2PasswordRequestForm = Depends()):
    """Logs the user in

    Args:
        form_data (OAuth2PasswordRequestForm, optional): The form data,
        has username and password as properties.

    Raises:
        HTTPException: Incorrect username or password

    Returns:
        dict: A dictionary telling if the login attempt was successful, as well as an included
        access token and token_type
    """
    user = select(u for u in User if u.username == form_data.username)[:]
    if len(user) == 0:
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    user: User = user[0]
    if not checkpw(form_data.password.encode("utf-8"), user.password.encode("utf-8")):
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    try:
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
    except:
        pass

    # Some kind of error occoured
    return {"success": False, "access_token": None, "token_type": None}


class Mzn_instanceT(SuccessT):
    name: str


class Dzn_instanceT(SuccessT):
    name: str
=======
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
    """Registers a new user

    Args:
        username (str, optional): The username of the user..
        password (str, optional): The password of the user.

    Raises:
        HTTPException: Username already exists
        HTTPException: Passowrd not set

    Returns:
        dict: A simple dictionary with the property "success": true
    """
    # print([user.to_dict() for user in select(u for u in User)[:]])
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
@db_session
def login(form_data: OAuth2PasswordRequestForm = Depends()):
    """Logs the user in

    Args:
        form_data (OAuth2PasswordRequestForm, optional): The form data,
        has username and password as properties.

    Raises:
        HTTPException: Incorrect username or password

    Returns:
        dict: A dictionary telling if the login attempt was successful, as well as an included
        access token and token_type
    """
    user = select(u for u in User if u.username == form_data.username)[:]
    if len(user) == 0:
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    user: User = user[0]
    if not checkpw(form_data.password.encode("utf-8"), user.password.encode("utf-8")):
        raise HTTPException(status_code=400, detail="Incorrect username or password")
    try:
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
    except:
        pass

    # Some kind of error occoured
    return {"success": False, "access_token": None, "token_type": None}


class Mzn_instanceT(SuccessT):
    name: str


class Dzn_instanceT(SuccessT):
    name: str
>>>>>>> 749ccb08d1ffccb8ddf699f3fe16b88da0b335ed
