from datetime import datetime
from os import getenv, path
from typing import Optional as OptionalT

from pony.orm import Database, LongStr, Optional, PrimaryKey, Required, Set
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
    sys_admin: OptionalT[int]
    max_cpu: int


class Mzn_instance(db.Entity):
    id = PrimaryKey(int, auto=True)
    user = Required(User)
    friendly_name = Optional(str)
    runs = Set("Run")
    contents = Optional(LongStr)


class Mzn_instanceT_slim(BaseModel):
    id: int
    user: int
    friendly_name: str
    contents: None | str


class Mzn_instanceT(Mzn_instanceT_slim):
    runs: list[int]


class Dzn_instance(db.Entity):
    id = PrimaryKey(int, auto=True)
    user = Required(User)
    friendly_name = Optional(str)
    runs = Set("Run")
    contents = Optional(LongStr)


class Dzn_instanceT_slim(BaseModel):
    id: int
    user: int
    friendly_name: str
    contents: None | str


class Dzn_instanceT(Dzn_instanceT_slim):
    runs: list[int]


class Run_status(db.Entity):
    SUBMITTED = 1
    RUNNING = 2
    TERMINATED_USER = 3
    TERMINATED_ADMIN = 4
    DONE = 5
    EXCEPTION = 6

    id = PrimaryKey(int, auto=True)
    name = Required(str)
    runs = Set("Run")


class Run_statusT(BaseModel):
    id: int
    name: str


class Run(db.Entity):
    id = PrimaryKey(int, auto=True)
    user = Required(User)
    submit_time = Required(datetime, default=datetime.now)
    start_time = Optional(datetime)
    end_time = Optional(datetime)
    execution_time = Optional(int)
    result = Optional(str, nullable=True)
    mzn_status = Optional(str, nullable=True)
    solvers = Set("Solver")
    mzn_instance = Required(Mzn_instance)
    dzn_instance = Optional(Dzn_instance)
    status = Required("Run_status")

    def get_resp_type(self):
        """Converts this Run into a valid response for the API

        Returns:
            RunT: The run
        """
        run = self.to_dict(with_collections=True, with_lazy=True, related_objects=True)
        run["user"] = run["user"].id
        run["mzn_instance"] = run["mzn_instance"].to_dict()
        run["dzn_instance"] = (
            None if not run["dzn_instance"] else run["dzn_instance"].to_dict()
        )
        run["solvers"] = [s.to_dict() for s in run["solvers"]]
        run["status"] = run["status"].to_dict()
        return run


class RunT(BaseModel):
    id: int
    user: int
    submit_time: datetime
    start_time: OptionalT[datetime]
    end_time: OptionalT[datetime]
    result: OptionalT[str]
    mzn_status: OptionalT[str]
    execution_time: OptionalT[int]
    solvers: list["SolverT"]
    mzn_instance: "Mzn_instanceT_slim"
    dzn_instance: OptionalT["Dzn_instanceT_slim"]
    status: "Run_statusT"


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


class SuccessT(BaseModel):
    success: bool


UserT.update_forward_refs()
Mzn_instanceT.update_forward_refs()
Dzn_instanceT.update_forward_refs()
Sys_AdminT.update_forward_refs()
RunT.update_forward_refs()
SolverT.update_forward_refs()


class DBHandler(object):
    """
    A simple singleton class that makes sure that only one connection to the database is ever initialised.
    """

    def __new__(cls):
        if not hasattr(cls, "instance"):
            cls.instance = super(DBHandler, cls).__new__(cls)
            cls.instance.bound = False
        return cls.instance

    def make_conn(self):
        if not self.bound:
            db.bind(
                provider="mysql",
                host=getenv("DB_HOST"),
                user=getenv("DB_USER"),
                passwd=getenv("DB_PASS"),
                database=getenv("DB_NAME"),
            )
            db.generate_mapping(create_tables=True)
            self.bound = True

    def make_test_conn(self):
        if not self.bound:
            db.bind(
                provider="sqlite",
                filename=f"{path.dirname(__file__)}/db.sqlite",
                create_db=True,
            )
            db.generate_mapping(create_tables=True)
            self.bound = True
