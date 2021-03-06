USE [master]
GO
/****** Object:  Database [GooglePayDb]    Script Date: 2/27/2020 10:33:25 AM ******/
CREATE DATABASE [GooglePayDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'GooglePayDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\GooglePayDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'GooglePayDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQL2017\MSSQL\DATA\GooglePayDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [GooglePayDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GooglePayDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GooglePayDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [GooglePayDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [GooglePayDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [GooglePayDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [GooglePayDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [GooglePayDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [GooglePayDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [GooglePayDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [GooglePayDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [GooglePayDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [GooglePayDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [GooglePayDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [GooglePayDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [GooglePayDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [GooglePayDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [GooglePayDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [GooglePayDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [GooglePayDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [GooglePayDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [GooglePayDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [GooglePayDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [GooglePayDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [GooglePayDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [GooglePayDb] SET  MULTI_USER 
GO
ALTER DATABASE [GooglePayDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [GooglePayDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [GooglePayDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [GooglePayDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [GooglePayDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [GooglePayDb] SET QUERY_STORE = OFF
GO
USE [GooglePayDb]
GO
/****** Object:  Schema [core]    Script Date: 2/27/2020 10:33:25 AM ******/
CREATE SCHEMA [core]
GO
/****** Object:  Table [dbo].[ApplicationLocales]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationLocales](
	[ApplicationLocaleId] [int] IDENTITY(1,1) NOT NULL,
	[LocaleCode] [varchar](50) NOT NULL,
	[LocaleName] [nvarchar](300) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationLocales] PRIMARY KEY CLUSTERED 
(
	[ApplicationLocaleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationTimeZones]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationTimeZones](
	[ApplicationTimeZoneId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationTimeZoneName] [nvarchar](100) NOT NULL,
	[Comment] [nvarchar](200) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_TimeZones] PRIMARY KEY CLUSTERED 
(
	[ApplicationTimeZoneId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationLocaleId] [int] NOT NULL,
	[ApplicationTimeZoneId] [int] NOT NULL,
	[LanguageCode] [varchar](3) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [binary](132) NOT NULL,
	[Salt] [binary](140) NOT NULL,
	[LoginBlocked] [bit] NOT NULL,
	[StatusId] [int] NOT NULL,
	[MobileNumber] [varchar](50) NULL,
	[EmailId] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vUsers]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vUsers]
AS
SELECT        appuser.UserId, timezone.ApplicationTimeZoneName, appuser.LanguageCode, appuser.UserName, appuser.Password, appuser.Salt, appuser.LoginBlocked, locale.LocaleCode
FROM            dbo.Users AS appuser INNER JOIN
                         dbo.ApplicationLocales AS locale ON appuser.ApplicationLocaleId = locale.ApplicationLocaleId INNER JOIN
                         dbo.ApplicationTimeZones AS timezone ON appuser.ApplicationTimeZoneId = timezone.ApplicationTimeZoneId
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[TransactionId] [bigint] IDENTITY(1,1) NOT NULL,
	[SenderId] [int] NOT NULL,
	[ReciverId] [int] NOT NULL,
	[Amount] [float] NOT NULL,
	[SendDate] [datetime2](7) NOT NULL,
	[TransactionStatus] [tinyint] NOT NULL,
	[UPIId] [bigint] NOT NULL,
	[Remarks] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[TransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GpayUsers]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GpayUsers](
	[GPayUserId] [int] IDENTITY(1,1) NOT NULL,
	[MobileNumber] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[UserTypeId] [tinyint] NOT NULL,
	[EmailId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_GpayUsers] PRIMARY KEY CLUSTERED 
(
	[GPayUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vAllTransactions]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vAllTransactions]
AS
SELECT        dbo.GpayUsers.GPayUserId, dbo.GpayUsers.MobileNumber, dbo.GpayUsers.UserName, dbo.Transactions.TransactionId, dbo.Transactions.SenderId, dbo.Transactions.Amount, dbo.Transactions.ReciverId, 
                         dbo.Transactions.SendDate, dbo.Transactions.TransactionStatus, dbo.Transactions.UPIId, dbo.Transactions.Remarks
FROM            dbo.GpayUsers INNER JOIN
                         dbo.Transactions ON dbo.GpayUsers.GPayUserId = dbo.Transactions.SenderId AND dbo.GpayUsers.GPayUserId = dbo.Transactions.ReciverId
GO
/****** Object:  Table [dbo].[Upis]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Upis](
	[UpiId] [bigint] IDENTITY(1,1) NOT NULL,
	[UpiName] [varchar](50) NOT NULL,
	[UpiPin] [varchar](20) NOT NULL,
	[BankDetailId] [bigint] NOT NULL,
	[UpiPriority] [bit] NOT NULL,
 CONSTRAINT [PK_Upis] PRIMARY KEY CLUSTERED 
(
	[UpiId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBankDetails]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBankDetails](
	[BankDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[BankId] [smallint] NOT NULL,
	[AccountNumber] [bigint] NOT NULL,
	[Balance] [float] NOT NULL,
	[GPayUserId] [int] NOT NULL,
	[AddedStatus] [bit] NOT NULL,
 CONSTRAINT [PK_UserBankDetails] PRIMARY KEY CLUSTERED 
(
	[BankDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vBankAccountInformation]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vBankAccountInformation]
AS
SELECT        dbo.GpayUsers.UserName, dbo.GpayUsers.MobileNumber, dbo.Upis.UpiId, dbo.Upis.UpiName, dbo.Upis.UpiPriority, dbo.UserBankDetails.BankId, dbo.UserBankDetails.AccountNumber, dbo.UserBankDetails.AddedStatus, 
                         dbo.UserBankDetails.GPayUserId
FROM            dbo.GpayUsers INNER JOIN
                         dbo.UserBankDetails ON dbo.GpayUsers.GPayUserId = dbo.UserBankDetails.GPayUserId INNER JOIN
                         dbo.Upis ON dbo.UserBankDetails.BankDetailId = dbo.Upis.BankDetailId
GO
/****** Object:  Table [dbo].[ApplicationModules]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationModules](
	[ApplicationModuleId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleMasterId] [int] NOT NULL,
	[ParentApplicationModuleId] [int] NULL,
 CONSTRAINT [PK_ApplicationModules] PRIMARY KEY CLUSTERED 
(
	[ApplicationModuleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationObjects]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationObjects](
	[ApplicationObjectId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationObjectTypeId] [int] NOT NULL,
	[ApplicationObjectName] [varchar](100) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationObjects] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationObjectTypes]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationObjectTypes](
	[ApplicationObjectTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationObjectTypeName] [varchar](100) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationObjectTypes] PRIMARY KEY CLUSTERED 
(
	[ApplicationObjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ApplicationUserTokens]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ApplicationUserTokens](
	[ApplicationUserTokenId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SecurityKey] [varchar](200) NOT NULL,
	[JwtToken] [varchar](max) NOT NULL,
	[AudienceType] [varchar](50) NOT NULL,
	[CreatedDateTime] [datetimeoffset](7) NOT NULL,
 CONSTRAINT [PK_ApplicationUserTokens] PRIMARY KEY CLUSTERED 
(
	[ApplicationUserTokenId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Banks]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Banks](
	[BankId] [smallint] IDENTITY(1,1) NOT NULL,
	[BankName] [varchar](50) NOT NULL,
	[IFSCcode] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Banks] PRIMARY KEY CLUSTERED 
(
	[BankId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cards]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cards](
	[CardId] [bigint] IDENTITY(1,1) NOT NULL,
	[CardNumber] [bigint] NOT NULL,
	[NameOnCard] [varchar](20) NOT NULL,
	[ExpiryDate] [varchar](5) NOT NULL,
	[CVV] [varchar](3) NOT NULL,
	[BankDetailId] [bigint] NOT NULL,
 CONSTRAINT [PK_Cards] PRIMARY KEY CLUSTERED 
(
	[CardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ComponentLanguageContents]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ComponentLanguageContents](
	[ComponentLanguageContentId] [int] IDENTITY(1,1) NOT NULL,
	[ComponentKeyId] [int] NOT NULL,
	[LanguageContentId] [int] NOT NULL,
	[En] [varchar](max) NULL,
	[Fr] [varchar](max) NULL,
 CONSTRAINT [PK_ModuleProperties] PRIMARY KEY CLUSTERED 
(
	[ComponentLanguageContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageContentKeys]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageContentKeys](
	[LanguageContentKeyId] [int] IDENTITY(1,1) NOT NULL,
	[KeyName] [varchar](50) NOT NULL,
	[IsComponent] [bit] NOT NULL,
 CONSTRAINT [PK_LanguageContentKeys] PRIMARY KEY CLUSTERED 
(
	[LanguageContentKeyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LanguageContents]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LanguageContents](
	[LanguageContentId] [int] IDENTITY(1,1) NOT NULL,
	[LanguageContentKeyId] [int] NOT NULL,
	[ContentType] [varchar](3) NOT NULL,
	[En] [varchar](max) NOT NULL,
	[Fr] [varchar](max) NULL,
 CONSTRAINT [PK_LanguageContents] PRIMARY KEY CLUSTERED 
(
	[LanguageContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ModuleMasters]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModuleMasters](
	[ModuleMasterId] [int] IDENTITY(1,1) NOT NULL,
	[ModuleMasterName] [varchar](100) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_ModuleMasters] PRIMARY KEY CLUSTERED 
(
	[ModuleMasterId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OTPs]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OTPs](
	[OTPId] [bigint] IDENTITY(1,1) NOT NULL,
	[OTPNumber] [int] NOT NULL,
	[MobileNumber] [varchar](50) NOT NULL,
 CONSTRAINT [PK_OTPs] PRIMARY KEY CLUSTERED 
(
	[OTPId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rewards]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rewards](
	[RewardId] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Amount] [float] NULL,
	[ScratchStatus] [bit] NOT NULL,
	[TransactionAmount] [float] NOT NULL,
 CONSTRAINT [PK_Rewards] PRIMARY KEY CLUSTERED 
(
	[RewardId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermissions]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermissions](
	[RolePermissionId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[ApplicationModuleId] [int] NOT NULL,
	[CanView] [bit] NULL,
	[CanAdd] [bit] NULL,
	[CanEdit] [bit] NULL,
	[CanDelete] [bit] NULL,
	[PermissionPriority] [int] NOT NULL,
 CONSTRAINT [PK_RolePermissions] PRIMARY KEY CLUSTERED 
(
	[RolePermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[StatusId] [int] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactionStatusObjects]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactionStatusObjects](
	[TransactionStatusId] [tinyint] NOT NULL,
	[TransactionName] [varchar](10) NOT NULL,
 CONSTRAINT [PK_TransactionStatusObjects] PRIMARY KEY CLUSTERED 
(
	[TransactionStatusId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[UserRoleId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTypeObjects]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypeObjects](
	[UserTypeId] [tinyint] NOT NULL,
	[UserTypeName] [varchar](20) NOT NULL,
 CONSTRAINT [PK_UserTypeObjects] PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_GpayUsers]    Script Date: 2/27/2020 10:33:25 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_GpayUsers] ON [dbo].[GpayUsers]
(
	[MobileNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF__RolePermi__NoAcc__114A936A]  DEFAULT ((0)) FOR [CanView]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF__RolePermi__Reado__123EB7A3]  DEFAULT ((0)) FOR [CanAdd]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF_RolePermissions_AllowView]  DEFAULT ((0)) FOR [CanEdit]
GO
ALTER TABLE [dbo].[RolePermissions] ADD  CONSTRAINT [DF__RolePermi__FullA__1332DBDC]  DEFAULT ((0)) FOR [CanDelete]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_LoginBlocked]  DEFAULT ((0)) FOR [LoginBlocked]
GO
ALTER TABLE [dbo].[ApplicationLocales]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationLocales_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[ApplicationLocales] CHECK CONSTRAINT [FK_ApplicationLocales_ApplicationObjects]
GO
ALTER TABLE [dbo].[ApplicationModules]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationModules_ModuleMasters] FOREIGN KEY([ModuleMasterId])
REFERENCES [dbo].[ModuleMasters] ([ModuleMasterId])
GO
ALTER TABLE [dbo].[ApplicationModules] CHECK CONSTRAINT [FK_ApplicationModules_ModuleMasters]
GO
ALTER TABLE [dbo].[ApplicationObjects]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationObjects_ApplicationObjectTypes] FOREIGN KEY([ApplicationObjectTypeId])
REFERENCES [dbo].[ApplicationObjectTypes] ([ApplicationObjectTypeId])
GO
ALTER TABLE [dbo].[ApplicationObjects] CHECK CONSTRAINT [FK_ApplicationObjects_ApplicationObjectTypes]
GO
ALTER TABLE [dbo].[ApplicationTimeZones]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationTimeZones_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[ApplicationTimeZones] CHECK CONSTRAINT [FK_ApplicationTimeZones_ApplicationObjects]
GO
ALTER TABLE [dbo].[ApplicationUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationUserTokens_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[ApplicationUserTokens] CHECK CONSTRAINT [FK_ApplicationUserTokens_Users]
GO
ALTER TABLE [dbo].[Cards]  WITH CHECK ADD  CONSTRAINT [FK_Cards_UserBankDetails] FOREIGN KEY([BankDetailId])
REFERENCES [dbo].[UserBankDetails] ([BankDetailId])
GO
ALTER TABLE [dbo].[Cards] CHECK CONSTRAINT [FK_Cards_UserBankDetails]
GO
ALTER TABLE [dbo].[ComponentLanguageContents]  WITH CHECK ADD  CONSTRAINT [FK_ComponentLanguageContents_LanguageContentKeys] FOREIGN KEY([ComponentKeyId])
REFERENCES [dbo].[LanguageContentKeys] ([LanguageContentKeyId])
GO
ALTER TABLE [dbo].[ComponentLanguageContents] CHECK CONSTRAINT [FK_ComponentLanguageContents_LanguageContentKeys]
GO
ALTER TABLE [dbo].[ComponentLanguageContents]  WITH CHECK ADD  CONSTRAINT [FK_ComponentLanguageContents_LanguageContents] FOREIGN KEY([LanguageContentId])
REFERENCES [dbo].[LanguageContents] ([LanguageContentId])
GO
ALTER TABLE [dbo].[ComponentLanguageContents] CHECK CONSTRAINT [FK_ComponentLanguageContents_LanguageContents]
GO
ALTER TABLE [dbo].[GpayUsers]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserTypeObjects] FOREIGN KEY([UserTypeId])
REFERENCES [dbo].[UserTypeObjects] ([UserTypeId])
GO
ALTER TABLE [dbo].[GpayUsers] CHECK CONSTRAINT [FK_Users_UserTypeObjects]
GO
ALTER TABLE [dbo].[LanguageContents]  WITH CHECK ADD  CONSTRAINT [FK_LanguageContents_LanguageContentKeys] FOREIGN KEY([LanguageContentKeyId])
REFERENCES [dbo].[LanguageContentKeys] ([LanguageContentKeyId])
GO
ALTER TABLE [dbo].[LanguageContents] CHECK CONSTRAINT [FK_LanguageContents_LanguageContentKeys]
GO
ALTER TABLE [dbo].[ModuleMasters]  WITH CHECK ADD  CONSTRAINT [FK_ModuleMasters_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[ModuleMasters] CHECK CONSTRAINT [FK_ModuleMasters_ApplicationObjects]
GO
ALTER TABLE [dbo].[Rewards]  WITH CHECK ADD  CONSTRAINT [FK_Rewards_GpayUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[GpayUsers] ([GPayUserId])
GO
ALTER TABLE [dbo].[Rewards] CHECK CONSTRAINT [FK_Rewards_GpayUsers]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_ApplicationModules] FOREIGN KEY([ApplicationModuleId])
REFERENCES [dbo].[ApplicationModules] ([ApplicationModuleId])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_ApplicationModules]
GO
ALTER TABLE [dbo].[RolePermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissions_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[RolePermissions] CHECK CONSTRAINT [FK_RolePermissions_Roles]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_ApplicationObjects]
GO
ALTER TABLE [dbo].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_ApplicationObjects1] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Roles] CHECK CONSTRAINT [FK_Roles_ApplicationObjects1]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_GpayUsers] FOREIGN KEY([SenderId])
REFERENCES [dbo].[GpayUsers] ([GPayUserId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_GpayUsers]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_GpayUsers1] FOREIGN KEY([ReciverId])
REFERENCES [dbo].[GpayUsers] ([GPayUserId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_GpayUsers1]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_TransactionStatusObjects] FOREIGN KEY([TransactionStatus])
REFERENCES [dbo].[TransactionStatusObjects] ([TransactionStatusId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_TransactionStatusObjects]
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD  CONSTRAINT [FK_Transactions_Upis] FOREIGN KEY([UPIId])
REFERENCES [dbo].[Upis] ([UpiId])
GO
ALTER TABLE [dbo].[Transactions] CHECK CONSTRAINT [FK_Transactions_Upis]
GO
ALTER TABLE [dbo].[Upis]  WITH CHECK ADD  CONSTRAINT [FK_Upis_UserBankDetails] FOREIGN KEY([BankDetailId])
REFERENCES [dbo].[UserBankDetails] ([BankDetailId])
GO
ALTER TABLE [dbo].[Upis] CHECK CONSTRAINT [FK_Upis_UserBankDetails]
GO
ALTER TABLE [dbo].[UserBankDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserBankDetails_GpayUsers] FOREIGN KEY([GPayUserId])
REFERENCES [dbo].[GpayUsers] ([GPayUserId])
GO
ALTER TABLE [dbo].[UserBankDetails] CHECK CONSTRAINT [FK_UserBankDetails_GpayUsers]
GO
ALTER TABLE [dbo].[UserBankDetails]  WITH CHECK ADD  CONSTRAINT [FK_UserDetails_UserDetails1] FOREIGN KEY([BankId])
REFERENCES [dbo].[Banks] ([BankId])
GO
ALTER TABLE [dbo].[UserBankDetails] CHECK CONSTRAINT [FK_UserDetails_UserDetails1]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Roles]
GO
ALTER TABLE [dbo].[UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserRoles_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserRoles] CHECK CONSTRAINT [FK_UserRoles_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_ApplicationObjects] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ApplicationObjects] ([ApplicationObjectId])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_ApplicationObjects]
GO
/****** Object:  StoredProcedure [dbo].[spCanDeleteRecord]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[spCanDeleteRecord](@TableName nvarchar(50), @RecordId int)
AS
BEGIN
			--DECLARE @RecordId INT=1
			--DECLARE @TableName nvarchar(50)='ApplicationModules'

			DECLARE @FkName nvarchar(250)
			DECLARE @ParentTable nvarchar(100)
			DECLARE @KeyName nvarchar(100)
			DECLARE @ReferenceTable nvarchar(100)
			DECLARE @TableSchema nvarchar(100)

			DECLARE @DynSql nvarchar(max)
			DECLARE @ReturnValue bit = 0
			CREATE TABLE #myTable(Cnt int)

			DECLARE RefCursor Cursor FOR
							SELECT
								    fk.name 'FkName',
								    tp.name 'ParentTable',
								    cp.name 'KeyName', 
									tr.name 'RefrenceTable',
									info.TABLE_SCHEMA 'TableSchema'
							FROM 
									sys.foreign_keys fk
									INNER JOIN 
									    sys.tables tp ON fk.parent_object_id = tp.object_id
									INNER JOIN 
										sys.tables tr ON fk.referenced_object_id = tr.object_id
									INNER JOIN 
										sys.foreign_key_columns fkc ON fkc.constraint_object_id = fk.object_id
									INNER JOIN 
										sys.columns cp ON fkc.parent_column_id = cp.column_id AND fkc.parent_object_id = cp.object_id
									INNER JOIN 
										sys.columns cr ON fkc.referenced_column_id = cr.column_id AND fkc.referenced_object_id = cr.object_id
						             INNER JOIN 
									    INFORMATION_SCHEMA.COLUMNS info ON tp.[name] =info.TABLE_NAME
							WHERE 
									tr.name=@TableName
									and tp.name!='Addresses' --To be removed once actual implementation done with Archi. 14-07-2017

			OPEN RefCursor
			FETCH NEXT FROM RefCursor INTO @FkName, @ParentTable, @KeyName, @ReferenceTable,@TableSchema
			WHILE @@FETCH_STATUS=0
			BEGIN
					--SELECT 	@FkName, @ParentTable, @KeyName, @ReferenceTable
					SET @DynSql	='	SELECT COUNT(*) Cnt FROM ' +@TableSchema+'.' + @ParentTable + '  WHERE ' + @KeyName + ' = ' + Cast(@RecordId as nvarchar(5))

					INSERT INTO #myTable(Cnt)
					EXEC (@DynSQL)  

					IF EXISTS(Select CNT from #myTable WHERE CNT>0)
					BEGIN
							SET @ReturnValue =1
							BREAK;
					END
					SET @DynSql=''		
					FETCH NEXT FROM RefCursor INTO @FkName, @ParentTable, @KeyName, @ReferenceTable,@TableSchema
			END
			CLOSE RefCursor
			Deallocate RefCursor
			DROP TABLE #myTable
			SELECT 1 as Id,  @ReturnValue as Result

END
GO
/****** Object:  StoredProcedure [dbo].[spRewards]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRewards]		@rewardAmount float,										
										@recieverId bigint,
										@sendDate datetime2(7) ,																				
										@rewardId bigint
AS
BEGIN
	
	SET NOCOUNT ON;	
    update Rewards set amount = @rewardAmount, ScratchStatus = 1 where RewardId = @rewardId;
	update UserBankDetails SET  Balance  = Balance-@rewardAmount  Where   GPayUserId = 3 and AddedStatus = 1 ;
	insert into Transactions(SenderId,ReciverId,Amount,	SendDate,TransactionStatus,UPIId,Remarks) values (3,@recieverId,@rewardAmount,@sendDate,1,3,'Reward');
	update UserBankDetails SET Balance = Balance+@rewardAmount where GPayUserId = @recieverId and AddedStatus = 1;
	
Return
END
GO
/****** Object:  StoredProcedure [dbo].[spTransactions]    Script Date: 2/27/2020 10:33:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTransactions]		@amount float,
										@senderId bigint,
										@recieverId bigint,
										@sendDate datetime2(7) ,
										@transactionStatus tinyint,
										@remark varchar(max),
										@upiId bigint
									/*	@flag bit OUTPUT */
AS
BEGIN
	
	SET NOCOUNT ON;	
		
	BEGIN TRY

	update UserBankDetails SET  Balance  = Balance-@amount  Where   GPayUserId = @senderId and AddedStatus = 1 ;
	insert into Transactions(SenderId,ReciverId,Amount,	SendDate,TransactionStatus,UPIId,Remarks) values (@senderId,@recieverId,@amount,@sendDate,@transactionStatus,@upiId,@remark);
	update UserBankDetails SET Balance = Balance+@amount where GPayUserId = @recieverId and AddedStatus = 1;
	
	/*select @flag = 1;*/
	
	END TRY

	Begin Catch
/*	select @flag = 0; */

		update UserBankDetails SEt Balance = Balance+@amount where GPayUserId = 3;
		/* if transactoin failed then inserting amount to google pay admin.. */
		insert into Transactions(SenderId,ReciverId,Amount,SendDate,TransactionStatus,UpiId,Remarks) values (@senderId,3,@amount,@sendDate,@transactionStatus,@upiId,@remark);

	Return
	END Catch

Return
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Parent Application Module' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApplicationModules', @level2type=N'COLUMN',@level2name=N'ParentApplicationModuleId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Main Primary Key' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApplicationObjects', @level2type=N'COLUMN',@level2name=N'ApplicationObjectId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Application Objects is used Application wide' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ApplicationObjects'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Thid field is the reference of LanguageContentKeys table, This stores only those ids of the respective IsComponent column value is true.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ComponentLanguageContents', @level2type=N'COLUMN',@level2name=N'ComponentKeyId'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'only respective values are allowed  like for placeholder ''p'', label ''l'',gridHeader ''gh''' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'LanguageContents', @level2type=N'COLUMN',@level2name=N'ContentType'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "GpayUsers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 334
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Transactions"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 344
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAllTransactions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vAllTransactions'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "GpayUsers"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 344
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "UserBankDetails"
            Begin Extent = 
               Top = 6
               Left = 454
               Bottom = 283
               Right = 632
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Upis"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 240
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 1
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vBankAccountInformation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vBankAccountInformation'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "appuser"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 251
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "locale"
            Begin Extent = 
               Top = 6
               Left = 289
               Bottom = 136
               Right = 483
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "timezone"
            Begin Extent = 
               Top = 6
               Left = 521
               Bottom = 136
               Right = 756
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vUsers'
GO
USE [master]
GO
ALTER DATABASE [GooglePayDb] SET  READ_WRITE 
GO
