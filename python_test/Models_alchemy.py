from datetime import datetime
from typing import Optional

from sqlalchemy import Column, ForeignKey, String, Table
from sqlalchemy.dialects.mysql import LONGTEXT
from sqlalchemy.orm import DeclarativeBase, Mapped, mapped_column, relationship


class Base(DeclarativeBase):
    pass


class Mzn_instance(Base):
    __tablename__ = "mzn_instances"

    id: Mapped[int] = mapped_column(primary_key=True)
    user_id: Mapped[int] = mapped_column(ForeignKey("users.id"))


class Dzn_instance(Base):
    __tablename__ = "dzn_instances"

    id: Mapped[int] = mapped_column(primary_key=True)
    user_id: Mapped[int] = mapped_column(ForeignKey("users.id"))


class Solver(Base):
    __tablename__ = "solvers"

    id: Mapped[int] = mapped_column(primary_key=True)
    name: Mapped[str] = mapped_column(String(30))
    flag: Mapped[str] = mapped_column(String(30))


run_many_to_many_solver = Table(
    "run_many_to_many_solver",
    Base.metadata,
    Column("run_id", ForeignKey("runs.id")),
    Column("solver_id", ForeignKey("solvers.id")),
)


class Run(Base):
    __tablename__ = "runs"

    id: Mapped[int] = mapped_column(primary_key=True)
    user_id: Mapped[int] = mapped_column(ForeignKey("users.id"))
    start_time: Mapped[datetime] = mapped_column(default=lambda: datetime.now())
    end_time: Mapped[Optional[datetime]] = mapped_column(default=None)
    result: Mapped[Optional[str]] = mapped_column(
        String(255).with_variant(LONGTEXT(), "mysql"), default=None
    )
    solvers: Mapped[list[Solver]] = relationship(secondary=run_many_to_many_solver)


class Sys_admin(Base):
    __tablename__ = "sys_adminds"

    id: Mapped[int] = mapped_column(primary_key=True)
    user_id: Mapped[int] = mapped_column(ForeignKey("users.id"))


class User(Base):
    __tablename__ = "users"

    id: Mapped[int] = mapped_column(primary_key=True)
    username: Mapped[str] = mapped_column(String(30))
    password: Mapped[str] = mapped_column(String(64))
    dzn_instances: Mapped[list[Dzn_instance]] = relationship()
    mzn_instances: Mapped[list[Mzn_instance]] = relationship()
    runs: Mapped[list[Run]] = relationship()
    sys_admin: Mapped[Sys_admin] = relationship()
    max_cpu: Mapped[int] = mapped_column(default=6)


if __name__ == "__main__":
    import pymysql
    from sqlalchemy import create_engine

    engine = create_engine(
        "mysql+mysqldb://test_user:1234@192.168.1.120/test", echo=True
    )

    print(Base.metadata.create_all(engine))
