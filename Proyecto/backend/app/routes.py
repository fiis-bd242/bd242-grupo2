from flask import Blueprint, jsonify, request
from .models import get_all_empleados, create_empleado, update_empleado, meseros_disponibles,autenticar_mesero,mesa_disponible,idm_actual,primer_registro_pedido,mostrar_categorias,get_all_mesas,dp_actual,boton_categoria,insert_item_pedido,summary

import logging


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





# MODULO 2

# AUTENTICACION DE MESERO
@router.route("/modulo2/autenticacion_mesero", methods=["POST"])
def autenticar_meseros():
    try:
        meseros_allow = meseros_disponibles()
        data_user = request.json
        cod_empleado = data_user.get('codigo_empleado')
        if cod_empleado in meseros_allow:
            autenticar_mesero(cod_empleado)
            return jsonify({"message": "Autenticación exitosa"}), 200  # Respuesta válida
        else:
            return jsonify({"error": "Empleado no permitido"}), 400  # Error si el empleado no está     permitido
    except Exception as e:
        return jsonify({"error": str(e)}), 500
    

# ASIGNACION DE MESA _ ELIMINA
@router.route("/modulo2/asignacion_mesa/<int:num_mesa>", methods=["GET"])
def mesas(num_mesa):
    try:
        mesas = mesa_disponible(num_mesa)
        print(mesas[0].get('disp_mesa')) # Valor de 0
        return mesas
        
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# VER TODAS LAS MESAS
@router.route("/modulo2/registrando_pedido", methods=["GET"])
def mostrar_mesas():
    try:
        mesas = get_all_mesas()
        return mesas
        
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# ASIGNACION DE MESA
@router.route("/modulo2/registrando_pedido/mesa", methods=["POST"])
def primer_registro_pedido_mesa():
    try:
        num_mesa = request.json
        num_mesa = num_mesa.get('cod_mesa')
        print(f"Recibido cod_mesa: {num_mesa}")
        mesas = mesa_disponible(num_mesa)
        cod_idm = idm_actual()
        cod_idm = cod_idm[0].get('cod_im_actual')  # COD_IDM_ACTUAL
        bool_mesa = mesas[0].get('disp_mesa')  # Valor de 0: DISPONIBLE
        print(f"Estado de mesa: {bool_mesa}")
        
        if bool_mesa == 0:
            cod_estado_dp = 'RE'
            primer_registro_pedido(cod_estado_dp, cod_idm, num_mesa)
            return jsonify({"message": "Detalle Pedido registrado"}), 200
        else:
            return jsonify({"error": "Mesa no disponible"}), 400

    except Exception as e:
        print(f"Error en la asignación de la mesa: {str(e)}")
        return jsonify({"error": str(e)}), 500

# MOSTRANDO CATEGORIAS
@router.route("/modulo2/registrando_pedido/categorias", methods=["GET"])
def categorias_friday():
    try:
        categories = mostrar_categorias()
        return jsonify(categories), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500


# CLICK EN ALGUNA CATEOGORIA
@router.route("/modulo2/registrando_pedido/categorias/<string:cod_categoria>/", methods=["GET"])
def seleccionando_items(cod_categoria):
    try:
        productos_friday = boton_categoria(cod_categoria)
        return jsonify(productos_friday), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# REGISTRANDO ITEMS DEL PEDIDO
@router.route("/modulo2/registrando_pedido/categorias/<string:cod_categoria>/items_pedido", methods=["POST"])
def items_pedido(cod_categoria):
    try:
        data_user = request.json
        productosFridays = data_user.get('productos', [])
        cod_dp = dp_actual()
        cod_dp = cod_dp[0].get('cod_dp')
        cod_dp = int(cod_dp)-1
        cod_dp = f"DP{cod_dp}"

        for producto in productosFridays:
            Cod_prodFriday = producto.get('Cod_prodFriday')
            cantidad = producto.get('cantidad')

            # Verificar que los datos son correctos
            if Cod_prodFriday and cantidad is not None and cantidad > 0:
                insert_item_pedido(Cod_prodFriday, cantidad, cod_dp)
            else:
                return jsonify({"error": "Faltan datos para un producto o cantidad inválida"}), 400

        return jsonify({"message": f"Items de {cod_categoria} registrados correctamente"}), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# CLICK EN ALGUNA CATEOGORIA
@router.route("/modulo2/registrando_pedido/summary", methods=["GET"])
def mostrar_summary():
    try:
        data_user = request.json
        cod_dp = data_user.get('cod_dp')
        productos_friday = summary(cod_dp)
        return jsonify(productos_friday), 200
    except Exception as e:
        return jsonify({"error": str(e)}), 500