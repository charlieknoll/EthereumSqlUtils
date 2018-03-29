--CREATE ASSEMBLY BouncyCastleCryptoAssembly 
--  FROM  'E:\dev\ethereum\apps\EthereumSqlUtils\EthereumSqlUtils\bin\Debug\BouncyCastle.Crypto.dll' 
--  WITH PERMISSION_SET = SAFE
--go

DROP PROCEDURE GETPublicAddress
DROP FUNCTION GenerateKeyPair

DROP ASSEMBLY EthereumSqlUtilsAssembly 

CREATE ASSEMBLY EthereumSqlUtilsAssembly 
  FROM  'E:\dev\ethereum\apps\EthereumSqlUtils\EthereumSqlUtils\bin\Release\EthereumSqlUtils.dll' 
  WITH PERMISSION_SET = SAFE
go


CREATE PROCEDURE GetPublicAddress (@privateKey nvarchar(66))
AS 
EXTERNAL NAME EthereumSqlUtilsAssembly.[EthereumSqlUtils.EthSigner].GetPublicAddress
go

CREATE FUNCTION GenerateKeyPair() RETURNS nchar(108)
AS 
EXTERNAL NAME EthereumSqlUtilsAssembly.[EthereumSqlUtils.EthSigner].GenerateKeyPair
go

exec GetPublicAddress '0xf8f8a2f43c8376ccb0871305060d7b27b0554d2cc72bccf41b2705608452f315'
select dbo.GenerateKeyPair()

--exec GetKeyPair 

--sp_configure 'show advanced options', 1;  
--GO  
--RECONFIGURE;  
--GO  
--sp_configure 'clr enabled', 1;  
--GO  
--RECONFIGURE;  
--GO  

--select * from sys.dm_clr_properties