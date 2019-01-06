USE [master]
GO
/****** Object:  Database [LogCorner.EduSync.Speech.Data]    Script Date: 28/12/2018 16:45:44 ******/
CREATE DATABASE [LogCorner.EduSync.Speech.Data]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LogCorner.EduSync.Speech.Data', FILENAME = N'C:\Users\gora.leye\LogCorner.EduSync.Speech.Data.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LogCorner.EduSync.Speech.Data_log', FILENAME = N'C:\Users\gora.leye\LogCorner.EduSync.Speech.Data_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LogCorner.EduSync.Speech.Data].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET ARITHABORT OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET  MULTI_USER 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LogCorner.EduSync.Speech.Data]
GO
/****** Object:  Table [dbo].[Movie]    Script Date: 28/12/2018 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[ID] [uniqueidentifier] NOT NULL,
	[Title] [nvarchar](250) NOT NULL,
	[Status] [int] NOT NULL,
	[Url] [nvarchar](250) NULL,
	[Tags] [nvarchar](max) NULL,
 CONSTRAINT [PK_Movie] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Presenter]    Script Date: 28/12/2018 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Presenter](
	[ID] [uniqueidentifier] NOT NULL,
	[ProfileID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Presenter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Speech]    Script Date: 28/12/2018 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Speech](
	[ID] [uniqueidentifier] NOT NULL DEFAULT (newid()),
	[Title] [nvarchar](250) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Status] [int] NOT NULL,
	[Url] [nvarchar](250) NOT NULL,
	[UpdatedOn] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL DEFAULT (getdate()),
	[CreatedBy] [nvarchar](120) NOT NULL,
	[UpdatedBy] [nvarchar](120) NULL,
	[Type] [int] NOT NULL DEFAULT ((1)),
 CONSTRAINT [PK_Presentation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpeechMovie]    Script Date: 28/12/2018 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpeechMovie](
	[PresentationID] [uniqueidentifier] NOT NULL,
	[MovieID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [U_Presentation_Movie] UNIQUE NONCLUSTERED 
(
	[MovieID] ASC,
	[PresentationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SpeechPresentedBy]    Script Date: 28/12/2018 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SpeechPresentedBy](
	[PresentationID] [uniqueidentifier] NOT NULL,
	[PresenterID] [uniqueidentifier] NOT NULL,
 CONSTRAINT [U_Presentation_PresentedBy] UNIQUE NONCLUSTERED 
(
	[PresenterID] ASC,
	[PresentationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Movie] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[Presenter] ADD  DEFAULT (newid()) FOR [ID]
GO
ALTER TABLE [dbo].[SpeechMovie]  WITH CHECK ADD  CONSTRAINT [FK_PresentationMovie_Movie] FOREIGN KEY([MovieID])
REFERENCES [dbo].[Movie] ([ID])
GO
ALTER TABLE [dbo].[SpeechMovie] CHECK CONSTRAINT [FK_PresentationMovie_Movie]
GO
ALTER TABLE [dbo].[SpeechMovie]  WITH CHECK ADD  CONSTRAINT [FK_PresentationMovie_Presentation] FOREIGN KEY([PresentationID])
REFERENCES [dbo].[Speech] ([ID])
GO
ALTER TABLE [dbo].[SpeechMovie] CHECK CONSTRAINT [FK_PresentationMovie_Presentation]
GO
ALTER TABLE [dbo].[SpeechPresentedBy]  WITH CHECK ADD  CONSTRAINT [FK_PresentationPresentedBy_Movie] FOREIGN KEY([PresentationID])
REFERENCES [dbo].[Speech] ([ID])
GO
ALTER TABLE [dbo].[SpeechPresentedBy] CHECK CONSTRAINT [FK_PresentationPresentedBy_Movie]
GO
ALTER TABLE [dbo].[SpeechPresentedBy]  WITH CHECK ADD  CONSTRAINT [FK_PresentationPresentedBy_Presenter] FOREIGN KEY([PresenterID])
REFERENCES [dbo].[Presenter] ([ID])
GO
ALTER TABLE [dbo].[SpeechPresentedBy] CHECK CONSTRAINT [FK_PresentationPresentedBy_Presenter]
GO
/****** Object:  StoredProcedure [dbo].[GetAllPresentations]    Script Date: 28/12/2018 16:45:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAllPresentations]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



SELECT [ID]
      ,[Title]
      ,[Description]
      ,[Status]
      ,[Url]
      ,[UpdatedOn]
      ,[CreatedOn]
      ,[CreatedBy]
      ,[UpdatedBy]
      ,[Type]
  FROM [dbo].[Presentation]



END

GO
USE [master]
GO
ALTER DATABASE [LogCorner.EduSync.Speech.Data] SET  READ_WRITE 
GO
