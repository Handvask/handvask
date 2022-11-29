from datetime import datetime
from os import getenv
from typing import Optional as OptionalT

from pony.orm import *
from pydantic import BaseModel

db = Database()


class User(db.Entity):
    id = PrimaryKey(int, auto=True)
    username = Required(str)
    password = Required(str)
    dzn_instances = Set("Dzn_instance")
    mzn_instances = Set("Mzn_instance")
    runs = Set("Run")
    sys_admin = Optional("Sys_admin")
    max_cpu = Required(int, default=6, unsigned=True)

    def to_dict(
        self,
        only=None,
        exclude=None,
        with_collections=False,
        with_lazy=False,
        related_objects=False,
    ):
        exclude = (exclude if exclude else []) + ["password"]
        return super().to_dict(
            only, exclude, with_collections, with_lazy, related_objects
        )


class UserT(BaseModel):
    id: int
    username: str
    dzn_instances: list[int]
    mzn_instances: list[int]
    runs: list[int]
    sys_admin: OptionalT["Sys_AdminT"]
    max_cpu: int


class Mzn_instance(db.Entity):
    id = PrimaryKey(int, auto=True)
    user = Required(User)
    friendly_name = Optional(str)
    runs = Set("Run")


class Mzn_instanceT(BaseModel):
    id: int
    user: "UserT"
    friendly_name: str
    runs: list[int]


class Dzn_instance(db.Entity):
    id = PrimaryKey(int, auto=True)
    user = Required(User)
    friendly_name = Optional(str)
    runs = Set("Run")


class Dzn_instanceT(BaseModel):
    id: int
    user: "UserT"
    friendly_name: str
    runs: list[int]


class Run(db.Entity):
    id = PrimaryKey(int, auto=True)
    user = Required(User)
    start_time = Required(datetime, default=lambda: datetime.now())
    end_time = Optional(datetime)
    result = Optional(str, nullable=True)
    solvers = Set("Solver")
    mzn_instance = Required(Mzn_instance)
    dzn_instance = Optional(Dzn_instance)


class RunT(BaseModel):
    id: int
    user: "UserT"
    start_time: datetime
    end_time: OptionalT[datetime]
    result: OptionalT[str]
    solvers: list[int]
    mzn_instance: "Mzn_instanceT"
    dzn_instance: "Dzn_instanceT"


class Sys_admin(db.Entity):
    id = PrimaryKey(int, auto=True)
    user = Required(User)


class Sys_AdminT(BaseModel):
    id: int
    user: "UserT"


class Solver(db.Entity):
    id = PrimaryKey(int, auto=True)
    name = Optional(str)
    runs = Set(Run)


class SolverT(BaseModel):
    id: int
    name: OptionalT[str]
    runs: list[int]


class SuccessT(BaseModel):
    success: bool


UserT.update_forward_refs()
Mzn_instanceT.update_forward_refs()
Dzn_instanceT.update_forward_refs()
Sys_AdminT.update_forward_refs()
RunT.update_forward_refs()
SolverT.update_forward_refs()


def make_conn():
    print(getenv("DB_HOST"), getenv("DB_USER"), getenv("DB_PASS"), getenv("DB_NAME"))
    db.bind(
        provider="mysql",
        host=getenv("DB_HOST"),
        user=getenv("DB_USER"),
        passwd=getenv("DB_PASS"),
        database=getenv("DB_NAME"),
    )
    db.generate_mapping(create_tables=True)
