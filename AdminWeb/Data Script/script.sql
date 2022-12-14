USE [master]
GO
/****** Object:  Database [Admin_CS]    Script Date: 12/17/2022 3:30:49 PM ******/
CREATE DATABASE [Admin_CS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Admin_CS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Admin_CS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Admin_CS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Admin_CS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Admin_CS] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Admin_CS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Admin_CS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Admin_CS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Admin_CS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Admin_CS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Admin_CS] SET ARITHABORT OFF 
GO
ALTER DATABASE [Admin_CS] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Admin_CS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Admin_CS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Admin_CS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Admin_CS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Admin_CS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Admin_CS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Admin_CS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Admin_CS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Admin_CS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Admin_CS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Admin_CS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Admin_CS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Admin_CS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Admin_CS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Admin_CS] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Admin_CS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Admin_CS] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Admin_CS] SET  MULTI_USER 
GO
ALTER DATABASE [Admin_CS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Admin_CS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Admin_CS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Admin_CS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Admin_CS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Admin_CS] SET QUERY_STORE = OFF
GO
USE [Admin_CS]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Address] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](max) NOT NULL,
	[EmployeeCode] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Person]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[HomeTown] [nvarchar](max) NULL,
	[CreatedByUser] [nvarchar](max) NULL,
	[CreatedDate] [datetimeoffset](7) NOT NULL,
	[ModifiedByUser] [nvarchar](max) NULL,
	[ModifiedDate] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'00000000000000_CreateIdentitySchema', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221214121524_init', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221215060201_update', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221215060530_extend_identity', N'6.0.10')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20221215063751_persontable', N'6.0.10')
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'85577319-df17-4750-8a74-902800b70989', N'Employee', N'EMPLOYEE', N'2dad550c-a1ca-4ec8-ae1a-0670adbeacc5')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'f20a33fe-054a-475c-9f68-83dfe367ceab', N'Admin', N'ADMIN', N'66d150d3-dff4-4cf0-b809-9672ef65ef2e')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'87bacb9c-9e1e-46de-8893-bb915a8c53ae', N'85577319-df17-4750-8a74-902800b70989')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'23561e55-3254-4253-ad9a-e090a3a49018', N'f20a33fe-054a-475c-9f68-83dfe367ceab')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [City], [Discriminator], [EmployeeCode], [Name], [PostalCode], [State]) VALUES (N'23561e55-3254-4253-ad9a-e090a3a49018', N'sameer@gmail.com', N'SAMEER@GMAIL.COM', N'sameer@gmail.com', N'SAMEER@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEBHHyjHsLnbto6pGimd6M6ZbSLdsywDyvb6VOdKvYjQtZBkxZPzYfuSAON98auObbg==', N'TMRIQLER4MAAZFHJNAXG3NIWRY6A4NQ7', N'83d39006-701a-47a9-a78c-6a7b9909e669', N'0900089', 0, 0, NULL, 1, 0, NULL, NULL, N'ApplicationUser', NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [City], [Discriminator], [EmployeeCode], [Name], [PostalCode], [State]) VALUES (N'2c23c5d1-62b7-464d-8cbc-60792550b23b', N'amir@gmail.com', N'AMIR@GMAIL.COM', N'amir@gmail.com', N'AMIR@GMAIL.COM', 1, N'AQAAAAEAACcQAAAAELLZZkFFmducL69IGh2UctnmFad+CHeOlFVaq/tiGhKcoBmmFm97+5VMBhqdqqpqhQ==', N'WI7F7HPKEYS5U2GZTYQ4QKVNX424QYSS', N'a1347237-b323-496a-853f-6b31432a1ecb', NULL, 0, 0, NULL, 1, 0, NULL, NULL, N'ApplicationUser', NULL, NULL, NULL, NULL)
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Address], [City], [Discriminator], [EmployeeCode], [Name], [PostalCode], [State]) VALUES (N'87bacb9c-9e1e-46de-8893-bb915a8c53ae', N'a@gmail.com', N'A@GMAIL.COM', N'a@gmail.com', N'A@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEAR96kbfEv5yfhTyzQvtUFHRYCMTYZ8LhYLYta0pCVNrnDHjfrvRtIIxh2a26Gl11w==', N'4PQCDZWY6XHZSAX5FRWKYYOBVH4KP6EG', N'6659b754-8c0f-4ea2-8a23-f71f41c83072', N'a', 0, 0, NULL, 1, 0, N'a', N'a', N'ApplicationUser', NULL, N'a', N'a', N'a')
GO
SET IDENTITY_INSERT [dbo].[Person] ON 

