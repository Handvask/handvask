import os

from Models import User, db
from pony.orm import *


@db_session
def test():
    # u = User(username="kaj", password="kodeasd")
    users = select(u for u in User)[:]
    for u in users:
        print(
            f"User[{u.id}]: {u.username} has password {u.password} and max_cpu {u.max_cpu} "
        )


if __name__ == "__main__":
    db.bind(
        provider="mysql",
        host=os.environ["DB_HOST"],
        user=os.environ["DB_USER"],
        passwd=os.environ["DB_PASS"],
        database=os.environ["DB_NAME"],
    )
    db.generate_mapping(create_tables=True)

    test()
