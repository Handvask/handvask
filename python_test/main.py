from Models import User, make_conn
from pony.orm import *


@db_session
def test():
    u = User(username="kaj", password="kodeasd")
    users = select(u for u in User)[:]
    for u in users:
        print(
            f"User[{u.id}]: {u.username} has password {u.password} and max_cpu {u.max_cpu} "
        )


if __name__ == "__main__":
    make_conn()
    test()
