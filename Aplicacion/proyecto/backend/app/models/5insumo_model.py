from ..extensions import get_db_connection

def insert_insumo(nombre_insumo, nombre_unidad, nombre_condiciones, nombre_categoriainsumo, nombre_subcategoria):
    query = """
    INSERT INTO insumo (nombre_insumo, cod_unidad, cod_condiciones, cod_categoriainsumo, cod_subcategoria)
    VALUES (
        %s,
        (SELECT um.cod_unidad FROM unidad_medidad um WHERE um.nombre_unidad = %s),
        (SELECT c.cod_condiciones FROM condiciones c WHERE c.nombre_condiciones = %s),
        (SELECT ci.cod_categoriainsumo FROM categoria_insumo ci WHERE ci.nombre_categoriainsumo = %s),
        (SELECT s.cod_subcategoria FROM subcategoria s WHERE s.nombre_subcategoria = %s)
    ) RETURNING cod_insumo;
    """
    
    conn = get_db_connection()
    cur = conn.cursor()

    cur.execute(query, (nombre_insumo, nombre_unidad, nombre_condiciones, nombre_categoriainsumo, nombre_subcategoria))
    new_cod_insumo = cur.fetchone()[0]  # Obtener el código del nuevo insumo

    conn.commit()
    cur.close()
    conn.close()

    return new_cod_insumo
