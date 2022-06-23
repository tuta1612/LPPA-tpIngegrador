USE dbreslppa3

SELECT *
FROM RefreshToken

ALTER TABLE RefreshToken
ALTER COLUMN Token nvarchar(50);

ALTER TABLE RefreshToken
ALTER COLUMN Expires datetime;

ALTER PROCEDURE [dbo].[Token_Insert] 
@UserId AS int
,@Token as nvarchar(50)
,@Expires as datetime 
AS
BEGIN
INSERT INTO dbo.RefreshToken(UserId, Token, Expires)
VALUES (@UserId,@Token,@Expires)
SELECT @@IDENTITY
END


ALTER procedure [dbo].[Token_Mod]
@Id as int,
@UserId AS int,
@Token as nvarchar(50),
@Expires as datetime 
AS
BEGIN
UPDATE dbo.RefreshToken SET UserId = @UserId , Token = @Token , Expires = @Expires  
WHERE Id = @Id
END


SELECT Id, UserId, Token, Expires
FROM RefreshToken

SELECT Id, UserName, Salt, PasswordHash, Email
FROM Users


ALTER PROCEDURE [dbo].[User_Mod] 
@id as int
,@UserName AS Nvarchar(50) 
,@Salt AS Nvarchar(50) 
,@PasswordHash AS Nvarchar(50) 
,@Email AS Nvarchar(50) 
AS
BEGIN
--update  dbo.Users  set UserName = @UserName , Salt = @Salt ,PasswordHash = @PasswordHash , Email = @Email
UPDATE dbo.Users  
SET UserName = IsNull(@UserName, Username), 
	Salt = IsNull(@Salt, Salt),
	PasswordHash = IsNull(@PasswordHash, PasswordHash), 
	Email = @Email
WHERE Id = @id
END 

