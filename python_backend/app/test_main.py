import os

import pytest
from fastapi.testclient import TestClient
from pony.orm import commit, db_session

from .Models import DBHandler, Solver, Sys_admin, User

dbh = DBHandler()
dbh.make_test_conn()

from .main import app

client = TestClient(app)


@pytest.fixture(scope="session", autouse=True)
def db_conn():
    # Will be executed before the first test

    yield None
    # Will be executed after the last test
    os.system(f"rm {os.path.dirname(__file__)}/db.sqlite")


def test_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello From Handvask Backend!"}


# Auth
# Register


class Test_Register:
    @staticmethod
    def register(username, password):
        response = client.post(
            "/auth/register",
            data={"username": username, "password": password},
        )
        return response

    def test_register_success(self):
        response = self.register("asdf", "asdf")
        assert response.status_code == 200
        assert dict(response.json())["success"] is True

    def test_register_fail_duplicated(self):
        response = self.register("asdf", "asdf")
        assert response.status_code == 400
        assert dict(response.json())["detail"] == "Username already exists"

    def test_register_fail_password(self):
        response = self.register("asdf", "")
        assert response.status_code == 422


# Login


class Test_Login:
    @staticmethod
    def login(username, password):
        response = client.post(
            "/auth/login",
            data={
                "grant_type": "",
                "username": username,
                "password": password,
                "scope": "",
                "client_id": "",
                "client_secret": "",
            },
        )
        return response

    def test_login_success(self):
        response = self.login("asdf", "asdf")
        assert response.status_code == 200
        assert dict(response.json())["token_type"] == "bearer"

    def test_login_fail(self):
        response = self.login("aaaa", "aaaa")
        assert response.status_code == 400
        assert dict(response.json())["detail"] == "Incorrect username or password"


@pytest.fixture
def token():
    authentication = Test_Login()
    response = authentication.login("asdf", "asdf")
    token = dict(response.json())["access_token"]
    return token


# Instances
# Test for MZN


class Test_Create_MZN:
    @staticmethod
    def create_mzn(token):
        access_token = "Bearer " + token
        response = client.post(
            "/instances/create_mzn", headers={"Authorization": access_token}
        )
        return response

    def test_create_success(self, token):
        response = self.create_mzn(token)
        assert response.status_code == 200
        assert dict(response.json())["id"] == 1


class Test_Get_MZN:
    @staticmethod
    def get_mzn(instance_ids, token):
        access_token = "Bearer " + token
        response = client.get(
            "/instances/mzn",
            params={
                "instance_ids": instance_ids,
            },
            headers={"Authorization": access_token},
        )
        return response

    def test_get_mzn_success(self, token):
        response = self.get_mzn(1, token)
        assert response.status_code == 200
        assert dict(response.json()[0])["id"] == 1


class Test_Update_MZN:
    @staticmethod
    def update_mzn(instance_number, contents, friendly_name, token):
        access_token = "Bearer " + token
        url = "/instances/mzn/" + str(instance_number)
        response = client.post(
            url,
            json={"contents": contents, "friendly_name": friendly_name},
            headers={"Authorization": access_token},
        )
        return response

    def test_update_mzn_success(self, token):
        response = self.update_mzn(1, "update_test", "", token)
        assert response.status_code == 200
        assert dict(response.json())["success"] is True

    def test_update_mzn_fail(self, token):
        response = self.update_mzn(2, "update_test", "", token)
        assert response.status_code == 404


class Test_Delete_MZN:
    @staticmethod
    def delete_mzn(instance_number, token):
        access_token = "Bearer " + token
        url = "/instances/delete_mzn/" + str(instance_number)
        response = client.post(url, headers={"Authorization": access_token})
        return response

    def test_delete_mzn_success(self, token):
        response = self.delete_mzn(1, token)
        assert response.status_code == 200
        assert dict(response.json())["success"] is True

    def test_delete_mzn_fail(self, token):
        response = self.delete_mzn(2, token)
        assert response.status_code == 404


# Test for DZN


