use gold_db
go

create or alter procedure CreateSQLServerlessView_gold @ViewName nvarchar(100)
AS
begin
declare @statement varchar(max)
set @statement = N'create or alter view ' + @ViewName + ' as 
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK ''https://sadatacleanpipeline.dfs.core.windows.net/gold/SalesLT/' + @ViewName + '/'',
        FORMAT = ''DELTA''
    ) AS [result]'

    exec (@statement)
end
go    



