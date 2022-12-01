from typing import List

from fastapi import APIRouter, Body, Depends, HTTPException, Query
from pony.orm import commit, db_session

from ..middleware.auth import get_current_user_id
from ..Models import Dzn_instance, Dzn_instanceT, Mzn_instance, Mzn_instanceT, SuccessT

router = APIRouter(
    prefix="/instances",
    tags=["Instances"],
    responses={
        404: {"Description": "Not found"},
        401: {"Description": "Access denied"},
    },
)


@router.get("/mzn", response_model=List[Mzn_instanceT])
@db_session
def get_mzn(
    instance_ids: List[int] = Query(None), user_id: int = Depends(get_current_user_id)
):
    """Fetches mzn instances from the database given a list of IDs

    Args:
        instance_ids (List[int], optional): A list of instance ids
        user_id (int, optional): The user_id of the currently logged in user

    Raises:
        HTTPException: Instance not found
        HTTPException: Access denied

    Returns:
        List[Mzn_InstanceT]: A list of mzn instances
    """
    res = []
    for i in instance_ids:
        try:
            instance = Mzn_instance[i]
        except:
            raise HTTPException(status_code=404, detail=f"Instance {i} not found")
        if instance.user.id != user_id:
            raise HTTPException(status_code=401, detail="Access denied")
        res.append(instance.to_dict(with_collections=True, with_lazy=True))
    return res


@router.post("/mzn/{instance_id}", response_model=SuccessT)
@db_session
def update_mzn(
    instance_id: int,
    contents: str = Body(""),
    friendly_name: str = Body(""),
    user_id: int = Depends(get_current_user_id),
):
    """Updates an existing mzn instance

    Args:
        instance_id (int): The instance to update
        contents (str, optional): The new contents of the instance.
        friendly_name (str, optional): The new name of the instance
        user_id (int, optional): The user_id of the currently logged in user

    Raises:
        HTTPException: Instance not found
        HTTPException: Access denied

    Returns:
        dict: A success flag in a dictionary
    """
    try:
        instance = Mzn_instance[instance_id]
    except:
        raise HTTPException(status_code=404, detail=f"Instance {instance_id} not found")
    if instance.user.id != user_id:
        raise HTTPException(status_code=401, detail="Access denied")

    instance.contents = contents
    instance.friendly_name = friendly_name
    return {"success": True}


@router.post("/create_mzn", response_model=Mzn_instanceT)
@db_session
def create_mzn(contents: str = Body(""), user_id: int = Depends(get_current_user_id)):
    """Creates a new mzn instance in the database

    Args:
        contents (str, optional): The initial contents of the of the mzn instance
        user_id (int, optional): The user_id of the currently logged in user

    Returns:
        Mzn_InstanceT: The created instance
    """
    instance = Mzn_instance(user=user_id, contents=contents)
    commit()  # Save the instance so we can get the ID
    instance.friendly_name = f"mzn_{instance.id}"
    return instance.to_dict(with_collections=True, with_lazy=True)


# region Dzn
@router.get("/dzn", response_model=List[Dzn_instanceT])
@db_session
def get_dzn(
    instance_ids: List[int] = Query(None), user_id: int = Depends(get_current_user_id)
):
    """Fetches dzn instances from the database given a list of IDs

    Args:
        instance_ids (List[int], optional): A list of instance ids
        user_id (int, optional): The user_id of the currently logged in user

    Raises:
        HTTPException: Instance not found
        HTTPException: Access denied

    Returns:
        List[Dzn_InstanceT]: A list of dzn instances
    """
    res = []
    for i in instance_ids:
        try:
            instance = Dzn_instance[i]
        except:
            raise HTTPException(status_code=404, detail=f"Instance {i} not found")
        if instance.user.id != user_id:
            raise HTTPException(status_code=401, detail="Access denied")
        res.append(instance.to_dict(with_collections=True, with_lazy=True))
    return res


@router.post("/dzn/{instance_id}", response_model=SuccessT)
@db_session
def update_dzn(
    instance_id: int,
    contents: str = Body(""),
    friendly_name: str = Body(""),
    user_id: int = Depends(get_current_user_id),
):
    """Updates an existing dzn instance

    Args:
        instance_id (int): The instance to update
        contents (str, optional): The new contents of the instance.
        friendly_name (str, optional): The new name of the instance
        user_id (int, optional): The user_id of the currently logged in user

    Raises:
        HTTPException: Instance not found
        HTTPException: Access denied

    Returns:
        dict: A success flag in a dictionary
    """
    try:
        instance = Dzn_instance[instance_id]
    except:
        raise HTTPException(status_code=404, detail=f"Instance {instance_id} not found")
    if instance.user.id != user_id:
        raise HTTPException(status_code=401, detail="Access denied")

    instance.contents = contents
    instance.friendly_name = friendly_name
    return {"success": True}


@router.post("/create_dzn", response_model=Dzn_instanceT)
@db_session
def create_dzn(contents: str = Body(""), user_id: int = Depends(get_current_user_id)):
    """Creates a new dzn instance in the database

    Args:
        contents (str, optional): The initial contents of the of the dzn instance
        user_id (int, optional): The user_id of the currently logged in user

    Returns:
        Dzn_InstanceT: The created instance
    """
    instance = Dzn_instance(user=user_id, contents=contents)
    commit()  # Save the instance so we can get the ID
    instance.friendly_name = f"dzn_{instance.id}"
    return instance.to_dict(with_collections=True, with_lazy=True)
