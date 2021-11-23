USE [OLAP_Balance_Teplo_DB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T_OLAP_Dim_Pech](
	[PK_Номер печи] [tinyint] NOT NULL,
	[Наименование печи] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_T_Furnaces] PRIMARY KEY CLUSTERED 
(
	[PK_Номер печи] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[T_OLAP_Dim_Dates](
	[PK_Дата] [smalldatetime] NOT NULL,
	[Месяц]  AS ([dbo].[DateToMonth]([PK_Дата])),
	[Год]  AS (datepart(year,[PK_Дата])),
 CONSTRAINT [PK_T_OLAP_Dates] PRIMARY KEY CLUSTERED 
(
	[PK_Дата] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[T_OLAP_Fact_Balance_Teplo](
	[FK_Дата] [smalldatetime] NOT NULL,
	[FK_Номер печи] [tinyint] NOT NULL,
	[Приход тепла: горение кокса, кДж/кг чугуна] [float] NULL,
	[Приход тепла: физическое тепло дутья, кДж/кг чугуна] [float] NULL,
	[Приход тепла: тепло от горения природного газа, кДж/кг чугуна] [float] NULL,
	[Приход тепла: тепло шлакообразования, кДж/кг чугуна] [float] NULL,
	[Расход тепла: восстановление оксидов Fe, кДж/кг чугуна] [float] NULL,
	[Расход тепла: восстановление оксидов примесей, кДж/кг чугуна] [float] NULL,
	[Расход тепла: десульфурация чугуна, кДж/кг чугуна] [float] NULL,
	[Расход тепла: восстановление оксидов Fe водородом, кДж/кг чугуна] [float] NULL,
	[Расход тепла: нагрев чугуна, кДж/кг чугуна] [float] NULL,
	[Расход тепла: нагрев шлака, кДж/кг чугуна] [float] NULL,
	[Расход тепла: разложение влаги дутья, кДж/кг чугуна] [float] NULL,
	[Расход тепла: разложение известняка, кДж/кг чугуна] [float] NULL,
	[Расход тепла: разложение влаги шихты, кДж/кг чугуна] [float] NULL,
	[Расход тепла: тепло колошникового газа, кДж/кг чугуна] [float] NULL,
	[Расход тепла: тепловые потери, кДж/кг чугуна] [float] NULL,
	[Общий приход/расход тепла в печи, кДж/кг чугуна] [float] NULL,
	[Производительность среднесуточная, т/сутки] [float] NULL,
	[Химический состав чугуна: C, %] [float] NULL,
	[Химический состав чугуна: Si, %] [float] NULL,
	[Химический состав чугуна: Mn, %] [float] NULL,
	[Химический состав чугуна: S, %] [float] NULL,
	[Химический состав чугуна: P, %] [float] NULL,
	[Химический состав чугуна: Ti, %] [float] NULL,
	[Химический состав чугуна: Cr, %] [float] NULL,
	[Химический состав чугуна: V, %] [float] NULL,
	[Удельный расход кокса, кг/т чугуна] [float] NULL,
	[Зольность кокса, %] [float] NULL,
	[Удельный расход ЖРМ, кг/т чугуна] [float] NULL,
	[Удельный выход шлака, кг/т чугуна] [float] NULL,
	[Основность шлака CaO / SiO2, ед.] [float] NULL,
	[Основность шлака (CaO + MgO) / SiO2, ед.] [float] NULL,
	[Основность шлака (CaO + MgO) / (SiO2 + Al2O3), ед.] [float] NULL,
	[Дутье: расход, м3/мин] [float] NULL,
	[Дутье: температура, °С] [float] NULL,
	[Дутье: влажность, г/м3] [float] NULL,
	[Дутье: содержание O2, %] [float] NULL,
	[Дутье: удельный расход природного газа, м3/т чугуна] [float] NULL,
	[Состав колошникового газа: CO, %] [float] NULL,
	[Состав колошникового газа: CO2, %] [float] NULL,
	[Состав колошникового газа: H2, %] [float] NULL,
	[Температура колошникового газа, °С] [float] NULL,
	[Степень использования CO в печи, ед.] [float] NULL,
 CONSTRAINT [PK_T_OLAP_HeatBalance_Technology_Facts] PRIMARY KEY CLUSTERED 
(
	[FK_Номер печи] ASC,
	[FK_Дата] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[T_OLAP_Fact_Balance_Teplo]  WITH CHECK ADD  CONSTRAINT [FK_T_OLAP_HeatBalance_Technology_Facts_T_Furnaces] FOREIGN KEY([FK_Номер печи])
REFERENCES [dbo].[T_OLAP_Dim_Pech] ([PK_Номер печи])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[T_OLAP_Fact_Balance_Teplo] CHECK CONSTRAINT [FK_T_OLAP_HeatBalance_Technology_Facts_T_Furnaces]
GO

ALTER TABLE [dbo].[T_OLAP_Fact_Balance_Teplo]  WITH CHECK ADD  CONSTRAINT [FK_T_OLAP_HeatBalance_Technology_Facts_T_OLAP_Dates] FOREIGN KEY([FK_Дата])
REFERENCES [dbo].[T_OLAP_Dim_Dates] ([PK_Дата])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[T_OLAP_Fact_Balance_Teplo] CHECK CONSTRAINT [FK_T_OLAP_HeatBalance_Technology_Facts_T_OLAP_Dates]
GO
