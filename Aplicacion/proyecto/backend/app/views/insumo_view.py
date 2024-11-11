# backend/app/views/insumo_view.py
from flask import Blueprint, request, jsonify
from app.controllers.insumo_controller import agregar_insumo_controller

insumo_bp = Blueprint('insumo', __name__)

@insumo_bp.route('/api/agregar_insumo', methods=['POST'])
def agregar_insumo():
    data = request.get_json()

    # Obtener los datos del cuerpo de la solicitud
    nombre_insumo = data.get('nombre_insumo')
    nombre_unidad = data.get('nombre_unidad')
    nombre_condiciones = data.get('nombre_condiciones')
    nombre_subcategoria = data.get('nombre_subcategoria')

    # Validar que todos los datos estén presentes
    if not all([nombre_insumo, nombre_unidad, nombre_condiciones, nombre_subcategoria]):
        return jsonify({"error": "Faltan datos para insertar el insumo"}), 400

    # Llamar al controlador para procesar la solicitud
    resultado = agregar_insumo_controller(nombre_insumo, nombre_unidad, nombre_condiciones, nombre_subcategoria)

    # Devolver la respuesta en formato JSON
    if "error" in resultado:
        return jsonify(resultado), 500
    return jsonify(resultado), 201
