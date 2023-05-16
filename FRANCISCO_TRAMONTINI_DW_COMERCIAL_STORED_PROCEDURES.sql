-- ==============================================================================================================================================
-- Francisco Tramontini
-- < Se crean los Stored Procedures para DW_COMERCIAL tanto para las tablas de dimensiones con las tablas INT_<NOMBRE> como para DIM_<NOMBRE>, 
--   ademas para el hecho VENTAS con la tablas INT_FACT_<NOMBRE> y FACT_<NOMBRE> >
--
-- 2023-04-05 - Creacion de la query (FRANCISCO_TRAMONTINI_DW_STORED_PROCEDURES)
--			  - Creacion, ejecucion y validacion del SP : sp_carga_int_PRODUCTO
--			  - Creacion, ejecucion y validacion del SP : Sp_carga_int_CATEGORIA
-- 2023-04-06 - Creacion, ejecucion y validacion del SP : sp_carga_int_CLIENTE
--            - Creacion, ejecucion y validacion del SP : sp_carga_int_PAIS
--            - Creacion, ejecucion y validacion del SP : sp_carga_int_VENDEDOR
--            - Creacion, ejecucion y validacion del SP : sp_carga_int_SUCURSAL
--			  - Creacion, ejecucion y validacion del SP : sp_carga_dim_PRODUCTO
--            - Creacion, ejecucion y validacion del SP : sp_carga_dim_CATEGORIA
--            - Creacion, ejecucion y validacion del SP : sp_carga_dim_CLIENTE
--            - Creacion, ejecucion y validacion del SP : sp_carga_dim_PAIS
--            - Creacion, ejecucion y validacion del SP : sp_carga_dim_VENDEDOR
--            - Creacion, ejecucion y validacion del SP : sp_carga_dim_SUCURSAL
--            - Backup 1 EjercicioIntegrador\BKP\STOREDPROCEDURES
--            - Creacion, ejecucion y validacion del SP : sp_carga_dim_TIEMPO
--			  - Creacion, ejecucion y validacion del SP : sp_carga_int_VENTAS
--            - Creacion, ejecucion y validacion del SP : sp_carga_fact_VENTAS
--            - Backup 2 EjercicioIntegrador\BKP\STOREDPROCEDURES
-- ==============================================================================================================================================
USE [DW_COMERCIAL]
GO

-- Dimensiones
-- Tablas Intermedias : INT_DIM_<NOMBRE>

-- INT_DIM_PRODUCTO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-05>
-- Description:	<Carga de datos para la tabla INT_DIM_PRODUCTO>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_int_PRODUCTO] 

AS

BEGIN

	SET NOCOUNT ON 
	TRUNCATE TABLE [DW_COMERCIAL].[dbo].[INT_DIM_PRODUCTO]
	INSERT INTO [DW_COMERCIAL].[dbo].[INT_DIM_PRODUCTO]
	(
		[COD_PRODUCTO],
		[DESC_PRODUCTO]
	)
	SELECT [COD_PRODUCTO],
		   [DESC_PRODUCTO]
	FROM [DW_COMERCIAL].[dbo].[STG_DIM_PRODUCTO]

END
GO

EXEC [dbo].[sp_carga_int_PRODUCTO] -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_DIM_PRODUCTO] -- Validacion : INT_DIM_PRODUCTO
-------------------------------------------------------------------------------------------------
-- INT_DIM_CATEGORIA
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-05>
-- Description:	<Carga de datos para la tabla INT_DIM_CATEGORIA>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_int_CATEGORIA] 

AS

BEGIN

	SET NOCOUNT ON 
	TRUNCATE TABLE [DW_COMERCIAL].[dbo].[INT_DIM_CATEGORIA]
	INSERT INTO [DW_COMERCIAL].[dbo].[INT_DIM_CATEGORIA]
	(
		[COD_CATEGORIA],
		[DESC_CATEGORIA]
	)
	SELECT [COD_CATEGORIA],
		   [DESC_CATEGORIA]
	FROM [DW_COMERCIAL].[dbo].[STG_DIM_CATEGORIA]

END
GO

EXEC [dbo].[sp_carga_int_CATEGORIA] -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_DIM_CATEGORIA] -- Validacion : INT_DIM_CATEGORIA
-------------------------------------------------------------------------------------------------
-- INT_DIM_CLIENTE
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-06>
-- Description:	<Carga de datos para la tabla INT_DIM_CLIENTE>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_int_CLIENTE] 

