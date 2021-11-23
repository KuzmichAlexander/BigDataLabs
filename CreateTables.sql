USE [OLAP_Balance_Teplo_DB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[T_OLAP_Dim_Pech](
	[PK_����� ����] [tinyint] NOT NULL,
	[������������ ����] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_T_Furnaces] PRIMARY KEY CLUSTERED 
(
	[PK_����� ����] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[T_OLAP_Dim_Dates](
	[PK_����] [smalldatetime] NOT NULL,
	[�����]  AS ([dbo].[DateToMonth]([PK_����])),
	[���]  AS (datepart(year,[PK_����])),
 CONSTRAINT [PK_T_OLAP_Dates] PRIMARY KEY CLUSTERED 
(
	[PK_����] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

CREATE TABLE [dbo].[T_OLAP_Fact_Balance_Teplo](
	[FK_����] [smalldatetime] NOT NULL,
	[FK_����� ����] [tinyint] NOT NULL,
	[������ �����: ������� �����, ���/�� ������] [float] NULL,
	[������ �����: ���������� ����� �����, ���/�� ������] [float] NULL,
	[������ �����: ����� �� ������� ���������� ����, ���/�� ������] [float] NULL,
	[������ �����: ����� ����������������, ���/�� ������] [float] NULL,
	[������ �����: �������������� ������� Fe, ���/�� ������] [float] NULL,
	[������ �����: �������������� ������� ��������, ���/�� ������] [float] NULL,
	[������ �����: ������������� ������, ���/�� ������] [float] NULL,
	[������ �����: �������������� ������� Fe ���������, ���/�� ������] [float] NULL,
	[������ �����: ������ ������, ���/�� ������] [float] NULL,
	[������ �����: ������ �����, ���/�� ������] [float] NULL,
	[������ �����: ���������� ����� �����, ���/�� ������] [float] NULL,
	[������ �����: ���������� ����������, ���/�� ������] [float] NULL,
	[������ �����: ���������� ����� �����, ���/�� ������] [float] NULL,
	[������ �����: ����� ������������� ����, ���/�� ������] [float] NULL,
	[������ �����: �������� ������, ���/�� ������] [float] NULL,
	[����� ������/������ ����� � ����, ���/�� ������] [float] NULL,
	[������������������ ��������������, �/�����] [float] NULL,
	[���������� ������ ������: C, %] [float] NULL,
	[���������� ������ ������: Si, %] [float] NULL,
	[���������� ������ ������: Mn, %] [float] NULL,
	[���������� ������ ������: S, %] [float] NULL,
	[���������� ������ ������: P, %] [float] NULL,
	[���������� ������ ������: Ti, %] [float] NULL,
	[���������� ������ ������: Cr, %] [float] NULL,
	[���������� ������ ������: V, %] [float] NULL,
	[�������� ������ �����, ��/� ������] [float] NULL,
	[��������� �����, %] [float] NULL,
	[�������� ������ ���, ��/� ������] [float] NULL,
	[�������� ����� �����, ��/� ������] [float] NULL,
	[���������� ����� CaO / SiO2, ��.] [float] NULL,
	[���������� ����� (CaO + MgO) / SiO2, ��.] [float] NULL,
	[���������� ����� (CaO + MgO) / (SiO2 + Al2O3), ��.] [float] NULL,
	[�����: ������, �3/���] [float] NULL,
	[�����: �����������, ��] [float] NULL,
	[�����: ���������, �/�3] [float] NULL,
	[�����: ���������� O2, %] [float] NULL,
	[�����: �������� ������ ���������� ����, �3/� ������] [float] NULL,
	[������ ������������� ����: CO, %] [float] NULL,
	[������ ������������� ����: CO2, %] [float] NULL,
	[������ ������������� ����: H2, %] [float] NULL,
	[����������� ������������� ����, ��] [float] NULL,
	[������� ������������� CO � ����, ��.] [float] NULL,
 CONSTRAINT [PK_T_OLAP_HeatBalance_Technology_Facts] PRIMARY KEY CLUSTERED 
(
	[FK_����� ����] ASC,
	[FK_����] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[T_OLAP_Fact_Balance_Teplo]  WITH CHECK ADD  CONSTRAINT [FK_T_OLAP_HeatBalance_Technology_Facts_T_Furnaces] FOREIGN KEY([FK_����� ����])
REFERENCES [dbo].[T_OLAP_Dim_Pech] ([PK_����� ����])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[T_OLAP_Fact_Balance_Teplo] CHECK CONSTRAINT [FK_T_OLAP_HeatBalance_Technology_Facts_T_Furnaces]
GO

ALTER TABLE [dbo].[T_OLAP_Fact_Balance_Teplo]  WITH CHECK ADD  CONSTRAINT [FK_T_OLAP_HeatBalance_Technology_Facts_T_OLAP_Dates] FOREIGN KEY([FK_����])
REFERENCES [dbo].[T_OLAP_Dim_Dates] ([PK_����])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[T_OLAP_Fact_Balance_Teplo] CHECK CONSTRAINT [FK_T_OLAP_HeatBalance_Technology_Facts_T_OLAP_Dates]
GO
