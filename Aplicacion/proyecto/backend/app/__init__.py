# backend/app/__init__.py
from flask import Flask
from app.config import Config
from app.views.insumo_view import insumo_bp
from app.views.home_view import home_bp

def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)

    # Registrar blueprints
    app.register_blueprint(insumo_bp)
    app.register_blueprint(home_bp)

    return app
