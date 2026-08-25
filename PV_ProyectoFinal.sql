USE [master]
GO
/****** Object:  Database [PV_ProyectoFinal]    Script Date: 24/8/2026 10:54:04 p. m. ******/
CREATE DATABASE [PV_ProyectoFinal]
GO
USE [PV_ProyectoFinal]
GO
/****** Object:  Table [dbo].[Bitacora]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bitacora](
	[idBitacora] [int] IDENTITY(1,1) NOT NULL,
	[idReservacion] [int] NOT NULL,
	[idPersona] [int] NOT NULL,
	[accionRealizada] [varchar](25) NOT NULL,
	[fechaDeLaAccion] [datetime] NOT NULL,
 CONSTRAINT [PK_Bitacora] PRIMARY KEY CLUSTERED 
(
	[idBitacora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[idHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[idHotel] [int] NOT NULL,
	[numeroHabitacion] [varchar](10) NOT NULL,
	[capacidadMaxima] [int] NOT NULL,
	[descripcion] [varchar](500) NOT NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[idHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hotel](
	[idHotel] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[direccion] [varchar](500) NULL,
	[costoPorCadaAdulto] [numeric](10, 2) NOT NULL,
	[costoPorCadaNinho] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[idHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persona](
	[idPersona] [int] IDENTITY(1,1) NOT NULL,
	[nombreCompleto] [varchar](250) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[clave] [varchar](15) NOT NULL,
	[esEmpleado] [bit] NOT NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Persona] PRIMARY KEY CLUSTERED 
(
	[idPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservacion]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservacion](
	[idReservacion] [int] IDENTITY(1,1) NOT NULL,
	[idPersona] [int] NOT NULL,
	[idHabitacion] [int] NOT NULL,
	[fechaEntrada] [datetime] NOT NULL,
	[fechaSalida] [datetime] NOT NULL,
	[numeroAdultos] [int] NOT NULL,
	[numeroNinhos] [int] NOT NULL,
	[totalDiasReservacion] [int] NOT NULL,
	[costoPorCadaAdulto] [numeric](10, 2) NOT NULL,
	[costoPorCadaNinho] [numeric](10, 2) NOT NULL,
	[costoTotal] [numeric](14, 2) NOT NULL,
	[fechaCreacion] [datetime] NOT NULL,
	[fechaModificacion] [datetime] NULL,
	[estado] [varchar](1) NOT NULL,
 CONSTRAINT [PK_Reservacion] PRIMARY KEY CLUSTERED 
(
	[idReservacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bitacora] ON 
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (1, 1, 5, N'CREADA', CAST(N'2021-02-15T14:35:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (2, 1, 5, N'CANCELADA', CAST(N'2021-02-15T14:38:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (3, 2, 3, N'CREADA', CAST(N'2021-04-21T11:18:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (4, 2, 4, N'CORREGIDA', CAST(N'2021-04-21T11:19:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (5, 2, 4, N'CORREGIDA', CAST(N'2021-04-21T11:20:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (6, 3, 3, N'CREADA', CAST(N'2021-04-25T13:40:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (7, 3, 1, N'CORREGIDA', CAST(N'2021-04-25T13:41:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (8, 3, 1, N'CORREGIDA', CAST(N'2021-04-25T13:42:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (9, 3, 1, N'CORREGIDA', CAST(N'2021-04-25T13:43:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (10, 3, 5, N'CORREGIDA', CAST(N'2021-04-25T13:44:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (11, 4, 8, N'CREADA', CAST(N'2021-05-01T18:04:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (12, 4, 8, N'CORREGIDA', CAST(N'2021-05-01T18:05:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (13, 4, 8, N'CORREGIDA', CAST(N'2021-05-01T18:06:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (14, 4, 8, N'CORREGIDA', CAST(N'2021-05-01T18:07:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (15, 4, 8, N'CORREGIDA', CAST(N'2021-05-01T18:08:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (16, 4, 8, N'CORREGIDA', CAST(N'2021-05-01T18:09:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (17, 5, 1, N'CREADA', CAST(N'2021-05-04T20:11:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (18, 5, 1, N'CORREGIDA', CAST(N'2021-05-04T20:12:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (19, 5, 1, N'CORREGIDA', CAST(N'2021-05-04T20:11:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (20, 5, 1, N'CORREGIDA', CAST(N'2021-05-04T20:13:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (21, 5, 1, N'CORREGIDA', CAST(N'2021-05-04T20:14:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (22, 5, 1, N'CANCELADA', CAST(N'2021-05-04T20:15:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (23, 6, 8, N'CREADA', CAST(N'2021-05-07T09:01:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (24, 6, 1, N'CANCELADA', CAST(N'2021-05-07T09:02:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (25, 6, 1, N'CORREGIDA', CAST(N'2021-05-07T09:03:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (26, 7, 1, N'CREADA', CAST(N'2021-05-15T15:27:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (27, 7, 1, N'CORREGIDA', CAST(N'2021-05-15T15:28:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (28, 7, 1, N'CORREGIDA', CAST(N'2021-05-15T15:29:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (29, 8, 8, N'CREADA', CAST(N'2021-05-15T15:34:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (30, 9, 8, N'CREADA', CAST(N'2021-05-15T16:03:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (31, 10, 7, N'CREADA', CAST(N'2021-05-15T16:03:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (32, 11, 5, N'CREADA', CAST(N'2021-05-15T16:09:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (33, 12, 8, N'CREADA', CAST(N'2021-05-15T18:07:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (34, 13, 7, N'CREADA', CAST(N'2021-05-15T18:17:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (35, 14, 5, N'CREADA', CAST(N'2021-05-15T18:27:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (36, 15, 8, N'CREADA', CAST(N'2021-05-15T19:44:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (37, 16, 7, N'CREADA', CAST(N'2021-05-15T19:48:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (38, 17, 5, N'CREADA', CAST(N'2021-05-15T19:54:00.000' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (39, 19, 5, N'CREADA', CAST(N'2025-11-30T14:22:02.340' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (40, 20, 5, N'CREADA', CAST(N'2025-11-30T17:42:38.407' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (41, 21, 7, N'CREADA', CAST(N'2025-12-05T22:09:05.933' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (42, 22, 5, N'CREADA', CAST(N'2025-12-07T11:09:16.040' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (43, 23, 5, N'CREADA', CAST(N'2025-12-07T11:31:27.890' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (44, 24, 5, N'CREADA', CAST(N'2025-12-07T11:39:06.973' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (45, 25, 5, N'CREADA', CAST(N'2025-12-07T11:40:20.723' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (46, 26, 5, N'CREADA', CAST(N'2025-12-07T11:49:50.273' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (47, 27, 5, N'CREADA', CAST(N'2025-12-07T11:55:03.467' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (48, 27, 5, N'CANCELADA', CAST(N'2025-12-07T12:16:13.690' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (49, 26, 5, N'CANCELADA', CAST(N'2025-12-07T12:16:38.240' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (50, 28, 5, N'CREADA', CAST(N'2025-12-07T12:22:09.600' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (51, 28, 5, N'CANCELADA', CAST(N'2025-12-07T12:22:42.683' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (52, 29, 5, N'CREADA', CAST(N'2025-12-07T12:29:43.840' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (53, 30, 5, N'CREADA', CAST(N'2025-12-07T12:30:35.193' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (54, 31, 5, N'CREADA', CAST(N'2025-12-07T12:32:42.010' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (55, 31, 5, N'CANCELADA', CAST(N'2025-12-07T12:35:01.380' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (56, 32, 1, N'CREADA', CAST(N'2026-08-10T19:18:42.403' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (57, 32, 1, N'“CORREGIDA”', CAST(N'2026-08-10T19:18:54.713' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (58, 32, 1, N'“CORREGIDA”', CAST(N'2026-08-10T19:19:09.363' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (59, 32, 1, N'“CORREGIDA”', CAST(N'2026-08-10T19:19:22.210' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (60, 32, 1, N'“CORREGIDA”', CAST(N'2026-08-10T19:19:31.707' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (61, 32, 1, N'“CORREGIDA”', CAST(N'2026-08-10T19:19:40.083' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (62, 33, 8, N'CREADA', CAST(N'2026-08-10T19:20:18.017' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (63, 34, 1, N'CREADA', CAST(N'2026-08-17T00:23:08.633' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (64, 34, 1, N'“CORREGIDA”', CAST(N'2026-08-17T00:23:18.770' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (65, 35, 1, N'CREADA', CAST(N'2026-08-17T00:34:10.227' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (66, 32, 1, N'“CORREGIDA”', CAST(N'2026-08-17T00:47:34.257' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (67, 32, 1, N'“CORREGIDA”', CAST(N'2026-08-17T00:47:50.500' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (68, 36, 1, N'CREADA', CAST(N'2026-08-17T00:48:27.177' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (69, 34, 1, N'“CORREGIDA”', CAST(N'2026-08-17T01:24:53.597' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (70, 37, 8, N'CREADA', CAST(N'2026-08-17T01:25:55.610' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (71, 38, 8, N'CREADA', CAST(N'2026-08-17T01:45:18.840' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (72, 39, 1, N'CREADA', CAST(N'2026-08-23T15:17:00.813' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (73, 40, 8, N'CREADA', CAST(N'2026-08-23T15:17:40.700' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (74, 41, 8, N'CREADA', CAST(N'2026-08-23T16:27:12.580' AS DateTime))
GO
INSERT [dbo].[Bitacora] ([idBitacora], [idReservacion], [idPersona], [accionRealizada], [fechaDeLaAccion]) VALUES (75, 41, 8, N'“CORREGIDA”', CAST(N'2026-08-23T16:34:19.403' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
GO
SET IDENTITY_INSERT [dbo].[Habitacion] ON 
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (1, 1, N'R201', 1, N'Habitación individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (2, 1, N'R202', 2, N'Habitación doble de uso individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (3, 1, N'R303', 3, N'Habitación triple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (4, 1, N'R304', 4, N'Habitación cuádruple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (5, 1, N'R305', 4, N'Habitación cuádruple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (6, 2, N'T101', 2, N'Habitación doble de uso individual', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (7, 2, N'T102', 2, N'Habitación doble de uso individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (8, 2, N'T301', 3, N'Habitación triple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (9, 2, N'T302', 3, N'Habitación triple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (10, 2, N'T401', 4, N'Habitación cuádruple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (11, 2, N'T402', 4, N'Habitación cuádruple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (12, 2, N'T403', 4, N'Habitación cuádruple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (13, 3, N'H201', 2, N'Habitación doble de uso individual', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (14, 3, N'H202', 2, N'Habitación doble de uso individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (15, 3, N'H301', 3, N'Habitación triple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (16, 3, N'H302', 3, N'Habitación triple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (17, 3, N'H303', 3, N'Habitación triple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (18, 3, N'H401', 4, N'Habitación cuádruple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (19, 3, N'H402', 4, N'Habitación cuádruple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (20, 3, N'H403', 4, N'Habitación cuádruple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (21, 3, N'H404', 4, N'Habitación cuádruple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (22, 4, N'P101', 1, N'Habitación individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (23, 4, N'P102', 1, N'Habitación individual', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (24, 4, N'P103', 1, N'Habitación individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (25, 4, N'P104', 1, N'Habitación individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (26, 4, N'P201', 2, N'Habitación doble de uso individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (27, 4, N'P202', 2, N'Habitación doble de uso individual', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (28, 4, N'P203', 2, N'Habitación doble de uso individual', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (29, 4, N'P301', 3, N'Habitación triple', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (30, 4, N'P302', 3, N'Habitación triple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (31, 4, N'P303', 3, N'Habitación triple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (32, 4, N'P401', 4, N'Habitación cuádruple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (33, 4, N'P402', 4, N'Habitación cuádruple', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (34, 2, N'T250', 3, N'Habitacion de prueba', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (35, 2, N'T222', 3, N'Habitacion de prueba', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (36, 2, N'10', 2, N'Prueba', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (37, 2, N'T144', 2, N'Prueba', N'I')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (38, 2, N'T103', 8, N'Habitación familiar', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (39, 2, N'T208', 8, N'Habitación familiar', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (40, 1, N'R301', 4, N'Habitación doble.', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (41, 1, N'R302', 4, N'Habitación Doble', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (42, 1, N'R203', 6, N'Habitación familiar', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (43, 3, N'H405', 8, N'Habitación familiar', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (44, 3, N'H501', 6, N'Habitación familiar', N'A')
GO
INSERT [dbo].[Habitacion] ([idHabitacion], [idHotel], [numeroHabitacion], [capacidadMaxima], [descripcion], [estado]) VALUES (45, 3, N'H502', 8, N'Habitación familiar', N'A')
GO
SET IDENTITY_INSERT [dbo].[Habitacion] OFF
GO
SET IDENTITY_INSERT [dbo].[Hotel] ON 
GO
INSERT [dbo].[Hotel] ([idHotel], [nombre], [direccion], [costoPorCadaAdulto], [costoPorCadaNinho]) VALUES (1, N'Dreams Las Mareas', N'Playa, Provincia de Guanacaste', CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)))
GO
INSERT [dbo].[Hotel] ([idHotel], [nombre], [direccion], [costoPorCadaAdulto], [costoPorCadaNinho]) VALUES (2, N'Barceló Tambor', N'Playa Tambor, Puntarenas Tambor 771 Costa Rica Puntarenas, 11500', CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)))
GO
INSERT [dbo].[Hotel] ([idHotel], [nombre], [direccion], [costoPorCadaAdulto], [costoPorCadaNinho]) VALUES (3, N'Punta Leona', N'Punta Leona, 61102 Jacó, Costa Rica', CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)))
GO
INSERT [dbo].[Hotel] ([idHotel], [nombre], [direccion], [costoPorCadaAdulto], [costoPorCadaNinho]) VALUES (4, N'Río Perdido', N'Camino al Hotel Rio Perdido Lodge, Provincia de Guanacaste, Bagaces', CAST(89.81 AS Numeric(10, 2)), CAST(74.72 AS Numeric(10, 2)))
GO
SET IDENTITY_INSERT [dbo].[Hotel] OFF
GO
SET IDENTITY_INSERT [dbo].[Persona] ON 
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (1, N'Nadia Fonseca Masis', N'nfonseca1498@hotmail.com', N'12345', 0, N'A')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (2, N'Alberto Rivera Gutiérrez', N'alberto9684@msn.com', N'12345', 0, N'A')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (3, N'Olga Ávila Flores', N'oaflores23@gmail.com', N'12345', 1, N'I')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (4, N'Roger Pineda González', N'rpinedag46@outlook.com', N'12345', 0, N'A')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (5, N'Keren Martínez Oreamuno', N'kmartinez32@hotmail.com', N'12345', 1, N'A')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (6, N'Mauricio Tellez Cerdas', N'tellezc55@gmail.com', N'12345', 0, N'I')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (7, N'Vivian Muñoz Campos', N'vivimcampos28@outlook.com', N'12345', 0, N'A')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (8, N'Jorge Trejos Leal', N'jtleal1979@msn.com', N'12345', 1, N'A')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (9, N'Gloria Matarrita Pérez', N'gmape381@hotmail.com', N'12345', 0, N'I')
GO
INSERT [dbo].[Persona] ([idPersona], [nombreCompleto], [email], [clave], [esEmpleado], [estado]) VALUES (10, N'Aaron Camacho Elizondo', N'acael147@hotmail.com', N'12345', 1, N'I')
GO
SET IDENTITY_INSERT [dbo].[Persona] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservacion] ON 
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (1, 5, 24, CAST(N'2021-06-08T00:00:00.000' AS DateTime), CAST(N'2021-06-08T00:00:00.000' AS DateTime), 1, 0, 1, CAST(89.81 AS Numeric(10, 2)), CAST(74.72 AS Numeric(10, 2)), CAST(89.81 AS Numeric(14, 2)), CAST(N'2021-02-15T14:35:00.000' AS DateTime), CAST(N'2021-02-15T15:03:00.000' AS DateTime), N'I')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (2, 4, 17, CAST(N'2021-10-18T00:00:00.000' AS DateTime), CAST(N'2021-11-08T00:00:00.000' AS DateTime), 3, 0, 22, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(7978.74 AS Numeric(14, 2)), CAST(N'2021-04-21T11:18:00.000' AS DateTime), CAST(N'2021-04-24T16:57:00.000' AS DateTime), N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (3, 1, 8, CAST(N'2022-06-29T00:00:00.000' AS DateTime), CAST(N'2022-06-30T00:00:00.000' AS DateTime), 1, 2, 2, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(743.82 AS Numeric(14, 2)), CAST(N'2021-04-25T13:40:00.000' AS DateTime), CAST(N'2021-04-26T12:36:00.000' AS DateTime), N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (4, 8, 3, CAST(N'2021-09-17T00:00:00.000' AS DateTime), CAST(N'2021-09-20T00:00:00.000' AS DateTime), 2, 1, 4, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(1005.20 AS Numeric(14, 2)), CAST(N'2021-05-01T18:04:00.000' AS DateTime), CAST(N'2021-05-01T18:49:00.000' AS DateTime), N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (5, 1, 5, CAST(N'2021-09-08T00:00:00.000' AS DateTime), CAST(N'2021-09-09T00:00:00.000' AS DateTime), 1, 2, 2, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(462.20 AS Numeric(14, 2)), CAST(N'2021-05-04T20:11:00.000' AS DateTime), CAST(N'2021-05-04T21:18:00.000' AS DateTime), N'I')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (6, 1, 12, CAST(N'2021-09-22T00:00:00.000' AS DateTime), CAST(N'2021-09-23T00:00:00.000' AS DateTime), 2, 2, 2, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(1044.28 AS Numeric(14, 2)), CAST(N'2021-05-07T09:01:00.000' AS DateTime), CAST(N'2021-05-07T09:57:00.000' AS DateTime), N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (7, 1, 20, CAST(N'2021-10-29T00:00:00.000' AS DateTime), CAST(N'2021-11-24T00:00:00.000' AS DateTime), 3, 1, 27, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(12104.64 AS Numeric(14, 2)), CAST(N'2021-05-15T15:27:00.000' AS DateTime), CAST(N'2021-05-15T17:34:00.000' AS DateTime), N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (8, 8, 33, CAST(N'2021-12-13T00:00:00.000' AS DateTime), CAST(N'2021-12-13T00:00:00.000' AS DateTime), 2, 2, 1, CAST(89.81 AS Numeric(10, 2)), CAST(74.72 AS Numeric(10, 2)), CAST(329.06 AS Numeric(14, 2)), CAST(N'2021-05-15T15:34:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (9, 8, 2, CAST(N'2021-12-13T00:00:00.000' AS DateTime), CAST(N'2021-12-14T00:00:00.000' AS DateTime), 1, 1, 2, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(321.60 AS Numeric(14, 2)), CAST(N'2021-05-15T16:03:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (10, 7, 3, CAST(N'2021-12-15T00:00:00.000' AS DateTime), CAST(N'2021-12-16T00:00:00.000' AS DateTime), 2, 1, 2, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(502.60 AS Numeric(14, 2)), CAST(N'2021-05-15T16:03:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (11, 5, 5, CAST(N'2021-12-15T00:00:00.000' AS DateTime), CAST(N'2021-12-15T00:00:00.000' AS DateTime), 2, 2, 1, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(321.60 AS Numeric(14, 2)), CAST(N'2021-05-15T16:09:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (12, 8, 2, CAST(N'2021-12-19T00:00:00.000' AS DateTime), CAST(N'2021-12-20T00:00:00.000' AS DateTime), 1, 1, 2, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(321.60 AS Numeric(14, 2)), CAST(N'2021-05-15T18:17:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (13, 7, 12, CAST(N'2021-12-19T00:00:00.000' AS DateTime), CAST(N'2021-12-20T00:00:00.000' AS DateTime), 2, 2, 2, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(1044.28 AS Numeric(14, 2)), CAST(N'2021-05-15T18:17:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (14, 5, 7, CAST(N'2021-12-20T00:00:00.000' AS DateTime), CAST(N'2021-12-20T00:00:00.000' AS DateTime), 2, 0, 1, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(300.46 AS Numeric(14, 2)), CAST(N'2021-05-15T18:17:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (15, 8, 18, CAST(N'2021-12-20T00:00:00.000' AS DateTime), CAST(N'2021-12-21T00:00:00.000' AS DateTime), 3, 1, 2, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(896.64 AS Numeric(14, 2)), CAST(N'2021-05-15T19:44:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (16, 7, 15, CAST(N'2021-12-22T00:00:00.000' AS DateTime), CAST(N'2021-12-23T00:00:00.000' AS DateTime), 1, 2, 2, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(584.38 AS Numeric(14, 2)), CAST(N'2021-05-15T19:44:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (17, 5, 31, CAST(N'2021-12-22T00:00:00.000' AS DateTime), CAST(N'2021-12-22T00:00:00.000' AS DateTime), 2, 1, 1, CAST(89.81 AS Numeric(10, 2)), CAST(74.72 AS Numeric(10, 2)), CAST(254.34 AS Numeric(14, 2)), CAST(N'2021-05-15T19:44:00.000' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (18, 5, 8, CAST(N'2025-12-05T00:00:00.000' AS DateTime), CAST(N'2025-12-07T00:00:00.000' AS DateTime), 1, 2, 2, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(743.82 AS Numeric(14, 2)), CAST(N'2025-11-30T13:40:22.707' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (19, 8, 5, CAST(N'2025-12-28T00:00:00.000' AS DateTime), CAST(N'2025-12-30T00:00:00.000' AS DateTime), 2, 2, 2, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(643.20 AS Numeric(14, 2)), CAST(N'2025-11-30T14:22:02.323' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (20, 5, 8, CAST(N'2025-12-10T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 2, 1, 5, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(2056.50 AS Numeric(14, 2)), CAST(N'2025-11-30T17:42:38.390' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (21, 7, 14, CAST(N'2026-01-01T00:00:00.000' AS DateTime), CAST(N'2026-01-05T00:00:00.000' AS DateTime), 3, 0, 4, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(600.00 AS Numeric(14, 2)), CAST(N'2025-12-05T22:09:05.917' AS DateTime), CAST(N'2025-12-05T22:36:02.013' AS DateTime), N'C')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (22, 2, 34, CAST(N'2026-01-12T00:00:00.000' AS DateTime), CAST(N'2026-01-17T00:00:00.000' AS DateTime), 1, 1, 5, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(375.00 AS Numeric(14, 2)), CAST(N'2025-12-07T11:09:16.023' AS DateTime), CAST(N'2025-12-07T11:10:30.353' AS DateTime), N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (23, 2, 2, CAST(N'2026-01-01T00:00:00.000' AS DateTime), CAST(N'2026-01-05T00:00:00.000' AS DateTime), 1, 1, 4, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(643.20 AS Numeric(14, 2)), CAST(N'2025-12-07T11:31:27.873' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (24, 2, 35, CAST(N'2026-01-01T00:00:00.000' AS DateTime), CAST(N'2026-01-05T00:00:00.000' AS DateTime), 1, 0, 4, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(600.92 AS Numeric(14, 2)), CAST(N'2025-12-07T11:39:06.940' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (25, 8, 7, CAST(N'2026-01-01T00:00:00.000' AS DateTime), CAST(N'2026-01-05T00:00:00.000' AS DateTime), 2, 0, 4, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(1201.84 AS Numeric(14, 2)), CAST(N'2025-12-07T11:40:20.723' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (26, 8, 21, CAST(N'2026-01-01T00:00:00.000' AS DateTime), CAST(N'2026-01-05T00:00:00.000' AS DateTime), 1, 0, 4, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(483.56 AS Numeric(14, 2)), CAST(N'2025-12-07T11:49:50.257' AS DateTime), NULL, N'C')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (27, 4, 34, CAST(N'2026-01-01T00:00:00.000' AS DateTime), CAST(N'2026-01-05T00:00:00.000' AS DateTime), 1, 0, 4, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(600.92 AS Numeric(14, 2)), CAST(N'2025-12-07T11:55:03.440' AS DateTime), NULL, N'C')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (28, 2, 35, CAST(N'2026-05-01T00:00:00.000' AS DateTime), CAST(N'2026-05-04T00:00:00.000' AS DateTime), 1, 0, 3, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(450.69 AS Numeric(14, 2)), CAST(N'2025-12-07T12:22:09.577' AS DateTime), NULL, N'C')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (29, 5, 3, CAST(N'2026-01-01T00:00:00.000' AS DateTime), CAST(N'2026-01-05T00:00:00.000' AS DateTime), 2, 0, 4, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(724.00 AS Numeric(14, 2)), CAST(N'2025-12-07T12:29:43.830' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (30, 8, 1, CAST(N'2026-01-01T00:00:00.000' AS DateTime), CAST(N'2026-01-02T00:00:00.000' AS DateTime), 1, 0, 1, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(90.50 AS Numeric(14, 2)), CAST(N'2025-12-07T12:30:35.183' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (31, 8, 14, CAST(N'2026-01-01T00:00:00.000' AS DateTime), CAST(N'2026-01-05T00:00:00.000' AS DateTime), 1, 0, 4, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(483.56 AS Numeric(14, 2)), CAST(N'2025-12-07T12:32:42.000' AS DateTime), NULL, N'C')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (32, 1, 7, CAST(N'2026-08-30T00:00:00.000' AS DateTime), CAST(N'2026-09-06T00:00:00.000' AS DateTime), 4, 0, 7, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(600.92 AS Numeric(14, 2)), CAST(N'2026-08-10T19:18:42.390' AS DateTime), CAST(N'2026-08-17T00:47:50.500' AS DateTime), N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (33, 8, 5, CAST(N'2026-08-24T00:00:00.000' AS DateTime), CAST(N'2026-08-26T00:00:00.000' AS DateTime), 4, 0, 2, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(724.00 AS Numeric(14, 2)), CAST(N'2026-08-10T19:20:17.990' AS DateTime), CAST(N'2026-08-23T16:04:48.340' AS DateTime), N'I')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (34, 1, 12, CAST(N'2026-09-01T00:00:00.000' AS DateTime), CAST(N'2026-09-05T00:00:00.000' AS DateTime), 4, 2, 4, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(822.60 AS Numeric(14, 2)), CAST(N'2026-08-17T00:23:08.557' AS DateTime), CAST(N'2026-08-17T01:24:53.593' AS DateTime), N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (35, 1, 43, CAST(N'2026-09-19T00:00:00.000' AS DateTime), CAST(N'2026-09-22T00:00:00.000' AS DateTime), 3, 3, 3, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(1858.86 AS Numeric(14, 2)), CAST(N'2026-08-17T00:34:10.180' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (36, 1, 44, CAST(N'2026-11-23T00:00:00.000' AS DateTime), CAST(N'2026-11-28T00:00:00.000' AS DateTime), 6, 0, 5, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(3626.70 AS Numeric(14, 2)), CAST(N'2026-08-17T00:48:27.167' AS DateTime), CAST(N'2026-08-23T16:09:31.330' AS DateTime), N'I')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (37, 7, 38, CAST(N'2026-08-31T00:00:00.000' AS DateTime), CAST(N'2026-09-04T00:00:00.000' AS DateTime), 5, 0, 4, CAST(150.23 AS Numeric(10, 2)), CAST(110.84 AS Numeric(10, 2)), CAST(3004.60 AS Numeric(14, 2)), CAST(N'2026-08-17T01:25:55.603' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (38, 2, 42, CAST(N'2026-12-01T00:00:00.000' AS DateTime), CAST(N'2026-12-06T00:00:00.000' AS DateTime), 5, 0, 5, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(2262.50 AS Numeric(14, 2)), CAST(N'2026-08-17T01:45:18.823' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (39, 1, 40, CAST(N'2026-08-24T00:00:00.000' AS DateTime), CAST(N'2026-08-27T00:00:00.000' AS DateTime), 2, 0, 3, CAST(90.50 AS Numeric(10, 2)), CAST(70.30 AS Numeric(10, 2)), CAST(543.00 AS Numeric(14, 2)), CAST(N'2026-08-23T15:17:00.783' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (40, 7, 45, CAST(N'2026-08-24T00:00:00.000' AS DateTime), CAST(N'2026-08-28T00:00:00.000' AS DateTime), 4, 3, 4, CAST(120.89 AS Numeric(10, 2)), CAST(85.65 AS Numeric(10, 2)), CAST(2962.04 AS Numeric(14, 2)), CAST(N'2026-08-23T15:17:40.700' AS DateTime), NULL, N'A')
GO
INSERT [dbo].[Reservacion] ([idReservacion], [idPersona], [idHabitacion], [fechaEntrada], [fechaSalida], [numeroAdultos], [numeroNinhos], [totalDiasReservacion], [costoPorCadaAdulto], [costoPorCadaNinho], [costoTotal], [fechaCreacion], [fechaModificacion], [estado]) VALUES (41, 2, 26, CAST(N'2026-08-31T00:00:00.000' AS DateTime), CAST(N'2026-09-06T00:00:00.000' AS DateTime), 4, 0, 6, CAST(89.81 AS Numeric(10, 2)), CAST(74.72 AS Numeric(10, 2)), CAST(359.24 AS Numeric(14, 2)), CAST(N'2026-08-23T16:27:12.570' AS DateTime), CAST(N'2026-08-23T16:34:19.403' AS DateTime), N'A')
GO
SET IDENTITY_INSERT [dbo].[Reservacion] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Habitacion_hotel_numeroHabitacion]    Script Date: 24/8/2026 10:54:04 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Habitacion_hotel_numeroHabitacion] ON [dbo].[Habitacion]
(
	[idHotel] ASC,
	[numeroHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Persona_email]    Script Date: 24/8/2026 10:54:04 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Persona_email] ON [dbo].[Persona]
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [DF_Persona_clave]  DEFAULT ((12345)) FOR [clave]
GO
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [DF_Persona_esEmpleado]  DEFAULT ((0)) FOR [esEmpleado]
GO
ALTER TABLE [dbo].[Persona] ADD  CONSTRAINT [DF_Persona_estado]  DEFAULT ('A') FOR [estado]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Persona]
GO
ALTER TABLE [dbo].[Bitacora]  WITH CHECK ADD  CONSTRAINT [FK_Bitacora_Reservacion] FOREIGN KEY([idReservacion])
REFERENCES [dbo].[Reservacion] ([idReservacion])
GO
ALTER TABLE [dbo].[Bitacora] CHECK CONSTRAINT [FK_Bitacora_Reservacion]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_Hotel] FOREIGN KEY([idHotel])
REFERENCES [dbo].[Hotel] ([idHotel])
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_Hotel]
GO
ALTER TABLE [dbo].[Reservacion]  WITH CHECK ADD  CONSTRAINT [FK_Reservacion_Habitacion] FOREIGN KEY([idHabitacion])
REFERENCES [dbo].[Habitacion] ([idHabitacion])
GO
ALTER TABLE [dbo].[Reservacion] CHECK CONSTRAINT [FK_Reservacion_Habitacion]
GO
ALTER TABLE [dbo].[Reservacion]  WITH CHECK ADD  CONSTRAINT [FK_Reservacion_Persona] FOREIGN KEY([idPersona])
REFERENCES [dbo].[Persona] ([idPersona])
GO
ALTER TABLE [dbo].[Reservacion] CHECK CONSTRAINT [FK_Reservacion_Persona]
GO
/****** Object:  StoredProcedure [dbo].[SpActualizarHabitacion]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpActualizarHabitacion]
    @idHabitacion      INT,
    @numeroHabitacion  NVARCHAR(10),
    @capacidadMaxima   INT,
    @descripcion       NVARCHAR(500)
AS
BEGIN
    UPDATE Habitacion
    SET 
        numeroHabitacion = @numeroHabitacion,
        capacidadMaxima  = @capacidadMaxima,
        descripcion      = @descripcion
    WHERE idHabitacion = @idHabitacion;
END
GO
/****** Object:  StoredProcedure [dbo].[spAsignarHabitacion]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[spAsignarHabitacion]
    @idHotel INT,
    @capacidadRequerida INT -- Suma de numeroAdultos + numeroNinhos
AS
BEGIN
    SET NOCOUNT ON;
    DECLARE @idHabitacionAsignada INT = 0;

    -- PARA VER SI LAS HABITACIONES CUMPLEN CNO LA CAPACIDAD Y ESTADO
    WITH HabitacionesCandidatas AS (
        SELECT 
            H.idHabitacion
        FROM dbo.Habitacion H
        WHERE 
            H.idHotel = @idHotel
            AND H.estado = 'A' -- Solo habitaciones activas
            AND H.capacidadMaxima >= @capacidadRequerida
    ),
    
    -- CONTEO DE RESERVACION
    ReservasPorHabitacion AS (
        SELECT 
            HC.idHabitacion,
            COUNT(R.idReservacion) AS CantidadReservas
        FROM HabitacionesCandidatas HC
        LEFT JOIN dbo.Reservacion R ON HC.idHabitacion = R.idHabitacion
        GROUP BY HC.idHabitacion
    )
    
    -- seleccion la habitacion con menor cantidad de reservas
    SELECT TOP 1 
        @idHabitacionAsignada = idHabitacion
    FROM 
        ReservasPorHabitacion
    ORDER BY 
        CantidadReservas ASC, idHabitacion ASC;

    -- retorna el id de la habitacion
    SELECT ISNULL(@idHabitacionAsignada, 0) AS idHabitacionAsignada;
END


/** SpBitacoraPorReservacion 3 ** Usado en detalleReservacion, usa idReservacion para los detalles de la bitácora, se muestra en un gridview ****/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SpBitacoraPorReservacion]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpBitacoraPorReservacion]
    @idReservacion INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        B.idBitacora,
        CONVERT(VARCHAR(16), B.fechaDeLaAccion, 120) AS FechaAccion,   -- formato yyyy-MM-dd HH:mm
        FORMAT(B.fechaDeLaAccion, 'dd/MM/yyyy HH:mm') AS FechaAccionFormato, -- formato solicitado
        B.accionRealizada,
        P.nombreCompleto AS Persona
    FROM Bitacora B
    INNER JOIN Persona P ON P.idPersona = B.idPersona
    WHERE B.idReservacion = @idReservacion
    ORDER BY B.idBitacora DESC;
