from datetime import datetime

from pony.orm import *

db = Database()


class User(db.Entity):
    id = PrimaryKey(int, auto=True)
    username = Required(str)
    password = Required(str)
    dzn_instances = Set("Dzn_instance")
    mzn_instances = Set("Mzn_instance")
    runs = Set("Run")
    sys_admin = Optional("Sys_admin")
    max_cpu = Optional(int, default=6, unsigned=True)


class Mzn_instance(db.Entity):
    id = PrimaryKey(int, auto=True)
    user_id = Required(User)


class Dzn_instance(db.Entity):
    id = PrimaryKey(int, auto=True)
    user_id = Required(User)


class Run(db.Entity):
    id = PrimaryKey(int, auto=True)
    user_id = Required(User)
    start_time = Required(datetime, default=lambda: datetime.now())
    end_time = Optional(datetime)
    result = Optional(str, nullable=True)
    solvers = Set("Solver")


class Sys_admin(db.Entity):
    id = PrimaryKey(int, auto=True)
    user_id = Required(User)


class Solver(db.Entity):
    id = PrimaryKey(int, auto=True)
    name = Optional(str)
    runs = Set(Run)
