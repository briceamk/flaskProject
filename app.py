from flask import Flask


def create_app(config):
    app = Flask(__name__)
    app.config.from_object("config")
    app.config["TESTING"] = config.get("TESTING")

    @app.route('/index')
    def hello_world():  # put application's code here
        return 'Hello World!'

    return app


app = create_app({"TESTING": False})
if __name__ == '__main__':
    app.run()