END


/** SpCancelarReservacion 4 ** Utilizado en EditarReservaciones, creado por dayeri. ****/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SpCancelarReservacion]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpCancelarReservacion]
    @IdReservacion INT
AS
BEGIN
    UPDATE Reservacion
    SET estado = 'I',
        fechaModificacion = GETDATE()
    WHERE idReservacion = @IdReservacion;
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarReservacionParaModificar]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spConsultarReservacionParaModificar]
    @idReservacion INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        R.idReservacion,
        R.idHabitacion,
        H.numeroHabitacion        AS NumeroHabitacion,
        HO.idHotel,
        HO.nombre                 AS NombreHotel,
        R.idPersona,
        P.nombreCompleto          AS NombreCliente,
        R.fechaEntrada,
        R.fechaSalida,
        R.numeroAdultos,
        R.numeroNinhos,
        R.totalDiasReservacion,
        R.costoPorCadaAdulto,
        R.costoPorCadaNinho,
        R.costoTotal,
        R.estado
    FROM dbo.Reservacion R
    INNER JOIN dbo.Habitacion H ON R.idHabitacion = H.idHabitacion
    INNER JOIN dbo.Hotel HO ON H.idHotel = HO.idHotel
    INNER JOIN dbo.Persona P ON R.idPersona = P.idPersona
    WHERE 
        R.idReservacion = @idReservacion;
