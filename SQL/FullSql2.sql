USE [master]
GO
/****** Object:  Database [QUANLYBANLAPTOP]    Script Date: 20/02/2024 19:22:26 ******/
CREATE DATABASE [QUANLYBANLAPTOP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QUANLYBANLAPTOP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.NHATTAN\MSSQL\DATA\QUANLYBANLAPTOP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QUANLYBANLAPTOP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.NHATTAN\MSSQL\DATA\QUANLYBANLAPTOP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QUANLYBANLAPTOP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET ARITHABORT OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET RECOVERY FULL 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET  MULTI_USER 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QUANLYBANLAPTOP', N'ON'
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET QUERY_STORE = ON
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QUANLYBANLAPTOP]
GO
/****** Object:  Table [dbo].[BRANDS]    Script Date: 20/02/2024 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRANDS](
	[brand_id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[image] [nvarchar](255) NULL,
	[slug] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[brand_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CARTS]    Script Date: 20/02/2024 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CARTS](
	[user_id] [int] NULL,
	[product_id] [int] NULL,
	[prod_name] [nvarchar](255) NULL,
	[description] [nvarchar](max) NULL,
	[avatar] [nvarchar](255) NULL,
	[price] [float] NULL,
	[is_possible_to_order] [int] NULL,
	[count] [int] NULL,
	[product_total] [float] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[guest_id] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CATEGORIES]    Script Date: 20/02/2024 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CATEGORIES](
	[category_id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[slug] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IMAGES]    Script Date: 20/02/2024 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IMAGES](
	[image_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[image_url] [nvarchar](255) NULL,
	[url] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[image_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDER_DETAILS]    Script Date: 20/02/2024 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDER_DETAILS](
	[product_id] [int] NULL,
	[order_id] [int] NULL,
	[quantity] [int] NULL,
	[price] [float] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 20/02/2024 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paymentMethods] [varchar](255) NULL,
	[total] [float] NULL,
	[user_id] [int] NULL,
	[name] [nvarchar](100) NOT NULL,
	[email] [varchar](100) NULL,
	[user_address] [nvarchar](255) NOT NULL,
	[phone] [varchar](25) NULL,
	[trading_code] [varchar](255) NULL,
	[is_payment] [int] NULL,
	[is_transported] [int] NULL,
	[is_success] [int] NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[is_rated] [int] NULL,
	[note] [nvarchar](255) NULL,
	[guest_id] [varchar](50) NULL,
	[avatar] [nvarchar](255) NULL,
	[is_approved] [int] NULL,
	[is_being_shipped] [int] NULL,
	[approved_at] [datetime] NULL,
	[being_shipped_at] [datetime] NULL,
	[transported_at] [datetime] NULL,
	[successful_at] [datetime] NULL,
	[paid_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTS]    Script Date: 20/02/2024 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brand_id] [int] NULL,
	[category_id] [int] NULL,
	[prod_name] [nvarchar](255) NOT NULL,
	[avatar] [nvarchar](255) NULL,
	[prod_description] [nvarchar](max) NULL,
	[manufacturer] [nvarchar](255) NULL,
	[price] [float] NULL,
	[cost] [float] NULL,
	[quantity] [int] NULL,
	[prod_percent] [float] NULL,
	[cpu] [nvarchar](255) NULL,
	[hard_drive] [nvarchar](255) NULL,
	[mux_switch] [nvarchar](255) NULL,
	[screen] [nvarchar](255) NULL,
	[webcam] [nvarchar](255) NULL,
	[connection] [nvarchar](255) NULL,
	[prod_weight] [nvarchar](255) NULL,
	[pin] [nvarchar](255) NULL,
	[operation_system] [nvarchar](255) NULL,
	[created_at] [datetime] NULL,
	[updated_at] [datetime] NULL,
	[ram] [nvarchar](125) NULL,
	[graphics] [nvarchar](125) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROVIDED_USERS]    Script Date: 20/02/2024 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROVIDED_USERS](
	[user_id] [int] NULL,
	[name] [nvarchar](100) NULL,
	[email] [varchar](100) NULL,
	[provider] [varchar](255) NULL,
	[subject] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REVIEWS]    Script Date: 20/02/2024 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REVIEWS](
	[review_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NULL,
	[user_id] [int] NULL,
	[rating] [int] NULL,
	[comment] [nvarchar](max) NULL,
	[created_at] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS]    Script Date: 20/02/2024 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[password] [varchar](255) NULL,
	[email] [varchar](100) NULL,
	[role] [varchar](50) NULL,
	[provider] [varchar](255) NULL,
	[phone] [varchar](15) NULL,
	[registration_token] [varchar](255) NULL,
	[confirmation_status] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[USERS2]    Script Date: 20/02/2024 19:22:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USERS2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[password] [varchar](255) NULL,
	[email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BRANDS] ([brand_id], [name], [description], [created_at], [updated_at], [image], [slug]) VALUES (1, N'DELL', NULL, CAST(N'2023-08-22T08:36:21.503' AS DateTime), CAST(N'2023-08-22T08:36:21.503' AS DateTime), N'http://localhost:8000/upload/dell.png', N'dell')
GO
INSERT [dbo].[BRANDS] ([brand_id], [name], [description], [created_at], [updated_at], [image], [slug]) VALUES (2, N'MSI', NULL, CAST(N'2023-08-22T08:36:27.777' AS DateTime), CAST(N'2023-08-22T08:36:27.777' AS DateTime), N'http://localhost:8000/upload/msi.png', N'msi')
GO
INSERT [dbo].[BRANDS] ([brand_id], [name], [description], [created_at], [updated_at], [image], [slug]) VALUES (3, N'ASUS', NULL, CAST(N'2023-08-22T08:36:47.613' AS DateTime), CAST(N'2023-08-22T08:36:47.613' AS DateTime), N'http://localhost:8000/upload/asus.png', N'asus')
GO
INSERT [dbo].[BRANDS] ([brand_id], [name], [description], [created_at], [updated_at], [image], [slug]) VALUES (4, N'ACER', NULL, CAST(N'2023-08-22T08:36:52.253' AS DateTime), CAST(N'2023-08-22T08:36:52.253' AS DateTime), N'http://localhost:8000/upload/acer.png', N'acer')
GO
INSERT [dbo].[BRANDS] ([brand_id], [name], [description], [created_at], [updated_at], [image], [slug]) VALUES (5, N'LENOVO', NULL, CAST(N'2023-08-22T08:37:00.953' AS DateTime), CAST(N'2023-08-22T08:37:00.953' AS DateTime), N'http://localhost:8000/upload/lenovo.png', N'lenovo')
GO
INSERT [dbo].[BRANDS] ([brand_id], [name], [description], [created_at], [updated_at], [image], [slug]) VALUES (6, N'HP', NULL, CAST(N'2023-08-22T08:37:15.767' AS DateTime), CAST(N'2023-08-22T08:37:15.767' AS DateTime), N'http://localhost:8000/upload/hp.png', N'hp')
GO
INSERT [dbo].[BRANDS] ([brand_id], [name], [description], [created_at], [updated_at], [image], [slug]) VALUES (7, N'LG', NULL, CAST(N'2023-08-22T08:37:21.980' AS DateTime), CAST(N'2023-08-22T08:37:21.980' AS DateTime), N'http://localhost:8000/upload/lg.png', N'lg')
GO
INSERT [dbo].[BRANDS] ([brand_id], [name], [description], [created_at], [updated_at], [image], [slug]) VALUES (8, N'MICROSOFT', NULL, CAST(N'2023-08-22T08:38:28.877' AS DateTime), CAST(N'2023-08-22T08:38:28.877' AS DateTime), N'http://localhost:8000/upload/microsoft.png', N'microsoft')
GO
INSERT [dbo].[BRANDS] ([brand_id], [name], [description], [created_at], [updated_at], [image], [slug]) VALUES (9, N'MACBOOK', NULL, CAST(N'2023-08-29T09:50:19.780' AS DateTime), CAST(N'2023-08-29T09:50:19.780' AS DateTime), N'http://localhost:8000/upload/macbook.png', N'macbook')
GO
SET IDENTITY_INSERT [dbo].[CARTS] ON 
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (7008, 24, N'Dell Inspirion 15', N'Thiet ke hien dai dep de, tre trung', N'1683708021359-dellinspirion.png', 4000000, 12, 2, 8000000, CAST(N'2023-07-29T22:32:25.100' AS DateTime), CAST(N'2023-07-29T22:32:25.100' AS DateTime), 4, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (3002, 24, N'Dell Inspirion 15', N'Thiet ke hien dai dep de, tre trung', N'1683708021359-dellinspirion.png', 4000000, 12, 3, 12000000, CAST(N'2023-06-04T21:48:07.283' AS DateTime), CAST(N'2023-07-12T21:41:07.373' AS DateTime), 6, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (3002, 32, N'Laprtop Dell XPS 15 9520', N'Intel Core i7 12700H, Ram 16GB, SSD 1TB, VGA Nvidia GeForce RTX 3050Ti 44GB GDDR6, 15.6inch Full HD, Windows 11 Home, Vỏ nhôm nguyên khối màu bạc, Hàng chính hãng , Bảo hành 12 Tháng', N'1683865425452-Laprtop Dell XPS 15 9520.jpg', 58500000, 12, 2, 117000000, CAST(N'2023-06-06T16:16:57.587' AS DateTime), CAST(N'2023-06-06T16:16:57.587' AS DateTime), 7, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (3002, 23, N'Dell Vostro', N'Dell Vostro 2022', N'1683707853284-dellvostro.png', 500000, 11, 2, 1000000, CAST(N'2023-07-06T07:31:17.250' AS DateTime), CAST(N'2023-07-06T07:31:21.160' AS DateTime), 8, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (4004, 32, N'Laprtop Dell XPS 15 9520', N'Intel Core i7 12700H, Ram 16GB, SSD 1TB, VGA Nvidia GeForce RTX 3050Ti 44GB GDDR6, 15.6inch Full HD, Windows 11 Home, Vỏ nhôm nguyên khối màu bạc, Hàng chính hãng , Bảo hành 12 Tháng', N'1683865425452-Laprtop Dell XPS 15 9520.jpg', 58500000, 12, 5, 292500000, CAST(N'2023-06-08T15:24:03.210' AS DateTime), CAST(N'2023-06-08T15:25:09.027' AS DateTime), 10, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (4004, 25, N'HP A1503ZA', N'Thiet ke hien dai dep de, tre trung', N'1683708160360-hp-a1503za.png', 20000000, 11, 0, 0, CAST(N'2023-06-08T15:41:43.797' AS DateTime), CAST(N'2023-06-08T15:41:43.797' AS DateTime), 11, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (3002, 25, N'HP A1503ZA', N'Thiet ke hien dai dep de, tre trung', N'1683708160360-hp-a1503za.png', 20000000, 11, 1, 20000000, CAST(N'2023-07-12T13:50:46.663' AS DateTime), CAST(N'2023-07-12T13:50:46.663' AS DateTime), 13, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 24, N'Dell Inspirion 15', N'Thiet ke hien dai dep de, tre trung', N'1683708021359-dellinspirion.png', 40000000, 12, 1, 40000000, NULL, NULL, 16, N'77ab2858-344e-4e87-a664-c5262bad5160')
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 31, N'Laptop Gaming Acer Nitro 5 2021 AN515-57', N'Laptop Gaming Acer Nitro 5 2021 AN515-57 I5-10300h SSD 512Gb', N'http://localhost:8000/upload/1690807304036-2320_laptopaz_acer_nitro_5_an515_57_1.jpg', 16000000, 30, 1, 16000000, CAST(N'2023-10-03T13:30:56.483' AS DateTime), CAST(N'2023-10-03T13:30:56.483' AS DateTime), 22, N'77ab2858-344e-4e87-a664-c5262bad5160')
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 1034, N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) ', N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) (AMD Ryzen 5-6600H, Ram 16GB, SSD 512GB, Đồ họa RTX 3050Ti 4GB, màn hình 16.1 inch FHD, Windows 11 bản quyền, màu xanh)', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', 20990000, 3, 1, 20990000, CAST(N'2023-10-03T13:32:04.223' AS DateTime), CAST(N'2023-10-03T13:32:04.223' AS DateTime), 23, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 1034, N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) ', N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) (AMD Ryzen 5-6600H, Ram 16GB, SSD 512GB, Đồ họa RTX 3050Ti 4GB, màn hình 16.1 inch FHD, Windows 11 bản quyền, màu xanh)', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', 20990000, 3, 1, 20990000, CAST(N'2023-10-03T13:33:13.923' AS DateTime), CAST(N'2023-10-03T13:33:13.923' AS DateTime), 24, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 1034, N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) ', N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) (AMD Ryzen 5-6600H, Ram 16GB, SSD 512GB, Đồ họa RTX 3050Ti 4GB, màn hình 16.1 inch FHD, Windows 11 bản quyền, màu xanh)', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', 20990000, 3, 1, 20990000, CAST(N'2023-10-03T13:36:58.973' AS DateTime), CAST(N'2023-10-03T13:36:58.973' AS DateTime), 25, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 1034, N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) ', N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) (AMD Ryzen 5-6600H, Ram 16GB, SSD 512GB, Đồ họa RTX 3050Ti 4GB, màn hình 16.1 inch FHD, Windows 11 bản quyền, màu xanh)', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', 20990000, 3, 1, 20990000, CAST(N'2023-10-03T13:38:22.763' AS DateTime), CAST(N'2023-10-03T13:38:22.763' AS DateTime), 26, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 1034, N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) ', N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) (AMD Ryzen 5-6600H, Ram 16GB, SSD 512GB, Đồ họa RTX 3050Ti 4GB, màn hình 16.1 inch FHD, Windows 11 bản quyền, màu xanh)', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', 20990000, 3, 1, 20990000, CAST(N'2023-10-03T13:40:00.760' AS DateTime), CAST(N'2023-10-03T13:40:00.760' AS DateTime), 27, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 1034, N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) ', N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) (AMD Ryzen 5-6600H, Ram 16GB, SSD 512GB, Đồ họa RTX 3050Ti 4GB, màn hình 16.1 inch FHD, Windows 11 bản quyền, màu xanh)', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', 20990000, 3, 1, 20990000, CAST(N'2023-10-03T13:40:07.273' AS DateTime), CAST(N'2023-10-03T13:40:07.273' AS DateTime), 28, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 27, N'Laptop Gaming Asus ROG Strix SCAR 18 G834JY-N6039W', N'Laptop Gaming Asus ROG Strix SCAR 18 G834JY-N6039W Intel Core i9-13980HX, RAM 64GB, SSD 2TB, RTX 4090 16GB, Màn Hình 18 inch QHD+ 240Hz, Windows 11, Màu Đen', N'http://localhost:8000/upload/1690807275761-29171-laptop_asus_gaming_rog.jpg', 125000000, 25, 1, 125000000, CAST(N'2023-10-04T00:00:39.820' AS DateTime), CAST(N'2023-10-15T16:43:59.620' AS DateTime), 34, N'4fe4fc4d-9da2-4fb4-812e-ade5e0fa89d9')
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 33, N'Laptop LG Gram Style 2023 16Z90RS-G.AH54A5', N'Laptop LG Gram Style 2023 16Z90RS-G.AH54A5 Intel Core i5-1340P, RAM 16GB, SSD 512GB, VGA Intel Iris Xe Graphics, Màn Hình 16inch WQHD+ OLED 120Hz, Windows 11', N'http://localhost:8000/upload/1690807324890-Laptop LG Gram Style 2023 16Z90RS-G.AH54A5.jpg', 43990000, 27, 1, 43990000, CAST(N'2023-10-15T16:46:37.193' AS DateTime), CAST(N'2023-10-15T16:46:37.193' AS DateTime), 36, N'4fe4fc4d-9da2-4fb4-812e-ade5e0fa89d9')
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 32, N'Laprtop Dell XPS 15 9520', N'Laprtop Dell XPS 15 9520 Intel Core i7 12700H, Ram 16GB, SSD 1TB, VGA Nvidia GeForce RTX 3050Ti 44GB GDDR6, 15.6inch Full HD, Windows 11 Home, Vỏ nhôm nguyên khối màu bạc, Hàng chính hãng , Bảo hành 12 Tháng', N'http://localhost:8000/upload/1690807317488-Laprtop Dell XPS 15 9520.jpg', 58500000, 12, 1, 58500000, CAST(N'2023-10-15T16:46:44.127' AS DateTime), CAST(N'2023-10-15T16:46:44.127' AS DateTime), 37, N'4fe4fc4d-9da2-4fb4-812e-ade5e0fa89d9')
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 26, N'MacBook Air M1 2020', N'MacBook Air M1 2020', N'http://localhost:8000/upload/1690807261763-macbook-air-m1-2020.png', 21900000, 11, 1, 21900000, CAST(N'2023-10-17T11:04:31.803' AS DateTime), CAST(N'2023-10-17T11:04:31.803' AS DateTime), 38, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 27, N'Laptop Gaming Asus ROG Strix SCAR 18 G834JY-N6039W', N'Laptop Gaming Asus ROG Strix SCAR 18 G834JY-N6039W Intel Core i9-13980HX, RAM 64GB, SSD 2TB, RTX 4090 16GB, Màn Hình 18 inch QHD+ 240Hz, Windows 11, Màu Đen', N'http://localhost:8000/upload/1690807275761-29171-laptop_asus_gaming_rog.jpg', 125000000, 25, 1, 125000000, CAST(N'2023-10-17T11:04:42.213' AS DateTime), CAST(N'2023-10-17T11:04:42.213' AS DateTime), 39, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 27, N'Laptop Gaming Asus ROG Strix SCAR 18 G834JY-N6039W', N'Laptop Gaming Asus ROG Strix SCAR 18 G834JY-N6039W Intel Core i9-13980HX, RAM 64GB, SSD 2TB, RTX 4090 16GB, Màn Hình 18 inch QHD+ 240Hz, Windows 11, Màu Đen', N'http://localhost:8000/upload/1690807275761-29171-laptop_asus_gaming_rog.jpg', 125000000, 25, 1, 125000000, CAST(N'2023-10-17T11:05:02.857' AS DateTime), CAST(N'2023-10-17T11:05:02.857' AS DateTime), 40, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 23, N'Dell Vostro', N'Dell Vostro I7-7200h SSD 256GB', N'http://localhost:8000/upload/1695568803791-1683707853284-dellvostro.png', 500000, 112, 1, 500000, CAST(N'2023-10-17T11:05:15.997' AS DateTime), CAST(N'2023-10-17T11:05:15.997' AS DateTime), 41, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 23, N'Dell Vostro', N'Dell Vostro I7-7200h SSD 256GB', N'http://localhost:8000/upload/1695568803791-1683707853284-dellvostro.png', 500000, 112, 1, 500000, CAST(N'2023-10-17T11:05:43.207' AS DateTime), CAST(N'2023-10-17T11:05:43.207' AS DateTime), 42, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 23, N'Dell Vostro', N'Dell Vostro I7-7200h SSD 256GB', N'http://localhost:8000/upload/1695568803791-1683707853284-dellvostro.png', 500000, 112, 1, 500000, CAST(N'2023-10-17T11:10:17.590' AS DateTime), CAST(N'2023-10-17T11:10:17.590' AS DateTime), 43, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 23, N'Dell Vostro', N'Dell Vostro I7-7200h SSD 256GB', N'http://localhost:8000/upload/1695568803791-1683707853284-dellvostro.png', 500000, 112, 1, 500000, CAST(N'2023-10-17T11:12:37.573' AS DateTime), CAST(N'2023-10-17T11:12:37.573' AS DateTime), 44, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 23, N'Dell Vostro', N'Dell Vostro I7-7200h SSD 256GB', N'http://localhost:8000/upload/1695568803791-1683707853284-dellvostro.png', 500000, 112, 1, 500000, CAST(N'2023-10-17T11:14:04.757' AS DateTime), CAST(N'2023-10-17T11:14:04.757' AS DateTime), 45, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 23, N'Dell Vostro', N'Dell Vostro I7-7200h SSD 256GB', N'http://localhost:8000/upload/1695568803791-1683707853284-dellvostro.png', 500000, 112, 1, 500000, CAST(N'2023-10-17T11:16:08.890' AS DateTime), CAST(N'2023-10-17T11:16:08.890' AS DateTime), 46, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 33, N'Laptop LG Gram Style 2023 16Z90RS-G.AH54A5', N'Laptop LG Gram Style 2023 16Z90RS-G.AH54A5 Intel Core i5-1340P, RAM 16GB, SSD 512GB, VGA Intel Iris Xe Graphics, Màn Hình 16inch WQHD+ OLED 120Hz, Windows 11', N'http://localhost:8000/upload/1690807324890-Laptop LG Gram Style 2023 16Z90RS-G.AH54A5.jpg', 43990000, 27, 2, 87980000, CAST(N'2023-10-24T11:21:46.517' AS DateTime), CAST(N'2023-10-26T12:50:30.630' AS DateTime), 53, N'0e7d7f8a-c185-462f-9301-3543604aa8ac')
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 35, N'Laptop Acer Nitro Gaming AN515 56 51N4', N'Laptop Acer Nitro Gaming AN515 56 51N4 i5 11300H/8GB/512GB SSD/Nvidia GTX1650 4GB/Win11', N'http://localhost:8000/upload/1690802127060-acer_nitro5_515_56.jpg', 17999000, 1, 1, 17999000, CAST(N'2023-10-24T11:34:34.330' AS DateTime), CAST(N'2023-10-24T11:34:34.330' AS DateTime), 55, N'a900bb4e-0ff2-464e-a70f-54c2c053242a')
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 27, N'Laptop Gaming Asus ROG Strix SCAR 18 G834JY-N6039W', N'Laptop Gaming Asus ROG Strix SCAR 18 G834JY-N6039W Intel Core i9-13980HX, RAM 64GB, SSD 2TB, RTX 4090 16GB, Màn Hình 18 inch QHD+ 240Hz, Windows 11, Màu Đen', N'http://localhost:8000/upload/1690807275761-29171-laptop_asus_gaming_rog.jpg', 125000000, 25, 1, 125000000, CAST(N'2023-11-01T16:12:45.847' AS DateTime), CAST(N'2023-11-01T16:12:45.847' AS DateTime), 1067, N'c31cc346-c0fa-4968-bf7a-1a3a35df3f18')
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (5004, 26, N'MacBook Air M1 2020', N'MacBook Air M1 2020', N'http://localhost:8000/upload/1690807261763-macbook-air-m1-2020.png', 21900000, 11, 1, 21900000, CAST(N'2023-11-02T12:09:17.523' AS DateTime), CAST(N'2023-11-02T12:09:17.523' AS DateTime), 1068, NULL)
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 1034, N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) ', N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) (AMD Ryzen 5-6600H, Ram 16GB, SSD 512GB, Đồ họa RTX 3050Ti 4GB, màn hình 16.1 inch FHD, Windows 11 bản quyền, màu xanh)', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', 20990000, 3, 1, 20990000, CAST(N'2023-11-04T10:44:45.640' AS DateTime), CAST(N'2023-11-04T10:44:45.640' AS DateTime), 1069, N'1f7cbdc0-e68c-4f39-aa75-8afa96a0d84a')
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 1034, N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) ', N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) (AMD Ryzen 5-6600H, Ram 16GB, SSD 512GB, Đồ họa RTX 3050Ti 4GB, màn hình 16.1 inch FHD, Windows 11 bản quyền, màu xanh)', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', 20990000, 3, 1, 20990000, CAST(N'2023-11-04T20:43:07.210' AS DateTime), CAST(N'2023-11-04T20:43:07.210' AS DateTime), 1070, N'4e079b55-b802-4cb4-9759-6d967b8200c8')
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 1034, N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) ', N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) (AMD Ryzen 5-6600H, Ram 16GB, SSD 512GB, Đồ họa RTX 3050Ti 4GB, màn hình 16.1 inch FHD, Windows 11 bản quyền, màu xanh)', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', 20990000, 3, 1, 20990000, CAST(N'2023-12-10T22:19:18.020' AS DateTime), CAST(N'2023-12-10T22:19:18.020' AS DateTime), 1071, N'892a4573-e3bb-4508-88f6-b9c7671f788d')
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (NULL, 35, N'Laptop Acer Nitro Gaming AN515 56 51N4', N'Laptop Acer Nitro Gaming AN515 56 51N4 i5 11300H/8GB/512GB SSD/Nvidia GTX1650 4GB/Win11', N'http://localhost:8000/upload/1690802127060-acer_nitro5_515_56.jpg', 17999000, 1, 1, 17999000, CAST(N'2023-12-20T15:14:51.413' AS DateTime), CAST(N'2023-12-20T15:14:51.413' AS DateTime), 1072, N'655e6de1-709f-426b-a9a4-34c194d766ac')
GO
INSERT [dbo].[CARTS] ([user_id], [product_id], [prod_name], [description], [avatar], [price], [is_possible_to_order], [count], [product_total], [created_at], [updated_at], [id], [guest_id]) VALUES (2015, 24, N'Dell Inspirion 15', N'Laptop Dell Inspiron 15 N3520 - i7 1255U/RAM 8GB/SSD 512GB/15.6"FHD/Win11', N'http://localhost:8000/upload/1694141619104-dellinspirion.png', 19690000, 12, 1, 19690000, CAST(N'2024-02-17T10:18:53.620' AS DateTime), CAST(N'2024-02-17T10:18:53.620' AS DateTime), 2072, NULL)
GO
SET IDENTITY_INSERT [dbo].[CARTS] OFF
GO
INSERT [dbo].[CATEGORIES] ([category_id], [name], [description], [created_at], [updated_at], [slug]) VALUES (1, N'Laptop Gaming', N'Laptop Gaming', CAST(N'2023-06-08T14:52:47.057' AS DateTime), CAST(N'2023-06-08T14:52:47.057' AS DateTime), N'laptop-gaming')
GO
INSERT [dbo].[CATEGORIES] ([category_id], [name], [description], [created_at], [updated_at], [slug]) VALUES (2, N'Laptop Văn Phòng', N'Laptop Văn Phòng', CAST(N'2023-08-22T08:20:28.473' AS DateTime), CAST(N'2023-08-22T08:20:28.473' AS DateTime), N'laptop-vanphong')
GO
INSERT [dbo].[CATEGORIES] ([category_id], [name], [description], [created_at], [updated_at], [slug]) VALUES (3, N'Laptop Cao Cấp - Sang Trọng', N'Laptop Cao Cấp - Sang Trọng', CAST(N'2023-08-22T08:20:50.647' AS DateTime), CAST(N'2023-08-22T08:20:50.647' AS DateTime), N'laptop-caocap-sangtrong')
GO
INSERT [dbo].[CATEGORIES] ([category_id], [name], [description], [created_at], [updated_at], [slug]) VALUES (4, N'Laptop Đồ Họa - Kỹ Thuật', NULL, CAST(N'2023-08-22T08:21:44.203' AS DateTime), CAST(N'2023-08-22T08:21:44.203' AS DateTime), N'laptop-dohoa-kythuat')
GO
INSERT [dbo].[CATEGORIES] ([category_id], [name], [description], [created_at], [updated_at], [slug]) VALUES (5, N'Laptop Mỏng Nhẹ - Thời Trang', NULL, CAST(N'2023-08-22T08:23:41.190' AS DateTime), CAST(N'2023-08-22T08:23:41.190' AS DateTime), N'laptop-mongnhe-thoitrang')
GO
SET IDENTITY_INSERT [dbo].[IMAGES] ON 
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (1018, 1034, N'http://localhost:8000/upload/laptop-hp-victus-16-fullsz.png', N'http://localhost:8000/upload/laptop-hp-victus-16-fullsz.png')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2021, 1034, NULL, N'http://localhost:8000/upload/1695746410040-1695746295892-laptop-hp-victus-16-2.png')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2022, 1034, NULL, N'http://localhost:8000/upload/1695746410040-1695746333687-1695745919554-laptop-hp-victus-16-3.png')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2023, 1034, NULL, N'http://localhost:8000/upload/1695746410041-1695743480946-laptop-hp-victus-16-4.png')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2024, 1034, NULL, N'http://localhost:8000/upload/1695746410041-1695743480947-laptop-hp-victus-16-5.png')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2027, 24, NULL, N'http://localhost:8000/upload/1695746554027-1683708021359-dellinspirion.png')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2028, 25, NULL, N'http://localhost:8000/upload/1695746558978-1683708160360-hp-a1503za.png')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2029, 26, NULL, N'http://localhost:8000/upload/1695746563393-1683708250019-macbook-air-m1-2020.png')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2030, 27, NULL, N'http://localhost:8000/upload/1695746572831-1683863062655-29171-laptop_asus_gaming_rog.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2031, 31, NULL, N'http://localhost:8000/upload/1695746582113-1690807304036-2320_laptopaz_acer_nitro_5_an515_57_1.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2032, 32, NULL, N'http://localhost:8000/upload/1695746590098-1683865425452-Laprtop Dell XPS 15 9520.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2033, 35, NULL, N'http://localhost:8000/upload/1695746606854-1690802127060-acer_nitro5_515_56.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2043, 33, NULL, N'http://localhost:8000/upload/1695788712824-Laptop LG Gram Style 2023 16Z90RS-G.AH54A5.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2044, 33, NULL, N'http://localhost:8000/upload/1695788712826-lg-gram-style-2023-i5-16z90rsgah54a5-1.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2045, 33, NULL, N'http://localhost:8000/upload/1695788712827-lg-gram-style-2023-i5-16z90rsgah54a5-4.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2046, 33, NULL, N'http://localhost:8000/upload/1695788712826-lg-gram-style-2023-i5-16z90rsgah54a5-2.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (2047, 33, NULL, N'http://localhost:8000/upload/1695788776744-lg-gram-style-2023-i5-16z90rsgah54a5-3.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (3041, 34, NULL, N'http://localhost:8000/upload/1695918142885-1690645379602-macbookpro14.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (3048, 23, NULL, N'http://localhost:8000/upload/1705065632197-dell-vostro-i5-1.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (3049, 23, NULL, N'http://localhost:8000/upload/1705065632197-dell-vostro-i5-5.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (3050, 23, NULL, N'http://localhost:8000/upload/1705065632197-dell-vostro-i5-2.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (3051, 23, NULL, N'http://localhost:8000/upload/1705065632197-dell-vostro-i5-3.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (3052, 23, NULL, N'http://localhost:8000/upload/1705065632197-dell-vostro-i5-4.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (3063, 2043, NULL, N'http://localhost:8000/upload/1705379345655-msi-1.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (3064, 2043, NULL, N'http://localhost:8000/upload/1705379345657-msi-2.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (3065, 2043, NULL, N'http://localhost:8000/upload/1705379345657-msi-3.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (3066, 2043, NULL, N'http://localhost:8000/upload/1705379345657-msi-4.jpg')
GO
INSERT [dbo].[IMAGES] ([image_id], [product_id], [image_url], [url]) VALUES (3067, 2043, NULL, N'http://localhost:8000/upload/1705379345657-msi-5.jpg')
GO
SET IDENTITY_INSERT [dbo].[IMAGES] OFF
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (27, 14025, 1, 125000000, CAST(N'2023-10-25T18:46:43.380' AS DateTime), CAST(N'2023-10-25T18:46:43.380' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (32, 11010, 2, 58500000, CAST(N'2023-07-06T07:34:49.637' AS DateTime), CAST(N'2023-07-06T07:34:49.637' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (27, 11010, 1, 125000000, CAST(N'2023-07-06T07:34:49.637' AS DateTime), CAST(N'2023-07-06T07:34:49.637' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (23, 11010, 2, 500000, CAST(N'2023-07-06T07:34:49.637' AS DateTime), CAST(N'2023-07-06T07:34:49.637' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (24, 11010, 1, 4000000, CAST(N'2023-07-06T07:34:49.637' AS DateTime), CAST(N'2023-07-06T07:34:49.637' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (31, 11010, 2, 16000000, CAST(N'2023-07-06T07:34:49.637' AS DateTime), CAST(N'2023-07-06T07:34:49.637' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (31, 12010, 2, 16000000, CAST(N'2023-07-12T13:50:54.863' AS DateTime), CAST(N'2023-07-12T13:50:54.863' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (24, 13010, 1, 4000000, CAST(N'2023-07-29T22:32:35.863' AS DateTime), CAST(N'2023-07-29T22:32:35.863' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (33, 11010, 12, 43990000, CAST(N'2023-07-06T07:34:49.637' AS DateTime), CAST(N'2023-07-06T07:34:49.637' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (34, 13011, 5, 57490000, CAST(N'2023-07-30T10:29:17.163' AS DateTime), CAST(N'2023-07-30T10:29:17.163' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (1034, NULL, 2, 20990000, CAST(N'2023-10-24T11:25:33.447' AS DateTime), CAST(N'2023-10-24T11:25:33.447' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (27, NULL, 1, 125000000, CAST(N'2023-10-24T11:25:33.453' AS DateTime), CAST(N'2023-10-24T11:25:33.453' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (33, NULL, 1, 43990000, CAST(N'2023-10-24T11:25:33.460' AS DateTime), CAST(N'2023-10-24T11:25:33.460' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (1034, NULL, 2, 20990000, CAST(N'2023-10-24T11:29:26.560' AS DateTime), CAST(N'2023-10-24T11:29:26.560' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (27, NULL, 1, 125000000, CAST(N'2023-10-24T11:29:26.570' AS DateTime), CAST(N'2023-10-24T11:29:26.570' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (1034, NULL, 2, 20990000, CAST(N'2023-10-24T15:16:03.340' AS DateTime), CAST(N'2023-10-24T15:16:03.340' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (27, NULL, 1, 125000000, CAST(N'2023-10-24T15:16:03.367' AS DateTime), CAST(N'2023-10-24T15:16:03.367' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (1034, 14023, 2, 20990000, CAST(N'2023-10-24T15:38:22.693' AS DateTime), CAST(N'2023-10-24T15:38:22.693' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (27, 14023, 1, 125000000, CAST(N'2023-10-24T15:38:22.710' AS DateTime), CAST(N'2023-10-24T15:38:22.710' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (33, 14023, 1, 43990000, CAST(N'2023-10-24T15:38:22.730' AS DateTime), CAST(N'2023-10-24T15:38:22.730' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (33, 14024, 1, 43990000, CAST(N'2023-10-24T15:42:26.120' AS DateTime), CAST(N'2023-10-24T15:42:26.120' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (25, 15025, 1, 20000000, CAST(N'2023-10-27T06:38:06.680' AS DateTime), CAST(N'2023-10-27T06:38:06.680' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (25, 15026, 1, 20000000, CAST(N'2023-10-29T05:47:46.470' AS DateTime), CAST(N'2023-10-29T05:47:46.470' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (33, 15026, 1, 43990000, CAST(N'2023-10-29T05:47:46.480' AS DateTime), CAST(N'2023-10-29T05:47:46.480' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (1034, 15026, 1, 20990000, CAST(N'2023-10-29T05:47:46.483' AS DateTime), CAST(N'2023-10-29T05:47:46.483' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (1034, 15027, 1, 20990000, CAST(N'2023-11-01T16:07:48.740' AS DateTime), CAST(N'2023-11-01T16:07:48.740' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (35, 15028, 1, 17999000, CAST(N'2023-11-01T16:11:06.290' AS DateTime), CAST(N'2023-11-01T16:11:06.290' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (1034, 15028, 1, 20990000, CAST(N'2023-11-01T16:11:06.300' AS DateTime), CAST(N'2023-11-01T16:11:06.300' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (33, 15030, 1, 43990000, CAST(N'2023-11-02T11:28:08.057' AS DateTime), CAST(N'2023-11-02T11:28:08.057' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (1034, 15030, 1, 20990000, CAST(N'2023-11-02T11:28:08.063' AS DateTime), CAST(N'2023-11-02T11:28:08.063' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (26, 15031, 1, 21900000, CAST(N'2023-11-02T12:09:48.550' AS DateTime), CAST(N'2023-11-02T12:09:48.550' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (1034, 15032, 1, 20990000, CAST(N'2023-11-04T20:45:19.930' AS DateTime), CAST(N'2023-11-04T20:45:19.930' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (33, NULL, 1, 43990000, CAST(N'2023-10-24T11:29:26.577' AS DateTime), CAST(N'2023-10-24T11:29:26.577' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (1034, NULL, 2, 20990000, CAST(N'2023-10-24T11:30:21.667' AS DateTime), CAST(N'2023-10-24T11:30:21.667' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (27, NULL, 1, 125000000, CAST(N'2023-10-24T11:30:21.670' AS DateTime), CAST(N'2023-10-24T11:30:21.670' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (33, NULL, 1, 43990000, CAST(N'2023-10-24T11:30:21.680' AS DateTime), CAST(N'2023-10-24T11:30:21.680' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (24, NULL, 1, 4000000, CAST(N'2023-10-24T11:33:35.610' AS DateTime), CAST(N'2023-10-24T11:33:35.610' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (33, NULL, 1, 43990000, CAST(N'2023-10-24T15:16:03.373' AS DateTime), CAST(N'2023-10-24T15:16:03.373' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (27, 14026, 1, 125000000, CAST(N'2023-10-25T19:24:58.047' AS DateTime), CAST(N'2023-10-25T19:24:58.047' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (35, 15027, 1, 17999000, CAST(N'2023-11-01T16:07:48.740' AS DateTime), CAST(N'2023-11-01T16:07:48.740' AS DateTime))
GO
INSERT [dbo].[ORDER_DETAILS] ([product_id], [order_id], [quantity], [price], [created_at], [updated_at]) VALUES (27, 15029, 1, 125000000, CAST(N'2023-11-01T16:13:30.893' AS DateTime), CAST(N'2023-11-01T16:13:30.893' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ORDERS] ON 
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (11010, N'offline', 806880000, 3002, N'test1', N'test1@gmail.com', N'123123123', N'123123123123', N'0', 0, 2, 1, CAST(N'2023-07-06T07:34:49.617' AS DateTime), CAST(N'2023-07-06T07:34:49.617' AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (12010, N'offline', 32000000, 3002, N'test1', N'test1@gmail.com', N'', N'', N'0', 0, 0, 0, CAST(N'2023-07-12T13:50:54.853' AS DateTime), CAST(N'2023-07-12T13:50:54.853' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (13010, N'offline', 4000000, 7008, N'Hồ Nhật Tân', N'', N'', N'', N'0', 0, 0, 0, CAST(N'2023-07-29T22:32:35.850' AS DateTime), CAST(N'2023-07-29T22:32:35.850' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (13011, N'offline', 287450000, 2015, N'test', N'test@gmail.com', N'', N'', N'0', 0, 0, 0, CAST(N'2023-07-30T10:29:17.153' AS DateTime), CAST(N'2023-07-30T10:29:17.153' AS DateTime), NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14011, N'Bank', 210970000, NULL, N'Hồ Nhật Tân', N'honhattan121@gmail.com', N'123 Điện Biên Phủ, Phường An Mỹ, Thành phố Tam Kỳ, Tỉnh Quảng Nam', N'0359973209', N'0', 0, 0, 0, CAST(N'2023-10-24T11:25:33.437' AS DateTime), CAST(N'2023-10-24T11:25:33.437' AS DateTime), NULL, N'Hi', N'0e7d7f8a-c185-462f-9301-3543604aa8ac', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14012, N'Bank', 210970000, NULL, N'Hồ Nhật Tân', N'honhattan121@gmail.com', N'123 Điện Biên Phủ, Phường An Mỹ, Thành phố Tam Kỳ, Tỉnh Quảng Nam', N'0359973209', N'0', 0, 0, 0, CAST(N'2023-10-24T11:29:26.550' AS DateTime), CAST(N'2023-10-24T11:29:26.550' AS DateTime), NULL, N'Hi', N'0e7d7f8a-c185-462f-9301-3543604aa8ac', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14013, N'COD', 210970000, NULL, N'Anh Tân ', N'honhattan121@gmail.com', N'362 Hoàng Diệu, Phường Bình Thuận, Quận Hải Châu, Thành phố Đà Nẵng', N'0359973209', N'0', 0, 0, 0, CAST(N'2023-10-24T11:30:21.657' AS DateTime), CAST(N'2023-10-24T11:30:21.657' AS DateTime), NULL, N'Hi', N'0e7d7f8a-c185-462f-9301-3543604aa8ac', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14014, N'COD', 4000000, 5004, N'Bí mật', N'honhattan121@gmail.com', N'123 Hoàng Diệu, Phường Nhật Tân, Quận Tây Hồ, Thành phố Hà Nội', N'0123456789', N'0', 0, 0, 0, CAST(N'2023-10-24T11:33:35.603' AS DateTime), CAST(N'2023-10-24T11:33:35.603' AS DateTime), NULL, N'user', NULL, N'http://localhost:8000/upload/1694141619104-dellinspirion.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14015, N'COD', 210970000, NULL, N'Hồ Thanh Hiển', N'hothanhhien@dtu.edu.vn', N'Nhận hàng tại cửa hàng', N'0123456789', N'0', 0, 0, 0, CAST(N'2023-10-24T15:16:03.327' AS DateTime), CAST(N'2023-10-24T15:16:03.327' AS DateTime), NULL, N'', N'0e7d7f8a-c185-462f-9301-3543604aa8ac', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14016, N'COD', 210970000, NULL, N'Hồ Thanh Hiển', N'hothanhhien@dtu.edu.vn', N'Nhận hàng tại cửa hàng', N'0123456789', N'0', 0, 0, 0, CAST(N'2023-10-24T15:28:45.843' AS DateTime), CAST(N'2023-10-24T15:28:45.843' AS DateTime), NULL, N'', N'0e7d7f8a-c185-462f-9301-3543604aa8ac', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14017, N'COD', 210970000, NULL, N'Hồ Thanh Hiển', N'hothanhhien@dtu.edu.vn', N'Nhận hàng tại cửa hàng', N'0123456789', N'0', 0, 0, 0, CAST(N'2023-10-24T15:29:25.097' AS DateTime), CAST(N'2023-10-24T15:29:25.097' AS DateTime), NULL, N'', N'0e7d7f8a-c185-462f-9301-3543604aa8ac', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14018, N'COD', 210970000, NULL, N'Hồ Thanh Hiển', N'hothanhhien@dtu.edu.vn', N'Nhận hàng tại cửa hàng', N'0123456789', N'0', 0, 0, 0, CAST(N'2023-10-24T15:30:46.367' AS DateTime), CAST(N'2023-10-24T15:30:46.367' AS DateTime), NULL, N'', N'0e7d7f8a-c185-462f-9301-3543604aa8ac', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14019, N'COD', 210970000, NULL, N'Hồ Thanh Hiển', N'hothanhhien@dtu.edu.vn', N'Nhận hàng tại cửa hàng', N'0123456789', N'0', 0, 0, 0, CAST(N'2023-10-24T15:32:57.870' AS DateTime), CAST(N'2023-10-24T15:32:57.870' AS DateTime), NULL, N'', N'0e7d7f8a-c185-462f-9301-3543604aa8ac', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14020, N'COD', 210970000, NULL, N'Hồ Thanh Hiển', N'hothanhhien@dtu.edu.vn', N'Nhận hàng tại cửa hàng', N'0123456789', N'0', 0, 0, 0, CAST(N'2023-10-24T15:33:13.620' AS DateTime), CAST(N'2023-10-24T15:33:13.620' AS DateTime), NULL, N'', N'0e7d7f8a-c185-462f-9301-3543604aa8ac', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14021, N'COD', 210970000, NULL, N'Hồ Thanh Hiển', N'hothanhhien@dtu.edu.vn', N'Nhận hàng tại cửa hàng', N'0123456789', N'0', 0, 0, 0, CAST(N'2023-10-24T15:35:35.597' AS DateTime), CAST(N'2023-10-24T15:35:35.597' AS DateTime), NULL, N'', N'0e7d7f8a-c185-462f-9301-3543604aa8ac', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14022, N'COD', 210970000, NULL, N'Hồ Thanh Hiển', N'hothanhhien@dtu.edu.vn', N'Nhận hàng tại cửa hàng', N'0123456789', N'0', 0, 0, 0, CAST(N'2023-10-24T15:37:32.717' AS DateTime), CAST(N'2023-10-24T15:37:32.717' AS DateTime), NULL, N'', N'0e7d7f8a-c185-462f-9301-3543604aa8ac', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14023, N'COD', 210970000, NULL, N'Hồ Thanh Hiển', N'hothanhhien@dtu.edu.vn', N'Nhận hàng tại cửa hàng', N'0123456789', N'0', 0, 0, 0, CAST(N'2023-10-24T15:38:22.673' AS DateTime), CAST(N'2023-10-24T15:38:22.673' AS DateTime), NULL, N'', N'0e7d7f8a-c185-462f-9301-3543604aa8ac', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14024, N'COD', 43990000, NULL, N'Hồ Thanh Hiển', N'hothanhhien@dtu.edu.vn', N'Nhận hàng tại cửa hàng', N'0123456789', N'0', 0, 0, 0, CAST(N'2023-10-24T15:42:26.103' AS DateTime), CAST(N'2023-10-24T15:42:26.103' AS DateTime), NULL, N'', N'0e7d7f8a-c185-462f-9301-3543604aa8ac', N'http://localhost:8000/upload/1690807324890-Laptop LG Gram Style 2023 16Z90RS-G.AH54A5.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14025, N'COD', 125000000, 5004, N'ăd', N'?dawd', N', null, null, null', N'ad', N'0', 0, 1, 1, CAST(N'2023-10-25T18:46:43.350' AS DateTime), CAST(N'2023-10-25T18:46:43.350' AS DateTime), NULL, N'ắcdawd', NULL, N'http://localhost:8000/upload/1690807275761-29171-laptop_asus_gaming_rog.jpg', 1, 1, CAST(N'2023-11-03T20:07:15.277' AS DateTime), CAST(N'2023-11-03T20:07:15.277' AS DateTime), CAST(N'2023-11-03T20:07:15.277' AS DateTime), CAST(N'2023-11-03T20:07:15.283' AS DateTime), NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (14026, N'Bank', 125000000, 5004, N'hi', N'honhattan121@gmail.com', N'Nhận hàng tại cửa hàng', N'0359973209', N'0', 1, 0, 1, CAST(N'2023-10-25T19:24:58.037' AS DateTime), CAST(N'2023-10-25T19:24:58.037' AS DateTime), NULL, N'', NULL, N'http://localhost:8000/upload/1690807275761-29171-laptop_asus_gaming_rog.jpg', 1, 1, CAST(N'2024-02-14T13:15:15.363' AS DateTime), CAST(N'2024-02-14T13:15:15.370' AS DateTime), NULL, CAST(N'2024-02-15T09:54:07.757' AS DateTime), CAST(N'2024-02-14T13:15:15.360' AS DateTime))
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (15025, N'COD', 20000000, 5004, N'Hồ Nhật Tân', N'honhattan121@gmail.com', N'Nhận hàng tại cửa hàng', N'0359973209', N'0', 1, 0, 1, CAST(N'2023-10-27T06:38:06.660' AS DateTime), CAST(N'2023-10-27T06:38:06.660' AS DateTime), NULL, N'', NULL, N'http://localhost:8000/upload/1690807254756-hp-a1503za.png', 1, NULL, CAST(N'2024-01-16T16:20:08.650' AS DateTime), NULL, NULL, CAST(N'2024-01-16T16:20:08.660' AS DateTime), CAST(N'2024-01-16T16:20:08.640' AS DateTime))
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (15026, N'COD', 84980000, 5004, N'Hồ Nhật Tân', N'honhattan121@gmail.com', N'123 ĐBP, Phường An Mỹ, Thành phố Tam Kỳ, Tỉnh Quảng Nam', N'0359973209', N'0', 0, 0, 0, CAST(N'2023-10-29T05:47:46.437' AS DateTime), CAST(N'2023-10-29T05:47:46.437' AS DateTime), NULL, N'', NULL, N'http://localhost:8000/upload/1690807254756-hp-a1503za.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (15027, N'Bank', 38989000, NULL, N'Hồ Nhật Tân ', N'honhattan121@gmail.com', N'Nhận hàng tại cửa hàng', N'0359973209', N'0', 0, 0, 0, CAST(N'2023-11-01T16:07:48.730' AS DateTime), CAST(N'2023-11-01T16:07:48.730' AS DateTime), NULL, N'', N'c31cc346-c0fa-4968-bf7a-1a3a35df3f18', N'http://localhost:8000/upload/1690802127060-acer_nitro5_515_56.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (15028, N'Bank', 38989000, NULL, N'Hồ Nhật Tân ', N'honhattan121@gmail.com', N'Nhận hàng tại cửa hàng', N'0359973209', N'0', 1, 0, 0, CAST(N'2023-11-01T16:11:06.270' AS DateTime), CAST(N'2023-11-01T16:11:06.270' AS DateTime), NULL, N'', N'c31cc346-c0fa-4968-bf7a-1a3a35df3f18', N'http://localhost:8000/upload/1690802127060-acer_nitro5_515_56.jpg', 0, 0, NULL, NULL, NULL, NULL, CAST(N'2023-11-02T11:26:38.440' AS DateTime))
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (15029, N'COD', 125000000, NULL, N'Hồ Nhật Tân', N'honhattan121@gmail.com', N'362 Hoàng Diệu, Phường Bình Thuận, Quận Hải Châu, Thành phố Đà Nẵng', N'0359973209', N'0', 1, 0, 0, CAST(N'2023-11-01T16:13:30.880' AS DateTime), CAST(N'2023-11-01T16:13:30.880' AS DateTime), NULL, N'', N'c31cc346-c0fa-4968-bf7a-1a3a35df3f18', N'http://localhost:8000/upload/1690807275761-29171-laptop_asus_gaming_rog.jpg', 1, 0, CAST(N'2023-11-02T12:05:33.543' AS DateTime), NULL, NULL, NULL, CAST(N'2023-11-02T12:05:33.543' AS DateTime))
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (15030, N'Bank', 64980000, 5004, N'Tân', N'honhattan121@gmail.com', N'362 Hoàng Diệu, Phường Bình Thuận, Quận Hải Châu, Thành phố Đà Nẵng', N'0359973209', N'0', 1, 1, 1, CAST(N'2023-11-02T11:28:08.043' AS DateTime), CAST(N'2023-11-02T11:28:08.043' AS DateTime), NULL, N'', NULL, N'http://localhost:8000/upload/1690807324890-Laptop LG Gram Style 2023 16Z90RS-G.AH54A5.jpg', 1, 1, CAST(N'2024-02-15T09:20:15.030' AS DateTime), CAST(N'2024-02-15T09:20:35.477' AS DateTime), CAST(N'2024-02-15T09:20:39.940' AS DateTime), CAST(N'2024-02-15T09:21:25.947' AS DateTime), CAST(N'2023-11-02T11:28:30.697' AS DateTime))
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (15031, N'Bank', 21900000, 5004, N'test', N'test@gmail.com', N'123, Xã Pải Lủng, Huyện Mèo Vạc, Tỉnh Hà Giang', N'0', N'0', 1, 1, 0, CAST(N'2023-11-02T12:09:48.533' AS DateTime), CAST(N'2023-11-02T12:09:48.533' AS DateTime), NULL, N'', NULL, N'http://localhost:8000/upload/1690807261763-macbook-air-m1-2020.png', 1, 1, CAST(N'2023-11-02T21:27:08.760' AS DateTime), CAST(N'2023-11-02T21:27:08.763' AS DateTime), CAST(N'2024-02-15T09:26:54.007' AS DateTime), NULL, CAST(N'2023-11-02T21:27:08.743' AS DateTime))
GO
INSERT [dbo].[ORDERS] ([id], [paymentMethods], [total], [user_id], [name], [email], [user_address], [phone], [trading_code], [is_payment], [is_transported], [is_success], [created_at], [updated_at], [is_rated], [note], [guest_id], [avatar], [is_approved], [is_being_shipped], [approved_at], [being_shipped_at], [transported_at], [successful_at], [paid_at]) VALUES (15032, N'COD', 20990000, NULL, N'1', N'1', N'1, Xã Pải Lủng, Huyện Mèo Vạc, Tỉnh Hà Giang', N'1', N'0', 0, 1, 0, CAST(N'2023-11-04T20:45:19.907' AS DateTime), CAST(N'2023-11-04T20:45:19.907' AS DateTime), NULL, N'1', N'4e079b55-b802-4cb4-9759-6d967b8200c8', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', 1, 1, CAST(N'2024-02-15T09:16:46.753' AS DateTime), CAST(N'2024-02-15T09:16:51.800' AS DateTime), CAST(N'2024-02-15T09:16:55.850' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[ORDERS] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTS] ON 
GO
INSERT [dbo].[PRODUCTS] ([id], [brand_id], [category_id], [prod_name], [avatar], [prod_description], [manufacturer], [price], [cost], [quantity], [prod_percent], [cpu], [hard_drive], [mux_switch], [screen], [webcam], [connection], [prod_weight], [pin], [operation_system], [created_at], [updated_at], [ram], [graphics]) VALUES (23, 1, 1, N'Dell Vostro V5620 i5 1240P', N'http://localhost:8000/upload/1705125871316-dell-vostro-i5-1.jpg', N'Laptop Dell Vostro V5620 i5 1240P/8GB/512GB/16"FHD+/Nvidia MX570 2GB/Win11', NULL, 18990000, 21490000, 13, 0, N'Intel,Core i5,1240P,3.30 GHz,	4.50 GHz', N'SSD,	M2. PCIe,512 GB', NULL, N'16.0 inch,Anti-Glare LED-Backlit Display,1920 x 1200 Pixels,60 Hz ,WVA', N' Full HD Webcam (1080p Webcam)', N'1 HDMI-1 USB 3.2,802.11 ax ,v5.2', N'1.97 kg', N'3420 mAh', N'Window 11', CAST(N'2023-07-30T10:05:37.327' AS DateTime), CAST(N'2023-07-30T10:05:37.327' AS DateTime), N'	8 GB (1 thanh 8 GB),DDR4,2 ,1,0,32 GB', N'GeForce MX570, 2 GB')
GO
INSERT [dbo].[PRODUCTS] ([id], [brand_id], [category_id], [prod_name], [avatar], [prod_description], [manufacturer], [price], [cost], [quantity], [prod_percent], [cpu], [hard_drive], [mux_switch], [screen], [webcam], [connection], [prod_weight], [pin], [operation_system], [created_at], [updated_at], [ram], [graphics]) VALUES (24, 1, 1, N'Dell Inspirion 15', N'http://localhost:8000/upload/1694141619104-dellinspirion.png', N'Laptop Dell Inspiron 15 N3520 - i7 1255U/RAM 8GB/SSD 512GB/15.6"FHD/Win11', NULL, 19690000, 20690000, 12, 15, N'Intel, Core i7, 1255U', N'SSD 512GB', NULL, N'15.6 inch, 1920 x 1080 Pixels, WVA, 120, WVA Anti-glare LED Backlit Narrow Border', N'1.6MGp', N'Wifi, AirPlay', N'1.7kg', N'54 Wh', N'Window 11', CAST(N'2023-07-30T10:05:37.327' AS DateTime), CAST(N'2023-07-30T10:05:37.327' AS DateTime), N'8GB', N'GeForce MX550')
GO
INSERT [dbo].[PRODUCTS] ([id], [brand_id], [category_id], [prod_name], [avatar], [prod_description], [manufacturer], [price], [cost], [quantity], [prod_percent], [cpu], [hard_drive], [mux_switch], [screen], [webcam], [connection], [prod_weight], [pin], [operation_system], [created_at], [updated_at], [ram], [graphics]) VALUES (25, 6, 1, N'HP A1503ZA', N'http://localhost:8000/upload/1690807254756-hp-a1503za.png', N'HP A1503ZA', NULL, 20000000, 22000000, 11, 10, N'Intel, Core i5, 10300h', N'ssd 512Gb', NULL, N'FullHd', N'1.6MGp', N'Wifi, AirPlay', N'2kg', N'3 Cell', N'Window 11', CAST(N'2023-07-30T10:05:37.327' AS DateTime), CAST(N'2023-07-30T10:05:37.327' AS DateTime), N'8GB', N'GeForce MX550')
GO
INSERT [dbo].[PRODUCTS] ([id], [brand_id], [category_id], [prod_name], [avatar], [prod_description], [manufacturer], [price], [cost], [quantity], [prod_percent], [cpu], [hard_drive], [mux_switch], [screen], [webcam], [connection], [prod_weight], [pin], [operation_system], [created_at], [updated_at], [ram], [graphics]) VALUES (26, 9, 1, N'MacBook Air M1 2020', N'http://localhost:8000/upload/1690807261763-macbook-air-m1-2020.png', N'MacBook Air M1 2020', NULL, 21900000, 22900000, 11, 15, N'Apple, M1', N'ssd 512Gb', NULL, N'FullHd', N'1.6MGp', N'Wifi, AirPlay', N'2kg', N'3 Cell', N'Window 11', CAST(N'2023-07-30T10:05:37.327' AS DateTime), CAST(N'2023-07-30T10:05:37.327' AS DateTime), N'null', N'null')
GO
INSERT [dbo].[PRODUCTS] ([id], [brand_id], [category_id], [prod_name], [avatar], [prod_description], [manufacturer], [price], [cost], [quantity], [prod_percent], [cpu], [hard_drive], [mux_switch], [screen], [webcam], [connection], [prod_weight], [pin], [operation_system], [created_at], [updated_at], [ram], [graphics]) VALUES (27, 3, 1, N'Laptop Gaming Asus ROG Strix SCAR 18 G834JY-N6039W', N'http://localhost:8000/upload/1690807275761-29171-laptop_asus_gaming_rog.jpg', N'Laptop Gaming Asus ROG Strix SCAR 18 G834JY-N6039W Intel Core i9-13980HX, RAM 64GB, SSD 2TB, RTX 4090 16GB, Màn Hình 18 inch QHD+ 240Hz, Windows 11, Màu Đen', NULL, 125000000, 129000000, 25, 10, N'Intel, Core i9, 13980HX (upto 5.60 GHz, 36MB)', N'2TB PCIe 4.0 NVMe M.2 SSD', NULL, N'18 inch WQXGA (2560 x 1600) 16:10, 240Hz, 3ms, IPS-level, DCI-P3 100%, anti-glare display, G-Sync, ROG Nebula Display', N'720p HD Camera', N'Wifi, AirPlay', N'2kg', N'4 Cell 90WHrs', N'Window 11', CAST(N'2023-07-30T10:05:37.327' AS DateTime), CAST(N'2023-07-30T10:05:37.327' AS DateTime), N'64 GB,DDR5, 4800 MHz, 2, Không, 0, 64 GB', N'	NVIDIA GeForce RTX 4090,16 GB GDDR6 - Intel,	UHD')
GO
INSERT [dbo].[PRODUCTS] ([id], [brand_id], [category_id], [prod_name], [avatar], [prod_description], [manufacturer], [price], [cost], [quantity], [prod_percent], [cpu], [hard_drive], [mux_switch], [screen], [webcam], [connection], [prod_weight], [pin], [operation_system], [created_at], [updated_at], [ram], [graphics]) VALUES (31, 4, 1, N'Laptop Gaming Acer Nitro 5 2021 AN515-57', N'http://localhost:8000/upload/1690807304036-2320_laptopaz_acer_nitro_5_an515_57_1.jpg', N'Laptop Gaming Acer Nitro 5 2021 AN515-57 I5-10300h SSD 512Gb', NULL, 16000000, 21900000, 30, 10, N'Intel,Core i5, 10300h', N'ssd 512Gb', NULL, N'FullHd', N'1.6MGp', N'Wifi, AirPlay', N'2.5kg', N'3 Cell', N'Window 11', CAST(N'2023-07-30T10:05:37.327' AS DateTime), CAST(N'2023-07-30T10:05:37.327' AS DateTime), N'8 GB (1 thanh 8 GB), DDR4, 3200 MHz', N'NVIDIA GeForce RTX 3050, 4GB')
GO
INSERT [dbo].[PRODUCTS] ([id], [brand_id], [category_id], [prod_name], [avatar], [prod_description], [manufacturer], [price], [cost], [quantity], [prod_percent], [cpu], [hard_drive], [mux_switch], [screen], [webcam], [connection], [prod_weight], [pin], [operation_system], [created_at], [updated_at], [ram], [graphics]) VALUES (32, 1, 1, N'Laprtop Dell XPS 15 9520', N'http://localhost:8000/upload/1690807317488-Laprtop Dell XPS 15 9520.jpg', N'Laprtop Dell XPS 15 9520 Intel Core i7 12700H, Ram 16GB, SSD 1TB, VGA Nvidia GeForce RTX 3050Ti 44GB GDDR6, 15.6inch Full HD, Windows 11 Home, Vỏ nhôm nguyên khối màu bạc, Hàng chính hãng , Bảo hành 12 Tháng', NULL, 58500000, 59900000, 12, 10, N'Intel, Core i7, 12700H', N'SSD 1TB', NULL, N'15.6inch Full HD', N'Có', N'Wifi, AirPlay', N'null', N'6 cell', N'Window 11 Home', CAST(N'2023-07-30T10:05:37.327' AS DateTime), CAST(N'2023-07-30T10:05:37.327' AS DateTime), N', DDR4 2933 MHz', N'Intel UHD Graphics, Share')
GO
INSERT [dbo].[PRODUCTS] ([id], [brand_id], [category_id], [prod_name], [avatar], [prod_description], [manufacturer], [price], [cost], [quantity], [prod_percent], [cpu], [hard_drive], [mux_switch], [screen], [webcam], [connection], [prod_weight], [pin], [operation_system], [created_at], [updated_at], [ram], [graphics]) VALUES (33, 7, 1, N'Laptop LG Gram Style 2023 16Z90RS-G.AH54A5', N'http://localhost:8000/upload/1690807324890-Laptop LG Gram Style 2023 16Z90RS-G.AH54A5.jpg', N'Laptop LG Gram Style 2023 16Z90RS-G.AH54A5 Intel Core i5-1340P, RAM 16GB, SSD 512GB, VGA Intel Iris Xe Graphics, Màn Hình 16inch WQHD+ OLED 120Hz, Windows 11', NULL, 43990000, 44990000, 27, 15, N'Intel, Core i5, 1340P', N'512GB M.2 NVMe™ PCIe® 4.0 SSD (2 slot, còn trống 1 khe M.2)', NULL, N'16inch WQHD+ OLED 120Hz', N'Webcam IR FHD IR with Dual Mic', N'Wifi, AirPlay', N'null', N'80WHr', N'Window 11', CAST(N'2023-07-30T10:05:37.327' AS DateTime), CAST(N'2023-07-30T10:05:37.327' AS DateTime), N'16 GB (1 thanh 16 GB), DDR5 6000 MHz', N' Intel Iris Plus Graphics')
GO
INSERT [dbo].[PRODUCTS] ([id], [brand_id], [category_id], [prod_name], [avatar], [prod_description], [manufacturer], [price], [cost], [quantity], [prod_percent], [cpu], [hard_drive], [mux_switch], [screen], [webcam], [connection], [prod_weight], [pin], [operation_system], [created_at], [updated_at], [ram], [graphics]) VALUES (34, 9, 1, N'MacBook Pro 14 inch M2 Pro 2023 ', N'http://localhost:8000/upload/1690807519733-macbookpro14.jpg', N'MacBook Pro 14 inch M2 Pro 2023 10CPU 16GPU 32GB/512GB', NULL, 57490000, 63990000, 29, 12, N'Apple, M2 Pro, 10-Core', N'SSD 512 GB', NULL, N'14.2 inch, Retina,3024 x 1964 Pixels,	120 Hz', N'Full HD Webcam (1080p Webcam)', N'1 HDMI, 3 Type C, 1 Jack 3.5 mm', N'null', N'Lithium polymer 67 W', N'Ventura', CAST(N'2023-07-30T10:28:44.363' AS DateTime), CAST(N'2023-07-30T10:28:44.363' AS DateTime), N'32 GB', N'Apple M1')
GO
INSERT [dbo].[PRODUCTS] ([id], [brand_id], [category_id], [prod_name], [avatar], [prod_description], [manufacturer], [price], [cost], [quantity], [prod_percent], [cpu], [hard_drive], [mux_switch], [screen], [webcam], [connection], [prod_weight], [pin], [operation_system], [created_at], [updated_at], [ram], [graphics]) VALUES (35, 4, 1, N'Laptop Acer Nitro Gaming AN515 56 51N4', N'http://localhost:8000/upload/1690802127060-acer_nitro5_515_56.jpg', N'Laptop Acer Nitro Gaming AN515 56 51N4 i5 11300H/8GB/512GB SSD/Nvidia GTX1650 4GB/Win11', NULL, 17999000, 19798900, 1, 15, N'Intel, Core i5, 11300H', N'ssd 512Gb', NULL, N'15.6 inch, 1920 x 1080 Pixels, 144 Hz', N'HD webcam', N'USB Type-C  Jack tai nghe 3.5 mm  3 x USB 3.2  HDMI  LAN (RJ45)', N'null', N'4-cell Li-ion, 57.5 Wh', N'Window 11', CAST(N'2023-07-31T18:15:27.113' AS DateTime), CAST(N'2023-07-31T18:15:27.113' AS DateTime), N'8 GB (1 thanh 8 GB), ,3200 MHz', N'NVIDIA GeForce GTX 1650, 4GB-Intel Iris Xe Graphics')
GO
INSERT [dbo].[PRODUCTS] ([id], [brand_id], [category_id], [prod_name], [avatar], [prod_description], [manufacturer], [price], [cost], [quantity], [prod_percent], [cpu], [hard_drive], [mux_switch], [screen], [webcam], [connection], [prod_weight], [pin], [operation_system], [created_at], [updated_at], [ram], [graphics]) VALUES (1034, 6, 1, N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) ', N'http://localhost:8000/upload/1695519558964-laptop-hp-victus-16-fullsz.png', N'Laptop HP VICTUS 16-e1105AX(7C0T0PA) (AMD Ryzen 5-6600H, Ram 16GB, SSD 512GB, Đồ họa RTX 3050Ti 4GB, màn hình 16.1 inch FHD, Windows 11 bản quyền, màu xanh)', NULL, 20990000, 27990000, 3, 25, N'AMD, Ryzen 5,6600H (up to 4.50 GHz/ 6 nhân/ 12 luồng/16MB)', N' 512GB PCIe NVMe TLC M.2 SSD', NULL, N'16.1 inch, FullHD (1920 x 1080), 144Hz', N'HP Wide Vision 720p HD camera with integrated dual array digital microphones', N'Intel Wi-Fi 6E AX211 (2x2), Bluetooth® 5.3 compatible combo (supporting gigabit data rate)', N'2.5kg', N'4-cell, 70 Wh Li-ion polymer', N' Windows 11 Home 64', CAST(N'2023-08-29T11:31:11.667' AS DateTime), CAST(N'2023-08-29T11:31:11.667' AS DateTime), N'8 GB (1 thanh 8 GB), DDR5, 4800 MHz', N' NVIDIA GeForce RTX 3050, 4GB')
GO
INSERT [dbo].[PRODUCTS] ([id], [brand_id], [category_id], [prod_name], [avatar], [prod_description], [manufacturer], [price], [cost], [quantity], [prod_percent], [cpu], [hard_drive], [mux_switch], [screen], [webcam], [connection], [prod_weight], [pin], [operation_system], [created_at], [updated_at], [ram], [graphics]) VALUES (2043, 2, 1, N'MSI Gaming Thin GF63 12VE-454VN i5 12450H', N'http://localhost:8000/upload/1705379345655-msi-1.jpg', N'Laptop MSI Gaming Thin GF63 12VE-454VN i5 12450H/16GB/512GB/15.6" FHD/GeForce RTX 4050 6GB/Win 11', NULL, 20490000, 22990000, 5, 0, N'Intel, Core i5, 12450H', N'SSD 512 GB', NULL, N'15.6 inch, IPS FHD, 1920 x 1080 Pixels, Màn hình phẳng, 144 Hz, IPS, 45% NTSC', N'HD Webcam (720p Webcam)', N'1 DC-in jack 1 HDMI 1 Jack 3.5 mm 1 LAN 1 Type C 1 Type C 3 USB 3.2, Wifi 6', N'1.86kg', N'52.4 Wh', N'Windows 11 Home', CAST(N'2024-01-16T11:29:05.740' AS DateTime), CAST(N'2024-01-16T11:29:05.740' AS DateTime), N'16 GB, DDR4, 3200 MHz', N'NVIDIA GeForce RTX 4050, 6GB GDDR6 - Intel Iris Xe Graphics')
GO
SET IDENTITY_INSERT [dbo].[PRODUCTS] OFF
GO
INSERT [dbo].[PROVIDED_USERS] ([user_id], [name], [email], [provider], [subject]) VALUES (7008, N'Hồ Nhật Tân', NULL, N'https://www.facebook.com', N'2050501595295196')
GO
SET IDENTITY_INSERT [dbo].[REVIEWS] ON 
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (1, 31, 3002, 5, N'Ngon', CAST(N'2023-06-05T17:04:22.840' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (2, 33, 3002, 5, N'Máy tính mới, xịn', CAST(N'2023-06-05T17:26:40.573' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (3, 27, 3002, 5, N'Máy tính mới, xịn', CAST(N'2023-06-05T17:26:40.573' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (4, 31, 3002, 5, N'Máy tính mới, xịn', CAST(N'2023-06-05T17:26:40.573' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (5, 24, 3002, 5, N'Máy tính mới, xịn', CAST(N'2023-06-05T17:26:40.573' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (6, 32, 3002, 3, N'OK', CAST(N'2023-06-06T16:19:54.307' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (7, 23, 3002, 2, N'OK', CAST(N'2023-06-06T16:19:54.307' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (8, 32, 3002, 3, N'3', CAST(N'2023-06-08T13:44:13.397' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (9, 27, 3002, 1, N'1', CAST(N'2023-06-08T13:44:13.397' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (10, 33, 3002, 5, N'5', CAST(N'2023-06-08T13:44:13.400' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (11, 31, 3002, 4, N'4', CAST(N'2023-06-08T13:44:13.400' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (12, 23, 3002, 2, N'2', CAST(N'2023-06-08T13:44:13.400' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (13, 24, 3002, 0, N'', CAST(N'2023-06-08T13:44:13.400' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (14, 24, 5004, 2, N'Cũng tạm', CAST(N'2023-07-06T07:44:48.303' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (15, 23, 3002, 0, N'', CAST(N'2023-07-06T07:48:27.820' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (16, 33, 3002, 0, N'', CAST(N'2023-07-06T07:48:27.820' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (17, 32, 3002, 0, N'', CAST(N'2023-07-06T07:48:27.823' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (18, 31, 3002, 0, N'', CAST(N'2023-07-06T07:48:27.823' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (19, 27, 3002, 0, N'', CAST(N'2023-07-06T07:48:27.823' AS DateTime))
GO
INSERT [dbo].[REVIEWS] ([review_id], [product_id], [user_id], [rating], [comment], [created_at]) VALUES (20, 24, 3002, 0, N'', CAST(N'2023-07-06T07:48:27.827' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[REVIEWS] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (2015, N'Nhật Tân', N'$2b$10$UYyf8ct8wR/X23O7EFfiYeZgTYTzwtFcMA9KGANlnbwmwyR3883fy', N'admin@gmail.com', N'admin', NULL, NULL, NULL, N'1')
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (3002, N'test1', N'$2b$10$6KIa/jjaannA7Xvs4knBF.j20HvQAWzutDs0OoX.XnP9gAlp1ATyi', N'test1@gmail.com', N'user', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (3003, N'Hiếu', N'$2b$10$PC8QvkDXUGjdN0nmKOIqBe4rav5xNgpdpq41z4KBSCBW0MoyxIjDK', N'test3@gmail.com', N'user', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (3004, N'test100', N'$2b$10$GZnwARESRrrzt9rMEiclMuAV51JtvWldjMda0yp4.h.sNtjkWy6C2', N'test100@gmail.com', N'user', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (4004, N'test1000', N'$2b$10$G8iSlzb1q.Roz/xemAIfCek9BqdwrJWQM.DLAjxoXAd/0XBP2xq8O', N'test1000@gmail.com', N'user', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (5004, N'Nhật Tân', N'$2b$10$lOoVnS8Gu8RoBJb0SLMUUO4Yjl0K1WYvbmaZDxtO2Sqn7D/X73ik2', N'honhattan121@gmail.com', N'user', NULL, NULL, NULL, N'1')
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (7008, N'Hồ Nhật Tân', NULL, NULL, N'user', N'https://www.facebook.com', NULL, NULL, NULL)
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (7019, N'ADMIN', N'$2b$10$.ER6GYIwlZTDWzchWh89/uP4WlOTVNxHaIEE7zJr8KDRAgF0qWGf.', N'websitebanlaptop1212@gmail.com', N'admin', NULL, NULL, N'$2b$10$7nwDogUuP8mzcsuw3TvF/On.xAAHEAndfKPgC0QSRRw.CNhraHptK', N'1')
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (7020, N'Tân', N'$2b$10$oS002gDwzvA3lp6gVyo4NOehYtYmahA.exz8wGOG5x8rVeEz0zPdi', N'idol@gmail.com', N'user', NULL, NULL, N'$2b$10$bGp4fhOMlsSyJWVRaudu8eqHSNCD0u2KwInouicdLUT2SRY5jV2pK', N'0')
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (7023, N'Tân', N'$2b$10$6V/HmBSSdsF2sSV1REXwhOyYNMXSz95Zs7GathGvv59.P3VnYCgaC', N'Tan@gmail.com', N'user', NULL, NULL, N'$2b$10$ce.n17o7o785IpT2xDTtOuwiWZ9T2BJT2oJr.FeA//XLLxnkPESXW', N'0')
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (7028, N'hello', N'$2b$10$1E9s1jCaCjeOL/zfKv6MH.2ivj90DCcnLajJ0Vx50uKGthtElTZaS', N'a@gmail.commmmmmm', N'user', NULL, NULL, N'$2b$10$3GHbIsCoUHErarCnhyfyv.F0fQiVe8yrBDCdshIC7MPea/9mxuSvK', N'0')
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (7029, N'hello', N'$2b$10$nRv5CdWx.ocTB9pV4quXY.wJ7ZOEmFyKfsgl.11inNZ8A.JrFVDMi', N'12314@gmail.comagmail.com', N'user', NULL, NULL, N'$2b$10$smNmOyR6OlRA3usEW54ueu0XlUMNED.QUiH/tHQxwryVytbV158Mi', N'0')
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (8028, N'Xệ', N'$2b$10$l6/YAw/Os2RK2jE0.tLCYevV0xtR7lFQQ5xb8b0J26h17caTzyYwq', N'nhanlesnar@gmail.com', N'user', NULL, NULL, N'$2b$10$5RgohgdgqMFaYzxLmq6GKOsv88E3eU8qboDgqoIyzpIEyHuJDpzte', N'0')
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (8029, N'Tân Đẹp Trai', N'$2b$10$TRZ3cSjZ9SD3R6gYkiEOd.UtCDV3qnuyEuoyHXFSymcefVvTfwKF2', N'honhattan1@gmail.com', N'user', NULL, NULL, N'$2b$10$Ofq1kgMF.k7/GJW810nwqe96j6hXqOkpoONPDvajhqaNdZOWaK656', N'0')
GO
INSERT [dbo].[USERS] ([id], [name], [password], [email], [role], [provider], [phone], [registration_token], [confirmation_status]) VALUES (8043, N'Tân idol', N'$2b$10$7kxv7Ha.mYnXkvCQEGpbcuO.PgdvkeTpdpK3V5Xruj0R3vnQlt8d2', N'honhattan1@dtu.edu.vn', N'user', NULL, NULL, N'$2b$10$2GJwZ.P7xjJS2u/KCW3fN.g9ww5pGsE/V/X5Dvs0nHsAdKrWeCj1m', N'0')
GO
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
SET IDENTITY_INSERT [dbo].[USERS2] ON 
GO
INSERT [dbo].[USERS2] ([id], [name], [password], [email]) VALUES (2015, N'test', N'$2b$10$UYyf8ct8wR/X23O7EFfiYeZgTYTzwtFcMA9KGANlnbwmwyR3883fy', N'test@gmail.com')
GO
INSERT [dbo].[USERS2] ([id], [name], [password], [email]) VALUES (3002, N'test1', N'$2b$10$6KIa/jjaannA7Xvs4knBF.j20HvQAWzutDs0OoX.XnP9gAlp1ATyi', N'test1@gmail.com')
GO
INSERT [dbo].[USERS2] ([id], [name], [password], [email]) VALUES (3003, N'Hiếu', N'$2b$10$PC8QvkDXUGjdN0nmKOIqBe4rav5xNgpdpq41z4KBSCBW0MoyxIjDK', N'test3@gmail.com')
GO
INSERT [dbo].[USERS2] ([id], [name], [password], [email]) VALUES (3004, N'test100', N'$2b$10$GZnwARESRrrzt9rMEiclMuAV51JtvWldjMda0yp4.h.sNtjkWy6C2', N'test100@gmail.com')
GO
INSERT [dbo].[USERS2] ([id], [name], [password], [email]) VALUES (4004, N'test1000', N'$2b$10$G8iSlzb1q.Roz/xemAIfCek9BqdwrJWQM.DLAjxoXAd/0XBP2xq8O', N'test1000@gmail.com')
GO
INSERT [dbo].[USERS2] ([id], [name], [password], [email]) VALUES (5004, N'Nhật Tân', N'$2b$10$r9eP1/zw7Ik3.lFNQlPfh.tpXjda77/LQPnlB8fU/fvHJlL7LDZcq', N'honhattan121@gmail.com')
GO
INSERT [dbo].[USERS2] ([id], [name], [password], [email]) VALUES (5005, N'test2213', NULL, N'tes123123t@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[USERS2] OFF
GO
ALTER TABLE [dbo].[BRANDS] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[BRANDS] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[CATEGORIES] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[CATEGORIES] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[PRODUCTS] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[PRODUCTS] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[CARTS]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[PRODUCTS] ([id])
GO
ALTER TABLE [dbo].[CARTS]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[USERS] ([id])
GO
ALTER TABLE [dbo].[IMAGES]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[PRODUCTS] ([id])
GO
ALTER TABLE [dbo].[ORDER_DETAILS]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[ORDERS] ([id])
GO
ALTER TABLE [dbo].[ORDER_DETAILS]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[PRODUCTS] ([id])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[USERS] ([id])
GO
ALTER TABLE [dbo].[PRODUCTS]  WITH CHECK ADD FOREIGN KEY([brand_id])
REFERENCES [dbo].[BRANDS] ([brand_id])
GO
ALTER TABLE [dbo].[PRODUCTS]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[CATEGORIES] ([category_id])
GO
ALTER TABLE [dbo].[PROVIDED_USERS]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[USERS] ([id])
GO
ALTER TABLE [dbo].[REVIEWS]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[PRODUCTS] ([id])
GO
ALTER TABLE [dbo].[REVIEWS]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[USERS] ([id])
GO
USE [master]
GO
ALTER DATABASE [QUANLYBANLAPTOP] SET  READ_WRITE 
GO
