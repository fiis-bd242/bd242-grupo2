# backend/test_connection.py
from app.db_connection import get_db_connection

if __name__ == "__main__":
    conn = get_db_connection()
    if conn:
        print("Conexión establecida. ¡Todo funciona bien!")
        conn.close()
