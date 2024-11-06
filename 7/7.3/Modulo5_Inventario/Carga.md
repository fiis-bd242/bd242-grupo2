# Código para carga masiva

```sql
	DO $$
	DECLARE
	    base_path TEXT := 'C:/DBD CABALLERO/bd242-grupo2/7/7.3/Modulo5_Inventario/CSV/';
	BEGIN
		EXECUTE 'COPY Categoria_insumo(Nombre_categoriainsumo) 
	             FROM ' || quote_literal(base_path || 'Categoria_insumo.csv') || ' DELIMITER '','' CSV HEADER';
		EXECUTE 'COPY Condiciones(Nombre_condiciones) 
	             FROM ' || quote_literal(base_path || 'Condiciones.csv') || ' DELIMITER '','' CSV HEADER';
		EXECUTE 'COPY Subcategoria(Nombre_subcategoria, Cod_categoria) 
	             FROM ' || quote_literal(base_path || 'Subcategoria.csv') || ' DELIMITER '','' CSV HEADER';
		EXECUTE 'COPY Unidad_medidad(Nombre_unidad) 
	             FROM ' || quote_literal(base_path || 'Unidad_medidad.csv') || ' DELIMITER '','' CSV HEADER';
	    EXECUTE 'COPY Insumo(Nombre_Insumo, Cod_unidad, Cod_condiciones, Cod_subcategoria, Cod_categoriainsumo)
	             FROM ' || quote_literal(base_path || 'Insumo.csv') || ' DELIMITER '','' CSV HEADER';
	END $$;
```
