-- ================================================================================================================================
-- Francisco Tramontini
-- < Insertamos los datos correspondientes para DW_COMERCIAL >
--
-- 2023-04-05 - Creacion de la query (FRANCISCO_TRAMONTINI_DW_COMERCIAL_INSERTS)
--			  - Codigo para cargar los datos a la tabla STG_DIM_PRODUCTO provenientes de la base de datos BD_COMERCIAL
--			  - Codigo para cargar los datos a la tabla STG_DIM_CATEGORIA provenientes de la base de datos BD_COMERCIAL
--			  - Codigo para cargar los datos a la tabla STG_DIM_CLIENTE provenientes de la base de datos BD_COMERCIAL
--			  - Codigo para cargar los datos a la tabla STG_DIM_PAIS provenientes de la base de datos BD_COMERCIAL
--			  - Codigo para cargar los datos a la tabla STG_DIM_VENDEDOR provenientes de la base de datos BD_COMERCIAL
--			  - Codigo para cargar los datos a la tabla STG_DIM_SUCURSAL provenientes de la base de datos BD_COMERCIAL
--			  - Codigo para cargar los datos a la tabla STG_FACT_VENTAS provenientes de la base de datos BD_COMERCIAL
--            - Backup 1 EjercicioIntegrador\BKP\INSERTARDATOS
--            - Creacion de codigo de validacion de datos para cada una de las tablas STG_DIM Y STG_FACT
--            - Backup 2 EjercicioIntegrador\BKP\CREACIONDETABLAS
--            - Se ejecuta la query
--            - Se cargan los datos correctamente y se validan de la tabla STG_DIM_PRODUCTO
--            - Se cargan los datos correctamente y se validan de la tabla STG_DIM_CATEGORIA
--            - Se cargan los datos correctamente y se validan de la tabla STG_DIM_CLIENTE
--            - Se cargan los datos correctamente y se validan de la tabla STG_DIM_PAIS
--            - Se cargan los datos correctamente y se validan de la tabla STG_DIM_VENDEDOR
--            - Se cargan los datos correctamente y se validan de la tabla STG_DIM_SUCURSAL
--            - Se cargan los datos correctamente y se validan de la tabla STG_FACT_VENTAS
--            - Backup 3 EjercicioIntegrador\BKP\CREACIONDETABLAS
--            - Se encontraban mal ubicadas las columnas con sus datos en las tablas STG_DIM_<NOMBRE>, se corrige correctamente.
--            - Backup 4 EjercicioIntegrador\BKP\CREACIONDETABLAS
-- ================================================================================================================================
-- STG_DIM_PRODUCTO
INSERT INTO [DW_COMERCIAL].[dbo].[STG_DIM_PRODUCTO]
(
	[COD_PRODUCTO],
	[DESC_PRODUCTO]
)
SELECT CAST([COD_Producto] AS Varchar(500)),
	   CAST([Desc_Producto]	AS Varchar(500))   
FROM [DB_COMERCIAL].[dbo].[Producto]
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_PRODUCTO] -- Validacion : STG_DIM_PRODUCTO
-------------------------------------------------------------------------------------------------
-- STG_DIM_CATEGORIA
INSERT INTO [DW_COMERCIAL].[dbo].[STG_DIM_CATEGORIA]
(
	[COD_CATEGORIA],
	[DESC_CATEGORIA]
)
SELECT CAST([COD_Categoria] AS Varchar(500)),
	   CAST([Desc_Categoria] AS Varchar(500))
FROM [DB_COMERCIAL].[dbo].[Categoria]
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_CATEGORIA] -- Validacion : STG_DIM_CATEGORIA
-------------------------------------------------------------------------------------------------
-- STG_DIM_CIENTE
INSERT INTO [DW_COMERCIAL].[dbo].[STG_DIM_CLIENTE]
(
	[COD_CLIENTE],
	[DESC_CLIENTE]
)
SELECT CAST([COD_Cliente] AS Varchar(500)),
	   CAST([Desc_Cliente] AS Varchar(500))
FROM [DB_COMERCIAL].[dbo].[Cliente]
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_CLIENTE] -- Validacion : STG_DIM_CLIENTE
-------------------------------------------------------------------------------------------------
-- STG_DIM_PAIS
INSERT INTO [DW_COMERCIAL].[dbo].[STG_DIM_PAIS]
(
	[COD_PAIS],
	[DESC_PAIS]
)
SELECT CAST([COD_PAIS] AS Varchar(500)),
	   CAST([Desc_Pais] AS Varchar(500))
FROM [DB_COMERCIAL].[dbo].[Pais]
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_PAIS] -- Validacion : STG_DIM_PAIS
-------------------------------------------------------------------------------------------------
-- STG_DIM_VENDEDOR
INSERT INTO [DW_COMERCIAL].[dbo].[STG_DIM_VENDEDOR]
(
	[COD_VENDEDOR],
	[DESC_VENDEDOR]
)
SELECT CAST([COD_Vendedor] AS Varchar(500)),
	   CAST([Desc_Vendedor] AS Varchar(500))
FROM [DB_COMERCIAL].[dbo].[Vendedor]
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_VENDEDOR] -- Validacion : [STG_DIM_VENDEDOR
-------------------------------------------------------------------------------------------------
-- STG_DIM_SUCURSAL
INSERT INTO [DW_COMERCIAL].[dbo].[STG_DIM_SUCURSAL]
(
	[COD_SUCURSAL],
	[DESC_SUCURSAL]
)
SELECT CAST([COD_Sucursal] AS Varchar(500)),
	   CAST([Desc_Sucursal] AS Varchar(500))
FROM [DB_COMERCIAL].[dbo].[Sucursal]
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_SUCURSAL] -- Validacion : STG_DIM_SUCURSAL
-------------------------------------------------------------------------------------------------
-- STG_FACT_VENTAS
INSERT INTO [DW_COMERCIAL].[dbo].[STG_FACT_VENTAS]
(
	[COD_PRODUCTO],
	[COD_CATEGORIA],
	[COD_CLIENTE],
	[COD_PAIS],
	[COD_VENDEDOR],
	[COD_SUCURSAL],
	[FECHA],
	[CANTIDAD_VENDIDA],
	[MONTO_VENDIDO],
	[PRECIO],
	[COMISION_COMERCIAL]
)
SELECT CAST([COD_PRODUCTO] AS Varchar(500)),
	   CAST([COD_CATEGORIA] AS Varchar(500)),
	   CAST([COD_CLIENTE] AS Varchar(500)),
	   CAST([COD_PAIS] AS Varchar(500)),
	   CAST([COD_VENDEDOR] AS Varchar(500)),
	   CAST([COD_SUCURSAL] AS Varchar(500)),
	   CONVERT(varchar(500),[Fecha], 21),
       CAST([Cantidad_Vendida] AS Varchar(500)),
       CAST([Monto_Vendido] AS Varchar(500)),
       CAST([Precio] AS Varchar(500)),
       CAST([Comision_Comercial] AS Varchar(500))
FROM [DB_COMERCIAL].[dbo].[Ventas]
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_FACT_VENTAS] -- Validacion : STG_FACT_VENTAS