END


/** SpCrearHabitacion 5 ** Usado en CrearHabitacion, estado es A por defecto ****/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SpCrearHabitacion]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpCrearHabitacion]
    @idHotel INT,
    @numeroHabitacion VARCHAR(10),
    @capacidadMaxima INT,
    @descripcion VARCHAR(500)
AS
BEGIN
    INSERT INTO Habitacion (idHotel, numeroHabitacion, capacidadMaxima, descripcion, estado)
    VALUES (@idHotel, @numeroHabitacion, @capacidadMaxima, @descripcion, 'A');
END
GO
/****** Object:  StoredProcedure [dbo].[spCrearReservacion]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCrearReservacion]  
    @idPersona INT,  
    @idHabitacion INT,  
    @fechaEntrada DATETIME,  
    @fechaSalida DATETIME,  
    @numeroAdultos INT,  
    @numeroNinhos INT,  
    @costoPorCadaAdulto NUMERIC(10, 2), 
    @costoPorCadaNinho NUMERIC(10, 2)    
AS  
BEGIN  
    SET NOCOUNT ON;

    -- 1. Cálculos de duración y costo
    DECLARE @totalDiasReservacion INT;  
    DECLARE @costoTotal NUMERIC(14, 2);  
    DECLARE @fechaActual DATETIME = GETDATE();  

    SET @totalDiasReservacion = DATEDIFF(DAY, @fechaEntrada, @fechaSalida);  

    SET @costoTotal = 
        (@numeroAdultos * @costoPorCadaAdulto + @numeroNinhos * @costoPorCadaNinho) 
        * @totalDiasReservacion;  
    
    -- 2. Validar Fechas
    IF @fechaEntrada >= @fechaSalida  
    BEGIN  
        RAISERROR('La fecha de entrada debe ser anterior a la fecha de salida.', 16, 1);  
        RETURN;
    END

    -- 3. Insertar la reservación
    INSERT INTO dbo.Reservacion (  
        idPersona,  
        idHabitacion,  
        fechaEntrada,  
        fechaSalida,  
        numeroAdultos,  
        numeroNinhos,  
        totalDiasReservacion,  
        costoPorCadaAdulto,  
        costoPorCadaNinho,  
        costoTotal,  
        fechaCreacion,  
        estado  
    )  
    VALUES (  
        @idPersona,  
        @idHabitacion,  
        @fechaEntrada,  
        @fechaSalida,  
        @numeroAdultos,  
        @numeroNinhos,  
        @totalDiasReservacion,  
        @costoPorCadaAdulto,  
        @costoPorCadaNinho,  
        @costoTotal,  
        @fechaActual, 
        'A'
    ); 

    
    SELECT CAST(SCOPE_IDENTITY() AS INT) AS idReservacion;
END


/** SpEditarReservacion 7 ** Utilizado en EditarReservaciones, cerado por dayeri. ****/

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SpEditarReservacion]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpEditarReservacion]
(
    @IdReservacion INT,
    @FechaEntrada DATE,
    @FechaSalida DATE,
    @Adultos INT,
    @Ninos INT,
    @TotalDias INT,
    @CostoTotal DECIMAL(10,2)
)
AS
BEGIN
    UPDATE Reservacion
    SET fechaEntrada = @FechaEntrada,
        fechaSalida = @FechaSalida,
        numeroAdultos = @Adultos,
        numeroNinhos = @Ninos,
        totalDiasReservacion = @TotalDias,
        costoTotal = @CostoTotal,
        fechaModificacion = GETDATE()
    WHERE idReservacion = @IdReservacion;
