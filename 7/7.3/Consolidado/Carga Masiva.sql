
DO $$
DECLARE
    base_path TEXT := 'C:/DBD CABALLERO/bd242-grupo2/7/7.3/Modulo5_Inventario/CSV/';
BEGIN
-- modulo 4
	EXECUTE 'COPY Turno (Cod_turno, Nombre_turno, Hora_inicio, Hora_fin) 
             FROM ' || quote_literal(base_path || 'Turno.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Estado_Asistencia (Cod_estado, Nombre_Estado,Descripcion_estado)
             FROM ' || quote_literal(base_path || 'estado_asistencia.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Tipo_generacion (Cod_tipo_generacion, Nombre_tipo_generacion)
             FROM ' || quote_literal(base_path || 'tipo_generacion.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Estado_SD (Cod_estado_SD, Nombre_estado_sd)
             FROM ' || quote_literal(base_path || 'estado_sd.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Tipo_SD (Cod_tipo_sd, Nombre_tipo_sd)
             FROM ' || quote_literal(base_path || 'tipo_sd.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Tipo_notificacion (Cod_tipo_notificacion, Nombre_tipo_notificacion,Cod_tipo_generacion)
             FROM ' || quote_literal(base_path || 'tipo_notificacion.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Estado_usuario (Cod_estado_usuario, Nombre_estado_usuario)
             FROM ' || quote_literal(base_path || 'estado_usuario.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Local (Cod_local, Ubicacion_local, Nombre_local)
             FROM ' || quote_literal(base_path || '_local_.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Cargo (Cod_cargo, Nombre_cargo)
             FROM ' || quote_literal(base_path || 'cargo.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Area (Cod_area, Nombre_area,cod_cargo)
             FROM ' || quote_literal(base_path || 'area.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Tipo_contrato (Cod_tipo_contrato, Nombre_tipo_contrato)
             FROM ' || quote_literal(base_path || 'tipo_contrato.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY asistencia (fecha, hora_ingreso, hora_salida, cod_estado)
             FROM ' || quote_literal(base_path || 'Asistencia.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Contrato (fecha_contratacion, cod_tipo_contrato)
             FROM ' || quote_literal(base_path || 'contrato.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local)
             FROM ' || quote_literal(base_path || 'empleado.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Habilidad (nombre_habilidad, descripcion)
             FROM ' || quote_literal(base_path || 'habilidad.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Horario_libre (hora_inicio, hora_fin, codigo_empleado)
             FROM ' || quote_literal(base_path || 'horario_libre.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Horario_libre_dias (dias)
             FROM ' || quote_literal(base_path || 'horario_libre_dias.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Notificacion (fecha_envio, hora_envio, mensaje, destino, codigo_empleado, cod_tipo_notificacion)
             FROM ' || quote_literal(base_path || 'notificacion.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Posee (codigo_empleado, cod_habilidad)
             FROM ' || quote_literal(base_path || 'posee.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Registra (codigo_empleado, cod_asistencia)
             FROM ' || quote_literal(base_path || 'registra.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Usuario (username, contraseña, gmail, fecha_creacion, rol, codigo_empleado, cod_estado_usuario)
             FROM ' || quote_literal(base_path || 'usuario.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY historial_laboral (empresa, cargo, duración, codigo_empleado)
             FROM ' || quote_literal(base_path || 'historial_laboral.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY solicitud_o_descargo (titulo, descripcion, evidencia, respuesta, codigo_empleado, cod_estado_sd, cod_tipo_sd)
             FROM ' || quote_literal(base_path || 'solicitud_o_descargo.csv') || ' DELIMITER '','' CSV HEADER';
-- modulo 2
	EXECUTE 'COPY CATEGORIA (cod_categoria, nombre_categoria)
             FROM ' || quote_literal(base_path || 'categoria.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY AREA_EC (cod_area_ec, descripcion_ec)
             FROM ' || quote_literal(base_path || 'area_ec.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Producto_Friday (Cod_prodFriday, Nombre_producto, Precio_producto, Descripcion, cod_categoria, cod_area_ec)
             FROM ' || quote_literal(base_path || 'producto_friday.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY TAMANO (cod_tamano, descripcion_tamano)
             FROM ' || quote_literal(base_path || 'tamano.csv') || ' DELIMITER '','' CSV HEADER';

	EXECUTE 'COPY TIPO_DE_MESA (cod_tipo_de_mesa, descripcion_tipo_mesa)
             FROM ' || quote_literal(base_path || 'tipo_de_mesa.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY ESTADO_DP (cod_estado_dp, descripcion_estado_dp)
             FROM ' || quote_literal(base_path || 'estado_dp.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY ESTADO_ITEM_DP (cod_estado_item_dp, descripcion_estado_item_dp)
             FROM ' || quote_literal(base_path || 'estado_item_dp.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY MESA (cod_mesa, cod_tipo_de_mesa, cod_tamano)
             FROM ' || quote_literal(base_path || 'mesa.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY IDENTIFICACION_MESERO (cod_im, fecha, hora, codigo_empleado)
             FROM ' || quote_literal(base_path || 'identificacion_mesero.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY DETALLE_PEDIDO (cod_dp,fecha_pedido, cod_estado_dp, cod_im, cod_mesa)
             FROM ' || quote_literal(base_path || 'detalle_pedido.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY ITEM_DETALLE_PEDIDO (cod_item_dp, Cod_prodFriday, cantidad, precio, cod_estado_item_dp, cod_dp)
             FROM ' || quote_literal(base_path || 'item_detalle_pedido.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY KDS (cod_kds_item, cod_kds, cod_area_ec, cod_item_dp)
             FROM ' || quote_literal(base_path || 'kds.csv') || ' DELIMITER '','' CSV HEADER';
	
	-- modulo 5

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

	-- modulo 1
	
	EXECUTE 'COPY Solicitud_compra (fecha_creacion, Estado_solicicompra, Codigo_empleado)
             FROM ' || quote_literal(base_path || 'Solicitud_compra.csv') || ' DELIMITER '','' CSV HEADER';
	
	EXECUTE 'COPY Solicitud_comprainsumo (cantidad_solicitud, cod_solicitudcompra, Cod_Insumo)
             FROM ' || quote_literal(base_path || 'Solicitud_comprainsumo.csv') || ' DELIMITER '','' CSV HEADER';
	

END $$;



            
            
            
            

            
