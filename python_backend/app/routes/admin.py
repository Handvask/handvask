from fastapi import APIRouter, Body, Depends, HTTPException
from pony.orm import commit, db_session, select

from ..middleware.auth import get_current_user_id
from ..Models import SuccessT, Sys_admin, User

router = APIRouter(
    prefix="/admin",
    tags=["Admin"],
    responses={
        404: {"Description": "Not found"},
        401: {"Description": "Access denied"},
    },
)


@router.post("/user_quota", response_model=SuccessT)
@db_session
def update_quota(
    user_id: str = Body(""),
    max_cpu: str = Body(""),
    curr_user_id: int = Depends(get_current_user_id),
):
    """Update the number of cpu allowed to the user

    Args:
        max_cpu (str): The number of cpu
        user_id (str): The user_id of the target user

    Raises:
        HTTPException: User not found
        HTTPException: Not authorized

    Returns:
        dict: A success flag in a dictionary
    """

    if not bool(User[curr_user_id].sys_admin):
        raise HTTPException(status_code=401, detail="Access denied")
    try:
        user = User[int(user_id)]
    except:
        raise HTTPException(status_code=404, detail=f"User {user_id} not found")

    user.max_cpu = int(max_cpu)

    return {"success": True}


@router.post("/user_permission/{user_id}", response_model=SuccessT)
@db_session
def update_permission(user_id: int, curr_user_id: int = Depends(get_current_user_id)):
    """Update the permission of the user

    Args:
        user_id (int): The user_id of the target user

    Raises:
        HTTPException: User not found
        HTTPException: Not authorized

    Returns:
        dict: A success flag in a dictionary
    """
    if not bool(User[curr_user_id].sys_admin):
        raise HTTPException(status_code=401, detail="Access denied")
    try:
        user = User[user_id]
    except:
        raise HTTPException(status_code=404, detail=f"User {user_id} not found")

    is_admin = select(u for u in Sys_admin if u.user == user).first()
    if bool(is_admin):
        is_admin.delete()
    else:
        Sys_admin(user=user_id)
        commit()

    return {"success": True}
