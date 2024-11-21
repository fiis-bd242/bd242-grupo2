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
        local = cursor.fetchone()  # Devuelve la primera fila como un RealDictRow o None
        
        # Verificar si local es None
        if local is None:
            return None  # Si no se encuentra ningún valor, devolver None
        
        # Acceder al valor utilizando la clave 'cod_local' en lugar de un índice
        if 'cod_local' in local and local['cod_local'] is not None:
            return int(local['cod_local'])  # Convertir explícitamente a entero
        else:
            return None  # Si el valor de 'cod_local' es None, devolver None
    finally:
        cursor.close()
        conn.close()






## Ver órdenes de compra que deberían llegar el mismo día
def get_ordencompra_mismodia(codigo_empleado):
    conn = get_db_connection()
    cursor = conn.cursor()
    try:
        # Obtener el local del empleado
        local = get_local_empleado(codigo_empleado)
        if local is None:  # Si no se encuentra el local, devolver un mensaje de error o lanzar una excepción
            raise ValueError("El empleado no tiene un local asignado o no existe.")

        # Consultar órdenes de compra para el mismo día
        cursor.execute("""
            SELECT 
                oc.cod_ordencompra, 
                p.nombre_empresa, 
                pi2.nombre_proceso 
            FROM orden_compra oc
            INNER JOIN proveedor p ON p.cod_proveedor = oc.cod_proveedor
            INNER JOIN proceso_ingreso pi2 ON pi2.cod_proceso = oc.cod_proceso
            INNER JOIN empleado e ON e.codigo_empleado = oc.codigo_empleado
            WHERE e.cod_local = %s
            AND oc.fecha_requeridaentrega = current_date
            ORDER BY pi2.cod_proceso ASC;
        """, (local,))
        
        return cursor.fetchall()
    finally:
        cursor.close()
        conn.close()
