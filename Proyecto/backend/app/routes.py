from flask import Blueprint, jsonify, request
from .models import get_all_empleados, create_empleado, update_empleado, get_all_insumos

router = Blueprint("router", __name__)


# Ruta para obtener todos los empleados
@router.route("/empleados", methods=["GET"])
def get_empleados():
    try:
        empleados = get_all_empleados()
        return jsonify(empleados), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# Ruta para crear un empleado
@router.route("/empleados", methods=["POST"])
def add_empleado():
    data = request.json
    nombre = data.get("nombre")
    email = data.get("email")
    salario = data.get("salario")

    if not nombre or not email or not salario:
        return jsonify({"error": "Faltan datos"}), 400

    try:
        empleado_id = create_empleado(nombre, email, salario)
        return jsonify({"id": empleado_id, "message": "Empleado creado"}), 201
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# Ruta para actualizar un empleado
@router.route("/empleados/<int:id>", methods=["PUT"])
def edit_empleado(id):
    data = request.json
    nombre = data.get("nombre")
    email = data.get("email")
    salario = data.get("salario")

    if not nombre or not email or not salario:
        return jsonify({"error": "Faltan datos"}), 400

    try:
        filas_afectadas = update_empleado(id, nombre, email, salario)
        if filas_afectadas == 0:
            return jsonify({"error": "Empleado no encontrado"}), 404
        return jsonify({"message": "Empleado actualizado"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# Módulo 5 (Gestión de Inventario)
@router.route("/insumo", methods=["GET"])
def get_insumo():
    try:
        insumo = get_all_insumos()
        return jsonify(insumo), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500