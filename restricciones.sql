--1) Calcular el precio promedio de los productos en cada categoría:

SELECT c.nombre AS categoria, AVG(p.precio_unitario) AS precio_promedio
FROM Categoria c
JOIN Producto p ON c.id = p.categoria_id
GROUP BY c.nombre;

--2) Obtener la cantidad total de productos en stock por categoría:

SELECT c.nombre AS categoria, SUM(s.cantidad) AS cantidad_total_en_stock
FROM Categoria c
JOIN Producto p ON c.id = p.categoria_id
JOIN Stock s ON p.id = s.producto_id
GROUP BY c.nombre;

--3) Calcular el total de ventas por sucursal:

SELECT s.nombre AS sucursal, COALESCE(SUM(o.total), 0) AS total_ventas
FROM Sucursal s
LEFT JOIN Orden o ON s.id = o.sucursal_id
GROUP BY s.nombre;

--4) Obtener el cliente que ha realizado el mayor monto de compras:

SELECT c.nombre AS cliente, COALESCE(SUM(o.total), 0) AS monto_total_compras
FROM Cliente c
LEFT JOIN Orden o ON c.id = o.cliente_id
GROUP BY c.nombre
ORDER BY monto_total_compras DESC
LIMIT 1;