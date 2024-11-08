import pandas as pd
import random

# Definir los posibles valores para cada columna
valores_columna1 = list(range(23, 501))   # Números del 23 al 500
valores_columna2 = list(range(1, 457))    # Números del 1 al 456

# Crear un conjunto para almacenar filas únicas
filas_unicas = set()
while len(filas_unicas) < 2000:
    # Generar una tupla con valores aleatorios para cada columna
    fila = (random.choice(valores_columna1), random.choice(valores_columna2))
    filas_unicas.add(fila)

# Convertir el conjunto a una lista y crear un DataFrame
datos = list(filas_unicas)
df = pd.DataFrame(datos, columns=["Columna1", "Columna2"])

# Guardar el DataFrame en un archivo CSV
output_path = "datos_unicos_2000.csv"
df.to_csv(output_path, index=False)

print("Archivo 'datos_unicos_2000.csv' generado con éxito.")
