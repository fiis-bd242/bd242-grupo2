# backend/app/extensions.py

import psycopg2
from flask import current_app, g

def get_db():
    """Establece la conexión a la base de datos usando psycopg2."""
    if "db" not in g:
        try:
            g.db = psycopg2.connect(current_app.config["DATABASE_URI"])
            print("Conexión exitosa a la base de datos.")
        except psycopg2.Error as e:
            print(f"Error al conectar a la base de datos: {e}")
            g.db = None
    return g.db

def close_db(e=None):
    """Cierra la conexión a la base de datos."""
    db = g.pop("db", None)
    if db is not None:
        db.close()
