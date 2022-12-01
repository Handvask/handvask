from typing import List

from fastapi import APIRouter, Body, Depends, HTTPException, Query
from pony.orm import db_session, commit

from ..middleware.auth import get_current_user_id
from ..Models import Mzn_instance, Mzn_instanceT, SuccessT

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
    instance = Mzn_instance(user=user_id, contents=contents)
    commit()  # Save the instance so we can get the ID
    instance.friendly_name = f"mzn_{instance.id}"
    return instance.to_dict(with_collections=True, with_lazy=True)
