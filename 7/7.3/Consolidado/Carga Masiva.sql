DO $$
DECLARE
    base_path TEXT := 'C:/DBD CABALLERO/bd242-grupo2/7/7.3/Modulo5_Inventario/CSV/'; -- colocar ubicacion de los csv
BEGIN
-- ELIMINACION DE DATOS
EXECUTE 'TRUNCATE TABLE Turno CASCADE';
    EXECUTE 'TRUNCATE TABLE Estado_Asistencia CASCADE';
    EXECUTE 'TRUNCATE TABLE Tipo_generacion CASCADE';
    EXECUTE 'TRUNCATE TABLE Estado_SD CASCADE';
    EXECUTE 'TRUNCATE TABLE Tipo_SD CASCADE';
    EXECUTE 'TRUNCATE TABLE Tipo_notificacion CASCADE';
    EXECUTE 'TRUNCATE TABLE Estado_usuario CASCADE';
    EXECUTE 'TRUNCATE TABLE Local CASCADE';
    EXECUTE 'TRUNCATE TABLE Cargo CASCADE';
    EXECUTE 'TRUNCATE TABLE Area CASCADE';
    EXECUTE 'TRUNCATE TABLE Tipo_contrato CASCADE';
    EXECUTE 'TRUNCATE TABLE Asistencia CASCADE';
    EXECUTE 'TRUNCATE TABLE Contrato CASCADE';
    EXECUTE 'TRUNCATE TABLE Empleado CASCADE';
    EXECUTE 'TRUNCATE TABLE Habilidad CASCADE';
    EXECUTE 'TRUNCATE TABLE Horario_libre CASCADE';
    EXECUTE 'TRUNCATE TABLE Horario_libre_dias CASCADE';
    EXECUTE 'TRUNCATE TABLE Notificacion CASCADE';
    EXECUTE 'TRUNCATE TABLE Posee CASCADE';
    EXECUTE 'TRUNCATE TABLE Registra CASCADE';
    EXECUTE 'TRUNCATE TABLE Usuario CASCADE';
    EXECUTE 'TRUNCATE TABLE historial_laboral CASCADE';
    EXECUTE 'TRUNCATE TABLE solicitud_o_descargo CASCADE';
    EXECUTE 'TRUNCATE TABLE CATEGORIA CASCADE';
    EXECUTE 'TRUNCATE TABLE AREA_EC CASCADE';
    EXECUTE 'TRUNCATE TABLE Producto_Friday CASCADE';
    EXECUTE 'TRUNCATE TABLE TAMANO CASCADE';
    EXECUTE 'TRUNCATE TABLE TIPO_DE_MESA CASCADE';
    EXECUTE 'TRUNCATE TABLE ESTADO_DP CASCADE';
    EXECUTE 'TRUNCATE TABLE ESTADO_ITEM_DP CASCADE';
    EXECUTE 'TRUNCATE TABLE MESA CASCADE';
    EXECUTE 'TRUNCATE TABLE IDENTIFICACION_MESERO CASCADE';
    EXECUTE 'TRUNCATE TABLE DETALLE_PEDIDO CASCADE';
    EXECUTE 'TRUNCATE TABLE ITEM_DETALLE_PEDIDO CASCADE';
    EXECUTE 'TRUNCATE TABLE KDS CASCADE';
    EXECUTE 'TRUNCATE TABLE Unidad_medidad CASCADE';
    EXECUTE 'TRUNCATE TABLE Categoria_insumo CASCADE';
    EXECUTE 'TRUNCATE TABLE Subcategoria CASCADE';
    EXECUTE 'TRUNCATE TABLE Tipo_Almacen CASCADE';
    EXECUTE 'TRUNCATE TABLE HojaProduccion CASCADE';
    EXECUTE 'TRUNCATE TABLE proceso_ingreso CASCADE';
    EXECUTE 'TRUNCATE TABLE Tipo_movimiento CASCADE';
    EXECUTE 'TRUNCATE TABLE Almacen CASCADE';
    EXECUTE 'TRUNCATE TABLE Proveedor CASCADE';
    EXECUTE 'TRUNCATE TABLE Insumo CASCADE';
    EXECUTE 'TRUNCATE TABLE Orden_compra CASCADE';
    EXECUTE 'TRUNCATE TABLE Orden_comprainsumo CASCADE';
    EXECUTE 'TRUNCATE TABLE Revision_Cantidad CASCADE';
    EXECUTE 'TRUNCATE TABLE Calidad CASCADE';
    EXECUTE 'TRUNCATE TABLE Revision_Calidad CASCADE';
    EXECUTE 'TRUNCATE TABLE Incluye CASCADE';
    EXECUTE 'TRUNCATE TABLE SeConviertenEn CASCADE';
    EXECUTE 'TRUNCATE TABLE Stock CASCADE';
    EXECUTE 'TRUNCATE TABLE Movimiento CASCADE';
    EXECUTE 'TRUNCATE TABLE Solicitud_compra CASCADE';
    EXECUTE 'TRUNCATE TABLE Solicitud_comprainsumo CASCADE';
