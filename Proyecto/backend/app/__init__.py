from flask import Flask
from .routes import router


def create_app():
    app = Flask(__name__)
    app.config.from_object("app.config.Config")
    app.register_blueprint(router)
    return app
