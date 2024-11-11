# backend/app/__init__.py
from flask import Flask
from flask_cors import CORS
from app.config import Config
from app.views.insumo_view import insumo_bp
from app.views.home_view import home_bp

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    # Habilitar CORS para todas las rutas
    CORS(app)

    # Registrar blueprints
    app.register_blueprint(insumo_bp)
    app.register_blueprint(home_bp)

    return app