INSERT [dbo].[Person] ([Id], [Name], [Address], [HomeTown], [CreatedByUser], [CreatedDate], [ModifiedByUser], [ModifiedDate]) VALUES (7, N'N1', N'M1', N'N1', N'N1', CAST(N'2222-02-22T00:00:00.0000000+00:00' AS DateTimeOffset), N'XT', CAST(N'2222-02-22T00:00:00.0000000+00:00' AS DateTimeOffset))
SET IDENTITY_INSERT [dbo].[Person] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 12/17/2022 3:30:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 12/17/2022 3:30:49 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 12/17/2022 3:30:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 12/17/2022 3:30:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 12/17/2022 3:30:49 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 12/17/2022 3:30:49 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 12/17/2022 3:30:49 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [Discriminator]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
/****** Object:  StoredProcedure [dbo].[sp_EditPerson]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_EditPerson]
(
@Id int,
@Name varchar(50),
@Address varchar(100),
@HomeTown varchar(100),
@CreatedByUser varchar(100),
@CreatedDate varchar(10),
@ModifiedByUser varchar(100),
@ModifiedDate varchar(10)
)
as
begin
	update Person set
	Name = @Name,
	Address = @Address,
	HomeTown = @HomeTown,
	CreatedByUser = @CreatedByUser,
	CreatedDate=@CreatedDate,
	ModifiedByUser=@ModifiedByUser,
	ModifiedDate=@ModifiedDate

	where Id = @Id
end

GO
/****** Object:  StoredProcedure [dbo].[sp_GetSingle]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_GetSingle]
(
@Id int
)
as
begin
	delete from Person where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_OneRecord]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_OneRecord]
(
@Id int
)
as
begin
	select * from Person where Id = @Id
end
GO
/****** Object:  StoredProcedure [dbo].[sp_SavePerson]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[sp_SavePerson]
(

@Name varchar(50),
@Address varchar(100),
@HomeTown varchar(100),
@CreatedByUser varchar(100),
@CreatedDate varchar(10),
@ModifiedByUser varchar(100),
@ModifiedDate varchar(10)
)
as
begin
	set dateformat dmy
	insert into Person(Name,Address,HomeTown,CreatedByUser,CreatedDate,ModifiedByUser,ModifiedDate ) values
	(@Name,@Address,@HomeTown,@CreatedByUser,convert(date,@CreatedDate),@ModifiedByUser,convert(date,@ModifiedDate))
end

GO
/****** Object:  StoredProcedure [dbo].[spDeletePerson]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spDeletePerson]
(
@Id int
)

as 
begin
delete from person where Id=@Id;
end;
GO
/****** Object:  StoredProcedure [dbo].[spGetPersons]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create procedure [dbo].[spGetPersons]
As 
Select * from person
GO
/****** Object:  StoredProcedure [dbo].[spGetSingle]    Script Date: 12/17/2022 3:30:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[spGetSingle]
(
@Id int,
@Name varchar(50),
@Address varchar(100),
@HomeTown varchar(100),
@CreatedByUser varchar(100),
@CreatedDate varchar(10),
@ModifiedByUser varchar(100),
@ModifiedDate varchar(10)
)
as
begin
	update Person set
	Name = @Name,
	Address = @Address,
	HomeTown = @HomeTown,
	CreatedByUser = @CreatedByUser,
	CreatedDate=@CreatedDate,
	ModifiedByUser=@ModifiedByUser,
	ModifiedDate=@ModifiedDate

	where Id = @Id
end

GO
USE [master]
GO
ALTER DATABASE [Admin_CS] SET  READ_WRITE 
GO
