from typing import List

from fastapi import APIRouter, Depends, HTTPException
from pony.orm import db_session, select

from ..middleware.auth import get_current_user_id
from ..Models import SuccessT, User, UserT, RunT

router = APIRouter(
    prefix="/users", tags=["Users"], responses={404: {"Description": "Not found"}}
)


@router.get("/get", response_model=UserT)
@db_session
def get_self_user(user_id: int = Depends(get_current_user_id)):
    """Fetches data on the currently logged in user

    Args:
        user_id (int, optional): The user_id of the currently logged in user

    Returns:
        UserT: The user object
    """
    user = User[user_id]
    return user.to_dict(with_collections=True)


class Admin_all_user_T(UserT):
    runs: List[RunT]


@router.get("/getall", response_model=List[Admin_all_user_T])
@db_session
def get_all_users(user_id: int = Depends(get_current_user_id)):
    """Fetches all users

    Args:
        user_id (int, optional): The user_id of the currently logged in user

    Returns:
        List[UserT]: The user objects
    """
    if not bool(User[user_id].sys_admin):
        raise HTTPException(status_code=401, detail="Access denied")
    users = select(user for user in User)
    output = []
    for user in users:
        tmp = user.to_dict(with_collections=True)
        tmp["runs"] = [run.get_resp_type() for run in user.runs]
        output.append(tmp)
    return output


@router.post("/delete_user/{user_id}", response_model=SuccessT)
@db_session
def delete_user(
    user_id: int,
    admin_id: int = Depends(get_current_user_id),
):
    """deletes an existing user

    Args:
        user_id (int): The instance to delete
        admin_id (int, optional): The user_id of the currently logged in user

    Raises:
        HTTPException: User not found
        HTTPException: Access denied

    Returns:
        dict: A success flag in a dictionary
    """
    if not bool(User[admin_id].sys_admin):
        raise HTTPException(status_code=401, detail="Access denied")
    try:
        user = User[user_id]
    except:
        raise HTTPException(status_code=404, detail=f"User {user_id} not found")

    user.delete()
    return {"success": True}
