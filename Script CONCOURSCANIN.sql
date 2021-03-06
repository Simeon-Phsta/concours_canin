USE [master]
GO
/****** Object:  Database [CONCOURSCANIN]    Script Date: 30/12/2020 17:05:17 ******/
CREATE DATABASE [CONCOURSCANIN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CONCOURSCANIN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CONCOURSCANIN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CONCOURSCANIN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\CONCOURSCANIN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CONCOURSCANIN] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CONCOURSCANIN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CONCOURSCANIN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET ARITHABORT OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CONCOURSCANIN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CONCOURSCANIN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CONCOURSCANIN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CONCOURSCANIN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET RECOVERY FULL 
GO
ALTER DATABASE [CONCOURSCANIN] SET  MULTI_USER 
GO
ALTER DATABASE [CONCOURSCANIN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CONCOURSCANIN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CONCOURSCANIN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CONCOURSCANIN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CONCOURSCANIN] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CONCOURSCANIN] SET QUERY_STORE = OFF
GO
USE [CONCOURSCANIN]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [CONCOURSCANIN]
GO
/****** Object:  Table [dbo].[DERACE]    Script Date: 30/12/2020 17:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DERACE](
	[codechien] [char](6) NOT NULL,
	[codeproprietaire] [char](6) NOT NULL,
	[race] [char](20) NULL,
	[robe] [char](20) NULL,
 CONSTRAINT [PK_DERACE] PRIMARY KEY CLUSTERED 
(
	[codechien] ASC,
	[codeproprietaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHIEN]    Script Date: 30/12/2020 17:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHIEN](
	[codechien] [char](6) NOT NULL,
	[codeproprietaire] [char](6) NOT NULL,
	[ddnchien] [smalldatetime] NULL,
	[nomchien] [char](30) NULL,
 CONSTRAINT [PK_CHIEN] PRIMARY KEY CLUSTERED 
(
	[codechien] ASC,
	[codeproprietaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VUERACE]    Script Date: 30/12/2020 17:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Objet : vue dbo.VUERACE    ******/
CREATE VIEW [dbo].[VUERACE]
AS
SELECT C.codechien, C.codeproprietaire, ddnchien,nomchien, race, robe
FROM CHIEN C, DERACE R
WHERE C.codechien = R.codechien
AND C.codeproprietaire = R.codeproprietaire
GO
/****** Object:  Table [dbo].[BATARD]    Script Date: 30/12/2020 17:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BATARD](
	[codechien] [char](6) NOT NULL,
	[codeproprietaire] [char](6) NOT NULL,
	[caracteristiques] [char](30) NULL,
 CONSTRAINT [PK_BATARD] PRIMARY KEY CLUSTERED 
(
	[codechien] ASC,
	[codeproprietaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VUEBATARD]    Script Date: 30/12/2020 17:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Objet : vue dbo.VUEBATARD    ******/
