from fastapi.testclient import TestClient
from .Models import make_test_conn

from .main import app


client = TestClient(app)


make_test_conn()
def test_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello World"}

# Register

def test_register_success():
    response = client.post(
        "/auth/register",
        data={
        "username":"asdf", 
        "password":"asdf"
        },
    )
    assert response.status_code == 200
    assert dict(response.json())["success"] == True

def test_register_fail_duplicated():
    response = client.post(
        "/auth/register",
        data={
        "username":"asdf", 
        "password":"asdf"
        },
    )
    assert response.status_code == 400
    assert dict(response.json())["detail"] == 'Username already exists'

def test_register_fail_password():
    response = client.post(
        "/auth/register",
        data={
        "username":"asdf", 
        "password":""
        },
    )
    assert response.status_code == 422

# Login

def test_login_success():
    response = client.post(
        "/auth/login",
        data={"grant_type":"",
        "username":"asdf", 
        "password":"asdf",
        "scope":"",
        "client_id":"",
        "cleint_secret":""
        },
    )
    assert response.status_code == 200
    assert dict(response.json())["token_type"] == 'bearer'

def test_login_fail():
    response = client.post(
        "/auth/login",
        data={"grant_type":"",
        "username":"asdf", 
        "password":"aaaa",
        "scope":"",
        "client_id":"",
        "cleint_secret":""
        }
    )
    assert response.status_code == 400
    assert dict(response.json())["detail"] == 'Incorrect username or password'



