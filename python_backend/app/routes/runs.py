from typing import List, Optional

from fastapi import APIRouter, Body, Depends, HTTPException, Query
from pony.orm import commit, db_session, select

from ..middleware.auth import get_current_user_id
from ..Models import SuccessT, User, Dzn_instance, Mzn_instance


router = APIRouter(
    prefix="/runs",
    tags=["Runs"],
    responses={
        404: {"Description": "Not found"},
        401: {"Description": "Access denied"},
    },
)


@router.post("/create", response_model=SuccessT)
@db_session
def create_run(
    user_id: int = Depends(get_current_user_id),
    mzn: int = Body(),
    dzn: Optional[int] = Body(...),
):
    print(user_id, mzn, dzn)
