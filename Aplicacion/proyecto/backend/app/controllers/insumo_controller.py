# backend/app/controllers/insumo_controller.py
from app.models.insumo_model import insertar_insumo

def agregar_insumo_controller(nombre_insumo, nombre_unidad, nombre_condiciones, nombre_subcategoria):
    # Llama al modelo para insertar el insumo
    resultado = insertar_insumo(nombre_insumo, nombre_unidad, nombre_condiciones, nombre_subcategoria)
    return resultado
