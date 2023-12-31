-----------------------------------------------------------------
-- Looks at tem tables structures
--
-- rudi@babaluga.com, go ahead license
-----------------------------------------------------------------

SET NOCOUNT ON;
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;

SELECT REPLACE(TABLE_NAME, REPLICATE('_', 110), '_') as [table],
	COLUMN_NAME,
	DATA_TYPE,
	IS_NULLABLE,
	CHARACTER_MAXIMUM_LENGTH as CHAR_LENGTH
FROM tempdb.INFORMATION_SCHEMA.COLUMNS c 
WHERE TABLE_NAME LIKE '#%' 
AND TABLE_SCHEMA = 'dbo'
ORDER BY [table]
OPTION (RECOMPILE, MAXDOP 1);