END;


/** SpFiltrarReservacionesEmpleado 8** Usado en GestionarReservacion para filtrar según cliente, o fechas.****/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SpFiltrarReservacionesEmpleado]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpFiltrarReservacionesEmpleado]
    @idPersona INT,
    @fechaDesde DATE,
    @fechaHasta DATE
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        R.idReservacion,
        P.nombreCompleto AS Nombre,
        H.nombre AS Hotel,
        R.fechaEntrada,
        R.fechaSalida,
        R.costoTotal,
        R.estado
    FROM Reservacion R
        INNER JOIN Habitacion Hab ON R.idHabitacion = Hab.idHabitacion
        INNER JOIN Hotel H ON Hab.idHotel = H.idHotel
        INNER JOIN Persona P ON R.idPersona = P.idPersona
    WHERE 
        -- Si idPersona = 0, no filtra por persona
        (@idPersona = 0 OR R.idPersona = @idPersona)

        -- Fechas dentro del rango
        AND R.fechaEntrada >= @fechaDesde
        AND R.fechaSalida <= @fechaHasta

    ORDER BY R.idReservacion DESC;
END


/** SpHabitacionReservacionesFuturas 9 ** Usado en EditarHabitacion, para confirmar si existen reservaciones con fecha de salida futura a la fecha actual. ****/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[spHabitacionReservacionesFuturas]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spHabitacionReservacionesFuturas]
    @IdHabitacion INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        CASE 
            WHEN EXISTS (
                SELECT 1 
                FROM Reservacion r
                WHERE r.idHabitacion = @IdHabitacion
                  AND r.fechaSalida > CAST(GETDATE() AS DATE)
                  AND r.estado = 'A'  -- solo reservaciones activas
            )
            THEN 1
            ELSE 0
        END AS TieneReservacionesFuturas;
