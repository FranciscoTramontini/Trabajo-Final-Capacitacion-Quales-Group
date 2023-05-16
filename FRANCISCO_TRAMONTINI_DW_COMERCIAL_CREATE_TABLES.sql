-- ==============================================================================================================================
-- < Francisco Tramontini >
-- < Creacion de tablas para DW_COMERCIAL >
--
-- 2023-04-04 - Creacion de la query (FRANCISCO_TRAMONTINI_DW_COMERCIAL_CREATE_TABLES)
--			  - Creacion de las tablas para la dimension (PRODUCTO) - STG_DIM_PRODUCTO, INT_DIM_PRODUCTO, DIM_PRODUCTO
--			  - Creacion de las tablas para la dimension (CATEGORIA) - STG_DIM_CATEGORIA, INT_DIM_CATEGORIA, DIM_CATEGORIA
--			  - Creacion de las tablas para la dimension (CLIENTE) - STG_DIM_CLIENTE, INT_DIM_CLIENTE, DIM_CLIENTE
--            - Creacion de las tablas para la dimension (PAIS) - STG_DIM_PAIS, INT_DIM_PAIS, DIM_PAIS
--            - Creacion de las tablas para la dimension (VENDEDOR) - STG_DIM_VENDEDOR, INT_DIM_VENDEDOR, DIM_VENDEDOR
--            - Creacion de las tablas para la dimension (SUCURSAL) - STG_DIM_SUCURSAL, INT_DIM_SUCURSAL, DIM_SUCURSAL
--            - Creacion de las tablas para la dimension (TIEMPO) - DIM_TIEMPO
--            - Creacion de las tablas para el hecho (VENTAS) - STG_FACT_VENTAS, INT_FACT_VENTAS, FACT_VENTAS
--            - Backup 1 EjercicioIntegrador\BKP\CREACIONDETABLAS
--            - Creacion de codigo de validacion de datos para cada una de las tablas STG_DIM Y STG_FACT creadas anterirmente
--            - Backup 2 EjercicioIntegrador\BKP\CREACIONDETABLAS
--            - Se ejecuta la query
--            - Se crean las tablas y se validan los datos de la dimension (PRODUCTO) correctamente
--            - Se crean las tablas y se validan los datos de la dimension (CATEGORIA) correctamente
--            - Se crean las tablas y se validan los datos de la dimension (CLIENTE) correctamente
--            - Se crean las tablas y se validan los datos de la dimension (PAIS) correctamente
--            - Se crean las tablas y se validan los datos de la dimension (VENDEDOR) correctamente
--            - Se crean las tablas y se validan los datos de la dimension (SUCURSAL) correctamente
--            - Se crean la tabla y se validan los datos de la dimension (TIEMPO) correctamente
--            - Se crean las tablas y se validan los datos del hecho (VENTAS) correctamente
--            - Backup 3 EjercicioIntegrador\BKP\CREACIONDETABLAS
-- ==============================================================================================================================

-- Dimensiones

-- Dimension : PRODUCTO 
-- STG_DIM_PRODUCTO
CREATE TABLE [DW_COMERCIAL].[dbo].[STG_DIM_PRODUCTO] 
(
	[COD_PRODUCTO] Varchar(500) NULL,
	[DESC_PRODUCTO] Varchar(500) NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_PRODUCTO] -- Validacion : STG_DIM_PRODUCTO

-- INT_DIM_PRODUCTO
CREATE TABLE [DW_COMERCIAL].[dbo].[INT_DIM_PRODUCTO] 
(
	[COD_PRODUCTO] Varchar(500) NOT NULL,
	[DESC_PRODUCTO] Varchar(500) NOT NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_DIM_PRODUCTO] -- Validacion : INT_DIM_PRODUCTO

