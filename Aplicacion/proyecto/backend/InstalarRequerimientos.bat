@echo off
echo Cambiando al directorio donde se encuentra el archivo .bat...
cd /d "%~dp0"

echo Instalando las dependencias desde requirements.txt...
pip install -r requirements.txt
pause
