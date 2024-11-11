# backend/app/views/home_view.py
from flask import Blueprint, jsonify

home_bp = Blueprint('home', __name__)

@home_bp.route('/')
def home():
    # Devolver un diccionario como JSON
    return jsonify({"message": "La conexión es correcta :D"})
