# backend/app/db_connection.py
import psycopg2
from app.config import Config

def get_db_connection():
    try:
        conn = psycopg2.connect(Config.DATABASE_URL)
        print("✅ Conexión exitosa a la base de datos")
        return conn
    except psycopg2.Error as e:
        print(f"❌ Error al conectar a la base de datos: {e}")
        return None