--REINICIAR SECUENCIA
	ALTER SEQUENCE estado_asistencia_cod_estado_seq RESTART WITH 1;
	ALTER SEQUENCE tipo_generacion_cod_tipo_generacion_seq RESTART WITH 1;
	ALTER SEQUENCE estado_sd_cod_estado_sd_seq RESTART WITH 1;
	ALTER SEQUENCE tipo_sd_cod_tipo_sd_seq RESTART WITH 1;
	ALTER SEQUENCE tipo_notificacion_cod_tipo_notificacion_seq RESTART WITH 1;
	ALTER SEQUENCE estado_usuario_cod_estado_usuario_seq RESTART WITH 1;
	ALTER SEQUENCE local_cod_local_seq RESTART WITH 1;
	ALTER SEQUENCE cargo_cod_cargo_seq RESTART WITH 1;
	ALTER SEQUENCE area_cod_area_seq RESTART WITH 1;
	ALTER SEQUENCE tipo_contrato_cod_tipo_contrato_seq RESTART WITH 1;
	ALTER SEQUENCE asistencia_cod_asistencia_seq RESTART WITH 1;
	ALTER SEQUENCE contrato_cod_contrato_seq RESTART WITH 1;
	ALTER SEQUENCE empleado_Codigo_empleado_seq RESTART WITH 1;
	ALTER SEQUENCE habilidad_cod_habilidad_seq RESTART WITH 1;
	ALTER SEQUENCE horario_libre_cod_horario_seq RESTART WITH 1;
	ALTER SEQUENCE notificacion_cod_notificacion_seq RESTART WITH 1;
	ALTER SEQUENCE usuario_cod_usuario_seq RESTART WITH 1;
	ALTER SEQUENCE historial_laboral_Cod_his_lab_seq RESTART WITH 1;
	ALTER SEQUENCE solicitud_o_descargo_Cod_sd_seq RESTART WITH 1;
	ALTER SEQUENCE unidad_medidad_cod_unidad_seq RESTART WITH 1;
	ALTER SEQUENCE categoria_insumo_Cod_categoriainsumo_seq RESTART WITH 1;
	ALTER SEQUENCE subcategoria_cod_subcategoria_seq RESTART WITH 1;
	ALTER SEQUENCE tipo_almacen_cod_tipo_almacen_seq RESTART WITH 1;
	ALTER SEQUENCE Almacen_Cod_Almacen_seq RESTART WITH 1;
	ALTER SEQUENCE public.hojaproduccion_cod_hoja_seq RESTART WITH 1;
	ALTER SEQUENCE proveedor_cod_proveedor_seq RESTART WITH 1;
	ALTER SEQUENCE insumo_cod_insumo_seq RESTART WITH 1;
	ALTER SEQUENCE stock_cod_stock_seq RESTART WITH 1;
	ALTER SEQUENCE movimiento_cod_movimiento_seq RESTART WITH 1;
	ALTER SEQUENCE solicitud_compra_Cod_solicitudcompra_seq RESTART WITH 1;
	ALTER SEQUENCE proceso_ingreso_cod_proceso_seq RESTART WITH 1;
	ALTER SEQUENCE Orden_compra_Cod_ordencompra_seq RESTART WITH 1;
	ALTER SEQUENCE Revision_Cantidad_id_revision_cantidad_seq RESTART WITH 1;
	ALTER SEQUENCE Revision_Calidad_Cod_revision_calidad_seq RESTART WITH 1;
	ALTER SEQUENCE Calidad_Cod_calidad_seq RESTART WITH 1;
	ALTER SEQUENCE Tipo_movimiento_Cod_tipomovimiento_seq RESTART WITH 1;
-- CARGA DE DATOS
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
	EXECUTE 'COPY Habilidad (nombre_habilidad, descripcion)
             FROM ' || quote_literal(base_path || 'habilidad.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Empleado (direccion, contacto, dni, primer_nombre, primer_apellido, segundo_apellido, cod_turno, cod_contrato, cod_cargo, cod_local)
             FROM ' || quote_literal(base_path || 'empleado.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Horario_libre (hora_inicio, hora_fin, codigo_empleado)
             FROM ' || quote_literal(base_path || 'horario_libre.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Horario_libre_dias (dias, cod_horario)
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
	EXECUTE 'COPY Orden_comprainsumo(cantidad_compra, cod_ordencompra, Cod_Insumo)
             FROM ' || quote_literal(base_path || 'Orden_comprainsumo.csv') || ' DELIMITER '','' CSV HEADER';
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

	EXECUTE 'COPY Solicitud_compra (fecha_creacion, Estado_solicicompra, Codigo_empleado)
             FROM ' || quote_literal(base_path || 'Solicitud_compra.csv') || ' DELIMITER '','' CSV HEADER';
	EXECUTE 'COPY Solicitud_comprainsumo (cantidad_solicitud, cod_solicitudcompra, Cod_Insumo)
             FROM ' || quote_literal(base_path || 'Solicitud_comprainsumo.csv') || ' DELIMITER '','' CSV HEADER';

END $$;
