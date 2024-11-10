# backend/app/__init__.py

from flask import Flask
from .config import config
from .extensions import get_db, close_db
from .views.main_view import main_bp

def create_app():
    app = Flask(__name__)
    app.config.from_object(config)

    # Cerrar la conexión a la base de datos al finalizar la solicitud
    app.teardown_appcontext(close_db)

    # Registrar el Blueprint
    app.register_blueprint(main_bp)

    return app
