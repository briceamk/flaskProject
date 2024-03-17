from flask import Flask, jsonify, request


def create_app(config):
    app = Flask(__name__)
    app.config.from_object("config")
    app.config["TESTING"] = config.get("TESTING")

    @app.route('/')
    def hello_world():  # put application's code here
        return 'Hello World!'

    @app.route('/employees', methods=['GET'])
    def get_employees():
        employees = [
            {'id': 1, 'name': 'Ashley'},
            {'id': 2, 'name': 'Kate'},
            {'id': 3, 'name': 'Joe'}
        ]
        return jsonify(employees)

    return app


app = create_app({"TESTING": False})
if __name__ == '__main__':
    app.run()
