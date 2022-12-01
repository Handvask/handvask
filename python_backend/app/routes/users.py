from fastapi import APIRouter, Depends
from pony.orm import db_session

from ..middleware.auth import get_current_user_id
from ..Models import User, UserT

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
