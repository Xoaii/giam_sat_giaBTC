USE [master]
GO
/****** Object:  Database [bit]    Script Date: 25/05/2024 6:30:05 CH ******/
CREATE DATABASE [bit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.XOAII\MSSQL\DATA\bit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.XOAII\MSSQL\DATA\bit_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [bit] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bit] SET ARITHABORT OFF 
GO
ALTER DATABASE [bit] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bit] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bit] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bit] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bit] SET  MULTI_USER 
GO
ALTER DATABASE [bit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [bit] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [bit] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [bit] SET QUERY_STORE = ON
GO
ALTER DATABASE [bit] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [bit]
GO
/****** Object:  Table [dbo].[Coin]    Script Date: 25/05/2024 6:30:05 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Coin](
	[cid] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Coin] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Price]    Script Date: 25/05/2024 6:30:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Price](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cid] [int] NOT NULL,
	[priceCoin] [decimal](18, 0) NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_Price] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Coin] ([cid], [name]) VALUES (1, N'bitcoin')
GO
SET IDENTITY_INSERT [dbo].[Price] ON 

INSERT [dbo].[Price] ([id], [cid], [priceCoin], [time]) VALUES (1, 1, CAST(61555 AS Decimal(18, 0)), CAST(N'2024-05-19T14:53:27.000' AS DateTime))
INSERT [dbo].[Price] ([id], [cid], [priceCoin], [time]) VALUES (2, 1, CAST(61711 AS Decimal(18, 0)), CAST(N'2024-05-20T05:11:57.000' AS DateTime))
INSERT [dbo].[Price] ([id], [cid], [priceCoin], [time]) VALUES (3, 1, CAST(61740 AS Decimal(18, 0)), CAST(N'2024-05-20T15:18:54.000' AS DateTime))
INSERT [dbo].[Price] ([id], [cid], [priceCoin], [time]) VALUES (4, 1, CAST(64775 AS Decimal(18, 0)), CAST(N'2024-05-21T08:46:06.000' AS DateTime))
INSERT [dbo].[Price] ([id], [cid], [priceCoin], [time]) VALUES (5, 1, CAST(65149 AS Decimal(18, 0)), CAST(N'2024-05-21T13:36:30.000' AS DateTime))
INSERT [dbo].[Price] ([id], [cid], [priceCoin], [time]) VALUES (6, 1, CAST(64378 AS Decimal(18, 0)), CAST(N'2024-05-22T03:03:02.000' AS DateTime))
INSERT [dbo].[Price] ([id], [cid], [priceCoin], [time]) VALUES (7, 1, CAST(64356 AS Decimal(18, 0)), CAST(N'2024-05-22T06:20:51.000' AS DateTime))
INSERT [dbo].[Price] ([id], [cid], [priceCoin], [time]) VALUES (8, 1, CAST(61898 AS Decimal(18, 0)), CAST(N'2024-05-24T08:14:51.000' AS DateTime))
INSERT [dbo].[Price] ([id], [cid], [priceCoin], [time]) VALUES (9, 1, CAST(63629 AS Decimal(18, 0)), CAST(N'2024-05-25T08:31:13.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Price] OFF
GO
ALTER TABLE [dbo].[Price]  WITH CHECK ADD  CONSTRAINT [FK_Price_Coin] FOREIGN KEY([cid])
REFERENCES [dbo].[Coin] ([cid])
GO
ALTER TABLE [dbo].[Price] CHECK CONSTRAINT [FK_Price_Coin]
GO
/****** Object:  StoredProcedure [dbo].[Sp_Bit]    Script Date: 25/05/2024 6:30:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[Sp_Bit]
AS
BEGIN
    SET NOCOUNT ON;

    -- Tạo JSON từ bảng history
    DECLARE @json nvarchar(max);

    SELECT @json = (
        SELECT 
            1 AS ok,
            'ok' AS msg,
            (SELECT 
                [id], 
                [cid], 
                CONVERT(nvarchar(50), [priceCoin]) AS value, 
                CONVERT(nvarchar(50), [time]) AS time
             FROM Price
             FOR JSON PATH) AS data
        FOR JSON PATH, WITHOUT_ARRAY_WRAPPER
    );

    SELECT @json AS json;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_insertPrice]    Script Date: 25/05/2024 6:30:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_insertPrice]
    @cid int,
    @priceCoin decimal(18, 0),
	@time datetime
AS
BEGIN
    SET NOCOUNT ON;

    -- Chèn dữ liệu vào bảng 'history' với cột 'sid' và 'time' được cung cấp
    INSERT INTO Price(cid, priceCoin, time)
    VALUES (@cid, @priceCoin,@time);

    -- Trả về các giá trị đã chèn vào bảng 'history'
    SELECT SCOPE_IDENTITY() AS id, @cid AS sid, @priceCoin AS value,@time AS time;
END
GO
USE [master]
GO
ALTER DATABASE [bit] SET  READ_WRITE 
GO