AS

BEGIN

	SET NOCOUNT ON 
	TRUNCATE TABLE [DW_COMERCIAL].[dbo].[INT_DIM_CLIENTE]
	INSERT INTO [DW_COMERCIAL].[dbo].[INT_DIM_CLIENTE]
	(
		[COD_CLIENTE],
		[NOMBRE],
		[APELLIDO]
	)
	SELECT [COD_CLIENTE],
		   CAST(SUBSTRING(DESC_CLIENTE, 1, CHARINDEX(' ', DESC_CLIENTE, 1) -1) AS Varchar(500)),
		   CAST(SUBSTRING(DESC_CLIENTE, CHARINDEX(' ', DESC_CLIENTE) + 1, LEN(DESC_CLIENTE)) AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[STG_DIM_CLIENTE]

END
GO

EXEC [dbo].[sp_carga_int_CLIENTE] -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_DIM_CLIENTE] -- Validacion : INT_DIM_CLIENTE
-------------------------------------------------------------------------------------------------
-- INT_DIM_PAIS
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-06>
-- Description:	<Carga de datos para la tabla INT_DIM_PAIS>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_int_PAIS] 

AS

BEGIN

	SET NOCOUNT ON 
	TRUNCATE TABLE [DW_COMERCIAL].[dbo].[INT_DIM_PAIS]
	INSERT INTO [DW_COMERCIAL].[dbo].[INT_DIM_PAIS]
	(
		[COD_PAIS],
		[DESC_PAIS]
	)
	SELECT CAST([COD_PAIS] AS Varchar(3)),
		   [DESC_PAIS]
	FROM [DW_COMERCIAL].[dbo].[STG_DIM_PAIS]

END
GO

EXEC [dbo].[sp_carga_int_PAIS] -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_DIM_PAIS] -- Validacion : INT_DIM_PAIS
-------------------------------------------------------------------------------------------------
-- INT_DIM_VENDEDOR
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-06>
-- Description:	<Carga de datos para la tabla INT_DIM_VENDEDOR>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_int_VENDEDOR] 

AS

BEGIN

	SET NOCOUNT ON 
	TRUNCATE TABLE [DW_COMERCIAL].[dbo].[INT_DIM_VENDEDOR]
	INSERT INTO [DW_COMERCIAL].[dbo].[INT_DIM_VENDEDOR]
	(
		[COD_VENDEDOR],
		[NOMBRE],
		[APELLIDO]
	)
	SELECT [COD_VENDEDOR],
		   CAST(SUBSTRING(DESC_VENDEDOR, 1, CHARINDEX(' ', DESC_VENDEDOR, 1) -1) AS Varchar(500)),
		   CAST(SUBSTRING(DESC_VENDEDOR, CHARINDEX(' ', DESC_VENDEDOR) + 1, LEN(DESC_VENDEDOR)) AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[STG_DIM_VENDEDOR]

END
GO

EXEC [dbo].[sp_carga_int_VENDEDOR] -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_DIM_VENDEDOR] -- Validacion : INT_DIM_VENDEDOR
-------------------------------------------------------------------------------------------------
-- INT_DIM_SUCURSAL
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-06>
-- Description:	<Carga de datos para la tabla INT_DIM_SUCURSAL>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_int_SUCURSAL] 

AS

BEGIN

	SET NOCOUNT ON 
	TRUNCATE TABLE [DW_COMERCIAL].[dbo].[INT_DIM_SUCURSAL]
	INSERT INTO [DW_COMERCIAL].[dbo].[INT_DIM_SUCURSAL]
	(
		[COD_SUCURSAL],
		[DESC_SUCURSAL]
	)
	SELECT [COD_SUCURSAL],
		   [DESC_SUCURSAL]
	FROM [DW_COMERCIAL].[dbo].[STG_DIM_SUCURSAL]

END
GO

EXEC [dbo].[sp_carga_int_SUCURSAL] -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_DIM_SUCURSAL] -- Validacion : INT_DIM_SUCURSAL
-------------------------------------------------------------------------------------------------
-- Dimensiones

-- DIM_PRODUCTO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-06>
-- Description:	<Carga de datos para la tabla DIM_PRODUCTO>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_dim_PRODUCTO] 

AS

