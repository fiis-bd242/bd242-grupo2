from .db import get_db_connection
import logging

# Obtener todos los empleados
def get_all_empleados():
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("SELECT * FROM empleado")
        return cursor.fetchall()
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
            print(cod)
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
