# backend/app/models/insumo_model.py
from app.db_connection import get_db_connection

def insertar_insumo(nombre_insumo, nombre_unidad, nombre_condiciones, nombre_subcategoria):
    conn = get_db_connection()
    if not conn:
        return {"error": "No se pudo conectar a la base de datos"}

    try:
        with conn.cursor() as cursor:
            sql = """
            INSERT INTO Insumo (Nombre_Insumo, Cod_unidad, Cod_condiciones, Cod_subcategoria)
            VALUES (%s, 
                    (SELECT Cod_unidad FROM Unidad_medidad WHERE Nombre_Unidad = %s),
                    (SELECT Cod_condiciones FROM Condiciones WHERE Nombre_Condiciones = %s),
                    (SELECT Cod_subcategoria FROM Subcategoria WHERE Nombre_Subcategoria = %s)
            );
            """
            cursor.execute(sql, (nombre_insumo, nombre_unidad, nombre_condiciones, nombre_subcategoria))
            conn.commit()
            return {"message": "Insumo agregado correctamente"}
    except Exception as e:
        return {"error": f"Error al agregar insumo: {str(e)}"}  # Mostrar el error completo
    finally:
        conn.close()