BEGIN

	SET NOCOUNT ON 
	-- Se actualizan los registros
	UPDATE DP
	SET DP.DESC_PRODUCTO = IDP.DESC_PRODUCTO,
		DP.FECHA_UPDATE = CAST(CURRENT_TIMESTAMP AS Datetime),
		DP.USUARIO_UPDATE = CAST('Francisco Tramontini' AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[DIM_PRODUCTO] DP
	JOIN [DW_COMERCIAL].[dbo].[INT_DIM_PRODUCTO] IDP ON DP.COD_PRODUCTO = IDP.COD_PRODUCTO

	-- Insertar nuevos registros
	INSERT INTO [DW_COMERCIAL].[dbo].[DIM_PRODUCTO]
	(
		[COD_PRODUCTO],
		[DESC_PRODUCTO],
		[FECHA_ALTA],
		[USUARIO_ALTA]
	)
	SELECT IDP.COD_PRODUCTO,
		   IDP.DESC_PRODUCTO,
		   CAST(CURRENT_TIMESTAMP AS Datetime),
		   CAST('Francisco Tramontini' AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[INT_DIM_PRODUCTO] IDP
	LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_PRODUCTO] DP ON IDP.COD_PRODUCTO = DP.COD_PRODUCTO
	WHERE DP.COD_PRODUCTO IS NULL

END
GO

EXEC [dbo].[sp_carga_dim_PRODUCTO] -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_PRODUCTO] -- Validacion : DIM_PRODUCTO
-------------------------------------------------------------------------------------------------
-- DIM_CATEGORIA
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-06>
-- Description:	<Carga de datos para la tabla DIM_CATEGORIA>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_dim_CATEGORIA] 

AS

BEGIN

	SET NOCOUNT ON 
	-- Se actualizan los registros
	UPDATE DC
	SET	DC.DESC_CATEGORIA = IDC.DESC_CATEGORIA,
		DC.FECHA_UPDATE = CAST(CURRENT_TIMESTAMP AS Datetime),
		DC.USUARIO_UPDATE = CAST('Francisco Tramontini' AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[DIM_CATEGORIA] DC
	JOIN [DW_COMERCIAL].[dbo].[INT_DIM_CATEGORIA] IDC ON DC.COD_CATEGORIA = IDC.COD_CATEGORIA

	-- Insertar nuevos registros
	INSERT INTO [DW_COMERCIAL].[dbo].[DIM_CATEGORIA]
	(
		[COD_CATEGORIA],
		[DESC_CATEGORIA],
		[FECHA_ALTA],
		[USUARIO_ALTA]
	)
	SELECT IDC.COD_CATEGORIA,
		   IDC.DESC_CATEGORIA,
		   CAST(CURRENT_TIMESTAMP AS Datetime),
		   CAST('Francisco Tramontini' AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[INT_DIM_CATEGORIA] IDC
	LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_CATEGORIA] DC ON IDC.COD_CATEGORIA = DC.COD_CATEGORIA
	WHERE DC.COD_CATEGORIA IS NULL

END
GO

EXEC [dbo].[sp_carga_dim_CATEGORIA] -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_CATEGORIA] -- Validacion : DIM_CATEGORIA
-------------------------------------------------------------------------------------------------
-- DIM_CLIENTE
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-06>
-- Description:	<Carga de datos para la tabla DIM_CLIENTE>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_dim_CLIENTE] 

AS

BEGIN

	SET NOCOUNT ON 
	-- Se actualizan los registros
	UPDATE DCL
	SET DCL.NOMBRE = IDCL.NOMBRE,
		DCL.APELLIDO = IDCL.APELLIDO,
		DCL.FECHA_UPDATE = CAST(CURRENT_TIMESTAMP AS Datetime),
		DCL.USUARIO_UPDATE = CAST('Francisco Tramontini' AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[DIM_CLIENTE] DCL
	JOIN [DW_COMERCIAL].[dbo].[INT_DIM_CLIENTE] IDCL ON DCL.COD_CLIENTE = IDCL.COD_CLIENTE

	-- Insertar nuevos registros
	INSERT INTO [DW_COMERCIAL].[dbo].[DIM_CLIENTE]
	(
		[COD_CLIENTE],
		[NOMBRE],
		[APELLIDO],
		[FECHA_ALTA],
		[USUARIO_ALTA]
	)
	SELECT IDCL.COD_CLIENTE,
		   IDCL.NOMBRE,
		   IDCL.APELLIDO,
		   CAST(CURRENT_TIMESTAMP AS Datetime),
		   CAST('Francisco Tramontini' AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[INT_DIM_CLIENTE] IDCL
	LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_CLIENTE] DCL ON IDCL.COD_CLIENTE = DCL.COD_CLIENTE
	WHERE DCL.COD_CLIENTE IS NULL

END
GO

EXEC [dbo].[sp_carga_dim_CLIENTE] -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_CLIENTE] -- Validacion : DIM_CLIENTE
-------------------------------------------------------------------------------------------------
-- DIM_PAIS
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-06>
-- Description:	<Carga de datos para la tabla DIM_PAIS>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_dim_PAIS] 

