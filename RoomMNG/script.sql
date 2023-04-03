USE [room_management]
GO
/****** Object:  User [room_mng]    Script Date: 3.4.2023. 12:50:43 ******/
CREATE USER [room_mng] FOR LOGIN [room_mng] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [room_mng]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [room_mng]
GO
/****** Object:  Table [dbo].[Ponavljanja]    Script Date: 3.4.2023. 12:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ponavljanja](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Vrsta] [varchar](50) NULL,
 CONSTRAINT [PK_Ponavljanja] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prava]    Script Date: 3.4.2023. 12:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prava](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [varchar](50) NULL,
 CONSTRAINT [PK_Prava] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prostorija]    Script Date: 3.4.2023. 12:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prostorija](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Prostorija] [varchar](50) NULL,
 CONSTRAINT [PK_Prostorija] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rezervacije]    Script Date: 3.4.2023. 12:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rezervacije](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Datum] [date] NULL,
	[UserID] [int] NULL,
	[PocetakID] [int] NULL,
	[KrajID] [int] NULL,
	[ProstorijaID] [int] NULL,
	[PonavljanjeID] [int] NULL,
	[Aktivno] [bit] NULL,
 CONSTRAINT [PK_Rezervacije] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPrava]    Script Date: 3.4.2023. 12:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPrava](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[PravoID] [int] NULL,
	[Aktivno] [bit] NULL,
 CONSTRAINT [PK_UserPrava] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 3.4.2023. 12:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[FullName] [varchar](100) NULL,
	[Active] [bit] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vremena]    Script Date: 3.4.2023. 12:50:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vremena](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Pocetak] [datetime] NULL,
 CONSTRAINT [PK_Vremena] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Ponavljanja] ON 

INSERT [dbo].[Ponavljanja] ([ID], [Vrsta]) VALUES (1, N'Nema')
INSERT [dbo].[Ponavljanja] ([ID], [Vrsta]) VALUES (2, N'Tjedno')
INSERT [dbo].[Ponavljanja] ([ID], [Vrsta]) VALUES (3, N'Mjesečno')
SET IDENTITY_INSERT [dbo].[Ponavljanja] OFF
GO
SET IDENTITY_INSERT [dbo].[Prava] ON 

INSERT [dbo].[Prava] ([ID], [Naziv]) VALUES (1, N'Rezerviranje prostorije')
INSERT [dbo].[Prava] ([ID], [Naziv]) VALUES (2, N'Brisanje rezervacija')
INSERT [dbo].[Prava] ([ID], [Naziv]) VALUES (3, N'Pregled rezervacija')
INSERT [dbo].[Prava] ([ID], [Naziv]) VALUES (4, N'Dodavanje korisnika')
INSERT [dbo].[Prava] ([ID], [Naziv]) VALUES (5, N'Brisanje korisnika')
INSERT [dbo].[Prava] ([ID], [Naziv]) VALUES (6, N'Uređivanje korisnika')
SET IDENTITY_INSERT [dbo].[Prava] OFF
GO
SET IDENTITY_INSERT [dbo].[Prostorija] ON 

INSERT [dbo].[Prostorija] ([ID], [Prostorija]) VALUES (1, N'R31')
INSERT [dbo].[Prostorija] ([ID], [Prostorija]) VALUES (2, N'R32')
SET IDENTITY_INSERT [dbo].[Prostorija] OFF
GO
SET IDENTITY_INSERT [dbo].[Rezervacije] ON 

INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (1, CAST(N'2023-03-20' AS Date), 1, 1, 2, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (2, CAST(N'2023-03-19' AS Date), 1, 2, 3, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (3, CAST(N'2023-03-20' AS Date), 3, 2, 3, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (4, CAST(N'2023-04-02' AS Date), 3, 2, 3, 2, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (5, CAST(N'2023-04-03' AS Date), 3, 2, 3, 2, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (6, CAST(N'2023-04-03' AS Date), 3, 3, 4, 2, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (7, CAST(N'2023-04-03' AS Date), 3, 4, 5, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (9, CAST(N'2023-04-03' AS Date), 1, 2, 3, 2, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (10, CAST(N'2023-04-04' AS Date), 1, 1, 2, 2, 1, 1)
SET IDENTITY_INSERT [dbo].[Rezervacije] OFF
GO
SET IDENTITY_INSERT [dbo].[UserPrava] ON 

INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (1, 1, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (2, 1, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (3, 1, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (4, 1, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (5, 1, 5, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (6, 1, 6, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (7, 10, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (8, 11, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (9, 13, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (10, 14, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (11, 20, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (12, 22, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (13, 35, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (14, 35, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (15, 37, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (16, 37, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (17, 37, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (18, 38, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (19, 38, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (20, 38, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (21, 38, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (22, 38, 5, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (23, 38, 6, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (24, 39, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (25, 40, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (26, 41, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (27, 42, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (28, 44, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (29, 45, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (30, 45, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (31, 46, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (32, 47, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (33, 48, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (34, 50, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (35, 51, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (36, 52, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (37, 52, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (38, 52, 3, 1)
SET IDENTITY_INSERT [dbo].[UserPrava] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (1, N'admin', N'ISMvKXpXpadDiUoOSoAfww==', N'Administrator', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (2, N'Pota', N'4QrcOUm6Wau+VuBX8g+IPg==', N'Toni Babic', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (3, N'test123', N'zAPnR6avu8v4vnZorP6+5Q==', N'Test User', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (4, N'test124', N'rSryV4tNVbX3g4MCQnD4Ug==', N'Test1 User1', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (6, N'jura', N'rtrFcRSGO0MUI5wXOM98xw==', N'jura', 0)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (7, N'jura2', N'rtrFcRSGO0MUI5wXOM98xw==', N'jura2', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (8, N'jura3', N'GlpWPjVcXKPTjYNweqVt8w==', N'jura3', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (10, N'jura4', N'ZaZ/y/lvkBDV6pCyZaLT6g==', N'jura4', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (11, N'jura5', N'l45HvCeulNFXFvi6liq2gQ==', N'jura5', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (13, N'jura6', N'TP6WqJucDbdMmqfNQc90AQ==', N'jura6', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (14, N'jura7', N'LEar6OQmwx5eSV8cI1i7ZQ==', N'jura7', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (15, N'fakeBabic', N'12345', N'NijeBabic', 0)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (16, N'fakebabic1', N'12345', N'NijeBabic1', 0)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (17, N'bavic', N'sdadsad', N'babic', 0)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (18, N'drugi ', N'xjTrzmTzJ1s+vJS4I4TKEQ==', N'babic', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (19, N'Fakebabic2', N'HQKDeOEspr2vo7iyG8Wp6g==', N'NijeBabic', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (20, N'lolelo', N'4QrcOUm6Wau+VuBX8g+IPg==', N'Lovro Latin', 0)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (21, N'sven', N'tzKyCdvEWlD5WviCX3OfxQ==', N'svenresetar', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (22, N'fran', N'LCDLVVhiZUChcEsf5STqmg==', N'fran', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (24, N'asdds', N'tEfCegDjo0iIGwAwF3AAzQ==', N'nune', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (25, N'patrik', N'oHx5FSPVxj10dOHvG/vcMA==', N'paco', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (26, N'asdasd', N'v/FJoLh/Ww4A2d02Tp3aoA==', N'paco', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (27, N'adtrik', N'Sh29USTS/wZ0DFXqPsifIg==', N'paco', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (29, N'asdad', N'BW8y7lz0lARgfjaL2NPyrw==', N'dlfjhjgdd', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (31, N'fffff', N'Ed268zhq6h8pdO7phFQhUg==', N'giadjflskdf', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (33, N'adsda', N'tbA3p4UiZxuJosGyHZuAxg==', N'paco', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (35, N'korisnik123', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Korisnik', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (37, N'sdsdsa', N'tbA3p4UiZxuJosGyHZuAxg==', N'paco', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (38, N'admin2', N'yEJY6cOQWaiat32Ebdq5CQ==', N'Lovro', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (39, N'K1', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Jedan', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (40, N'guest', N'CE4DQ6BIb/BVMN9scFyLtA==', N'Guest', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (41, N'K2', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Dva', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (42, N'K3', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Tri', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (43, N'bot', N'+ryql4cVVbaKoJUzWXXmEw==', N'bot', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (44, N'K4', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Cetiri', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (45, N'K5', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Pet', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (46, N'K6', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Sest', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (47, N'K7', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Sedam', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (48, N'K8', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Osam', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (49, N'paco', N'MRAgZmpXdsV9JlrOaC3EbQ==', N'paco', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (50, N'K9', N'gnzLDuqKcGxMNKFokfhOew==', N'Korisnik Devet', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (51, N'bot2', N'nlf5SXD2xMqnkskJWfVmjA==', N'bot2', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (52, N'lovro2', N'7tN09tgopDDvI2RIQ9LsXQ==', N'lovro2', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Vremena] ON 

INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (1, CAST(N'2023-03-27T07:20:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (2, CAST(N'2023-03-27T08:10:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (3, CAST(N'2023-03-27T09:00:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (4, CAST(N'2023-03-27T10:00:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (5, CAST(N'2023-03-27T10:50:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (6, CAST(N'2023-03-27T11:40:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (7, CAST(N'2023-03-27T12:25:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (8, CAST(N'2023-03-27T13:15:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (9, CAST(N'2023-03-27T14:05:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (10, CAST(N'2023-03-27T14:55:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (11, CAST(N'2023-03-27T15:55:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (12, CAST(N'2023-03-27T16:45:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (13, CAST(N'2023-03-27T17:35:00.000' AS DateTime))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (14, CAST(N'2023-03-27T18:20:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Vremena] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Username]    Script Date: 3.4.2023. 12:50:43 ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [AK_Username] UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ponavljanja]  WITH CHECK ADD  CONSTRAINT [FK_Ponavljanja_Ponavljanja] FOREIGN KEY([ID])
REFERENCES [dbo].[Ponavljanja] ([ID])
GO
ALTER TABLE [dbo].[Ponavljanja] CHECK CONSTRAINT [FK_Ponavljanja_Ponavljanja]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacije_Ponavljanja] FOREIGN KEY([PonavljanjeID])
REFERENCES [dbo].[Ponavljanja] ([ID])
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_Rezervacije_Ponavljanja]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacije_Prostorija] FOREIGN KEY([ProstorijaID])
REFERENCES [dbo].[Prostorija] ([ID])
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_Rezervacije_Prostorija]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacije_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_Rezervacije_Users]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacije_Vremena] FOREIGN KEY([PocetakID])
REFERENCES [dbo].[Vremena] ([ID])
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_Rezervacije_Vremena]
GO
ALTER TABLE [dbo].[Rezervacije]  WITH CHECK ADD  CONSTRAINT [FK_Rezervacije_Vremena1] FOREIGN KEY([KrajID])
REFERENCES [dbo].[Vremena] ([ID])
GO
ALTER TABLE [dbo].[Rezervacije] CHECK CONSTRAINT [FK_Rezervacije_Vremena1]
GO
ALTER TABLE [dbo].[UserPrava]  WITH CHECK ADD  CONSTRAINT [FK_UserPrava_Prava] FOREIGN KEY([PravoID])
REFERENCES [dbo].[Prava] ([ID])
GO
ALTER TABLE [dbo].[UserPrava] CHECK CONSTRAINT [FK_UserPrava_Prava]
GO
ALTER TABLE [dbo].[UserPrava]  WITH CHECK ADD  CONSTRAINT [FK_UserPrava_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[UserPrava] CHECK CONSTRAINT [FK_UserPrava_Users]
GO
