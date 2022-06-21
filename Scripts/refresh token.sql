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