END
GO
/****** Object:  StoredProcedure [dbo].[SpInactivarHabitacion]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpInactivarHabitacion]
    @idHabitacion INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE Habitacion
    SET estado = 'I'
    WHERE idHabitacion = @idHabitacion;
END
GO
/****** Object:  StoredProcedure [dbo].[spInsertarBitacora]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spInsertarBitacora]
    @idReservacion INT, 
    @idPersona INT,
    @accion VARCHAR(25)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Bitacora (
        idReservacion,
        idPersona,
        accionRealizada,
        fechaDeLaAccion
    )
    VALUES (
        @idReservacion,
        @idPersona,
        @accion,
        GETDATE()
    );
END


/** SpListaHoteles 12 ** Usado en CrearHabitacion para cargar el DropDown****/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SpListaHoteles]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpListaHoteles]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        idHotel,
        nombre
    FROM Hotel
    ORDER BY nombre ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[SpListarHabitaciones]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpListarHabitaciones]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        Hab.idHabitacion,
        H.nombre AS Hotel,
        Hab.numeroHabitacion,
        Hab.capacidadMaxima,
        Hab.estado
    FROM Habitacion Hab
        INNER JOIN Hotel H ON Hab.idHotel = H.idHotel
    ORDER BY 
        H.nombre ASC,
        Hab.estado ASC,
        Hab.numeroHabitacion ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[SpListarPersonasActivas]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpListarPersonasActivas]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        P.idPersona,
        P.nombreCompleto
    FROM Persona P
    WHERE P.estado = 'A'
    ORDER BY P.nombreCompleto ASC;
