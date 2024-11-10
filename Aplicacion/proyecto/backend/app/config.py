# Configuración de Flask 

# backend/app/config.py

import os
from dotenv import load_dotenv

load_dotenv()

class Config:
    """Configuración base para la aplicación Flask."""
    SECRET_KEY = os.getenv("SECRET_KEY", "mi_secreto")

    DB_USER = os.getenv("DB_USER")
    DB_PASSWORD = os.getenv("DB_PASSWORD")
    DB_HOST = os.getenv("DB_HOST")
    DB_PORT = os.getenv("DB_PORT")
    DB_NAME = os.getenv("DB_NAME")

    @property
    def DATABASE_URI(self):
        return f"postgresql://{self.DB_USER}:{self.DB_PASSWORD}@{self.DB_HOST}:{self.DB_PORT}/{self.DB_NAME}"

config = Config()
