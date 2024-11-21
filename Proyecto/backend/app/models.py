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


## Obtener codigo de local de empleado
def get_local_empleado(codigo_empleado):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("select e.cod_local from empleado e where e.codigo_empleado = %s", (codigo_empleado, ))
        local = cursor.fetchone()
        if local:
            return local[0]
        else:
            return {"error": "No existe empleado con ese código"}
    finally:
        cursor.close()
        conn.close()

## Obtener órdenes de compra que deberían llegar ese mismo día
def get_ordencompra_mismodia():
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        cursor.execute("""
            select oc.cod_ordencompra ,p.nombre_empresa, pi2.nombre_proceso from orden_compra oc 
            inner join proveedor p on p.cod_proveedor = oc.cod_proveedor 
            inner join proceso_ingreso pi2 on pi2.cod_proceso = oc.cod_proceso 
            inner join empleado e on e.codigo_empleado = oc.codigo_empleado 
            where oc.fecha_requeridaentrega = current_date
            order by pi2.cod_proceso asc;
        """)
        return cursor.fetchall()
    finally:
        cursor.close()
        conn.close()