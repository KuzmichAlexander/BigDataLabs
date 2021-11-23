USE [OLAP_Balance_Teplo_DB]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE function [dbo].[DateToMonth](@date smalldatetime)
returns  nvarchar(8)
as 
BEGIN
DECLARE @ret nvarchar(8)
set @ret = 
case datepart(month, @date)
	when 1 then '������'
	when 2 then '�������'
	when 3 then '����'
	when 4 then '������'
	when 5 then '���'
	when 6 then '����'
	when 7 then '����'
	when 8 then '������'
	when 9 then '��������'
	when 10 then '�������'
	when 11 then '������'
	when 12 then '�������'
end 
return @ret
end


GO


