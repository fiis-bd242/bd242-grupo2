# backend/app/views/main_view.py

from flask import Blueprint

# Crear un Blueprint para las rutas
main_bp = Blueprint("main", __name__)

# Definir una ruta para la página de inicio
@main_bp.route("/", methods=["GET"])
def index():
    return "¡La aplicación Flask está funcionando correctamente desde la carpeta 'views'!", 200
