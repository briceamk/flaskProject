import pytest

from app import create_app


@pytest.fixture
def client():
    app = create_app({"TESTING": True})
    with app.test_client() as client:
        yield client


def test_should_status_code_ok(client):
    response = client.get('/index')
    assert response.status_code == 200


def test_should_return_hello_world(client):
    response = client.get('/index')
    assert response.data.decode() == 'Hello World!'
    assert response.status_code == 200