END


/**SpLogin** Usa email y clave para seleccionar persona, validando correo, clave y estado A. *****/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[spLogin]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spLogin]
    @Email NVARCHAR(150),
    @Clave NVARCHAR(15)
AS
BEGIN
    SELECT idPersona, nombreCompleto, esEmpleado
    FROM Persona
    WHERE email = @Email
      AND clave = @Clave
      AND estado = 'A';
END


/** SpObtenerCostosHotel ** Usado en crear y modificar reservacion ****/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[spObtenerCostosHotel]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerCostosHotel]
    @idHotel INT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Retorna los costos por adulto y nino para el hotel seleccionado.
    SELECT 
        costoPorCadaAdulto, 
        costoPorCadaNinho
    FROM 
        dbo.Hotel
    WHERE 
        idHotel = @idHotel;
END


/** SpObtenerDetalleHabitacion ** Usado en EditarHabitacion para cargar detalles de la habitación y verificar estado de la habitación ****/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[spObtenerDetalleHabitacion]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerDetalleHabitacion]
    @IdHabitacion INT
AS
BEGIN
    SELECT 
        h.idHabitacion,
        ht.idHotel,
        ht.nombre AS nombreHotel,
        h.numeroHabitacion,
        h.capacidadMaxima,
        h.descripcion,
        h.estado
    FROM Habitacion h
    INNER JOIN Hotel ht ON ht.idHotel = h.idHotel
    WHERE h.idHabitacion = @IdHabitacion;
