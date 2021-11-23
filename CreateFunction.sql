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
	when 1 then '€нварь'
	when 2 then 'февраль'
	when 3 then 'март'
	when 4 then 'апрель'
	when 5 then 'май'
	when 6 then 'июнь'
	when 7 then 'июль'
	when 8 then 'август'
	when 9 then 'сент€брь'
	when 10 then 'окт€брь'
	when 11 then 'но€брь'
	when 12 then 'декабрь'
end 
return @ret
end


GO