CREATE VIEW [dbo].[VUEBATARD]
AS
SELECT C.codechien, C.codeproprietaire, ddnchien, nomchien, caracteristiques
FROM CHIEN C, BATARD B
WHERE C.codechien = B.codechien
AND C.codeproprietaire = B.codeproprietaire
GO
/****** Object:  Table [dbo].[CONCOURS]    Script Date: 30/12/2020 17:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CONCOURS](
	[codeconcours] [char](6) NOT NULL,
	[adresseconcours] [char](40) NULL,
	[cpconcours] [char](5) NULL,
	[dateconcours] [smalldatetime] NULL,
	[salleconcours] [char](20) NULL,
	[villeconcours] [char](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[codeconcours] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PARTICIPE]    Script Date: 30/12/2020 17:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PARTICIPE](
	[codeproprietaire] [char](6) NOT NULL,
	[codechien] [char](6) NOT NULL,
	[codeconcours] [char](6) NOT NULL,
	[note] [int] NULL,
 CONSTRAINT [PK_PARTICIPE] PRIMARY KEY CLUSTERED 
(
	[codechien] ASC,
	[codeproprietaire] ASC,
	[codeconcours] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROPRIETAIRE]    Script Date: 30/12/2020 17:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROPRIETAIRE](
	[codeproprietaire] [char](6) NOT NULL,
	[adresseproprietaire] [char](30) NULL,
	[cpproprietaire] [char](5) NULL,
	[nomproprietaire] [char](20) NULL,
	[prenomproprietaire] [char](20) NULL,
	[villeproprietaire] [char](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[codeproprietaire] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BATARD] ([codechien], [codeproprietaire], [caracteristiques]) VALUES (N'ICO13 ', N'345Y5 ', N'FOX CANICHE                   ')
INSERT [dbo].[BATARD] ([codechien], [codeproprietaire], [caracteristiques]) VALUES (N'LOU13 ', N'543R4 ', N'CANICHE COKER                 ')
INSERT [dbo].[CHIEN] ([codechien], [codeproprietaire], [ddnchien], [nomchien]) VALUES (N'GG19  ', N'54TY9 ', CAST(N'2020-03-03T00:00:00' AS SmallDateTime), N'JAVA                          ')
INSERT [dbo].[CHIEN] ([codechien], [codeproprietaire], [ddnchien], [nomchien]) VALUES (N'HRE87 ', N'976T5 ', CAST(N'2017-07-07T00:00:00' AS SmallDateTime), N'PATAUD                        ')
INSERT [dbo].[CHIEN] ([codechien], [codeproprietaire], [ddnchien], [nomchien]) VALUES (N'ICO13 ', N'345Y5 ', CAST(N'2018-10-20T00:00:00' AS SmallDateTime), N'PILOU                         ')
INSERT [dbo].[CHIEN] ([codechien], [codeproprietaire], [ddnchien], [nomchien]) VALUES (N'INT32 ', N'345Y5 ', CAST(N'2019-02-03T00:00:00' AS SmallDateTime), N'RINTINTIN                     ')
INSERT [dbo].[CHIEN] ([codechien], [codeproprietaire], [ddnchien], [nomchien]) VALUES (N'KJY98 ', N'976T5 ', CAST(N'2017-02-20T00:00:00' AS SmallDateTime), N'JOE                           ')
INSERT [dbo].[CHIEN] ([codechien], [codeproprietaire], [ddnchien], [nomchien]) VALUES (N'LOU13 ', N'543R4 ', CAST(N'2019-05-06T00:00:00' AS SmallDateTime), N'MILOU                         ')
INSERT [dbo].[CHIEN] ([codechien], [codeproprietaire], [ddnchien], [nomchien]) VALUES (N'OSC74 ', N'543R4 ', CAST(N'2018-05-21T00:00:00' AS SmallDateTime), N'OSCAR                         ')
INSERT [dbo].[CHIEN] ([codechien], [codeproprietaire], [ddnchien], [nomchien]) VALUES (N'TYH45 ', N'976T5 ', CAST(N'2019-12-12T00:00:00' AS SmallDateTime), N'SMOOTHIE                      ')
INSERT [dbo].[CHIEN] ([codechien], [codeproprietaire], [ddnchien], [nomchien]) VALUES (N'ZUI67 ', N'543R4 ', CAST(N'2020-10-14T00:00:00' AS SmallDateTime), N'ZAC                           ')
INSERT [dbo].[CONCOURS] ([codeconcours], [adresseconcours], [cpconcours], [dateconcours], [salleconcours], [villeconcours]) VALUES (N'9OCWOZ', N'esg                                     ', N'esr  ', NULL, N'ersg                ', N'erhs                ')
INSERT [dbo].[CONCOURS] ([codeconcours], [adresseconcours], [cpconcours], [dateconcours], [salleconcours], [villeconcours]) VALUES (N'ZUMRX0', N'zegs                                    ', N'ersg ', NULL, N'zge                 ', N'gersg               ')
INSERT [dbo].[DERACE] ([codechien], [codeproprietaire], [race], [robe]) VALUES (N'GG19  ', N'54TY9 ', N'LABRADOR            ', N'BLANC               ')
INSERT [dbo].[DERACE] ([codechien], [codeproprietaire], [race], [robe]) VALUES (N'HRE87 ', N'976T5 ', N'DALMATIEN           ', N'TACHETE             ')
INSERT [dbo].[DERACE] ([codechien], [codeproprietaire], [race], [robe]) VALUES (N'INT32 ', N'345Y5 ', N'BERGER ALLEMAND     ', N'NOIR                ')
INSERT [dbo].[DERACE] ([codechien], [codeproprietaire], [race], [robe]) VALUES (N'OSC74 ', N'543R4 ', N'COCKER              ', N'NOIR                ')
INSERT [dbo].[DERACE] ([codechien], [codeproprietaire], [race], [robe]) VALUES (N'TYH45 ', N'976T5 ', N'COCKER              ', N'GOLDEN              ')
INSERT [dbo].[DERACE] ([codechien], [codeproprietaire], [race], [robe]) VALUES (N'ZUI67 ', N'543R4 ', N'DOBERMAN            ', N'NOIR                ')
INSERT [dbo].[PARTICIPE] ([codeproprietaire], [codechien], [codeconcours], [note]) VALUES (N'976T5 ', N'HRE87 ', N'ZUMRX0', NULL)
INSERT [dbo].[PARTICIPE] ([codeproprietaire], [codechien], [codeconcours], [note]) VALUES (N'345Y5 ', N'INT32 ', N'ZUMRX0', NULL)
INSERT [dbo].[PARTICIPE] ([codeproprietaire], [codechien], [codeconcours], [note]) VALUES (N'976T5 ', N'TYH45 ', N'9OCWOZ', 4)
INSERT [dbo].[PARTICIPE] ([codeproprietaire], [codechien], [codeconcours], [note]) VALUES (N'543R4 ', N'ZUI67 ', N'9OCWOZ', NULL)
INSERT [dbo].[PROPRIETAIRE] ([codeproprietaire], [adresseproprietaire], [cpproprietaire], [nomproprietaire], [prenomproprietaire], [villeproprietaire]) VALUES (N'345Y5 ', N'80 rue des inguieras          ', N'13000', N'INDUREN             ', N'MARCEL              ', N'MARSEILLE                     ')
INSERT [dbo].[PROPRIETAIRE] ([codeproprietaire], [adresseproprietaire], [cpproprietaire], [nomproprietaire], [prenomproprietaire], [villeproprietaire]) VALUES (N'543R4 ', N'98 rue des peupliers          ', N'58000', N'PARENT              ', N'PASCAL              ', N'NEVERS                        ')
INSERT [dbo].[PROPRIETAIRE] ([codeproprietaire], [adresseproprietaire], [cpproprietaire], [nomproprietaire], [prenomproprietaire], [villeproprietaire]) VALUES (N'54TY9 ', N'Place Meunier                 ', N'03000', N'BOUTIN              ', N'IDA                 ', N'MOULINS                       ')
INSERT [dbo].[PROPRIETAIRE] ([codeproprietaire], [adresseproprietaire], [cpproprietaire], [nomproprietaire], [prenomproprietaire], [villeproprietaire]) VALUES (N'976T5 ', N'65 avenue FOCH                ', N'75000', N'RAMBOURG            ', N'BENJAMIN            ', N'PARIS                         ')
INSERT [dbo].[PROPRIETAIRE] ([codeproprietaire], [adresseproprietaire], [cpproprietaire], [nomproprietaire], [prenomproprietaire], [villeproprietaire]) VALUES (N'SXMT7R', N'esg                           ', N'esg  ', N'rgsg                ', N'seg                 ', N'grg                           ')
ALTER TABLE [dbo].[CHIEN]  WITH CHECK ADD  CONSTRAINT [FK__CHIEN__codepropr__00551192] FOREIGN KEY([codeproprietaire])
REFERENCES [dbo].[PROPRIETAIRE] ([codeproprietaire])
GO
ALTER TABLE [dbo].[CHIEN] CHECK CONSTRAINT [FK__CHIEN__codepropr__00551192]
GO
ALTER TABLE [dbo].[PARTICIPE]  WITH CHECK ADD  CONSTRAINT [FK_PARTICIPE_CHIEN] FOREIGN KEY([codechien], [codeproprietaire])
REFERENCES [dbo].[CHIEN] ([codechien], [codeproprietaire])
GO
ALTER TABLE [dbo].[PARTICIPE] CHECK CONSTRAINT [FK_PARTICIPE_CHIEN]
GO
ALTER TABLE [dbo].[PARTICIPE]  WITH CHECK ADD  CONSTRAINT [FK_PARTICIPE_CONCOURS] FOREIGN KEY([codeconcours])
REFERENCES [dbo].[CONCOURS] ([codeconcours])
GO
ALTER TABLE [dbo].[PARTICIPE] CHECK CONSTRAINT [FK_PARTICIPE_CONCOURS]
GO
/****** Object:  StoredProcedure [dbo].[CountQuery]    Script Date: 30/12/2020 17:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountQuery]
AS
	SET NOCOUNT ON;
SELECT COUNT(*) FROM PROPRIETAIRE
GO
/****** Object:  StoredProcedure [dbo].[pCONCOURS_INSERT]    Script Date: 30/12/2020 17:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Objet : Procédure stockée dbo.pCONCOURS_INSERT */ 
CREATE PROC [dbo].[pCONCOURS_INSERT] 
	
	@codeConcours char(6)
	,@adresse char(40) 
	,@cpconcours char(5) 
	,@dateconcours smallDateTime 
	,@salle char(20) 
	,@ville char(20) 
	AS 
	INSERT CONCOURS ( 
		codeconcours 
		,adresseconcours 
		,cpconcours 
		,dateconcours 
		,salleconcours 
		,villeconcours  ) 
	VALUES ( 
		@codeConcours 
		,@adresse 
		,@cpconcours 
		,@dateconcours 
		,@salle 
		,@ville )
