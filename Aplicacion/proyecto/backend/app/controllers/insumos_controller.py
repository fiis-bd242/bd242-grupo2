# backend/app/controllers/insumos_controller.py
from app.db_connection import get_db_connection

def fetch_all_insumos():
    conn = get_db_connection()
    if not conn:
        return []

    try:
        with conn.cursor() as cursor:
            cursor.execute("SELECT * FROM insumo;")
            insumos = cursor.fetchall()
            return insumos
    finally:
        conn.close()
