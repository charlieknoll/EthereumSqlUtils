
DECLARE @tab as TABLE (col nchar(108))

INSERT INTO @tab 
select dbo.GenerateKeyPair()
 

select * FROM @tab
select LEN(RTRIM(col)) FROM @tab

DELETE FROM KeyPairs

DECLARE @Ctr INT = 0
WHILE (@Ctr < 1000)
BEGIN
BEGIN TRANSACTION
INSERT INTO KeyPairs (k)
SELECT TOP(1000) dbo.GenerateKeyPair() k
FROM vTally 
SET @Ctr = @Ctr + 1
COMMIT TRANSACTION
END


Select k, COUNT(k) FROM KeyPairs 
Group By k
HAVING COUNT(k) > 1
ORDER BY k

Select k FROM KeyPairs 