AS

BEGIN

	SET NOCOUNT ON 
	-- Se actualizan los registros
	UPDATE DPA
	SET DPA.DESC_PAIS = IDPA.DESC_PAIS,
		DPA.FECHA_UPDATE = CAST(CURRENT_TIMESTAMP AS Datetime),
		DPA.USUARIO_UPDATE = CAST('Francisco Tramontini' AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[DIM_PAIS] DPA
	JOIN [DW_COMERCIAL].[dbo].[INT_DIM_PAIS] IDPA ON DPA.COD_PAIS = IDPA.COD_PAIS

	-- Insertar nuevos registros
	INSERT INTO [DW_COMERCIAL].[dbo].[DIM_PAIS]
	(
		[COD_PAIS],
		[DESC_PAIS],
		[FECHA_ALTA],
		[USUARIO_ALTA]
	)
	SELECT IDPA.COD_PAIS,
		   IDPA.DESC_PAIS,
		   CAST(CURRENT_TIMESTAMP AS Datetime),
		   CAST('Francisco Tramontini' AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[INT_DIM_PAIS] IDPA
	LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_PAIS] DPA ON IDPA.COD_PAIS = DPA.COD_PAIS
	WHERE DPA.COD_PAIS IS NULL

END
GO

EXEC [dbo].[sp_carga_dim_PAIS] -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_PAIS] -- Validacion : DIM_PAIS
-------------------------------------------------------------------------------------------------
-- DIM_VENDEDOR
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-06>
-- Description:	<Carga de datos para la tabla DIM_VENDEDOR>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_dim_VENDEDOR] 

AS

BEGIN

	SET NOCOUNT ON 
	-- Se actualizan los registros
	UPDATE DV
	SET	DV.NOMBRE = IDV.NOMBRE,
		DV.APELLIDO = IDV.APELLIDO,
		DV.FECHA_UPDATE = CAST(CURRENT_TIMESTAMP AS Datetime),
		DV.USUARIO_UPDATE = CAST('Francisco Tramontini' AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[DIM_VENDEDOR] DV
	JOIN [DW_COMERCIAL].[dbo].[INT_DIM_VENDEDOR] IDV ON DV.COD_VENDEDOR = IDV.COD_VENDEDOR

	-- Insertar nuevos registros
	INSERT INTO [DW_COMERCIAL].[dbo].[DIM_VENDEDOR]
	(
		[COD_VENDEDOR],
		[NOMBRE],
		[APELLIDO],
		[FECHA_ALTA],
		[USUARIO_ALTA]
	)
	SELECT IDV.COD_VENDEDOR,
		   IDV.NOMBRE,
		   IDV.APELLIDO,
		   CAST(CURRENT_TIMESTAMP AS Datetime),
		   CAST('Francisco Tramontini' AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[INT_DIM_VENDEDOR] IDV
	LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_VENDEDOR] DV ON IDV.COD_VENDEDOR = DV.COD_VENDEDOR
	WHERE DV.COD_VENDEDOR IS NULL

END
GO

EXEC [dbo].[sp_carga_dim_VENDEDOR] -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_VENDEDOR] -- Validacion : DIM_VENDEDOR
-------------------------------------------------------------------------------------------------
-- DIM_SUCURSAL
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-06>
-- Description:	<Carga de datos para la tabla DIM_SUCURSAL>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_dim_SUCURSAL] 

AS