class Text_Create_DZN:
    @staticmethod
    def create_dzn(token):
        access_token = "Bearer " + token
        response = client.post(
            "/instances/create_dzn", headers={"Authorization": access_token}
        )
        return response

    def test_create_dzn_success(self, token):
        response = self.create_dzn(token)
        assert response.status_code == 200
        assert dict(response.json())["id"] == 1


class Text_Get_DZN:
    @staticmethod
    def get_dzn(instance_ids, token):
        access_token = "Bearer " + token
        response = client.get(
            "/instances/dzn",
            params={
                "instance_ids": instance_ids,
            },
            headers={"Authorization": access_token},
        )
        return response

    def test_get_dzn_success(self, token):
        response = self.get_dzn(1, token)
        assert response.status_code == 200
        assert dict(response.json()[0])["id"] == 1

    def test_get_dzn_fail(self, token):
        response = self.get_dzn(2, token)
        assert response.status_code == 404


class Text_Update_DZN:
    @staticmethod
    def update_dzn(instance_id, contents, friendly_name, token):
        access_token = "Bearer " + token
        url = "/instances/dzn/" + str(instance_id)
        response = client.post(
            url,
            json={"contents": contents, "friendly_name": friendly_name},
            headers={"Authorization": access_token},
        )
        return response

    def test_update_dzn_success(self, token):
        response = self.update_dzn(1, "update_test", "", token)
        assert response.status_code == 200
        assert dict(response.json())["success"] is True

    def test_fail(self, token):
        response = self.update_dzn(2, "update_test", "", token)
        assert response.status_code == 404


class Text_Delete_DZN:
    @staticmethod
    def delete_dzn(instance_number, token):
        access_token = "Bearer " + token
        url = "/instances/delete_dzn/" + str(instance_number)
        response = client.post(url, headers={"Authorization": access_token})
        return response

    def test_delete_dzn_success(self, token):
        response = self.delete_dzn(1, token)
        assert response.status_code == 200
        assert dict(response.json())["success"] is True

    def test_delete_dzn_fail(self, token):
        response = self.delete_dzn(2, token)
        assert response.status_code == 404


# Test for Solvers


class Test_Solvers:
    @staticmethod
    def solvers(token):
        access_token = "Bearer " + token
        response = client.get("/solvers", headers={"Authorization": access_token})
        return response

    @db_session
    def test_solvers_success(self, token):
        Solver(id="1", name="test_solver")
        commit()
        response = self.solvers(token)
        assert response.status_code == 200
        assert dict(response.json()[0])["id"] == 1
        assert dict(response.json()[0])["name"] == "test_solver"


# Test for Users


class Test_Get_UserInfo:
    @staticmethod
    def get_userInfo(token):
        access_token = "Bearer " + token
        response = client.get("/users/get", headers={"Authorization": access_token})
        return response

    def test_get_userInfo_success(self, token):
        response = self.get_userInfo(token)
        assert response.status_code == 200
        assert dict(response.json())["id"] == 1


class Test_Get_All_UserInfo:
    @staticmethod
    def get_all_userInfo(token):
        access_token = "Bearer " + token
        response = client.get("/users/getall", headers={"Authorization": access_token})
        return response

    def test_get_all_userinfo_fail(self, token):
        response = self.get_all_userInfo(token)
        assert response.status_code == 401

    @db_session
    def test_get_all_userinfo_success(self, token):
        Sys_admin(id=1, user=1)
        commit()
        response = self.get_all_userInfo(token)
        assert response.status_code == 200
        assert dict(response.json()[0])["id"] == 1


class Test_Delete_User:
    @staticmethod
    def delete_user(admin_id, user_id, token):
        access_token = "Bearer " + token
        url = "/users/delete_user/" + str(user_id)
        response = client.post(
            url, data={"user_id": admin_id}, headers={"Authorization": access_token}
        )
        return response

    def test_delete_user_fail(self, token):
        response = self.delete_user(1, 2, token)
        assert response.status_code == 404

    @db_session
    def test_delete_user_success(self, token):
        User(username="1234", password="1234")
        commit()
        response = self.delete_user(1, 2, token)
        assert response.status_code == 200
        assert dict(response.json())["success"] is True
