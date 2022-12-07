import os

import pytest
from fastapi.testclient import TestClient

from .Models import DBHandler

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

# Register

def test_register_success():
    response = client.post(
        "/auth/register",
        data={
            "username": "asdf", 
            "password": "asdf"
            },
    )
    assert response.status_code == 200
    assert dict(response.json())["success"] == True


def test_register_fail_duplicated():
    response = client.post(
        "/auth/register",
        data={
            "username": "asdf", 
            "password": "asdf"
            },
    )
    assert response.status_code == 400
    assert dict(response.json())["detail"] == "Username already exists"


def test_register_fail_password():
    response = client.post(
        "/auth/register",
        data={
            "username": "asdf", 
            "password": ""
            },
    )
    assert response.status_code == 422

# Login

def login():
    response = client.post(
        "/auth/login",
        data={
            "grant_type": "",
            "username": "asdf",
            "password": "asdf",
            "scope": "",
            "client_id": "",
            "client_secret": "",
        },
    )
    return response

def test_login_success():
    response = login()
    assert response.status_code == 200
    assert dict(response.json())["token_type"] == "bearer"

def test_login_fail():
    response = client.post(
        "/auth/login",
        data={
            "grant_type": "",
            "username": "asdf",
            "password": "aaaa",
            "scope": "",
            "client_id": "",
            "client_secret": "",
        },
    )
    assert response.status_code == 400
    assert dict(response.json())["detail"] == "Incorrect username or password"

@pytest.fixture
def token():
    response = login()
    token = dict(response.json())["access_token"] 
    return token


# Test for MZN

def test_create_mzn(token):
    access_token = "Bearer "+token
    response = client.post(
        "/instances/create_mzn",
        headers={
            "Authorization":access_token
            }
    )
    assert response.status_code == 200
    assert dict(response.json())["id"] == 1

def test_get_mzn(token):
    access_token = "Bearer "+token
    response = client.get(
        "/instances/mzn",
        params={
            "instance_ids":"1",
        },
        headers={
            "Authorization":access_token
            }
    )
    assert response.status_code == 200
    assert dict(response.json()[0])["id"] == 1

def test_update_mzn(token):
    access_token = "Bearer "+token
    response = client.post(
        "/instances/mzn/1",
        json={
            "contents": "update_test",
            "friendly_name": ""
        },
        headers={
            "Authorization":access_token
            }
    )
    assert response.status_code == 200
    assert dict(response.json())["success"] == True

def test_delete_mzn(token):
    access_token = "Bearer "+token
    response = client.post(
        "/instances/delete_mzn/1",
        headers={
            "Authorization":access_token
            }
    )
    assert response.status_code == 200
    assert dict(response.json())["success"] == True


# Test for DZN

def test_create_dzn(token):
    access_token = "Bearer "+token
    response = client.post(
        "/instances/create_dzn",
        headers={
            "Authorization":access_token
            }
    )
    assert response.status_code == 200
    assert dict(response.json())["id"] == 1

def test_get_dzn(token):
    access_token = "Bearer "+token
    response = client.get(
        "/instances/dzn",
        params={
            "instance_ids":"1",
        },
        headers={
            "Authorization":access_token
            }
    )
    assert response.status_code == 200
    assert dict(response.json()[0])["id"] == 1

def test_update_dzn(token):
    access_token = "Bearer "+token
    response = client.post(
        "/instances/dzn/1",
        json={
            "contents": "update_test",
            "friendly_name": ""
        },
        headers={
            "Authorization":access_token
            }
    )
    assert response.status_code == 200
    assert dict(response.json())["success"] == True

def test_delete_dzn(token):
    access_token = "Bearer "+token
    response = client.post(
        "/instances/delete_dzn/1",
        headers={
            "Authorization":access_token
            }
    )
    assert response.status_code == 200
    assert dict(response.json())["success"] == True

