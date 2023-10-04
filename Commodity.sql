USE [master]
GO
/****** Object:  Database [Commodities]    Script Date: 04-Oct-23 10:51:36 AM ******/
CREATE DATABASE [Commodities]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Commodities', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQL1\MSSQL\DATA\Commodities.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Commodities_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQL1\MSSQL\DATA\Commodities_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Commodities] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Commodities].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Commodities] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Commodities] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Commodities] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Commodities] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Commodities] SET ARITHABORT OFF 
GO
ALTER DATABASE [Commodities] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Commodities] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Commodities] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Commodities] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Commodities] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Commodities] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Commodities] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Commodities] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Commodities] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Commodities] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Commodities] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Commodities] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Commodities] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Commodities] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Commodities] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Commodities] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Commodities] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Commodities] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Commodities] SET  MULTI_USER 
GO
ALTER DATABASE [Commodities] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Commodities] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Commodities] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Commodities] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Commodities] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Commodities] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Commodities] SET QUERY_STORE = ON
GO
ALTER DATABASE [Commodities] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Commodities]
GO
/****** Object:  Table [dbo].[2DCropPrices]    Script Date: 04-Oct-23 10:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[2DCropPrices](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Retail] [varchar](max) NULL,
	[Wholesale] [varchar](max) NULL,
	[Date] [datetime2](7) NULL,
	[CropDimensionId] [int] NULL,
	[StateDimensionId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CropDimensions]    Script Date: 04-Oct-23 10:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CropDimensions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[crop_name] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[advisory_img] [nvarchar](max) NULL,
 CONSTRAINT [crop_pkey] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateDimensions]    Script Date: 04-Oct-23 10:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateDimensions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [nvarchar](max) NULL,
	[ShortCode] [nvarchar](max) NULL,
 CONSTRAINT [PK_States] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[2DCropPrices]  WITH CHECK ADD FOREIGN KEY([CropDimensionId])
REFERENCES [dbo].[CropDimensions] ([Id])
GO
ALTER TABLE [dbo].[2DCropPrices]  WITH CHECK ADD FOREIGN KEY([StateDimensionId])
REFERENCES [dbo].[StateDimensions] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[usp_GetCropPriceBySateDate]    Script Date: 04-Oct-23 10:51:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetCropPriceBySateDate]
(@Id INT,
@Date datetime2)
AS
BEGIN
SELECT
    cd.image,
    cd.crop_name,
	MAX(CASE WHEN cp.StateDimensionId = @Id THEN sd.state_name END) AS State_Name,
    MAX(CASE WHEN cp.StateDimensionId = @Id THEN cp.Retail END) AS Retail,
    MAX(CASE WHEN cp.StateDimensionId = 34 THEN cp.Retail END) AS Average_Retail,
    MAX(CASE WHEN cp.StateDimensionId = 35 THEN cp.Retail END) AS Maximum_Retail,
    MAX(CASE WHEN cp.StateDimensionId = 36 THEN cp.Retail END) AS Minimum_Retail,
    MAX(CASE WHEN cp.StateDimensionId = 37 THEN cp.Retail END) AS Modal_Retail,
    MAX(CASE WHEN cp.StateDimensionId = @Id THEN cp.Wholesale END) AS Wholesale,
    MAX(CASE WHEN cp.StateDimensionId = 34 THEN cp.Wholesale END) AS Average_Wholesale,
    MAX(CASE WHEN cp.StateDimensionId = 35 THEN cp.Wholesale END) AS Maximum_Wholesale,
    MAX(CASE WHEN cp.StateDimensionId = 36 THEN cp.Wholesale END) AS Minimum_Wholesale,
    MAX(CASE WHEN cp.StateDimensionId = 37 THEN cp.Wholesale END) AS Modal_Wholesale
FROM [dbo].[CropDimensions] AS cd
INNER JOIN [dbo].[2DCropPrices] AS cp ON cd.Id = cp.CropDimensionId
INNER JOIN [dbo].[StateDimensions] AS sd ON sd.Id = cp.StateDimensionId
WHERE cp.Date = @Date
    AND cp.StateDimensionId IN (@Id, 34, 35, 36, 37)
GROUP BY
    cd.image,
    cd.crop_name;
END
GO
USE [master]
GO
ALTER DATABASE [Commodities] SET  READ_WRITE 
GO
