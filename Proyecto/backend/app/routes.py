from flask import Blueprint, jsonify, request
from .models import get_all_empleados, create_empleado, update_empleado, get_all_insumos, get_all_condiciones, get_all_unidades,get_local_empleado, get_ordencompra_mismodia

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
    

@router.route("/condicion", methods=["GET"])
def get_condicion():
    try:
        condiciones = get_all_condiciones()
        return jsonify(condiciones), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    

@router.route("/unidad", methods=["GET"])
def get_unidad():
    try:
        unidades = get_all_unidades()
        return jsonify(unidades), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    



@router.route("/ordencompra/<int:codigo_empleado>", methods=["GET"])
def get_ordencompra_mismodia_route(codigo_empleado):
    try:
        # Llamamos a la función que obtiene las órdenes de compra para el mismo día
        print(f"Buscando órdenes de compra para el empleado con código: {codigo_empleado}")
        ordenes = get_ordencompra_mismodia(codigo_empleado)

        # Depurar si no se encuentran órdenes
        if not ordenes:
            return jsonify({"message": "No se encontraron órdenes de compra para hoy"}), 404

        # Convertimos las filas en una lista de diccionarios
        ordenes_response = [
            {
                "cod_ordencompra": orden['cod_ordencompra'],  # Accedemos por las claves del diccionario
                "nombre_empresa": orden['nombre_empresa'],
                "nombre_proceso": orden['nombre_proceso']
            }
            for orden in ordenes
        ]
        
        # Si hay órdenes de compra, las devolvemos
        return jsonify(ordenes_response), 200

    except ValueError as ve:
        # Capturamos errores esperados (como empleado no asignado a un local)
        print(f"Error esperado: {ve}")  # Para depuración
        return jsonify({"error": str(ve)}), 400
    except Exception as e:
        # Si ocurre un error inesperado, lo manejamos y devolvemos un mensaje de error genérico
        print(f"Error inesperado: {e}")  # Para depuración
        return jsonify({"error": "Ocurrió un error en el servidor: " + str(e)}), 500
