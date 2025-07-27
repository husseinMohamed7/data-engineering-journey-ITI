USE master;
GO
CREATE DATABASE [ITI]
ON PRIMARY
----------------------------------------------------------
----- don't forget to change the directory to your own
( NAME = N'ITI2', FILENAME = N'/var/opt/mssql/data/ITI.mdf', SIZE = 12288KB, MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
LOG ON
( NAME = N'ITI2_log', FILENAME = N'/var/opt/mssql/data/ITI_log.ldf', SIZE = 1792KB, MAXSIZE = 2048GB, FILEGROWTH = 10%)
COLLATE Arabic_CI_AS;
GO
----------------------------------------------------------
ALTER DATABASE [ITI] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ITI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [ITI] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ITI] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ITI] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ITI] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ITI] SET ARITHABORT OFF
GO
ALTER DATABASE [ITI] SET AUTO_CLOSE ON
GO
ALTER DATABASE [ITI] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ITI] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ITI] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ITI] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ITI] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ITI] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ITI] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ITI] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ITI] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ITI] SET  DISABLE_BROKER
GO
ALTER DATABASE [ITI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ITI] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ITI] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ITI] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ITI] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ITI] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ITI] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ITI] SET  READ_WRITE
GO
ALTER DATABASE [ITI] SET RECOVERY FULL
GO
ALTER DATABASE [ITI] SET  MULTI_USER
GO
ALTER DATABASE [ITI] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ITI] SET DB_CHAINING OFF
GO
USE [ITI]
GO
/****** Object:  User [itistudent]    Script Date: 02/14/2010 05:41:30 ******/
CREATE USER [itistudent] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [newschema]    Script Date: 02/14/2010 05:41:30 ******/
CREATE SCHEMA [newschema] AUTHORIZATION [dbo]
GO
/****** Object:  Schema [new]    Script Date: 02/14/2010 05:41:30 ******/
CREATE SCHEMA [new] AUTHORIZATION [dbo]
GO
/****** Object:  Table [dbo].[_#_AdventureWorks_Contact]    Script Date: 02/14/2010 05:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[Topic]    Script Date: 02/14/2010 05:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topic](
	[Top_Id] [int] NOT NULL,
	[Top_Name] [nvarchar](50) COLLATE Arabic_CI_AS NULL,
 CONSTRAINT [PK_Topic] PRIMARY KEY CLUSTERED 
(
	[Top_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Topic] ([Top_Id], [Top_Name]) VALUES (1, N'Programming')
INSERT [dbo].[Topic] ([Top_Id], [Top_Name]) VALUES (2, N'DB')
INSERT [dbo].[Topic] ([Top_Id], [Top_Name]) VALUES (3, N'Web')
INSERT [dbo].[Topic] ([Top_Id], [Top_Name]) VALUES (4, N'Operating System')
INSERT [dbo].[Topic] ([Top_Id], [Top_Name]) VALUES (5, N'Design')
INSERT [dbo].[Topic] ([Top_Id], [Top_Name]) VALUES (20, N'DB Admin')
INSERT [dbo].[Topic] ([Top_Id], [Top_Name]) VALUES (30, N'DB Admin')
INSERT [dbo].[Topic] ([Top_Id], [Top_Name]) VALUES (100, N'WEb')
INSERT [dbo].[Topic] ([Top_Id], [Top_Name]) VALUES (120, N'DB Admin')
/****** Object:  Table [dbo].[Instructor]    Script Date: 02/14/2010 05:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Instructor](
	[Ins_Id] [int] NOT NULL,
	[Ins_Name] [nvarchar](50) COLLATE Arabic_CI_AS NULL,
	[Ins_Degree] [nvarchar](50) COLLATE Arabic_CI_AS NULL,
	[Dept_Id] [int] NULL,
	[Salary] [int] NULL,
 CONSTRAINT [PK_Instructor] PRIMARY KEY CLUSTERED 
(
	[Ins_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (100, N'Ahmed', N'Master', 10, 1000)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (101, N'Hany', N'Master', 10, 2000)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (102, N'Reham', N'Master', 10, 3000)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (103, N'Yasmin', N'PHD', 10, 2500)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (104, N'Amany', N'PHD', 10, 2000)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (105, N'Eman', N'Master', 10, 1500)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (106, N'Saly', NULL, 10, 1000)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (107, N'Amr', NULL, 30, 2000)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (108, N'Hussien', NULL, 50, 3000)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (109, N'Khalid', NULL, 30, 4000)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (110, N'Salah', NULL, 70, 3500)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (111, N'Adel', NULL, 70, 5000)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (112, N'Fakry', NULL, 20, 3000)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (113, N'Amena', NULL, NULL, 2000)
INSERT [dbo].[Instructor] ([Ins_Id], [Ins_Name], [Ins_Degree], [Dept_Id], [Salary]) VALUES (114, N'Ghada', NULL, NULL, NULL)
/****** Object:  Table [dbo].[Department]    Script Date: 02/14/2010 05:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Dept_Id] [int] NOT NULL,
	[Dept_Name] [nvarchar](50) COLLATE Arabic_CI_AS NULL,
	[Dept_Desc] [nvarchar](100) COLLATE Arabic_CI_AS NULL,
	[Dept_Location] [nvarchar](50) COLLATE Arabic_CI_AS NULL,
	[Dept_Manager] [int] NULL,
	[Hiredate] [date] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Dept_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Department] ([Dept_Id], [Dept_Name], [Dept_Desc], [Dept_Location], [Dept_Manager], [Hiredate]) VALUES (10, N'SD', N'System Development', N'Cairo', 100, CAST(0x07240B00 AS Date))
INSERT [dbo].[Department] ([Dept_Id], [Dept_Name], [Dept_Desc], [Dept_Location], [Dept_Manager], [Hiredate]) VALUES (20, N'EL', N'E-Learning', N'Mansoura', 101, CAST(0xE2260B00 AS Date))
INSERT [dbo].[Department] ([Dept_Id], [Dept_Name], [Dept_Desc], [Dept_Location], [Dept_Manager], [Hiredate]) VALUES (30, N'Java', N'Java', N'Cairo', 102, CAST(0x0D240B00 AS Date))
INSERT [dbo].[Department] ([Dept_Id], [Dept_Name], [Dept_Desc], [Dept_Location], [Dept_Manager], [Hiredate]) VALUES (40, N'MM', N'Multimedia', N'Alex', 103, CAST(0xDF300B00 AS Date))
INSERT [dbo].[Department] ([Dept_Id], [Dept_Name], [Dept_Desc], [Dept_Location], [Dept_Manager], [Hiredate]) VALUES (50, N'Unix', N'Unix', N'Alex', NULL, NULL)
INSERT [dbo].[Department] ([Dept_Id], [Dept_Name], [Dept_Desc], [Dept_Location], [Dept_Manager], [Hiredate]) VALUES (60, N'NC', N'Network', N'Cairo', NULL, NULL)
INSERT [dbo].[Department] ([Dept_Id], [Dept_Name], [Dept_Desc], [Dept_Location], [Dept_Manager], [Hiredate]) VALUES (70, N'EB', N'E-Business', N'Alex', NULL, NULL)
/****** Object:  Table [dbo].[Course]    Script Date: 02/14/2010 05:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Crs_Id] [int] NOT NULL,
	[Crs_Name] [nvarchar](50) COLLATE Arabic_CI_AS NULL,
	[Crs_Duration] [int] NULL,
	[Ins_Id] [int] NULL,
	[Top_Id] [int] NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[Crs_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Course] ([Crs_Id], [Crs_Name], [Crs_Duration], [Ins_Id], [Top_Id]) VALUES (100, N'HTML', 20, 100, 3)
INSERT [dbo].[Course] ([Crs_Id], [Crs_Name], [Crs_Duration], [Ins_Id], [Top_Id]) VALUES (200, N'C Progamming', 60, 101, 1)
INSERT [dbo].[Course] ([Crs_Id], [Crs_Name], [Crs_Duration], [Ins_Id], [Top_Id]) VALUES (300, N'OOP', 80, 101, 1)
INSERT [dbo].[Course] ([Crs_Id], [Crs_Name], [Crs_Duration], [Ins_Id], [Top_Id]) VALUES (400, N'Unix', 50, NULL, 4)
INSERT [dbo].[Course] ([Crs_Id], [Crs_Name], [Crs_Duration], [Ins_Id], [Top_Id]) VALUES (500, N'SQL Server', 60, 103, 2)
INSERT [dbo].[Course] ([Crs_Id], [Crs_Name], [Crs_Duration], [Ins_Id], [Top_Id]) VALUES (600, N'C#', 80, 104, 1)
INSERT [dbo].[Course] ([Crs_Id], [Crs_Name], [Crs_Duration], [Ins_Id], [Top_Id]) VALUES (700, N'Web Service', 20, 104, 3)
INSERT [dbo].[Course] ([Crs_Id], [Crs_Name], [Crs_Duration], [Ins_Id], [Top_Id]) VALUES (800, N'Java', 60, 105, 1)
INSERT [dbo].[Course] ([Crs_Id], [Crs_Name], [Crs_Duration], [Ins_Id], [Top_Id]) VALUES (900, N'Oracle', 50, 106, 2)
INSERT [dbo].[Course] ([Crs_Id], [Crs_Name], [Crs_Duration], [Ins_Id], [Top_Id]) VALUES (1000, N'ASP.Net', 60, 107, 3)
INSERT [dbo].[Course] ([Crs_Id], [Crs_Name], [Crs_Duration], [Ins_Id], [Top_Id]) VALUES (1100, N'Win_XP', 20, 108, 4)
INSERT [dbo].[Course] ([Crs_Id], [Crs_Name], [Crs_Duration], [Ins_Id], [Top_Id]) VALUES (1200, N'Photoshop', 30, 109, 5)
/****** Object:  Table [newschema].[Student]    Script Date: 02/14/2010 05:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [newschema].[Student](
	[St_Id] [int] NOT NULL,
	[St_Fname] [nvarchar](50) COLLATE Arabic_CI_AS NULL,
	[St_Lname] [nchar](10) COLLATE Arabic_CI_AS NULL,
	[St_Address] [nvarchar](100) COLLATE Arabic_CI_AS NULL,
	[St_Age] [int] NULL,
	[Dept_Id] [int] NULL,
	[St_super] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[St_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [newschema].[Student] ([St_Id], [St_Fname], [St_Lname], [St_Address], [St_Age], [Dept_Id], [St_super]) VALUES (1, N'Ahmed', N'Hassan    ', N'Cairo', 20, 10, NULL)
INSERT [newschema].[Student] ([St_Id], [St_Fname], [St_Lname], [St_Address], [St_Age], [Dept_Id], [St_super]) VALUES (2, N'Amr', N'Magdy     ', N'Cairo', 21, 10, 1)
INSERT [newschema].[Student] ([St_Id], [St_Fname], [St_Lname], [St_Address], [St_Age], [Dept_Id], [St_super]) VALUES (3, N'Mona', N'Saleh     ', N'Cairo', 22, 10, 1)
INSERT [newschema].[Student] ([St_Id], [St_Fname], [St_Lname], [St_Address], [St_Age], [Dept_Id], [St_super]) VALUES (4, N'Ahmed', N'Mohamed   ', N'Alex', 23, 10, 1)
INSERT [newschema].[Student] ([St_Id], [St_Fname], [St_Lname], [St_Address], [St_Age], [Dept_Id], [St_super]) VALUES (5, N'Khalid', NULL, N'Alex', 24, 10, 1)
INSERT [newschema].[Student] ([St_Id], [St_Fname], [St_Lname], [St_Address], [St_Age], [Dept_Id], [St_super]) VALUES (6, N'Heba', N'Farouk    ', N'Mansoura', 25, 20, NULL)
INSERT [newschema].[Student] ([St_Id], [St_Fname], [St_Lname], [St_Address], [St_Age], [Dept_Id], [St_super]) VALUES (7, NULL, N'Hussien   ', NULL, NULL, 20, 6)
INSERT [newschema].[Student] ([St_Id], [St_Fname], [St_Lname], [St_Address], [St_Age], [Dept_Id], [St_super]) VALUES (8, N'Mohamed', N'Fars      ', N'Alex', 28, 20, 6)
INSERT [newschema].[Student] ([St_Id], [St_Fname], [St_Lname], [St_Address], [St_Age], [Dept_Id], [St_super]) VALUES (9, N'Saly', N'Ahmed     ', N'Mansoura', 30, 30, NULL)
INSERT [newschema].[Student] ([St_Id], [St_Fname], [St_Lname], [St_Address], [St_Age], [Dept_Id], [St_super]) VALUES (10, N'Fady', N'Ali       ', N'Alex', 32, 30, 9)
INSERT [newschema].[Student] ([St_Id], [St_Fname], [St_Lname], [St_Address], [St_Age], [Dept_Id], [St_super]) VALUES (11, N'Marwa', N'Ahmed     ', N'Cairo', 22, 30, 9)
INSERT [newschema].[Student] ([St_Id], [St_Fname], [St_Lname], [St_Address], [St_Age], [Dept_Id], [St_super]) VALUES (12, N'Noha', N'Omar      ', N'Cairo', 22, 40, NULL)
INSERT [newschema].[Student] ([St_Id], [St_Fname], [St_Lname], [St_Address], [St_Age], [Dept_Id], [St_super]) VALUES (13, N'Said', NULL, NULL, 24, 40, 12)
/****** Object:  Table [dbo].[Stud_Course]    Script Date: 02/14/2010 05:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stud_Course](
	[Crs_Id] [int] NOT NULL,
	[St_Id] [int] NOT NULL,
	[grade] [int] NULL,
 CONSTRAINT [PK_Stud_Course] PRIMARY KEY CLUSTERED 
(
	[Crs_Id] ASC,
	[St_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (100, 1, 100)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (100, 2, 50)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (100, 3, 70)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (100, 4, 80)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (100, 5, 100)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (100, 6, 120)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (200, 1, 100)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (200, 2, 90)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (200, 3, 90)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (200, 4, 70)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (200, 5, 40)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (200, 7, 30)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (200, 8, 80)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (200, 9, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (300, 5, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (300, 6, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (300, 7, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (300, 10, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (400, 1, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (400, 2, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (400, 3, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (400, 4, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (400, 5, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (500, 6, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (600, 7, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (700, 8, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (800, 1, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (800, 9, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (800, 10, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (900, 2, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (900, 3, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (900, 4, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (900, 5, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (1000, 1, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (1000, 2, NULL)
INSERT [dbo].[Stud_Course] ([Crs_Id], [St_Id], [grade]) VALUES (1000, 3, NULL)
/****** Object:  ForeignKey [FK_Department_Instructor]    Script Date: 02/14/2010 05:41:34 ******/
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Instructor] FOREIGN KEY([Dept_Manager])
REFERENCES [dbo].[Instructor] ([Ins_Id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Instructor]
GO
/****** Object:  ForeignKey [FK_Course_Instructor]    Script Date: 02/14/2010 05:41:34 ******/
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Instructor] FOREIGN KEY([Ins_Id])
REFERENCES [dbo].[Instructor] ([Ins_Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Instructor]
GO
/****** Object:  ForeignKey [FK_Course_Topic]    Script Date: 02/14/2010 05:41:34 ******/
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Topic] FOREIGN KEY([Top_Id])
REFERENCES [dbo].[Topic] ([Top_Id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Topic]
GO
/****** Object:  ForeignKey [FK_Student_Department]    Script Date: 02/14/2010 05:41:34 ******/
ALTER TABLE [newschema].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Department] FOREIGN KEY([Dept_Id])
REFERENCES [dbo].[Department] ([Dept_Id])
GO
ALTER TABLE [newschema].[Student] CHECK CONSTRAINT [FK_Student_Department]
GO
/****** Object:  ForeignKey [FK_Student_Student]    Script Date: 02/14/2010 05:41:34 ******/
ALTER TABLE [newschema].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Student] FOREIGN KEY([St_super])
REFERENCES [newschema].[Student] ([St_Id])
GO
ALTER TABLE [newschema].[Student] CHECK CONSTRAINT [FK_Student_Student]
GO
/****** Object:  ForeignKey [FK_Stud_Course_Course]    Script Date: 02/14/2010 05:41:34 ******/
ALTER TABLE [dbo].[Stud_Course]  WITH CHECK ADD  CONSTRAINT [FK_Stud_Course_Course] FOREIGN KEY([Crs_Id])
REFERENCES [dbo].[Course] ([Crs_Id])
GO
ALTER TABLE [dbo].[Stud_Course] CHECK CONSTRAINT [FK_Stud_Course_Course]
GO
/****** Object:  ForeignKey [FK_Stud_Course_Student]    Script Date: 02/14/2010 05:41:34 ******/
ALTER TABLE [dbo].[Stud_Course]  WITH CHECK ADD  CONSTRAINT [FK_Stud_Course_Student] FOREIGN KEY([St_Id])
REFERENCES [newschema].[Student] ([St_Id])
GO
ALTER TABLE [dbo].[Stud_Course] CHECK CONSTRAINT [FK_Stud_Course_Student]
GO
