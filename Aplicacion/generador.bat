@echo off

REM Crear carpetas principales
mkdir proyecto
cd proyecto

mkdir backend
mkdir backend\app
mkdir backend\app\controllers
mkdir backend\app\models
mkdir backend\app\views
mkdir backend\tests

REM Crear archivos en el backend
echo # Inicialización de la aplicación Flask > backend\app\__init__.py
echo # Controladores de negocio > backend\app\controllers\insumos_controller.py
echo # Modelos de la base de datos > backend\app\models\insumo_model.py
echo # Rutas de la API > backend\app\views\insumo_view.py
echo # Configuración de Flask > backend\app\config.py
echo # Extensiones para librerías externas > backend\app\extensions.py
echo # Utilidades y funciones auxiliares > backend\app\utils.py
echo # Pruebas para el backend > backend\tests\test_insumo.py
echo # Dependencias de Python > backend\requirements.txt
echo # WSGI para el servidor > backend\wsgi.py

REM Crear carpetas y archivos en el frontend
mkdir frontend
mkdir frontend\public
mkdir frontend\src
mkdir frontend\src\assets
mkdir frontend\src\components
mkdir frontend\src\pages
mkdir frontend\src\services
mkdir frontend\src\utils

REM Crear archivos en el frontend
echo # Archivos estáticos > frontend\public\index.html
echo # Recursos de la app (imágenes, fuentes) > frontend\src\assets\.keep
echo # Componentes reutilizables de React > frontend\src\components\InsumoForm.js
echo # Páginas de la app > frontend\src\pages\NuevoInsumo.js
echo # Servicios de la API > frontend\src\services\api.js
echo # Funciones auxiliares > frontend\src\utils\.keep
echo # Componente principal de React > frontend\src\App.js
echo # Punto de entrada de React > frontend\src\index.js
echo # Dependencias del frontend > frontend\package.json

REM Archivo de documentación
echo # Documentación del proyecto > README.md

echo Estructura de carpetas y archivos creada correctamente.
pause
