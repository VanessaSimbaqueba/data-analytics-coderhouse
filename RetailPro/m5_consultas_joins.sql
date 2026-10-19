-- Motor utilizado: SQL Server (SSMS)

USE Ventas_Tech_DB;

-- Consulta 1: vista base del proyecto (INNER JOIN)
SELECT
    fecha_venta,
    clientes.id_cliente,
    nombre AS nombre_cliente,
    ciudad,
    nombre_producto,
    nombre_categoria AS categoria,
    cantidad,
    precio_unitario,
    cantidad * precio_unitario AS total_venta
FROM ventas
INNER JOIN clientes ON ventas.id_cliente = clientes.id_cliente
INNER JOIN productos ON ventas.id_producto = productos.id_producto
INNER JOIN categorias ON productos.id_categoria = categorias.id_categoria;

-- Dato de ejemplo: cliente registrado que aún no ha comprado
IF NOT EXISTS (SELECT 1 FROM clientes WHERE id_cliente = 6)
    INSERT INTO clientes (id_cliente, nombre, email, ciudad, fecha_registro)
    VALUES (6, 'Sofia Ramirez', 'sofia@mail.com', 'Salta', '2024-03-10');

-- Consulta 2: clientes sin ventas (LEFT JOIN)
SELECT
    nombre,
    email,
    fecha_registro
FROM clientes
LEFT JOIN ventas ON clientes.id_cliente = ventas.id_cliente
WHERE ventas.id_venta IS NULL;

-- Consulta 3: productos sin ventas (LEFT JOIN)
SELECT
    nombre_producto,
    nombre_categoria AS categoria,
    precio
FROM productos
INNER JOIN categorias ON productos.id_categoria = categorias.id_categoria
LEFT JOIN ventas ON productos.id_producto = ventas.id_producto
WHERE ventas.id_venta IS NULL;

-- Consulta 4: consolidado por canal (UNION ALL)
SELECT fecha_venta, cantidad * precio_unitario AS total, 'Periodo 1' AS canal
FROM ventas
WHERE fecha_venta < '2024-03-10'
UNION ALL
SELECT fecha_venta, cantidad * precio_unitario AS total, 'Periodo 2' AS canal
FROM ventas
WHERE fecha_venta >= '2024-03-10';

-- Consulta 1: vista base del proyecto (INNER JOIN)
-- Propósito: unir ventas, clientes, productos y categorías en una sola tabla para usarla en Power BI.
-- Hallazgo: Computación concentra el 77% de lo facturado ($4950 de $6444) y Buenos Aires es la ciudad que más compra (41%).

-- Consulta 2: clientes sin ventas (LEFT JOIN)
-- Propósito: detectar clientes registrados que nunca compraron, para que CRM los contacte.
-- Hallazgo: 1 de los 6 clientes registrados nunca compró y se registró el 10 de marzo de 2024.

-- Consulta 3: productos sin ventas (LEFT JOIN)
-- Propósito: identificar productos del catálogo sin movimiento, para que el área de producto los revise.
-- Hallazgo: 1 de los 7 productos del catálogo (Webcam HD, de Accesorios) no tiene ventas.

-- Consulta 4: consolidado por canal (UNION ALL)
-- Propósito: comparar lo facturado en dos períodos, antes del 10 de marzo y desde esa fecha.
-- Hallazgo: los dos períodos facturaron casi lo mismo ($3230 y $3214), así que las ventas no cambiaron entre ambos.
