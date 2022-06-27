USE [dbreslppa3]
GO
/****** Object:  User [lppatp_SQLLogin_1]    Script Date: 22/06/2022 23:38:47 ******/
CREATE USER [lppatp_SQLLogin_1] FOR LOGIN [lppatp_SQLLogin_1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [lppatp_SQLLogin_1]
GO
/****** Object:  Table [dbo].[Privileges]    Script Date: 22/06/2022 23:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Privileges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Privileges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RefreshToken]    Script Date: 22/06/2022 23:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RefreshToken](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[Token] [nvarchar](50) NULL,
	[Expires] [datetime] NULL,
 CONSTRAINT [PK_RefreshToken] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 22/06/2022 23:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Salt] [nvarchar](50) NULL,
	[PasswordHash] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UsersPrivileges]    Script Date: 22/06/2022 23:38:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsersPrivileges](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[PrivilegeId] [int] NULL,
 CONSTRAINT [PK_UsersPrivileges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Privileges] ON 
GO
INSERT [dbo].[Privileges] ([Id], [Description]) VALUES (1, N'Admin')
GO
INSERT [dbo].[Privileges] ([Id], [Description]) VALUES (4, N'Vendedor')
GO
INSERT [dbo].[Privileges] ([Id], [Description]) VALUES (5, N'Técnico')
GO
INSERT [dbo].[Privileges] ([Id], [Description]) VALUES (12, N'Santi')
GO
INSERT [dbo].[Privileges] ([Id], [Description]) VALUES (13, N'Santi')
GO
INSERT [dbo].[Privileges] ([Id], [Description]) VALUES (14, N'Santi')
GO
INSERT [dbo].[Privileges] ([Id], [Description]) VALUES (15, N'Santi')
GO
INSERT [dbo].[Privileges] ([Id], [Description]) VALUES (16, N'Santi')
GO
INSERT [dbo].[Privileges] ([Id], [Description]) VALUES (17, N'Santi')
GO
INSERT [dbo].[Privileges] ([Id], [Description]) VALUES (18, N'www')
GO
INSERT [dbo].[Privileges] ([Id], [Description]) VALUES (19, N'Santiwww')
GO
SET IDENTITY_INSERT [dbo].[Privileges] OFF
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] ON 
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (1, 1, N'asdf', CAST(N'2023-01-01T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (2, 1, N'qwerty', CAST(N'2023-01-05T00:00:00.000' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (3, 26, N'669E6664ECAB01EA332F5C523E1055E04FA19E570548127311', CAST(N'2022-06-23T22:19:57.133' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (4, 27, N'DF3665D9E4C38542376668C7DB5FEB1A7A6E767D1FB1AD4075', CAST(N'2022-06-24T00:12:57.947' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (5, 26, N'1B7A7B0B4A1F0D2796E0C520ED7F282AD2C630B3D930A72E89', CAST(N'2022-06-24T00:13:26.103' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (6, 27, N'0C836A75BA404A48EEE2F775ACB80E911D58DFE0796E6FAF0C', CAST(N'2022-06-24T00:20:27.657' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (7, 27, N'06318B3A040A4376F89FE93E4B6E7AA42A1CE790A9A98E49DC', CAST(N'2022-06-24T00:25:31.023' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (8, 27, N'125E0A23154530F8136B4889744039DEC6D7FADE8A90748451', CAST(N'2022-06-24T00:28:22.187' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (9, 27, N'86AE8B43F1B8CFBA006A64A0355E6E3AFA5536860277E7C45D', CAST(N'2022-06-24T00:48:27.177' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (10, 27, N'5E653B42DE9B2E9BF409D1CD2AAA22667837EB8655D8663C56', CAST(N'2022-06-24T00:53:05.523' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (11, 27, N'81EDF8F8BB57708969916CB26220BEC148E0FCC6570258E609', CAST(N'2022-06-24T00:58:12.867' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (12, 27, N'9478BD876B3881C82A6F3091765E8795931E3D3B38DFD74E7F', CAST(N'2022-06-24T01:08:22.480' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (13, 27, N'8FA7F9F9316F271547A2AF6F4C1A89A1D8E7FAFAC9A62477F1', CAST(N'2022-06-24T01:16:41.937' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (14, 26, N'5AFB9C90379487FEB6A7B571FDD805DF9E2DB30433C9EFC152', CAST(N'2022-06-24T01:20:04.777' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (15, 27, N'BB26C65FFABE0AEF1CCEF18F47322174C345CAD515F694B545', CAST(N'2022-06-24T01:25:33.710' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (16, 26, N'82C26FCCA51130D15478BA16399CF7355BB7819247BA07A2E6', CAST(N'2022-06-24T01:26:16.883' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (17, 26, N'7765042CB58883CA22EAB1D2BEB86BCC8AC4EF474AC7B68713', CAST(N'2022-06-24T01:31:20.027' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (18, 27, N'ABCFF0DBA8460BA26A5D11D4756BEC407E70CF102C31CCBFAE', CAST(N'2022-06-25T21:46:00.510' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (19, 26, N'3F098B3CEDC824E964705B4C2896E84782C0C30A3403906C1A', CAST(N'2022-06-25T21:46:47.387' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (20, 28, N'58B0389E7CBBF46DF14B541442F3FEA0710279EEE5723BC876', CAST(N'2022-06-25T22:01:17.910' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (21, 26, N'ECE9F07569D60C75471AD2134DE04E228DC1228E0D9C59CFB4', CAST(N'2022-06-25T22:10:36.183' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (22, 29, N'0EFEB1B5F9103C377B4D16B2C5ECC9759CBBF62B2F1ED203B5', CAST(N'2022-06-25T22:22:57.260' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (23, 26, N'6054092CAC9663B2A44862BE1FED74DA8609287266EE97ACD8', CAST(N'2022-06-25T22:27:06.853' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (24, 26, N'0DC01884AB9CF92DA2D93BDB9DA2E11201C4D9CEABFDF68B7B', CAST(N'2022-06-25T23:01:23.193' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (25, 26, N'509AE90353667466A4FC568E8F40A2147B932D0D9B623DEB11', CAST(N'2022-06-25T23:11:14.093' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (26, 26, N'4F506EEE680682B009691B5F1791F76C5D3DCD7612286B0B19', CAST(N'2022-06-25T23:18:30.917' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (27, 26, N'1BC49D752B7C0B49CB82655E6488F2029561877C7BE933EF62', CAST(N'2022-06-25T23:23:38.277' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (28, 26, N'3685B632694F0F182958379D7847DF5BECD138754DC7113465', CAST(N'2022-06-25T23:25:40.200' AS DateTime))
GO
INSERT [dbo].[RefreshToken] ([Id], [UserId], [Token], [Expires]) VALUES (29, 26, N'E850D73FA68F6A546F218BC367D9511F51E266476A482A741B', CAST(N'2022-06-25T23:27:21.960' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[RefreshToken] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (1, N'tutin321', N'qwerty', N'bla bla', N'string@asdf.com')
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (17, N'dope', N'HbTui22o0Yp0VVQyW/2HZDcRiOyEBE4ELCiHQD5T52CQJ8jkpw', N'H6OXNnKPN9eedC84tCJZE7zglTZ5pFjcFtO+Tz5J6Lg=', N'string@h')
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (19, N'Prueba', N'4XeSM5jobRDT6rzUOOjEmgt6IOR428BAzHal8C8l+zqGybrT9n', N'/wrEe2oE1HAJvDyxKFhWPyJE/3TSsZBus1U+YM1Rz7Q=', N'string@hotmail.com')
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (20, N'Prue', N'5wG0nD5DmHul1LHsYQThGS0MgzG/iDOz2Suvn7Yx+q/ZydK7+h', N'7t9Rb7P1fQ24BTyxn540YpSA3AAzQxCqDdgSbTSNsxs=', N'string@hotmail.com')
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (21, N'Prueba22', N'JK4cV9dGB1upff/ItQDRTrOHHHd5PmcU8xcoZwGxqCCvl0SOwt', N'sJkGWoaPmtO0Gd6HvJ70Dwii7x15ca+WRU/a5QHGoeo=', N'string@hotmail.com')
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (22, N'Prueba2sss2', N'uPFgO++JS2ov9xhkfylbIpQ1OeumIovp66HGe5ZTU2+V7zHkiG', N'g5MIKPsmaGhq15TZ+OK2v5QzdnEv6vnnY+wie/w8Rdk=', N'string@hotmail.com')
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (23, N'test123', N'ULtV6GW/KiWJGnUCU2socIc3P2n2ccLaKR1tgzHibcCcELI4TC', N'kzARIVgvGMYHDswCD2kr/jcL7u1QHoDMJ/Xz6a5dpYQ=', N'test123@yopmail.com')
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (24, N'qwerty123', N'CQnicqvFNEjN/K7apkPcoKLuXxsn9bbgLOPTj1taCCjtvOLWpb', N'TadW+SuREYKi2eMX34WXKr8jMASTuAgKxMex47zTeOU=', N'qwerty123@yopmail.com')
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (25, N'qwerty1234', N'PuCK2Uud1ase6H3whVWXWS8spVdEhyxo1wwLcEISEIbva94/Qq', N'cCzdm/Xh4iLdTNBuTcLPoQxzUHq69MIQiEynbKRuhLU=', N'qwerty1234@yopmail.com')
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (26, N'test123456', N'XmU4VE3jiK+UDhJxRjKhv572soaKu66EWTTa0zQdXrJhHeQ=', N'4gR8ROtqD9pSy6G33NOTHCdibv329bgpGPrrOKoyxF4=', N'test123456@yopmail.com')
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (27, N'test1234567', N'JrZW51FzCk+7n86s3eBTNM+cWZoRsAmdP5Hl0tTiwj1aoJs=', N'jddDlmLwqL31upd3w1J/e39UYUeVtKsE41f7532Smt8=', N'test1234567@yopmail.com')
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (28, N'bla12345', N'J5aXt6sZm3BRVCapNpG0JEs34TMr/aviFBtIQ242cpW3h84=', N'94wRfG8jBpd/R/jC7RR4VjseAEGd8TYHMTNHiMl89b0=', N'bla12345@yopmail.com')
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (29, N'string123', N'+E2KazL7q31GscXoF7xCwxn5CTv07/V7sSsi8JipXd567K0=', N'TwahUPM35HHtXMRRIsd2vPweSNRynvAf1yJvUrJyz5g=', N'nioquiasdf@aa.asdr')
GO
INSERT [dbo].[Users] ([Id], [UserName], [Salt], [PasswordHash], [Email]) VALUES (30, N'pepe', N'1WTfMT+E2J+fAVh51TwsVYYc/i9H2x6B0UjaG60m35Iu1IA=', N'kcCqUyeNufjdAT+kugNsQOXbLi+A8z+mVG84F6Gp/Uw=', N'ppp@asdf.asom')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UsersPrivileges] ON 
GO
INSERT [dbo].[UsersPrivileges] ([Id], [UserId], [PrivilegeId]) VALUES (16, 26, 1)
GO
INSERT [dbo].[UsersPrivileges] ([Id], [UserId], [PrivilegeId]) VALUES (17, 26, 4)
GO
INSERT [dbo].[UsersPrivileges] ([Id], [UserId], [PrivilegeId]) VALUES (18, 27, 4)
GO
INSERT [dbo].[UsersPrivileges] ([Id], [UserId], [PrivilegeId]) VALUES (19, 30, 1)
GO
INSERT [dbo].[UsersPrivileges] ([Id], [UserId], [PrivilegeId]) VALUES (20, 29, 1)
GO
SET IDENTITY_INSERT [dbo].[UsersPrivileges] OFF
GO
ALTER TABLE [dbo].[RefreshToken]  WITH CHECK ADD  CONSTRAINT [FK_RefreshToken_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[RefreshToken] CHECK CONSTRAINT [FK_RefreshToken_Users]
GO
ALTER TABLE [dbo].[UsersPrivileges]  WITH CHECK ADD  CONSTRAINT [FK_UsersPrivileges_Privileges] FOREIGN KEY([PrivilegeId])
REFERENCES [dbo].[Privileges] ([Id])
GO
ALTER TABLE [dbo].[UsersPrivileges] CHECK CONSTRAINT [FK_UsersPrivileges_Privileges]
GO
ALTER TABLE [dbo].[UsersPrivileges]  WITH CHECK ADD  CONSTRAINT [FK_UsersPrivileges_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UsersPrivileges] CHECK CONSTRAINT [FK_UsersPrivileges_Users]
GO
/****** Object:  StoredProcedure [dbo].[Privileges_Deleted]    Script Date: 22/06/2022 23:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Privileges_Deleted] 
@Id as int 
as
begin
Delete from   dbo.Privileges 
where  @Id = Id
END



GO
/****** Object:  StoredProcedure [dbo].[Privileges_Insert]    Script Date: 22/06/2022 23:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[Privileges_Insert] 

@Description AS Nvarchar(50) 
AS
BEGIN
INSERT INTO dbo.Privileges(Description)
VALUES
(@Description
 )
END
GO
/****** Object:  StoredProcedure [dbo].[Privileges_Mod]    Script Date: 22/06/2022 23:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Privileges_Mod] 
@Id as int 
,@Description AS Nvarchar(50) 
AS
BEGIN
update  dbo.Privileges set Description =  @Description
where Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Token_Deleted]    Script Date: 22/06/2022 23:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


Create procedure [dbo].[Token_Deleted]
@Id int 	

as
begin
Delete from RefreshToken 
where @Id = Id


end
GO
/****** Object:  StoredProcedure [dbo].[Token_Insert]    Script Date: 22/06/2022 23:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Token_Insert] 
@UserId AS int
,@Token as nvarchar(50)
,@Expires as datetime 
AS
BEGIN
INSERT INTO dbo.RefreshToken(UserId, Token, Expires)
VALUES (@UserId,@Token,@Expires)
SELECT @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[Token_Mod]    Script Date: 22/06/2022 23:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Token_Mod]
@Id as int,
@UserId AS int,
@Token as nvarchar(50),
@Expires as datetime 
AS
BEGIN
UPDATE dbo.RefreshToken SET UserId = @UserId , Token = @Token , Expires = @Expires  
WHERE Id = @Id
END
GO
/****** Object:  StoredProcedure [dbo].[Token_View]    Script Date: 22/06/2022 23:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[Token_View]
	

as
begin
select   Token , Expires  from RefreshToken
end
GO
/****** Object:  StoredProcedure [dbo].[User_Deleted]    Script Date: 22/06/2022 23:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[User_Deleted] 
@id as int
 AS
BEGIN
delete  from  dbo.Users 
where   @id = Id
end 
GO
/****** Object:  StoredProcedure [dbo].[User_Insert]    Script Date: 22/06/2022 23:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Insert] 

@UserName AS Nvarchar(50) 
,@Salt AS Nvarchar(50) 
,@PasswordHash AS Nvarchar(50) 
,@Email AS Nvarchar(50) 
AS
BEGIN
INSERT INTO dbo.Users(UserName,Salt,PasswordHash,Email)
VALUES
(@UserName 
,@Salt 
,@PasswordHash 
,@Email 
 )

 SELECT @@IDENTITY
END
GO
/****** Object:  StoredProcedure [dbo].[User_Mod]    Script Date: 22/06/2022 23:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[User_Mod] 
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

GO
/****** Object:  StoredProcedure [dbo].[User_Privileges_Delete]    Script Date: 22/06/2022 23:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Privileges_Delete] 
@UserID AS int 
AS
BEGIN
DELETE FROM dbo.UsersPrivileges
WHERE UserId = @UserID
END
GO
/****** Object:  StoredProcedure [dbo].[User_Privileges_Insert]    Script Date: 22/06/2022 23:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[User_Privileges_Insert] 


@UserID AS int 
,@PrivilegeId AS int
AS
BEGIN
INSERT INTO  dbo.UsersPrivileges(UserId ,PrivilegeId )
VALUES
(@UserID  
,@PrivilegeId )
END
GO
/****** Object:  StoredProcedure [dbo].[User_Privileges_View]    Script Date: 22/06/2022 23:38:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure  [dbo].[User_Privileges_View]
	

as
begin
select us.UserName , us.Email , pr.Description from Users us 
join UsersPrivileges up on up.UserId = us.Id
join Privileges pr on pr.Id = up.PrivilegeId


end
GO