-- DIM_PRODUCTO
CREATE TABLE [DW_COMERCIAL].[dbo].[DIM_PRODUCTO] 
(
	[PRODUCTO_KEY] Integer Identity Primary Key NOT NULL,
	[COD_PRODUCTO] Varchar(500) NOT NULL,
	[DESC_PRODUCTO] Varchar(500) NOT NULL,
	[FECHA_ALTA] Datetime NULL,
	[USUARIO_ALTA] Varchar(500) NULL,
	[FECHA_UPDATE] Datetime NULL,
	[USUARIO_UPDATE] Varchar(500) NULL,
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_PRODUCTO] -- Validacion : DIM_PRODUCTO
-------------------------------------------------------------------------------------------------
-- Dimension : CATEGORIA
-- STG_DIM_CATEGORIA
CREATE TABLE [DW_COMERCIAL].[dbo].[STG_DIM_CATEGORIA] 
(
	[COD_CATEGORIA] Varchar(500) NULL,
	[DESC_CATEGORIA] Varchar(500) NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_CATEGORIA] -- Validacion : STG_DIM_CATEGORIA

-- INT_DIM_CATEGORIA
CREATE TABLE [DW_COMERCIAL].[dbo].[INT_DIM_CATEGORIA] 
(
	[COD_CATEGORIA] Varchar(500) NOT NULL,
	[DESC_CATEGORIA] Varchar(500) NOT NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_DIM_CATEGORIA] -- Validacion : INT_DIM_CATEGORIA

-- DIM_CATEGORIA
CREATE TABLE [DW_COMERCIAL].[dbo].[DIM_CATEGORIA] 
(
	[CATEGORIA_KEY] Integer Identity Primary Key NOT NULL,
	[COD_CATEGORIA] Varchar(500) NOT NULL,
	[DESC_CATEGORIA] Varchar(500) NOT NULL,
	[FECHA_ALTA] Datetime NULL,
	[USUARIO_ALTA] Varchar(500) NULL,
	[FECHA_UPDATE] Datetime NULL,
	[USUARIO_UPDATE] Varchar(500) NULL,
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_CATEGORIA] -- Validacion : DIM_CATEGORIA

-------------------------------------------------------------------------------------------------
-- Dimension : CLIENTE
-- STG_DIM_CLIENTE
CREATE TABLE [DW_COMERCIAL].[dbo].[STG_DIM_CLIENTE] 
(
	[COD_CLIENTE] Varchar(500) NULL,
	[DESC_CLIENTE] Varchar(500) NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_CLIENTE] -- Validacion : STG_DIM_CLIENTE

-- INT_DIM_CLIENTE
CREATE TABLE [DW_COMERCIAL].[dbo].[INT_DIM_CLIENTE] 
(
	[COD_CLIENTE] Varchar(500) NOT NULL,
	[NOMBRE] Varchar(500) NOT NULL,
	[APELLIDO] Varchar(500) NOT NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_DIM_CLIENTE] -- Validacion : INT_DIM_CLIENTE

-- DIM_CLIENTE
CREATE TABLE [DW_COMERCIAL].[dbo].[DIM_CLIENTE] 
(
	[CLIENTE_KEY] Integer Identity Primary Key NOT NULL,
	[COD_CLIENTE] Varchar(500) NOT NULL,
	[NOMBRE] Varchar(500) NOT NULL,
	[APELLIDO] Varchar(500) NOT NULL,
	[FECHA_ALTA] Datetime NULL,
	[USUARIO_ALTA] Varchar(500) NULL,
	[FECHA_UPDATE] Datetime NULL,
	[USUARIO_UPDATE] Varchar(500) NULL,
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_CLIENTE] -- Validacion : DIM_CLIENTE
-------------------------------------------------------------------------------------------------
-- Dimension : PAIS
-- STG_DIM_PAIS
CREATE TABLE [DW_COMERCIAL].[dbo].[STG_DIM_PAIS] 
(
	[COD_PAIS] Varchar(500) NULL,
	[DESC_PAIS] Varchar(500) NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_PAIS] -- Validacion : STG_DIM_PAIS

