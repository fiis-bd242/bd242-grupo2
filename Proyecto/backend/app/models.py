from .db import get_db_connection


# Obtener todos los empleados
def get_all_empleados():
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("SELECT * FROM empleado;")
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

# Módulo 5 (Inventario)

## Obtener todos los insumos
def get_all_insumos():
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("SELECT * FROM insumo;")
        return cursor.fetchall()
    finally:
        cursor.close()
        conn.close()

## Mostrar condiciones
def get_all_condiciones():
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("select c.nombre_condiciones from condiciones c ;")
        return cursor.fetchall()
    finally:
        cursor.close()
        conn.close()

## Mostrar unidades de medida
def get_all_unidades():
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("select um.nombre_unidad from unidad_medidad um;")
        return cursor.fetchall()
    finally:
        cursor.close()
        conn.close()


def get_local_empleado(codigo_empleado):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute(
            "SELECT e.cod_local FROM empleado e WHERE e.codigo_empleado = %s",
            (codigo_empleado,)
        )
        local = cursor.fetchone()  # Devuelve la primera tupla
        if local and local[0] is not None:  # Si encuentra un valor no nulo
            return int(local)
        else:
            return {"error": "No existe empleado con ese código"}  # Error si no se encuentra
    finally:
        cursor.close()
        conn.close()


## Ver órdenes de compra que deberían llegar el mismo día
def get_ordencompra_mismodia(codigo_empleado):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        local=get_local_empleado(codigo_empleado)
        cursor.execute("""
            select oc.cod_ordencompra ,p.nombre_empresa, pi2.nombre_proceso from orden_compra oc 
            inner join proveedor p on p.cod_proveedor = oc.cod_proveedor 
            inner join proceso_ingreso pi2 on pi2.cod_proceso = oc.cod_proceso 
            inner join empleado e on e.codigo_empleado = oc.codigo_empleado
            where e.cod_local = %s
            and oc.fecha_requeridaentrega = current_date
            order by pi2.cod_proceso asc;
        """, (local, ))
        return cursor.fetchall()
    finally:
        cursor.close()
        conn.close()