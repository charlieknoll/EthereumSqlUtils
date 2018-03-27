--CREATE ASSEMBLY BouncyCastleCryptoAssembly 
--  FROM  'E:\dev\ethereum\apps\EthereumSqlUtils\EthereumSqlUtils\bin\Debug\BouncyCastle.Crypto.dll' 
--  WITH PERMISSION_SET = SAFE
--go

DROP PROCEDURE GETPublicAddress

DROP ASSEMBLY EthereumSqlUtilsAssembly 

CREATE ASSEMBLY EthereumSqlUtilsAssembly 
  FROM  'E:\dev\ethereum\apps\EthereumSqlUtils\EthereumSqlUtils\bin\Release\EthereumSqlUtils.dll' 
  WITH PERMISSION_SET = SAFE
go


CREATE PROCEDURE GetPublicAddress (@privateKey nvarchar(64))
AS 
EXTERNAL NAME EthereumSqlUtilsAssembly.[EthereumSqlUtils.EthSigner].GetPublicAddress
go

exec GetPublicAddress 'f8f8a2f43c8376ccb0871305060d7b27b0554d2cc72bccf41b2705608452f315'

--sp_configure 'show advanced options', 1;  
--GO  
--RECONFIGURE;  
--GO  
--sp_configure 'clr enabled', 1;  
--GO  
--RECONFIGURE;  
--GO  

--select * from sys.dm_clr_properties