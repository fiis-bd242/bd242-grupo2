from .db import get_db_connection
import psycopg2.extras
import psycopg2


def get_all_empleados():
    conn = get_db_connection()
    cursor = conn.cursor(
        cursor_factory=psycopg2.extras.DictCursor
    )  # Cambia el cursor a DictCursor
    try:
        cursor.execute("SELECT * FROM empleado;")
        return [
            dict(row) for row in cursor.fetchall()
        ]  # Convierte a lista de diccionarios
    finally:
        cursor.close()
        conn.close()


# Insertar un nuevo empleado
def create_empleado(nombre, email, salario):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "INSERT INTO empleados (nombre, email, salario) VALUES (%s, %s, %s) RETURNING id;",
            (nombre, email, salario),
        )
        conn.commit()
        return cursor.fetchone()["id"]
    finally:
        cursor.close()
        conn.close()


# Actualizar un empleado
def update_empleado(id, nombre, email, salario):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "UPDATE empleados SET nombre = %s, email = %s, salario = %s WHERE id = %s;",
            (nombre, email, salario, id),
        )
        conn.commit()
        return cursor.rowcount
    finally:
        cursor.close()
        conn.close()





# MODULO 2

# AUTENTICACION DE MESERO
def meseros_disponibles():
    conn = get_db_connection()
    cursor = conn.cursor()
    consulta_permitidos = """
            select re.Codigo_empleado codigos_permitidos
            from Registra re
            INNER JOIN Asistencia asis
            on re.cod_asistencia = asis.cod_asistencia
            INNER JOIN empleado e
            on re.Codigo_empleado = e.Codigo_empleado and e.cod_cargo = '7'
            where asis.fecha = '2023-06-28' and asis.cod_estado in (1)
            """
    try:
        cursor.execute(consulta_permitidos)
        meseros_allow = cursor.fetchall()
        array_meseros = []
        for row in meseros_allow:
            cod = row.get('codigos_permitidos')
            array_meseros.append(cod)

        return array_meseros
    except Exception as e:
        print(f"Error ejecutando consulta {e}")
    finally:
        cursor.close()
        conn.close()

def autenticar_mesero(codigo_empleado):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "INSERT INTO IDENTIFICACION_MESERO(Codigo_empleado) VALUES (%s)",
            (codigo_empleado,),
        )
        conn.commit()
    finally:
        cursor.close()
        conn.close()



# VER TODAS LAS MESAS 
def get_all_mesas():
    conn = get_db_connection()
    cursor = conn.cursor()
    consulta = """
            select cod_mesa
            from DISPONIBILIDAD_MESA
            WHERE DISPONIBILIDAD = 'NO DISPONIBLE'
                """
    try:
        cursor.execute(consulta)
        resultado_select = cursor.fetchall()
        return resultado_select
    finally:
        cursor.close()
        conn.close()

# VERIFICAR DISPONIBILIDAD DE MESA
def mesa_disponible(num_mesa):
    conn = get_db_connection()
    cursor = conn.cursor()
    consulta_mesas = """
            SELECT COUNT(*) DISP_MESA
            FROM DISPONIBILIDAD_MESA
            WHERE cod_mesa = %s and DISPONIBILIDAD = 'NO DISPONIBLE'
                """
    try:
        cursor.execute(consulta_mesas,(str(num_mesa),))
        resultado_select = cursor.fetchall()
        return resultado_select
    finally:
        cursor.close()
        conn.close()

# ASIGNACION DE MESA
def primer_registro_pedido(cod_estado_dp,cod_im,cod_mesa):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "INSERT INTO DETALLE_PEDIDO (cod_estado_dp,cod_im, cod_mesa) VALUES (%s, %s, %s);",
            (cod_estado_dp,cod_im,str(cod_mesa)),
        )
        conn.commit()
    finally:
        cursor.close()
        conn.close()


# CAPTURANDO IDM_ACTUAL
def idm_actual():
    conn = get_db_connection()
    cursor = conn.cursor()
    consulta_im_actual = """
            select MAX(cod_im) cod_im_actual
            from identificacion_mesero
                """
    try:
        cursor.execute(consulta_im_actual)
        resultado_select = cursor.fetchall()
        return resultado_select
    finally:
        cursor.close()
        conn.close()

def dp_actual():
    conn = get_db_connection()
    cursor = conn.cursor()
    consulta = """
            select index_dp() cod_dp
                """
    try:
        cursor.execute(consulta)
        resultado_select = cursor.fetchall()
        return resultado_select
    finally:
        cursor.close()
        conn.close()


# MOSTRANDO LAS CATEGORIAS DE LOS PRODUCTOS
def mostrar_categorias():
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("SELECT * FROM Categoria")
        return cursor.fetchall()
    finally:
        cursor.close()
        conn.close()

# CLICK EN ALGUNA CATEGORÍA
def boton_categoria(cod_categoria):
    conn = get_db_connection()
    cursor = conn.cursor()
    consulta = """
            SELECT cod_prodfriday,nombre_producto
            FROM Producto_Friday
            WHERE cod_categoria = %s
                """
    try:
        cursor.execute(consulta,(str(cod_categoria),))
        resultado_select = cursor.fetchall()
        return resultado_select
    finally:
        cursor.close()
        conn.close()

# REGISTRANDO ITEMS DEL PEDIDO
def insert_item_pedido(Cod_prodFriday, cantidad, cod_dp):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "INSERT INTO ITEM_DETALLE_PEDIDO (Cod_prodFriday, cantidad, cod_estado_item_dp, cod_dp) VALUES (%s, %s,'EP', %s);",
            (Cod_prodFriday,cantidad,str(cod_dp)),
        )
        conn.commit()
    finally:
        cursor.close()
        conn.close()

# MOSTRANDO SUMMARY
def summary(cod_dp):
    conn = get_db_connection()
    cursor = conn.cursor()
    consulta = """
            SELECT idp.cod_item_dp, idp.cod_dp,pf.nombre_producto , 
            idp.cantidad , idp.precio, dp.cod_im,dp.cod_mesa num_mesa,
            e.primer_apellido || ' ' || SUBSTRING(e.segundo_apellido FROM 1 FOR 1) || '. ' || 
            e.primer_nombre mesero, 
            SUM(idp.precio) OVER (PARTITION BY idp.cod_dp) AS TOTAL
            --  Suma de precios de todas las filas que contengan el mismo "cod_dp"
            FROM ITEM_DETALLE_PEDIDO idp
            LEFT JOIN Producto_Friday pf
            on idp.cod_prodfriday = pf.cod_prodfriday
            LEFT JOIN DETALLE_PEDIDO dp
            on dp.cod_dp = idp.cod_dp
            LEFT JOIN IDENTIFICACION_MESERO im 
            ON dp.cod_im = im.cod_im
            LEFT JOIN Empleado e 
            ON im.Codigo_empleado = e.Codigo_empleado
            WHERE idp.cod_dp = %s
                """
    try:
        cursor.execute(consulta,(cod_dp,))
        resultado_select = cursor.fetchall()
        return resultado_select
    finally:
        cursor.close()
        conn.close()
