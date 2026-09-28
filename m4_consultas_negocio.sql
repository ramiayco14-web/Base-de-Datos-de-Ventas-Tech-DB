USE Ventas_Tech_DB;
GO

-- =============================================================================
-- Consulta 1: Resumen ejecutivo mensual
-- =============================================================================
SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(id_venta) AS cantidad_pedidos,
    AVG(cantidad * precio_unitario) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;

-- =============================================================================
-- Consulta 2: Ranking de productos (Top 5)
-- =============================================================================
SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;

-- =============================================================================
-- Consulta 3: Clientes recurrentes
-- =============================================================================
SELECT 
    id_cliente,
    COUNT(id_venta) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(id_venta) > 1;

-- =============================================================================
-- Consulta 4: Meses por encima/por debajo del promedio
-- =============================================================================
SELECT 
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE 
        WHEN SUM(cantidad * precio_unitario) > (
            SELECT AVG(total_mensual) 
            FROM (
                SELECT SUM(cantidad * precio_unitario) AS total_mensual 
                FROM ventas 
                GROUP BY MONTH(fecha_venta)
            ) AS Promedios
        ) THEN 'Por encima'
        ELSE 'Por debajo'
    END AS rendimiento_mensual
FROM ventas
GROUP BY MONTH(fecha_venta);

-- =============================================================================
-- HALLAZGOS DEL ANÁLISIS DE NEGOCIO
-- =============================================================================
/*
1. Concentración de facturación: El producto 1 (Laptop Pro 15) es el líder absoluto indiscutido. Con solo 3 unidades vendidas, generó $3,600, representando más del 50% de los ingresos totales de la compañía.
2. Fidelización perfecta: La recurrencia actual es del 100%. Al aplicar el filtro HAVING COUNT > 1, observamos que exactamente los 5 clientes registrados en la base de datos realizaron 2 pedidos cada uno.
3. Estacionalidad concentrada: Al analizar la fecha_venta, todas las transacciones de la tabla ocurrieron en el mes de marzo (Mes 3). Esto provoca que el rendimiento del Mes 3 sea exactamente igual al promedio general.
*/