-- INT_DIM_PAIS
CREATE TABLE [DW_COMERCIAL].[dbo].[INT_DIM_PAIS] 
(
	[COD_PAIS] Varchar(3) NOT NULL,
	[DESC_PAIS] Varchar(500) NOT NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_DIM_PAIS] -- Validacion : INT_DIM_PAIS

-- DIM_PAIS
CREATE TABLE [DW_COMERCIAL].[dbo].[DIM_PAIS] 
(
	[PAIS_KEY] Integer Identity Primary Key NOT NULL,
	[COD_PAIS] Varchar(3) NOT NULL,
	[DESC_PAIS] Varchar(500) NOT NULL,
	[FECHA_ALTA] Datetime NULL,
	[USUARIO_ALTA] Varchar(500) NULL,
	[FECHA_UPDATE] Datetime NULL,
	[USUARIO_UPDATE] Varchar(500) NULL,
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_PAIS] -- Validacion : DIM_PAIS
-------------------------------------------------------------------------------------------------
-- Dimension : VENDEDOR
-- STG_DIM_VENDEDOR
CREATE TABLE [DW_COMERCIAL].[dbo].[STG_DIM_VENDEDOR] 
(
	[COD_VENDEDOR] Varchar(500) NULL,
	[DESC_VENDEDOR] Varchar(500) NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_VENDEDOR] -- Validacion : STG_DIM_VENDEDOR

-- INT_DIM_VENDEDOR
CREATE TABLE [DW_COMERCIAL].[dbo].[INT_DIM_VENDEDOR] 
(
	[COD_VENDEDOR] Varchar(500) NOT NULL,
	[NOMBRE] Varchar(500) NOT NULL,
	[APELLIDO] Varchar(500) NOT NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_DIM_VENDEDOR] -- Validacion : INT_DIM_VENDEDOR

-- DIM_VENDEDOR
CREATE TABLE [DW_COMERCIAL].[dbo].[DIM_VENDEDOR] 
(
	[VENDEDOR_KEY] Integer Identity Primary Key NOT NULL,
	[COD_VENDEDOR] Varchar(500) NOT NULL,
	[NOMBRE] Varchar(500) NOT NULL,
	[APELLIDO] Varchar(500) NOT NULL,
	[FECHA_ALTA] Datetime NULL,
	[USUARIO_ALTA] Varchar(500) NULL,
	[FECHA_UPDATE] Datetime NULL,
	[USUARIO_UPDATE] Varchar(500) NULL,
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_VENDEDOR] -- Validacion : DIM_VENDEDOR
-------------------------------------------------------------------------------------------------
-- Dimension : SUCURSAL
-- STG_DIM_SUCURSAL
CREATE TABLE [DW_COMERCIAL].[dbo].[STG_DIM_SUCURSAL] 
(
	[COD_SUCURSAL] Varchar(500) NULL,
	[DESC_SUCURSAL] Varchar(500) NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_DIM_SUCURSAL] -- Validacion : STG_DIM_SUCURSAL

-- INT_DIM_SUCURSAL
CREATE TABLE [DW_COMERCIAL].[dbo].[INT_DIM_SUCURSAL] 
(
	[COD_SUCURSAL] Varchar(500) NOT NULL,
	[DESC_SUCURSAL] Varchar(500) NOT NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_DIM_SUCURSAL] -- Validacion : INT_DIM_SUCURSAL

