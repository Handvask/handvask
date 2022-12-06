from os.path import dirname

import jwt
from fastapi import Depends, HTTPException

from ..routes.auth import oauth2_scheme

with open(f"{dirname(__file__)}/../../jwtRS256.key.pub", "r") as f:
    public_key = f.read()


def get_bearer_token(token: str = Depends(oauth2_scheme)):
    try:
        unencoded = jwt.decode(token, public_key, algorithms=["RS256"])
    except jwt.exceptions.ExpiredSignatureError:
        raise HTTPException(
            status_code=401,
            detail="Token expired",
            headers={"WWW-Authenticate": "Bearer"},
        )
    return unencoded


def get_current_user_id(unencoded_token: dict = Depends(get_bearer_token)):
    return unencoded_token["user_id"]
