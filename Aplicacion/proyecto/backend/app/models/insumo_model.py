# backend/app/models/insumo_model.py
from app.db_connection import get_db_connection

def insertar_insumo(nombre_insumo, nombre_unidad, nombre_condiciones, nombre_subcategoria):
    conn = get_db_connection()
    if not conn:
        return {"error": "No se pudo conectar a la base de datos"}

    try:
        with conn.cursor() as cursor:
            sql = """
            INSERT INTO insumo (nombre_insumo, cod_unidad, cod_condiciones, cod_subcategoria)
            VALUES
            (
                %s,  -- Nombre del insumo
                (SELECT um.cod_unidad FROM unidad_medidad um WHERE um.nombre_unidad = %s),
                (SELECT c.cod_condiciones FROM condiciones c WHERE c.nombre_condiciones = %s),
                (SELECT s.cod_subcategoria FROM subcategoria s WHERE s.nombre_subcategoria = %s)
            );
            """
            # Ejecutar la consulta SQL
            cursor.execute(sql, (nombre_insumo, nombre_unidad, nombre_condiciones, nombre_subcategoria))
            conn.commit()
            return {"message": "Insumo agregado correctamente"}
    except Exception as e:
        return {"error": str(e)}
    finally:
        conn.close()  # Cerrar la conexión siempre
