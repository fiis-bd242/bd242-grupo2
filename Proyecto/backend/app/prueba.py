# prueba.py
from .models import get_local_empleado, get_ordencompra_mismodia

# Código de prueba para obtener órdenes de compra del mismo día
def test_get_ordencompra_mismodia():
    codigo_empleado = 33  # Usar un código de empleado de prueba, por ejemplo, 33

    try:
        print(f"Probando obtener órdenes de compra para el empleado con código: {codigo_empleado}")
        result = get_ordencompra_mismodia(codigo_empleado)
        
        # Verificar el resultado
        if isinstance(result, list):
            if result:
                print("Órdenes de compra obtenidas:")
                for orden in result:
                    print(orden)
            else:
                print("No se encontraron órdenes de compra para el día de hoy.")
        else:
            print(result)  # Si el resultado no es una lista, probablemente es un error

    except Exception as e:
        print(f"Ocurrió un error durante la prueba: {e}")

# Ejecutar la prueba
if __name__ == "__main__":
    test_get_ordencompra_mismodia()