BEGIN

	SET NOCOUNT ON 
	-- Se actualizan los registros
	UPDATE DS
	SET	DS.DESC_SUCURSAL = IDS.DESC_SUCURSAL,
		DS.FECHA_UPDATE = CAST(CURRENT_TIMESTAMP AS Datetime),
		DS.USUARIO_UPDATE = CAST('Francisco Tramontini' AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[DIM_SUCURSAL] DS
	JOIN [DW_COMERCIAL].[dbo].[INT_DIM_SUCURSAL] IDS ON DS.COD_SUCURSAL = IDS.COD_SUCURSAL

	-- Insertar nuevos registros
	INSERT INTO [DW_COMERCIAL].[dbo].[DIM_SUCURSAL]
	(
		[COD_SUCURSAL],
		[DESC_SUCURSAL],
		[FECHA_ALTA],
		[USUARIO_ALTA]
	)
	SELECT IDS.COD_SUCURSAL,
		   IDS.DESC_SUCURSAL,
		   CAST(CURRENT_TIMESTAMP AS Datetime),
		   CAST('Francisco Tramontini' AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[INT_DIM_SUCURSAL] IDS
	LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_SUCURSAL] DS ON IDS.COD_SUCURSAL = DS.COD_SUCURSAL
	WHERE DS.COD_SUCURSAL IS NULL

END
GO

EXEC [dbo].[sp_carga_dim_SUCURSAL] -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_SUCURSAL] -- Validacion : DIM_SUCURSAL
-------------------------------------------------------------------------------------------------
-- DIM_TIEMPO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-06>
-- Description:	<Carga de datos para la tabla DIM_TIEMPO>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_dim_TIEMPO]

@anio Int

AS

SET NOCOUNT ON
SET ARITHABORT OFF
SET ARITHIGNORE ON

-- Variables

SET DATEFIRST 1;
SET DATEFORMAT mdy
DECLARE @dia Smallint
DECLARE @mes Smallint
DECLARE @f_txt Varchar(10)
DECLARE @fecha Smalldatetime
DECLARE @key Int
DECLARE @vacio Smallint
DECLARE @fin Smallint
DECLARE @fin_mes Int
DECLARE @anioperiodicidad Int
SELECT @dia = 1
SELECT @mes = 1
SELECT @f_txt = CONVERT(CHAR(2), @mes) + '/' + CONVERT(CHAR(2), @dia) + '/' + CONVERT(CHAR(4), @anio)
SELECT @fecha = CONVERT(Smalldatetime, @f_txt)
select @anioperiodicidad = @anio

-- Se chequea que el año a procesar, no exista en la tabla TIME
IF (SELECT COUNT(*) FROM [DW_COMERCIAL].[dbo].[DIM_TIEMPO] WHERE ANIO = @anio) > 0

BEGIN

PRINT 'El año que ingreso ya existe en la tabla'
PRINT 'Procedimiento CANCELADO.................'
RETURN 0

END

-- Se inserta dia a dia, hasta terminar el año

SELECT @fin = @anio + 1
WHILE (@anio < @fin)

BEGIN

--Armo la fecha
IF LEN(RTRIM(CONVERT(CHAR(2), DATEPART(mm, @fecha)))) = 1

BEGIN

IF LEN(RTRIM(CONVERT(CHAR(2), DATEPART(dd, @fecha)))) = 1
	SET @f_txt = CONVERT(CHAR(4), DATEPART(yyyy, @fecha)) + '0' + RTRIM(CONVERT(CHAR(2), DATEPART(mm, @fecha))) + '0' + RTRIM(CONVERT(CHAR(2), DATEPART(dd, @fecha)))
ELSE
	SET @f_txt = CONVERT(CHAR(4), DATEPART(yyyy, @fecha)) + '0' + RTRIM(CONVERT(CHAR(2), DATEPART(mm, @fecha))) + CONVERT(CHAR(2), DATEPART(dd, @fecha))
END
ELSE
BEGIN

IF LEN(RTRIM(CONVERT(CHAR(2), DATEPART(dd, @fecha)))) = 1
SET @f_txt = CONVERT(CHAR(4), DATEPART(yyyy, @fecha)) + CONVERT(CHAR(2), DATEPART(mm, @fecha)) + '0' + RTRIM(CONVERT(CHAR(2), DATEPART(dd, @fecha)))
ELSE
SET @f_txt = CONVERT(CHAR(4), DATEPART(yyyy, @fecha)) + CONVERT(CHAR(2), DATEPART(mm, @fecha)) + CONVERT(CHAR(2), DATEPART(dd, @fecha))
END

--Calculo el último día del mes

