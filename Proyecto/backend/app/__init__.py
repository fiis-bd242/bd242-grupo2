from flask import Flask, request
from .routes import router
from flask_cors import CORS

def create_app():
    app = Flask(__name__)
    app.config.from_object("app.config.Config")
    app.register_blueprint(router)

    # Permitir solicitudes desde dos orígenes
    CORS(app, resources={r"/*": {"origins": ["https://bd242-grupo2-1.onrender.com", "http://localhost:5000"]}})

    # Middleware para agregar encabezados CORS manualmente (por si acaso)
    @app.after_request
    def after_request(response):
        response.headers['Access-Control-Allow-Origin'] = 'https://bd242-grupo2-1.onrender.com, http://localhost:5000'
        response.headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
        response.headers['Access-Control-Allow-Headers'] = 'Content-Type, Authorization'
        return response

    return app