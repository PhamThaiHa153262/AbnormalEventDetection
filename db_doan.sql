USE [Db_Doan]
GO
/****** Object:  Table [dbo].[Camera]    Script Date: 1/19/2023 1:01:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Camera](
	[CameraID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[HistoryCameraID] [int] NOT NULL,
	[EventID] [int] NOT NULL,
	[NotificationID] [int] NOT NULL,
 CONSTRAINT [PK_Camera] PRIMARY KEY CLUSTERED 
(
	[CameraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EmailList]    Script Date: 1/19/2023 1:01:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailList](
	[EmailListID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[NotificationID] [int] NOT NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_EmailList] PRIMARY KEY CLUSTERED 
(
	[EmailListID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 1/19/2023 1:01:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[EventID] [int] IDENTITY(1,1) NOT NULL,
	[CameraID] [int] NOT NULL,
	[Message] [nvarchar](max) NULL,
	[DateTime] [datetime] NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[EventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Help]    Script Date: 1/19/2023 1:01:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Help](
	[HelpID] [int] NOT NULL,
	[Answer] [nvarchar](max) NULL,
	[Question] [nvarchar](max) NULL,
 CONSTRAINT [PK_Help] PRIMARY KEY CLUSTERED 
(
	[HelpID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HistoryCamera]    Script Date: 1/19/2023 1:01:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HistoryCamera](
	[HistoryCameraID] [int] NOT NULL,
	[CameraID] [int] NOT NULL,
	[FilePath] [nvarchar](max) NULL,
	[Datetime] [datetime] NULL,
 CONSTRAINT [PK_HistoryCamera] PRIMARY KEY CLUSTERED 
(
	[HistoryCameraID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 1/19/2023 1:01:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[NotificationID] [int] NOT NULL,
	[CameraID] [int] NOT NULL,
	[EmailListID] [int] NOT NULL,
	[Message] [nvarchar](max) NULL,
	[Datetime] [datetime] NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/19/2023 1:01:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Camera]  WITH CHECK ADD  CONSTRAINT [FK_Camera_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Event] ([EventID])
GO
ALTER TABLE [dbo].[Camera] CHECK CONSTRAINT [FK_Camera_Event]
GO
ALTER TABLE [dbo].[Camera]  WITH CHECK ADD  CONSTRAINT [FK_Camera_HistoryCamera] FOREIGN KEY([HistoryCameraID])
REFERENCES [dbo].[HistoryCamera] ([HistoryCameraID])
GO
ALTER TABLE [dbo].[Camera] CHECK CONSTRAINT [FK_Camera_HistoryCamera]
GO
ALTER TABLE [dbo].[Camera]  WITH CHECK ADD  CONSTRAINT [FK_Camera_Notification] FOREIGN KEY([NotificationID])
REFERENCES [dbo].[Notification] ([NotificationID])
GO
ALTER TABLE [dbo].[Camera] CHECK CONSTRAINT [FK_Camera_Notification]
GO
ALTER TABLE [dbo].[Camera]  WITH CHECK ADD  CONSTRAINT [FK_Camera_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Camera] CHECK CONSTRAINT [FK_Camera_User]
GO
ALTER TABLE [dbo].[EmailList]  WITH CHECK ADD  CONSTRAINT [FK_EmailList_Notification] FOREIGN KEY([NotificationID])
REFERENCES [dbo].[Notification] ([NotificationID])
GO
ALTER TABLE [dbo].[EmailList] CHECK CONSTRAINT [FK_EmailList_Notification]
GO
ALTER TABLE [dbo].[EmailList]  WITH CHECK ADD  CONSTRAINT [FK_EmailList_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[EmailList] CHECK CONSTRAINT [FK_EmailList_User]
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_Camera] FOREIGN KEY([CameraID])
REFERENCES [dbo].[Camera] ([CameraID])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_Camera]
GO
ALTER TABLE [dbo].[HistoryCamera]  WITH CHECK ADD  CONSTRAINT [FK_HistoryCamera_Camera] FOREIGN KEY([CameraID])
REFERENCES [dbo].[Camera] ([CameraID])
GO
ALTER TABLE [dbo].[HistoryCamera] CHECK CONSTRAINT [FK_HistoryCamera_Camera]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Camera] FOREIGN KEY([CameraID])
REFERENCES [dbo].[Camera] ([CameraID])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Camera]
GO
