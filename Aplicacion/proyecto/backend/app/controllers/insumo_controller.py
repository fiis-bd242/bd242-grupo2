from flask import request, jsonify
from ..models import 5insumo_model

def create_insumo():
    # Obtener los datos del request (cuerpo de la solicitud)
    nombre_insumo = request.json.get('nombre_insumo')
    nombre_unidad = request.json.get('nombre_unidad')
    nombre_condiciones = request.json.get('nombre_condiciones')
    nombre_categoriainsumo = request.json.get('nombre_categoriainsumo')
    nombre_subcategoria = request.json.get('nombre_subcategoria')

    # Llamar a la función del modelo para insertar el nuevo insumo
    new_cod_insumo = 5insumo_model.insert_insumo(
        nombre_insumo, nombre_unidad, nombre_condiciones, nombre_categoriainsumo, nombre_subcategoria
    )

    # Retornar el código del nuevo insumo
    return jsonify({'cod_insumo': new_cod_insumo}), 201