GO
/****** Object:  StoredProcedure [dbo].[pPARTICIPE_INSERT]    Script Date: 30/12/2020 17:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pPARTICIPE_INSERT] 
	
	@codeprop char(6)
	,@codechien char(6)  
	,@codeconc char(6) 
	,@note int 
	AS 
	INSERT PARTICIPE ( 
		codeproprietaire 
		,codechien 
		,codeconcours 
		,note  ) 
	VALUES ( 
		@codeprop 
		,@codechien 
		,@codeconc 
		,@note )
GO
/****** Object:  StoredProcedure [dbo].[pPROPRIETAIRE_INSERT]    Script Date: 30/12/2020 17:05:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[pPROPRIETAIRE_INSERT] 
	
	@codeprop char(6)
	,@adresse char(30) 
	,@cp char(5) 
	,@nom char(20)
	,@prenom char(20) 
	,@ville char(30) 
	AS 
	INSERT PROPRIETAIRE ( 
		codeproprietaire
		,adresseproprietaire 
		,cpproprietaire 
		,nomproprietaire
		,prenomproprietaire 
		,villeproprietaire  ) 
	VALUES ( 
		@codeprop 
		,@adresse 
		,@cp 
		,@nom 
		,@prenom 
		,@ville )
GO
USE [master]
GO
ALTER DATABASE [CONCOURSCANIN] SET  READ_WRITE 
GO