SET @fin_mes = DAY(DATEADD(d, -1, DATEADD(m, 1, DATEADD(d, - DAY(@fecha) + 1, @fecha))))
INSERT [DW_COMERCIAL].[dbo].[DIM_TIEMPO] (TIEMPO_KEY, ANIO, MES_NRO, MES_NOMBRE, SEMESTRE, TRIMESTRE, SEMANA_ANIO, SEMANA_NRO_MES, DIA, DIA_NOMBRE, DIA_SEMANA_NRO, FECHA_ALTA, USUARIO_ALTA)
SELECT
TIEMPO_KEY = @fecha, 
ANIO = DATEPART(yyyy, @fecha), 
MES_NRO = DATEPART(mm, @fecha),
--, mes_nombre = Datename(mm, @fecha)
MES_NOMBRE = CAST(CASE DATENAME(mm, @fecha)
				   WHEN 'January' THEN 'Enero'
				   WHEN 'February' THEN 'Febrero'
				   WHEN 'March' THEN 'Marzo'
				   WHEN 'April' THEN 'Abril'
				   WHEN 'May' THEN 'Mayo'
				   WHEN 'June' THEN 'Junio'
				   WHEN 'July' THEN 'Julio'
				   WHEN 'August' THEN 'Agosto'
				   WHEN 'September' THEN 'Septiembre'
				   WHEN 'October' THEN 'Octubre'
				   WHEN 'November' THEN 'Noviembre'
				   WHEN 'December' THEN 'Diciembre'
			   ELSE DATENAME(mm, @fecha)
			   END AS Varchar(15)),
SEMESTRE = CASE DATEPART(mm, @fecha)
				WHEN (SELECT DATEPART(mm, @fecha)
				       WHERE DATEPART(mm, @fecha) BETWEEN 1 AND 6) THEN 1
				ELSE 2
				END,
TRIMESTRE = DATEPART(qq, @fecha), 
SEMANA_ANIO = DATEPART(wk, @fecha),
SEMANA_NRO_MES = DATEPART(wk, @fecha) - DATEPART(week, DATEADD(dd,-day(@fecha)+1, @fecha)) + 1,
DIA = DATEPART(dd, @fecha),
DIA_NOMBRE = CAST(CASE DATENAME(dw, @fecha)
				WHEN 'Monday' THEN 'Lunes'
				WHEN 'Tuesday' THEN 'Martes'
				WHEN 'Wednesday' THEN 'Miercoles'
				WHEN 'Thursday' THEN 'Jueves'
				WHEN 'Friday' THEN 'Viernes'
				WHEN 'Saturday' THEN 'Sabado'
				WHEN 'Sunday' THEN 'Domingo'
			 ELSE DATENAME(dw, @fecha)
			 END AS Varchar(20)),
--, dia_nombre = Datename(dw, @fecha)
DIA_SEMANA_NRO = DATEPART(dw, @fecha),
FECHA_ALTA = CAST(CURRENT_TIMESTAMP AS Datetime),
USUARIO_ALTA = CAST('Francisco Tramontini' AS Varchar(500))
SELECT @fecha = DATEADD(dd, 1, @fecha)
SELECT @dia = DATEPART(dd, @fecha)
SELECT @mes = DATEPART(mm, @fecha)
SELECT @anio = DATEPART(yy, @fecha)
CONTINUE

END

-- Ejecucion del SP con los años 2014 a 2025 y carga de datos
EXEC sp_carga_dim_tiempo 2014
EXEC sp_carga_dim_tiempo 2015
EXEC sp_carga_dim_tiempo 2016
EXEC sp_carga_dim_tiempo 2017
EXEC sp_carga_dim_tiempo 2018
EXEC sp_carga_dim_tiempo 2019
EXEC sp_carga_dim_tiempo 2020
EXEC sp_carga_dim_tiempo 2021
EXEC sp_carga_dim_tiempo 2022
EXEC sp_carga_dim_tiempo 2023
EXEC sp_carga_dim_tiempo 2024
EXEC sp_carga_dim_tiempo 2025
SELECT * FROM [DW_COMERCIAL].[dbo].[DIM_TIEMPO] -- Validacion : DIM_TIEMPO
-------------------------------------------------------------------------------------------------

-- Tabla intermedia
-- Hecho

-- INT_FACT_VENTAS
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =================================================================
-- Create date: <2023-04-06>
-- Description:	<Carga de datos para la tabla INT_FACT_VENTAS>
-- =================================================================
CREATE PROCEDURE [dbo].[sp_carga_int_VENTAS] 

AS