-- DIM_SUCURSAL
CREATE TABLE [DW_COMERCIAL].[dbo].[DIM_SUCURSAL] 
(
	[SUCURSAL_KEY] Integer Identity Primary Key NOT NULL,
	[COD_SUCURSAL] Varchar(500) NOT NULL,
	[DESC_SUCURSAL] Varchar(500) NOT NULL,
	[FECHA_ALTA] Datetime NULL,
	[USUARIO_ALTA] Varchar(500) NULL,
	[FECHA_UPDATE] Datetime NULL,
	[USUARIO_UPDATE] Varchar(500) NULL,
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_SUCURSAL] -- Validacion : DIM_SUCURSAL
-------------------------------------------------------------------------------------------------
-- Dimension : TIEMPO
-- DIM_TIEMPO
CREATE TABLE [DW_COMERCIAL].[dbo].[DIM_TIEMPO] 
(
	[TIEMPO_KEY] Smalldatetime Primary Key NOT NULL,
	[ANIO] Integer NULL,
	[MES_NRO] Integer NULL,
	[MES_NOMBRE] Varchar(15) NULL,
	[SEMESTRE] Integer NULL,
	[TRIMESTRE] Integer NULL,
	[SEMANA_ANIO] Integer NULL,
	[SEMANA_NRO_MES] Integer NULL,
	[DIA] Integer NULL,
	[DIA_NOMBRE] Varchar(20) NULL,
	[DIA_SEMANA_NRO] Integer NULL,
	[FECHA_ALTA] Datetime NULL,
	[USUARIO_ALTA] Varchar(500) NULL,
	[FECHA_UPDATE] Datetime NULL,
	[USUARIO_UPDATE] Varchar(500) NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_TIEMPO] -- Validacion : DIM_TIEMPO
-------------------------------------------------------------------------------------------------

-- Hechos

-- STG_FACT_VENTAS
CREATE TABLE [DW_COMERCIAL].[dbo].[STG_FACT_VENTAS] 
(
	[COD_PRODUCTO] Varchar(500) NULL,
	[COD_CATEGORIA] Varchar(500) NULL,
	[COD_CLIENTE] Varchar(500) NULL,
	[COD_PAIS] Varchar(500) NULL,
	[COD_VENDEDOR] Varchar(500) NULL,
	[COD_SUCURSAL] Varchar(500) NULL,
	[FECHA] Varchar(500) NULL,
	[CANTIDAD_VENDIDA] Varchar(500) NULL,
	[MONTO_VENDIDO] Varchar(500) NULL,
	[PRECIO] Varchar(500) NULL,
	[COMISION_COMERCIAL] Varchar(500) NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[STG_FACT_VENTAS] -- Validacion : STG_FACT_VENTAS

-- INT_FACT_VENTAS
CREATE TABLE [DW_COMERCIAL].[dbo].[INT_FACT_VENTAS] 
(
	[COD_PRODUCTO] Varchar(100) NOT NULL,
	[COD_CATEGORIA] Varchar(100) NOT NULL,
	[COD_CLIENTE] Varchar(100) NOT NULL,
	[COD_PAIS] Varchar(100) NOT NULL,
	[COD_VENDEDOR] Varchar(100) NOT NULL,
	[COD_SUCURSAL] Varchar(100) NOT NULL,
	[FECHA] Smalldatetime NOT NULL,
	[CANTIDAD_VENDIDA] Decimal(18,2) NULL,
	[MONTO_VENDIDO] Decimal(18,2) NULL,
	[PRECIO] Decimal(18,2) NULL,
	[COMISION_COMERCIAL] Decimal(18,2) NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_FACT_VENTAS] -- Validacion : INT_FACT_VENTAS

-- FACT_VENTAS
CREATE TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS] 
(
	[PRODUCTO_KEY] Integer NOT NULL,
	[CATEGORIA_KEY] Integer NOT NULL,
	[CLIENTE_KEY] Integer NOT NULL,
	[PAIS_KEY] Integer NOT NULL,
	[VENDEDOR_KEY] Integer NOT NULL,
	[SUCURSAL_KEY] Integer NOT NULL,
	[TIEMPO_KEY] Smalldatetime NOT NULL,
	[CANTIDAD_VENDIDA] Decimal(18,2) NULL,
	[MONTO_VENDIDO] Decimal(18,2) NULL,
	[PRECIO] Decimal(18,2) NULL,
	[COMISION_COMERCIAL] Decimal(18,2) NULL,
	[FECHA_ALTA] Datetime NULL,
	[USUARIO_ALTA] Varchar(500) NULL
) ON [PRIMARY]
GO
SELECT * FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS] -- Validacion : FACT_VENTAS