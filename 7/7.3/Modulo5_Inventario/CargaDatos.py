import os
import subprocess

# Ruta del directorio donde están los archivos CSV
base_path = r'C:/DBD CABALLERO/bd242-grupo2/7/7.3/Modulo5_Inventario/CSV/'

# Iterar sobre cada archivo CSV en el directorio
for filename in os.listdir(base_path):
    if filename.endswith('.csv'):
        file_path = os.path.join(base_path, filename)
        print(f"Cargando el archivo: {file_path}")
        
        # Comando psql con \copy
        command = f'psql -U nuevo_usuario -d Prueba_React -h localhost -p 5434 -c "\copy Insumo(Nombre_Insumo, Cod_unidad, Cod_condiciones, Cod_subcategoria, Cod_categoriainsumo) FROM \'{file_path.replace("\\", "/")}\' DELIMITER \',\' CSV HEADER"'
        
        # Ejecutar el comando en el shell
        subprocess.run(command, shell=True, check=True)
        print(f"Archivo {filename} cargado exitosamente.")

print("Todos los archivos CSV han sido cargados.")
