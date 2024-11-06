# Código para carga masiva

```sql
DO $$
DECLARE
    base_path TEXT := 'C:/DBD CABALLERO/bd242-grupo2/7/7.3/Modulo5_Inventario/CSV/';
BEGIN
	EXECUTE 'COPY Unidad_medidad(Nombre_unidad) 
             FROM ' || quote_literal(base_path || 'Unidad_medidad.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Categoria_insumo(Nombre_categoriainsumo) 
             FROM ' || quote_literal(base_path || 'Categoria_insumo.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Condiciones(Nombre_condiciones) 
             FROM ' || quote_literal(base_path || 'Condiciones.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Subcategoria(Nombre_subcategoria, Cod_categoria) 
             FROM ' || quote_literal(base_path || 'Subcategoria.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Tipo_Almacen(Nombre_tipo_almacen)
             FROM ' || quote_literal(base_path || 'Tipo_Almacen.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY HojaProduccion(Fecha_elaboracion, Codigo_empleado)
             FROM ' || quote_literal(base_path || 'HojaProduccion.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY proceso_ingreso(nombre_proceso)
             FROM ' || quote_literal(base_path || 'proceso_ingreso.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Tipo_movimiento(Nombre_tipomovimiento)
             FROM ' || quote_literal(base_path || 'Tipo_movimiento.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Almacen(Cod_tipo_almacen, Cod_local)
             FROM ' || quote_literal(base_path || 'Almacen.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Proveedor(Nombre_Empresa, RUC, Direccion_Proveedor, Correo_proveedor)
             FROM ' || quote_literal(base_path || 'Proveedor.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Insumo(Nombre_Insumo, Cod_unidad, Cod_condiciones, Cod_subcategoria, Cod_categoriainsumo)
             FROM ' || quote_literal(base_path || 'Insumo.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Orden_compra(fecha_ordencompra, Codigo_empleado, fecha_requeridaentrega, Cod_Proveedor, cod_proceso)
             FROM ' || quote_literal(base_path || 'Orden_compra.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Revision_Cantidad(Cod_ordencompra, cod_insumo, cantidad_revisada, fecha_revision, Cod_supervisor)
             FROM ' || quote_literal(base_path || 'Revision_Cantidad.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Calidad(Estado)
             FROM ' || quote_literal(base_path || 'Calidad.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Revision_Calidad(Cod_ordencompra, cod_insumo, Cod_calidad, fecha_revision, Cod_supervisor, descripcion)
             FROM ' || quote_literal(base_path || 'Revision_Calidad.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Incluye(Cantidad, Cod_Hoja, Cod_prodFriday)
             FROM ' || quote_literal(base_path || 'Incluye.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY SeConviertenEn(Cantidad_Receta, Cod_Insumo, Cod_Producto)
             FROM ' || quote_literal(base_path || 'SeConviertenEn.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Tipo_movimiento(Nombre_tipomovimiento)
             FROM ' || quote_literal(base_path || 'Tipo_movimiento.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Stock(Fecha_Vencimiento, Cantidad, Cod_Insumo, Cod_Proveedor, Cod_Almacen)
             FROM ' || quote_literal(base_path || 'Stock.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Movimiento(Fecha_Movimiento, Cantidad_movimiento, Fecha_fin, Codigo_empleado, Cod_Stock, Cod_tipomovimiento)
             FROM ' || quote_literal(base_path || 'Movimiento.csv') || ' DELIMITER '','' CSV HEADER';
END $$;
```
