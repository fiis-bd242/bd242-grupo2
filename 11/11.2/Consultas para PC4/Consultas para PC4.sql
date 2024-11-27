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
        SELECT 
            e.DNI,
            e.Primer_apellido
        FROM 
            Empleado e
        JOIN 
            Horario_libre hl ON e.Codigo_empleado = hl.Codigo_empleado
        JOIN 
            Horario_libre_Dias hld ON hl.Cod_horario = hld.Cod_horario
        JOIN 
            Turno t ON t.Cod_turno = (SELECT cod_turno FROM TURNO WHERE nombre_turno = 'Mañana')
        JOIN 
            Cargo c ON e.Cod_cargo = c.Cod_cargo
        WHERE 
            hld.Dias = 'Domingo' AND
            c.Nombre_cargo = 'LIMPIEZA' AND
            hl.Hora_inicio <= t.Hora_inicio AND
            hl.Hora_fin >= t.Hora_fin;
UPdate empleado set cod_turno=2
where codigo_empleado=3;
select*from turno;
Select*from cargo;
Select*from empleado where dni='91327168';
BEGIN;
-- Paso 1: Actualizar el turno del empleado
UPDATE
Empleado
SET
Cod_turno = (SELECT cod_turno FROM TURNO WHERE Nombre_turno='Tarde')
WHERE
dni = '76688037';


-- Paso 2: Eliminar la disponibilidad previa en la tabla Horario_libre_Dias
DELETE FROM
Horario_libre_Dias
WHERE
Cod_horario IN (
SELECT Cod_horario
FROM Horario_libre
WHERE Codigo_empleado = (select codigo_empleado from empleado where dni='76688037')
);


-- Paso 3: Eliminar la disponibilidad previa en la tabla Horario_libre
DELETE FROM
Horario_libre
WHERE
Codigo_empleado = (SELECT codigo_empleado from  empleado where dni='76688037');


COMMIT;
rollback;

-- Modulo 5
select * from revision r order by r.cod_revision desc

select * from stock s order by s.cod_stock desc

select * from movimiento m order by m.cod_movimiento desc
