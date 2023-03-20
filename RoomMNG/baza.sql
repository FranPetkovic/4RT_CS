USE [room_management]
GO
/****** Object:  User [room_mng]    Script Date: 20.3.2023. 12:53:17 ******/
CREATE USER [room_mng] FOR LOGIN [room_mng] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [room_mng]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [room_mng]
GO
/****** Object:  Table [dbo].[Ponavljanja]    Script Date: 20.3.2023. 12:53:17 ******/
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
/****** Object:  Table [dbo].[Prava]    Script Date: 20.3.2023. 12:53:17 ******/
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
/****** Object:  Table [dbo].[Prostorija]    Script Date: 20.3.2023. 12:53:17 ******/
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
/****** Object:  Table [dbo].[Rezervacije]    Script Date: 20.3.2023. 12:53:17 ******/
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
/****** Object:  Table [dbo].[UserPrava]    Script Date: 20.3.2023. 12:53:17 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 20.3.2023. 12:53:17 ******/
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
/****** Object:  Table [dbo].[Vremena]    Script Date: 20.3.2023. 12:53:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vremena](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Pocetak] [time](7) NULL,
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
SET IDENTITY_INSERT [dbo].[Prostorija] OFF
GO
SET IDENTITY_INSERT [dbo].[Rezervacije] ON 

INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (1, CAST(N'2023-03-20' AS Date), 1, 1, 2, 1, 1, 1)
INSERT [dbo].[Rezervacije] ([ID], [Datum], [UserID], [PocetakID], [KrajID], [ProstorijaID], [PonavljanjeID], [Aktivno]) VALUES (2, CAST(N'2023-03-19' AS Date), 1, 2, 3, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Rezervacije] OFF
GO
SET IDENTITY_INSERT [dbo].[UserPrava] ON 

INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (1, 1, 1, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (2, 1, 2, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (3, 1, 3, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (4, 1, 4, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (5, 1, 5, 1)
INSERT [dbo].[UserPrava] ([ID], [UserID], [PravoID], [Aktivno]) VALUES (6, 1, 6, 1)
SET IDENTITY_INSERT [dbo].[UserPrava] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (1, N'admin', N'ISMvKXpXpadDiUoOSoAfww==', N'Administrator', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (2, N'Pota', N'4QrcOUm6Wau+VuBX8g+IPg==', N'Toni Babic', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (3, N'test123', N'zAPnR6avu8v4vnZorP6+5Q==', N'Test User', 1)
INSERT [dbo].[Users] ([ID], [Username], [Password], [FullName], [Active]) VALUES (4, N'test124', N'rSryV4tNVbX3g4MCQnD4Ug==', N'Test1 User1', 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Vremena] ON 

INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (1, CAST(N'07:20:00' AS Time))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (2, CAST(N'08:10:00' AS Time))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (3, CAST(N'09:00:00' AS Time))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (4, CAST(N'10:00:00' AS Time))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (5, CAST(N'10:50:00' AS Time))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (6, CAST(N'11:40:00' AS Time))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (7, CAST(N'12:25:00' AS Time))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (8, CAST(N'13:15:00' AS Time))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (9, CAST(N'14:05:00' AS Time))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (10, CAST(N'14:55:00' AS Time))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (11, CAST(N'15:55:00' AS Time))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (12, CAST(N'16:45:00' AS Time))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (13, CAST(N'17:35:00' AS Time))
INSERT [dbo].[Vremena] ([ID], [Pocetak]) VALUES (14, CAST(N'18:20:00' AS Time))
SET IDENTITY_INSERT [dbo].[Vremena] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [AK_Username]    Script Date: 20.3.2023. 12:53:17 ******/
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
