-- VISTA
-- Permite visualizar qué mesas están actualmente disponibles (Asignación de Mesa)

drop view if exists DISPONIBILIDAD_MESA cascade;
CREATE VIEW DISPONIBILIDAD_MESA
AS
SELECT  me.cod_mesa, 
		me.cod_tipo_de_mesa,
		dp.cod_estado_dp estado_mesa,
		CASE 
			WHEN dp.cod_estado_dp is NULL OR dp.cod_estado_dp = 'TD' THEN 'DISPONIBLE'
			ELSE 'NO DISPONIBLE'
		END AS DISPONIBILIDAD
from MESA me
LEFT JOIN DETALLE_PEDIDO dp
on me.cod_mesa = dp.cod_mesa;

select * from DISPONIBILIDAD_MESA
where disponibilidad != 'DISPONIBLE'

-- ÍNDICE

-- CONSULTA: Permite visualizar los items de producto de un Pedido de Mesa
SELECT idp.cod_item_dp, idp.cod_dp,pf.nombre_producto , 
	idp.cantidad , idp.precio, dp.cod_im,dp.cod_mesa num_mesa,
	e.primer_apellido || ' ' || SUBSTRING(e.segundo_apellido FROM 1 FOR 1) || '. ' || 
	e.primer_nombre mesero, 
	SUM(idp.precio) OVER (PARTITION BY idp.cod_dp) AS TOTAL
	--  Suma de precios de todas las filas que contengan el mismo "cod_dp"
FROM ITEM_DETALLE_PEDIDO idp
LEFT JOIN Producto_Friday pf
on idp.cod_prodfriday = pf.cod_prodfriday
LEFT JOIN DETALLE_PEDIDO dp
on dp.cod_dp = idp.cod_dp
LEFT JOIN IDENTIFICACION_MESERO im 
ON dp.cod_im = im.cod_im
LEFT JOIN Empleado e 
ON im.Codigo_empleado = e.Codigo_empleado
WHERE idp.cod_dp = 'DP25'

-- Analizar Costo
EXPLAIN ANALYZE SELECT idp.cod_item_dp, idp.cod_dp, pf.nombre_producto, 
                        idp.cantidad, idp.precio, dp.cod_im, dp.cod_mesa num_mesa,
                        e.primer_apellido || ' ' || SUBSTRING(e.segundo_apellido FROM 1 FOR 1) || '. ' || 
                        e.primer_nombre mesero, 
                        SUM(idp.precio) OVER (PARTITION BY idp.cod_dp) AS TOTAL
FROM ITEM_DETALLE_PEDIDO idp
LEFT JOIN Producto_Friday pf
  ON idp.cod_prodfriday = pf.cod_prodfriday
LEFT JOIN DETALLE_PEDIDO dp
  ON dp.cod_dp = idp.cod_dp
LEFT JOIN IDENTIFICACION_MESERO im 
  ON dp.cod_im = im.cod_im
LEFT JOIN Empleado e 
  ON im.Codigo_empleado = e.Codigo_empleado
WHERE idp.cod_dp = 'DP25';

-- APLICAR ÍNDICE
CREATE INDEX idx_cod_dp ON ITEM_DETALLE_PEDIDO (cod_dp);

-- VOLVER A ANALIZAR EL COSTO
EXPLAIN ANALYZE SELECT idp.cod_item_dp, idp.cod_dp, pf.nombre_producto, 
                        idp.cantidad, idp.precio, dp.cod_im, dp.cod_mesa num_mesa,
                        e.primer_apellido || ' ' || SUBSTRING(e.segundo_apellido FROM 1 FOR 1) || '. ' || 
                        e.primer_nombre mesero, 
                        SUM(idp.precio) OVER (PARTITION BY idp.cod_dp) AS TOTAL
FROM ITEM_DETALLE_PEDIDO idp
LEFT JOIN Producto_Friday pf
  ON idp.cod_prodfriday = pf.cod_prodfriday
LEFT JOIN DETALLE_PEDIDO dp
  ON dp.cod_dp = idp.cod_dp
LEFT JOIN IDENTIFICACION_MESERO im 
  ON dp.cod_im = im.cod_im
LEFT JOIN Empleado e 
  ON im.Codigo_empleado = e.Codigo_empleado
WHERE idp.cod_dp = 'DP25';