BEGIN

	SET NOCOUNT ON 
	TRUNCATE TABLE [DW_COMERCIAL].[dbo].[INT_FACT_VENTAS]
	INSERT INTO [DW_COMERCIAL].[dbo].[INT_FACT_VENTAS]
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
	SELECT CAST([COD_PRODUCTO] AS Varchar(100)),
		   CAST([COD_CATEGORIA] AS Varchar(100)),
		   CAST([COD_CLIENTE] AS Varchar(100)),
		   CAST([COD_PAIS] AS Varchar(100)),
		   CAST([COD_VENDEDOR] AS Varchar(100)),
		   CAST([COD_SUCURSAL] AS Varchar(100)),
		   CAST([FECHA] AS Smalldatetime),
		   CAST([CANTIDAD_VENDIDA] AS Decimal(18,2)),
		   CAST([MONTO_VENDIDO] AS Decimal(18,2)),
		   CAST([PRECIO] AS Decimal(18,2)),
		   CAST([COMISION_COMERCIAL] AS Decimal(18,2))
	FROM [DW_COMERCIAL].[dbo].[STG_FACT_VENTAS]

END
GO

EXEC [dbo].[sp_carga_int_VENTAS] -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[INT_FACT_VENTAS] -- Validacion : INT_FACT_VENTAS
-------------------------------------------------------------------------------------------------
-- FACT_VENTAS
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sp_carga_fact_VENTAS] 

@fechaDes Smalldatetime,
@fechaHas Smalldatetime

AS

BEGIN

	SET NOCOUNT ON 

	-- Insertar nuevos registros
	INSERT INTO [DW_COMERCIAL].[dbo].[FACT_VENTAS]
	(
		[PRODUCTO_KEY],
		[CATEGORIA_KEY],
		[CLIENTE_KEY],
		[PAIS_KEY],
		[VENDEDOR_KEY],
		[SUCURSAL_KEY],
		[TIEMPO_KEY],
		[CANTIDAD_VENDIDA],
		[MONTO_VENDIDO],
		[PRECIO],
		[COMISION_COMERCIAL],
		[FECHA_ALTA],
		[USUARIO_ALTA]
	)
	SELECT ISNULL(DP.PRODUCTO_KEY, -1) AS PRODUCTO_KEY,
	       ISNULL(DC.CATEGORIA_KEY, -1) AS CATEGORIA_KEY,
		   ISNULL(DCL.CLIENTE_KEY, -1) AS CLIENTE_KEY,
		   ISNULL(DPA.PAIS_KEY, -1) AS PAIS_KEY,
		   ISNULL(DV.VENDEDOR_KEY, -1) AS VENDEDOR_KEY,
		   ISNULL(DS.SUCURSAL_KEY, -1) AS SUCURSAL_KEY,
		   ISNULL(DT.TIEMPO_KEY, '1900-01-01') AS TIEMPO_KEY,
		   IFV.CANTIDAD_VENDIDA,
		   IFV.MONTO_VENDIDO,
		   IFV.PRECIO,
		   IFV.COMISION_COMERCIAL,
		   CAST(CURRENT_TIMESTAMP AS Datetime),
		   CAST('Francisco Tramontini' AS Varchar(500))
	FROM [DW_COMERCIAL].[dbo].[INT_FACT_VENTAS] IFV
	LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_PRODUCTO] DP ON IFV.COD_PRODUCTO = DP.COD_PRODUCTO
	LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_CATEGORIA] DC ON IFV.COD_CATEGORIA = DC.COD_CATEGORIA
	LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_CLIENTE] DCL ON IFV.COD_CLIENTE = DCL.COD_CLIENTE
	LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_PAIS] DPA ON IFV.COD_PAIS = DPA.COD_PAIS
	LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_VENDEDOR] DV ON IFV.COD_VENDEDOR = DV.COD_VENDEDOR
	LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_SUCURSAL] DS ON IFV.COD_SUCURSAL = DS.COD_SUCURSAL
	LEFT JOIN [DW_COMERCIAL].[dbo].[DIM_TIEMPO] DT ON IFV.FECHA = DT.TIEMPO_KEY
	WHERE IFV.FECHA BETWEEN @fechaDes AND @fechaHas

END
GO

EXEC sp_carga_fact_VENTAS '2016-01-01', '2021-12-31' -- Ejecucion del SP y carga de datos
SELECT * FROM [DW_COMERCIAL].[dbo].[FACT_VENTAS] -- Validacion