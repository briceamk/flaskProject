import pytest

from app import create_app


@pytest.fixture
def client():
    app = create_app({"TESTING": True})
    with app.test_client() as client:
        yield client


def test_should_status_code_ok(client):
    response = client.get('/')
    assert response.status_code == 200


def test_should_return_hello_world(client):
    response = client.get('/')
    assert response.data.decode() == 'Hello World!'
    assert response.status_code == 200


def test_should_return_employees(client):
    response = client.get('/employees')
    assert len(response.json) == 3
