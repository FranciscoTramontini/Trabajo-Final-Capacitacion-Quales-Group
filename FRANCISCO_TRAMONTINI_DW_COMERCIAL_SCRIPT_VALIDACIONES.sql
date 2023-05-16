-- ============================================================================================
-- < Francisco Tramontini >
-- < Validaciones de los datos cargados > 
-- ============================================================================================
-- DIM_PRODUCTO con la tabla FACT_VENTAS
SELECT DISTINCT DP.COD_PRODUCTO, 
				DP.DESC_PRODUCTO
FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS] FV
LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_PRODUCTO] DP ON FV.PRODUCTO_KEY = DP.PRODUCTO_KEY
ORDER BY DP.COD_PRODUCTO ASC
-----------------------------------------------------------------------------------------------
-- DIM_CATEGORIA con la tabla FACT_VENTAS
SELECT DISTINCT DC.COD_CATEGORIA, 
				DC.DESC_CATEGORIA
FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS] FV
LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_CATEGORIA] DC ON FV.CATEGORIA_KEY = DC.CATEGORIA_KEY
ORDER BY DC.COD_CATEGORIA ASC
-----------------------------------------------------------------------------------------------
-- DIM_CLIENTE con la tabla FACT_VENTAS
SELECT DISTINCT DCL.COD_CLIENTE, 
				DCL.NOMBRE,
				DCL.APELLIDO
FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS] FV
LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_CLIENTE] DCL ON FV.CLIENTE_KEY = DCL.CLIENTE_KEY
ORDER BY DCL.COD_CLIENTE ASC
-----------------------------------------------------------------------------------------------
-- DIM_PAIS con la tabla FACT_VENTAS
SELECT DISTINCT DPA.COD_PAIS, 
				DPA.DESC_PAIS
FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS] FV
LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_PAIS] DPA ON FV.PAIS_KEY = DPA.PAIS_KEY
ORDER BY DPA.COD_PAIS ASC
-----------------------------------------------------------------------------------------------
-- DIM_VENDEDOR con la tabla FACT_VENTAS
SELECT DISTINCT DV.COD_VENDEDOR, 
				DV.NOMBRE,
				DV.APELLIDO
FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS] FV
LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_VENDEDOR] DV ON FV.VENDEDOR_KEY = DV.VENDEDOR_KEY
ORDER BY DV.COD_VENDEDOR ASC
-----------------------------------------------------------------------------------------------
-- DIM_SUCURSAL con la tabla FACT_VENTAS
SELECT DISTINCT DS.COD_SUCURSAL, 
				DS.DESC_SUCURSAL
FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS] FV
LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_SUCURSAL] DS ON FV.SUCURSAL_KEY = DS.SUCURSAL_KEY
ORDER BY DS.COD_SUCURSAL ASC
-----------------------------------------------------------------------------------------------
-- FACT_VENTAS
SELECT * FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS]
-----------------------------------------------------------------------------------------------
-- Suma Totales y Promedio 
SELECT SUM(FV.CANTIDAD_VENDIDA) AS Total_Cantidad_Vendida,
	   SUM(FV.MONTO_VENDIDO) AS Total_Monto_Vendido,
	   SUM(FV.PRECIO) AS Total_Precio,
	   SUM(FV.COMISION_COMERCIAL) AS Total_Comision_Comercial,
	   AVG(FV.CANTIDAD_VENDIDA) AS Promedio_Cantidad_Vendida,
	   AVG(FV.MONTO_VENDIDO) AS Promedio_Monto_Vendido,
	   AVG(FV.PRECIO) AS Promedio_Precio,
	   AVG(FV.COMISION_COMERCIAL) AS Promedio_Comision_Comercial
FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS] FV
-----------------------------------------------------------------------------------------------
-- Total Monto Vendido Agrupado por Países.
SELECT DPA.COD_PAIS,
	   SUM(FV.MONTO_VENDIDO) AS MONTO_VENDIDO
FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS] FV
JOIN [DW_COMERCIAL].[dbo].[DIM_PAIS] DPA ON FV.PAIS_KEY = DPA.PAIS_KEY
GROUP BY DPA.COD_PAIS
-----------------------------------------------------------------------------------------------
-- Total Monto Vendido por el País 13 (ARG) Agrupado por Vendedores
SELECT DV.COD_VENDEDOR,
	   SUM(FV.MONTO_VENDIDO) AS MONTO_VENDIDO
FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS] FV
JOIN [DW_COMERCIAL].[dbo].[DIM_VENDEDOR] DV ON FV.VENDEDOR_KEY = DV.VENDEDOR_KEY
WHERE FV.PAIS_KEY = 13
GROUP BY DV.COD_VENDEDOR
-----------------------------------------------------------------------------------------------
-- Top 3 de los Vendedores.
SELECT TOP (3) DV.COD_VENDEDOR,
			   SUM(FV.MONTO_VENDIDO) AS MONTO_VENDIDO
FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS] FV
JOIN [DW_COMERCIAL].[dbo].[DIM_VENDEDOR] DV ON FV.VENDEDOR_KEY = DV.VENDEDOR_KEY
GROUP BY DV.COD_VENDEDOR
ORDER BY 2 DESC
