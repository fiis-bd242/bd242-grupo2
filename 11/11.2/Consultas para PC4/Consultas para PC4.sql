-- Modulo1

-- Modulo 2
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
WHERE idp.cod_dp = (
		select cod_dp 
		from DETALLE_PEDIDO
		order by fecha_pedido desc
		LIMIT 1)

-- Modulo 3

-- Modulo 4

-- Modulo 5
select * from revision r order by r.cod_revision desc

select * from stock s order by s.cod_stock desc

select * from movimiento m order by m.cod_movimiento desc