END
GO
/****** Object:  StoredProcedure [dbo].[SpObtenerReservacionPorId]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpObtenerReservacionPorId]
    @idReservacion INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        r.idReservacion AS numeroReservacion,
        h.nombre AS hotel,
        hab.numeroHabitacion AS numeroHabitacion,
        p.nombreCompleto AS cliente,
        r.fechaEntrada,
        r.fechaSalida,
        DATEDIFF(DAY, r.fechaEntrada, r.fechaSalida) AS diasReserva,
        r.numeroAdultos,
        r.numeroNinhos,
        r.costoTotal
    FROM Reservacion r
        INNER JOIN Habitacion hab ON r.idHabitacion = hab.idHabitacion
        INNER JOIN Hotel h ON hab.idHotel = h.idHotel
        INNER JOIN Persona p ON r.idPersona = p.idPersona
    WHERE r.idReservacion = @idReservacion;
END


/**SpReservacionesParaEmpleado** Usado en GestionarReservacion. Toma IdPersona, y devuelve datos para el gridview ****/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SpReservacionesParaEmpleado]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpReservacionesParaEmpleado]
    @idPersona INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        R.idReservacion,
        P.nombreCompleto AS Nombre,
        H.nombre AS Hotel,
        R.fechaEntrada,
        R.fechaSalida,
        R.costoTotal,
        R.estado
    FROM Reservacion R
        INNER JOIN Persona P ON R.idPersona = P.idPersona
        INNER JOIN Habitacion Hab ON R.idHabitacion = Hab.idHabitacion
        INNER JOIN Hotel H ON Hab.idHotel = H.idHotel
    ORDER BY R.idReservacion DESC;
