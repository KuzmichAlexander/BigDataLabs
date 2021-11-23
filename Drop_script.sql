USE [OLAP_Balance_Teplo_DB]
GO

ALTER TABLE [dbo].[T_OLAP_Fact_Balance_Teplo] DROP CONSTRAINT [FK_T_OLAP_HeatBalance_Technology_Facts_T_OLAP_Dates]
GO

ALTER TABLE [dbo].[T_OLAP_Fact_Balance_Teplo] DROP CONSTRAINT [FK_T_OLAP_HeatBalance_Technology_Facts_T_Furnaces]
GO

/****** Object:  Table [dbo].[T_OLAP_Dim_Dates]    Script Date: 20.11.2021 17:03:59 ******/
DROP TABLE [dbo].[T_OLAP_Dim_Dates]
GO

/****** Object:  Table [dbo].[T_OLAP_Dim_Pech]    Script Date: 20.11.2021 17:03:59 ******/
DROP TABLE [dbo].[T_OLAP_Dim_Pech]
GO

/****** Object:  Table [dbo].[T_OLAP_Fact_Balance_Teplo]    Script Date: 20.11.2021 17:03:59 ******/
DROP TABLE [dbo].[T_OLAP_Fact_Balance_Teplo]
GO

