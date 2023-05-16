-- ==============================================================================================================================
-- < Francisco Tramontini >
-- < Modificamos las tablas que correspondan para DW_COMERCIAL >
--
-- 2023-04-05 - Creacion de la query (FRANCISCO_TRAMONTINI_DW_COMERCIAL_ALTER_TABLES)
--			  - Se coloca la clave foreanea en la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_PRODUCTO
--			  - Se coloca la clave foreanea en la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_CATEGORIA
--			  - Se coloca la clave foreanea en la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_CLIENTE
--			  - Se coloca la clave foreanea en la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_PAIS
--			  - Se coloca la clave foreanea en la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_VENDEDOR
--			  - Se coloca la clave foreanea en la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_SUCURSAL
--			  - Se coloca la clave foreanea en la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_TIEMPO
--            - Backup 1 EjercicioIntegrador\BKP\MODIFICACIONDETABLAS
--            - Se ejecuta la query
--            - Se modifica la tabla FACT_VENTAS para la clave foranea PRODUCTO_KEY proveniente de la tabla DIM_PRODUCTO
--            - Se modifica la tabla FACT_VENTAS para la clave foranea CATEGORI_KEY proveniente de la tabla DIM_CATEGORIA
--            - Se modifica la tabla FACT_VENTAS para la clave foranea CLIENTE_KEY proveniente de la tabla DIM_CLIENTE
--            - Se modifica la tabla FACT_VENTAS para la clave foranea PAIS_KEY proveniente de la tabla DIM_PAIS
--            - Se modifica la tabla FACT_VENTAS para la clave foranea VENDEDOR_KEY proveniente de la tabla DIM_VENDEDOR
--            - Se modifica la tabla FACT_VENTAS para la clave foranea SUCURSAL_KEY proveniente de la tabla DIM_SUCURSAL
--            - Se modifica la tabla FACT_VENTAS para la clave foranea TIEMPO_KEY proveniente de la tabla DIM_TIEMPO
--            - Backup 2 EjercicioIntegrador\BKP\MODIFICACIONDETABLAS
-- ==============================================================================================================================
-- FOREIGN KEY de la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_PRODUCTO 
ALTER TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS]
ADD FOREIGN KEY (PRODUCTO_KEY) REFERENCES [DW_COMERCIAL].[dbo].[DIM_PRODUCTO](PRODUCTO_KEY)
-------------------------------------------------------------------------------------------------
-- FOREIGN KEY de la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_CATEGORIA
ALTER TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS]
ADD FOREIGN KEY (CATEGORIA_KEY) REFERENCES [DW_COMERCIAL].[dbo].[DIM_CATEGORIA](CATEGORIA_KEY)
-------------------------------------------------------------------------------------------------
-- FOREIGN KEY de la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_CLIENTE
ALTER TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS]
ADD FOREIGN KEY (CLIENTE_KEY) REFERENCES [DW_COMERCIAL].[dbo].[DIM_CLIENTE](CLIENTE_KEY)
-------------------------------------------------------------------------------------------------
-- FOREIGN KEY de la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_PAIS
ALTER TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS]
ADD FOREIGN KEY (PAIS_KEY) REFERENCES [DW_COMERCIAL].[dbo].[DIM_PAIS](PAIS_KEY)
-------------------------------------------------------------------------------------------------
-- FOREIGN KEY de la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_VENDEDOR
ALTER TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS]
ADD FOREIGN KEY (VENDEDOR_KEY) REFERENCES [DW_COMERCIAL].[dbo].[DIM_VENDEDOR](VENDEDOR_KEY)
-------------------------------------------------------------------------------------------------
-- FOREIGN KEY de la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_SUCURSAL
ALTER TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS]
ADD FOREIGN KEY (SUCURSAL_KEY) REFERENCES [DW_COMERCIAL].[dbo].[DIM_SUCURSAL](SUCURSAL_KEY)
-------------------------------------------------------------------------------------------------
-- FOREIGN KEY de la tabla FACT_VENTAS proveniente de la clave primaria de la tabla DIM_TIEMPO
ALTER TABLE [DW_COMERCIAL].[dbo].[FACT_VENTAS]
ADD FOREIGN KEY (TIEMPO_KEY) REFERENCES [DW_COMERCIAL].[dbo].[DIM_TIEMPO](TIEMPO_KEY)