END


/** SpReservacionesPorPersona** Usado en MisReservaciones. Toma IdPersona, y devuelve datos para el gridview ****/
SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[spReservacionesPorPersona]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spReservacionesPorPersona]
    @idPersona INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        R.idReservacion,
        H.nombre AS hotel,
        R.fechaEntrada,
        R.fechaSalida,
        R.costoTotal,
        R.estado
    FROM Reservacion R
        INNER JOIN Habitacion Hab ON R.idHabitacion = Hab.idHabitacion
        INNER JOIN Hotel H ON Hab.idHotel = H.idHotel
    WHERE R.idPersona = @idPersona
    ORDER BY R.idReservacion DESC;
END


/** SpVerificarNumeroHabitacion **Usado en CrearHabitacion para validar que el numero de habitacion no se encuentre duplicado en el hotel. Si devuelve 0 la habitación no existe y se puede crear ****/

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[SpVerificarNumeroHabitacion]    Script Date: 24/8/2026 10:54:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SpVerificarNumeroHabitacion]
    @idHotel INT,
    @numeroHabitacion VARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT COUNT(*) AS Existe
    FROM Habitacion
    WHERE idHotel = @idHotel
      AND numeroHabitacion = @numeroHabitacion;
END
GO
USE [master]
GO
ALTER DATABASE [PV_ProyectoFinal] SET  READ_WRITE 
GO
