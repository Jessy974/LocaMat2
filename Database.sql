USE [master]
GO
/****** Object:  Database [LocaMat]    Script Date: 10/06/2018 00:32:59 ******/
CREATE DATABASE [LocaMat]
GO
ALTER DATABASE [LocaMat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LocaMat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LocaMat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LocaMat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LocaMat] SET ARITHABORT OFF 
GO
ALTER DATABASE [LocaMat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LocaMat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LocaMat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LocaMat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LocaMat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LocaMat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LocaMat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LocaMat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LocaMat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LocaMat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LocaMat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LocaMat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LocaMat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LocaMat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LocaMat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LocaMat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LocaMat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LocaMat] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [LocaMat] SET  MULTI_USER 
GO
ALTER DATABASE [LocaMat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LocaMat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LocaMat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LocaMat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LocaMat] SET DELAYED_DURABILITY = DISABLED 
GO
USE [LocaMat]
GO
/****** Object:  Table [dbo].[Agences]    Script Date: 10/06/2018 00:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ville] [varchar](50) NOT NULL,
	[Adresse] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Agences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoriesProduits]    Script Date: 10/06/2018 00:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriesProduits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NOT NULL,
 CONSTRAINT [PK_CategoriesProduits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clients]    Script Date: 10/06/2018 00:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](50) NOT NULL,
	[Prenom] [varchar](50) NOT NULL,
	[Adresse] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Clients] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 10/06/2018 00:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProduit] [int] NOT NULL,
	[IdAgence] [int] NOT NULL,
	[IdClient] [int] NOT NULL,
	[DateDebut] [datetime] NOT NULL,
	[DateFin] [datetime] NOT NULL,
	[Quantite] [int] NOT NULL,
	[TotalFacture] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OffresProduits]    Script Date: 10/06/2018 00:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OffresProduits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProduit] [int] NOT NULL,
	[IdAgence] [int] NOT NULL,
	[Quantite] [int] NOT NULL,
 CONSTRAINT [PK_OffresProduits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produits]    Script Date: 10/06/2018 00:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nom] [varchar](150) NOT NULL,
	[Description] [varchar](300) NULL,
	[IdCategorie] [int] NOT NULL,
	[PrixJourHT] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Produits] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Agences] ON 
GO
INSERT [dbo].[Agences] ([Id], [Ville], [Adresse]) VALUES (1, N'ROUEN', N'15 Avenue Champlain')
GO
INSERT [dbo].[Agences] ([Id], [Ville], [Adresse]) VALUES (2, N'PARIS', N'144 Cour Bénédicte Durand')
GO
INSERT [dbo].[Agences] ([Id], [Ville], [Adresse]) VALUES (3, N'BORDEAUX', N'1 Rue de l''épée')
GO
INSERT [dbo].[Agences] ([Id], [Ville], [Adresse]) VALUES (4, N'TOULOUSE', N'25 Rue Claude Déterd')
GO
SET IDENTITY_INSERT [dbo].[Agences] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoriesProduits] ON 
GO
INSERT [dbo].[CategoriesProduits] ([Id], [Nom]) VALUES (1, N'Nettoyage')
GO
INSERT [dbo].[CategoriesProduits] ([Id], [Nom]) VALUES (2, N'Espaces verts')
GO
INSERT [dbo].[CategoriesProduits] ([Id], [Nom]) VALUES (3, N'Elévation')
GO
INSERT [dbo].[CategoriesProduits] ([Id], [Nom]) VALUES (4, N'Perforation')
GO
INSERT [dbo].[CategoriesProduits] ([Id], [Nom]) VALUES (5, N'Sciage')
GO
SET IDENTITY_INSERT [dbo].[CategoriesProduits] OFF
GO
SET IDENTITY_INSERT [dbo].[OffresProduits] ON 
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (1, 1, 1, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (2, 1, 2, 3)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (3, 1, 3, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (4, 1, 4, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (5, 2, 1, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (6, 2, 2, 3)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (7, 2, 3, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (8, 2, 4, 3)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (9, 3, 1, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (10, 3, 2, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (11, 3, 3, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (12, 4, 1, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (13, 4, 2, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (14, 4, 3, 3)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (16, 4, 4, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (17, 5, 1, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (18, 5, 2, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (19, 5, 3, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (20, 5, 4, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (21, 7, 1, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (22, 7, 2, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (23, 7, 4, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (24, 8, 2, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (25, 8, 3, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (26, 8, 3, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (27, 9, 1, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (28, 9, 2, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (29, 9, 4, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (30, 10, 1, 3)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (31, 10, 2, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (32, 10, 3, 4)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (33, 10, 4, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (34, 11, 1, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (35, 11, 3, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (36, 11, 4, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (37, 12, 1, 3)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (38, 12, 2, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (39, 12, 3, 4)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (40, 12, 4, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (41, 14, 1, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (42, 14, 2, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (43, 14, 3, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (44, 14, 4, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (46, 17, 1, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (47, 17, 2, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (48, 17, 3, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (49, 17, 4, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (50, 18, 1, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (51, 18, 3, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (52, 18, 4, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (53, 19, 1, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (54, 19, 2, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (55, 19, 3, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (56, 19, 4, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (57, 20, 2, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (58, 20, 3, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (59, 20, 4, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (60, 21, 1, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (61, 21, 2, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (62, 21, 3, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (63, 21, 4, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (64, 22, 1, 4)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (65, 22, 2, 3)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (66, 22, 3, 5)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (67, 22, 4, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (68, 23, 1, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (69, 23, 3, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (70, 24, 1, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (71, 24, 2, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (72, 24, 3, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (73, 24, 4, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (74, 25, 1, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (75, 25, 2, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (76, 26, 4, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (77, 26, 1, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (78, 26, 2, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (79, 26, 3, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (80, 26, 4, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (81, 27, 1, 3)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (82, 27, 2, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (86, 27, 3, 2)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (87, 27, 4, 3)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (88, 30, 1, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (89, 30, 2, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (90, 30, 3, 1)
GO
INSERT [dbo].[OffresProduits] ([Id], [IdProduit], [IdAgence], [Quantite]) VALUES (91, 30, 4, 1)
GO
SET IDENTITY_INSERT [dbo].[OffresProduits] OFF
GO
SET IDENTITY_INSERT [dbo].[Produits] ON 
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (1, N'	MARTEAU PERFORATEUR ÉLECTRIQUE 6 KG', N'Perçage de trous d’ancrage dans les matériaux de construction. Percement de trous traversants dans le béton, pierre, brique, bois ou métal.', 4, CAST(24.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (2, N'	MARTEAU PERFORATEUR ÉLECTRIQUE 2,5 KG', N'Perçage de trous d’ancrage dans les matériaux de construction
Percement de trous traversants dans le béton, pierre, brique, bois ou métal', 4, CAST(11.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (3, N'MARTEAU PERFORATEUR SANS FIL 36 V - < 5 KG  ', N'Perçage de trous d’ancrage dans les matériaux de construction
Percement de trous traversants dans le béton, pierre, brique, bois ou métal', 4, CAST(20.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (4, N'	PERCEUSE-VISSEUSE SANS FIL 36 V  ', N'Percement et vissage sur des structures en acier ou bois', 4, CAST(6.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (5, N'MARTEAU PIQUEUR ÉLECTRIQUE 230 V - 10 KG  ', N'- Démolition de béton, briques, pierres naturelles au pic ou au burin.
- Perçage de matériaux tendres ou durs avec forets.', 4, CAST(34.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (7, N'ECHAFAUDAGE ROULANT 7M', N'L’échafaudage roulant est un outil utilisé par de nombreux corps d’état. Sa capacité à être facilement transporté, monté, démonté ou déplacé fait de lui un outil polyvalent.', 3, CAST(37.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (8, N'ECHAFAUDAGE ROULANT <= 2M', N'L’échafaudage roulant est un outil utilisé par de nombreux corps d’état. Sa capacité à être facilement transporté, monté, démonté ou déplacé fait de lui un outil polyvalent.', 3, CAST(16.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (9, N'PLATEFORME INDIVIDUELLE TELESCOPIQUE', N'Elévation des personnes pour tous travaux en poste fixe à faible hauteur.', 3, CAST(8.10 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (10, N'TONDEUSE A GAZON TRACTEE ESSENCE  ', N'Coupe d’herbe fine et de faible hauteur', 2, CAST(30.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (11, N'TONDEUSE AUTOPORTÉE 20/25 CV', N'- Tonte professionnelle des moyennes et grandes surfaces, avec ramassage
- Utilisable même sur herbe mouillée ou haute', 2, CAST(109.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (12, N'TAILLE HAIE BI LAME 0,60M', N'Taille de haies épaisses ou noueuses. ', 2, CAST(19.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (14, N'DEBROUSSAILLEUSE PORTEE ESSENCE  ', N'Fauchage et défrichage d''herbes tenaces, broussailles, ronces', 2, CAST(25.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (17, N'SOUFFLEUR POUR FEUILLES', N'Soufflage des feuilles mortes, du gazon coupé et des herbes sèches pour l''entretien des propriétés, voiries, trottoirs, terrains de sport', 2, CAST(23.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (18, N'TRONÇONNEUSE À BOIS 45CM3  ', N'Abattage, élagage ou ébranchage des arbres
Débit de bois de chauffage, poutres et éléments de charpente.', 2, CAST(23.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (19, N'PERCHE ELAGUEUSE', N'Travaux de coupe et d''élaguage en hauteur depuis le sol', 2, CAST(26.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (20, N'COUPE CARREAUX LONG. 470/670 MM  ', N'Coupes droites et diagonales de tous revêtements, céramique, faïence, grès ou terre cuite', 5, CAST(4.90 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (21, N'SCIE CIRCULAIRE PORTATIVE Ø 230 MM', N'Coupes longitudinales, transversales et biaises de bois, contreplaqués, coupe des bois de coffrage', 5, CAST(13.50 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (22, N'SCIE SAUTEUSE ELECTRIQUE', N'Découpes et coupes droites, curvilignes et biaises jusqu’à 45°, sur un support rigide, dans le bois, les matières plastiques, le métal, le caoutchouc et les plaques en céramique.', 5, CAST(7.60 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (23, N'SCIE SUR TABLE 230V', N'Tronçonnage de précision de tous revêtements : céramique, faïence, grès, terre cuite, plaquettes de parement.', 5, CAST(34.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (24, N'MEULEUSE D''ANGLE ELECTRIQUE 230V', N'Tronçonnage à sec des matériaux de construction, carrelages, béton, acier, inox, métaux', 5, CAST(9.70 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (25, N'SCIE CARRELAGE PORTABLE', N'Tronçonnage de précision de tous revêtements : céramique, faïence, grès, terre cuite, plaquettes de parement', 5, CAST(18.80 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (26, N'ASPIRATEUR MIXTE EAU / POUSSIÈRE > 2 KW', N'- Aspiration de poussières ou liquides sur chantiers, locaux professionnels et industriels
- Accouplés à d’autres machines, aspiration des poussières de sciage ou de ponçage
- Collecte des liquides dans les travaux de sciage ou de carottage avec arrosage.', 1, CAST(25.00 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (27, N'ASPIRATEUR MIXTE < 2 KW', N'- Aspiration de poussières ou liquides sur chantiers, locaux professionnels et industriels
- Accouplés à d’autres machines, aspiration des poussières de sciage ou de ponçage
- Collecte des liquides dans les travaux de sciage ou de carottage avec arrosage', 1, CAST(15.40 AS Decimal(10, 2)))
GO
INSERT [dbo].[Produits] ([Id], [Nom], [Description], [IdCategorie], [PrixJourHT]) VALUES (30, N'NETTOYEUR HAUTE PRESSION EAU FROIDE ELECTRIQUE 230V', N'- Nettoyage d’engins, véhicules et matériel 
- Préparation et entretien des façades et toitures (mousse, lichens...)
- Nettoyage de toutes surfaces, bassins, piscines, terrasses, sols béton,...
- Réalisation de surfaces en béton désactivé (mise en saillie des agrégats par lavage en surface).', 1, CAST(23.00 AS Decimal(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Produits] OFF
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Agence] FOREIGN KEY([IdAgence])
REFERENCES [dbo].[Agences] ([Id])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Agence]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Clients] ([Id])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Client]
GO
ALTER TABLE [dbo].[Locations]  WITH CHECK ADD  CONSTRAINT [FK_Locations_Produit] FOREIGN KEY([IdProduit])
REFERENCES [dbo].[Produits] ([Id])
GO
ALTER TABLE [dbo].[Locations] CHECK CONSTRAINT [FK_Locations_Produit]
GO
ALTER TABLE [dbo].[OffresProduits]  WITH CHECK ADD  CONSTRAINT [FK_OffresProduits_Agence] FOREIGN KEY([IdAgence])
REFERENCES [dbo].[Agences] ([Id])
GO
ALTER TABLE [dbo].[OffresProduits] CHECK CONSTRAINT [FK_OffresProduits_Agence]
GO
ALTER TABLE [dbo].[OffresProduits]  WITH CHECK ADD  CONSTRAINT [FK_OffresProduits_Produit] FOREIGN KEY([IdProduit])
REFERENCES [dbo].[Produits] ([Id])
GO
ALTER TABLE [dbo].[OffresProduits] CHECK CONSTRAINT [FK_OffresProduits_Produit]
GO
ALTER TABLE [dbo].[Produits]  WITH CHECK ADD  CONSTRAINT [FK_Produits_Categorie] FOREIGN KEY([IdCategorie])
REFERENCES [dbo].[CategoriesProduits] ([Id])
GO
ALTER TABLE [dbo].[Produits] CHECK CONSTRAINT [FK_Produits_Categorie]
GO
/****** Object:  StoredProcedure [dbo].[SupprimerProduit]    Script Date: 10/06/2018 00:32:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SupprimerProduit]
	@IdProduit int
AS
BEGIN
	SET NOCOUNT ON;

	DELETE Locations WHERE IdProduit = @IdProduit

	DELETE OffresProduits WHERE IdProduit = @IdProduit

	DELETE Produits WHERE Id = @IdProduit
END
GO
USE [master]
GO
ALTER DATABASE [LocaMat] SET  READ_WRITE 
GO
