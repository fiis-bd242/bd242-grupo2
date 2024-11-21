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
