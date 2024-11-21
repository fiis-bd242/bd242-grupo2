from flask import Blueprint, jsonify, request
from .models import get_all_empleados, create_empleado, update_empleado, get_all_insumos, get_all_condiciones, get_all_unidades,get_local_empleado, get_ordencompra_mismodia, ver_contenido_orden_compra, get_empleado_supervisor, insertar_revision, actualizar_proceso_orden_a_2, obtener_detalles_revision

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

#Ruta para ver contenido de orden de compra
@router.route("/contenido/<int:cod_orden>", methods=["GET"])
def contenido_orden_compra(cod_orden):
    try:
        # Llamar a la función que obtiene el contenido de la orden de compra
        contenido = ver_contenido_orden_compra(cod_orden)
        
        if not contenido:
            return jsonify({"error": "Orden de compra no encontrada"}), 404
        
        # Estructurar la respuesta
        return jsonify({"contenido": contenido}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    

#Ruta para ver los empleados que pueden ser supervisores
@router.route("/asignacion/<int:cod_empleado>", methods=["GET"])
def asignacion_empleado(cod_empleado):
    try:
        # Llamamos a la función que obtiene la asignación del empleado
        contenido = get_empleado_supervisor(cod_empleado)

        # Si no se encuentra contenido, devolvemos un error 404
        if not contenido:
            return jsonify({"error": "Empleado no encontrado o no tiene la asignación correspondiente"}), 404
        
        # Estructuramos la respuesta
        return jsonify({"empleado": contenido}), 200

    except Exception as e:
        # Si ocurre un error inesperado, lo manejamos y devolvemos un mensaje de error genérico
        return jsonify({"error": "Ocurrió un error en el servidor: " + str(e)}), 500
    

## Ruta para la creación de supervisiones
@router.route("/revision/<int:cod_ordencompra>", methods=["POST"])
def crear_revision(cod_ordencompra):
    try:
        # Obtén los datos enviados en la solicitud (suponemos que vienen como JSON)
        data = request.json
        cod_supcantidad = data.get("cod_supcantidad")
        cod_supcalidad = data.get("cod_supcalidad")

        # Verificamos que los datos necesarios estén presentes
        if cod_supcantidad is None or cod_supcalidad is None:
            return jsonify({"error": "Faltan datos en la solicitud"}), 400

        # Llamamos a la función para insertar la revisión
        response, status_code = insertar_revision(cod_ordencompra, cod_supcantidad, cod_supcalidad)
        
        return jsonify(response), status_code

    except Exception as e:
        return jsonify({"error": "Ocurrió un error en el servidor: " + str(e)}), 500


# Ruta para actualizar el proceso de una orden de compra a 2
@router.route("/ordencompra/<int:cod_ordencompra>/proceso2", methods=["PUT"])
def actualizar_proceso_a_2(cod_ordencompra):
    try:
        # Llamar a la función que actualiza el proceso a 2
        filas_afectadas = actualizar_proceso_orden_a_2(cod_ordencompra)

        # Si no se encuentra la orden, devolver un error
        if filas_afectadas == 0:
            return jsonify({"error": "Orden de compra no encontrada"}), 404

        # Respuesta exitosa
        return jsonify({"message": "Proceso de orden de compra actualizado a 2 exitosamente"}), 200
    except Exception as e:
        # Manejo de errores
        return jsonify({"error": f"Error del servidor: {str(e)}"}), 500


# Ruta para ver las revisiones hechas a los insumos
# Ruta para obtener los detalles de una orden de compra
@router.route("/ordencompra/<int:cod_ordencompra>/detalles", methods=["GET"])
def obtener_detalles(cod_ordencompra):
    try:
        # Llamamos a la función para obtener los detalles de la orden de compra
        detalles = obtener_detalles_revision(cod_ordencompra)
        
        # Si no se encuentra la orden, devolver un error 404
        if not detalles:
            return jsonify({"error": "Detalles de la orden de compra no encontrados"}), 404
        
        # Devolver la respuesta con los detalles de la orden
        return jsonify({"detalles": detalles}), 200  # Corrección aquí
        
    except Exception as e:
        # Si ocurre un error, devolvemos un mensaje de error
        return jsonify({"error": f"Error del servidor: {str(e)}"}), 500

