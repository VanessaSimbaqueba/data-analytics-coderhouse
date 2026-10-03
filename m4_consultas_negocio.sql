USE Ventas_Tech_DB
SELECT 
MONTH(fecha_venta) AS mes,
COUNT(*) AS cantidad_pedidos,
SUM(cantidad * precio_unitario) AS total_facturado,
AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta);
SELECT TOP 5 id_producto,
SUM(cantidad) AS unidades_vendidas,
SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;
SELECT 
id_cliente,
COUNT(*) AS cantidad_pedidos,
SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;
SELECT 
mes,
total_facturado,
CASE 
WHEN total_facturado > (SELECT AVG(total_facturado) 
FROM ( SELECT SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY MONTH(fecha_venta))
AS promedios)
THEN 'Por encima'
ELSE 'Por debajo'
END AS comparacion_promedio
FROM (
SELECT 
MONTH(fecha_venta) AS mes,
SUM(cantidad * precio_unitario) AS total_facturado
FROM ventas
GROUP BY MONTH(fecha_venta))
AS resumen_mensual;

-- HALLAZGOS:
-- 1. El producto 1 (Laptop Pro 15) concentra el 56% del total facturado ($3600 de $6444), 
--    siendo el producto más rentable pese a venderse en poca cantidad (solo 3 unidades).
-- 2. El producto 2 (Mouse Inalámbrico) fue el más vendido en unidades (13), pero generó 
--    apenas $364 -- esto muestra que volumen de ventas no siempre equivale a mayor ingreso.
-- 3. El cliente 1 (María López) gastó $2640, más del doble que el promedio de gasto por 
--    cliente (~$1289), posicionándose como el cliente de mayor valor para RetailPro.
