USE [master]
GO
/****** Object:  Database [balo_shop]    Script Date: 3/11/2021 7:55:01 PM ******/
CREATE DATABASE [balo_shop]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'balo_shop', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\balo_shop.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'balo_shop_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\balo_shop_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [balo_shop] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [balo_shop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [balo_shop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [balo_shop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [balo_shop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [balo_shop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [balo_shop] SET ARITHABORT OFF 
GO
ALTER DATABASE [balo_shop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [balo_shop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [balo_shop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [balo_shop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [balo_shop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [balo_shop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [balo_shop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [balo_shop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [balo_shop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [balo_shop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [balo_shop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [balo_shop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [balo_shop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [balo_shop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [balo_shop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [balo_shop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [balo_shop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [balo_shop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [balo_shop] SET  MULTI_USER 
GO
ALTER DATABASE [balo_shop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [balo_shop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [balo_shop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [balo_shop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [balo_shop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [balo_shop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [balo_shop] SET QUERY_STORE = OFF
GO
USE [balo_shop]
GO
/****** Object:  Table [dbo].[account]    Script Date: 3/11/2021 7:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[active_code] [nvarchar](50) NULL,
	[role] [int] NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brands]    Script Date: 3/11/2021 7:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brands](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 3/11/2021 7:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](30) NOT NULL,
	[status] [text] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 3/11/2021 7:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[img_name] [nvarchar](30) NOT NULL,
	[note] [nvarchar](30) NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Details]    Script Date: 3/11/2021 7:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Details](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NULL,
	[product_id] [int] NULL,
	[product_name] [nvarchar](100) NULL,
	[product_price] [float] NULL,
	[quantity] [int] NULL,
 CONSTRAINT [PK_Order_Details] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 3/11/2021 7:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[mobile] [nvarchar](11) NOT NULL,
	[address] [nvarchar](1000) NOT NULL,
	[total_money] [float] NOT NULL,
	[note] [nvarchar](1000) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 3/11/2021 7:55:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[brand_id] [int] NOT NULL,
	[category_id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[img_name] [nvarchar](50) NULL,
	[description] [nvarchar](2000) NULL,
	[note] [nvarchar](100) NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[account] ON 

INSERT [dbo].[account] ([id], [email], [password], [active_code], [role], [status]) VALUES (1, N'dattthe150411@gmail.com', N'12345678', N'BBBBCCC', NULL, 1)
SET IDENTITY_INSERT [dbo].[account] OFF
GO
SET IDENTITY_INSERT [dbo].[Brands] ON 

INSERT [dbo].[Brands] ([id], [name], [status]) VALUES (1, N'Crumpler', 1)
INSERT [dbo].[Brands] ([id], [name], [status]) VALUES (2, N'North Face', 1)
INSERT [dbo].[Brands] ([id], [name], [status]) VALUES (3, N'Herschel', 1)
INSERT [dbo].[Brands] ([id], [name], [status]) VALUES (4, N'Tactical', 1)
INSERT [dbo].[Brands] ([id], [name], [status]) VALUES (5, N'Adidas', 1)
INSERT [dbo].[Brands] ([id], [name], [status]) VALUES (6, N'Nike', 1)
INSERT [dbo].[Brands] ([id], [name], [status]) VALUES (7, N'Jansport', 1)
INSERT [dbo].[Brands] ([id], [name], [status]) VALUES (9, N'Calvin Klein', 1)
SET IDENTITY_INSERT [dbo].[Brands] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name], [status]) VALUES (1, N'Du lịch', N'1')
INSERT [dbo].[Categories] ([id], [name], [status]) VALUES (2, N'Da', N'1')
INSERT [dbo].[Categories] ([id], [name], [status]) VALUES (3, N'Học sinh, sinh viên', N'1')
INSERT [dbo].[Categories] ([id], [name], [status]) VALUES (4, N'Máy ảnh', N'1')
INSERT [dbo].[Categories] ([id], [name], [status]) VALUES (5, N'Leo núi', N'1')
INSERT [dbo].[Categories] ([id], [name], [status]) VALUES (6, N'Thời trang', N'1')
INSERT [dbo].[Categories] ([id], [name], [status]) VALUES (7, N'Quai chéo', N'1')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (1, 1, N'MA_crumpler_1_1.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (2, 1, N'MA_crumpler_1_2.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (3, 1, N'MA_crumpler_1_3.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (4, 1, N'MA_crumpler_1_4.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (5, 1, N'MA_crumpler_1_5.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (6, 1, N'MA_crumpler_1_6.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (8, 2, N'TT_adidas_2_1.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (9, 2, N'TT_adidas_2_2.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (10, 2, N'TT_adidas_2_3.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (11, 2, N'TT_adidas_2_4.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (12, 2, N'TT_adidas_2_5.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (13, 2, N'TT_adidas_2_6.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (14, 3, N'LN_northface_3_1.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (15, 3, N'LN_northface_3_2.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (16, 3, N'LN_northface_3_3.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (17, 3, N'LN_northface_3_4.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (18, 5, N'TT_jansport_5_2.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (19, 4, N'TT_herschel_4_2.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (20, 4, N'TT_herschel_4_1.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (21, 4, N'TT_herschel_4_3.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (22, 4, N'TT_herschel_4_4.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (23, 5, N'TT_jansport_5_3.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (24, 5, N'TT_jansport_5_4.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (25, 5, N'TT_jansport_5_1.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (26, 6, N'TT_nike_6_1.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (27, 6, N'TT_nike_6_2.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (28, 6, N'TT_nike_6_3.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (29, 6, N'TT_nike_6_4.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (30, 7, N'HS_adidas_7_1.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (31, 7, N'HS_adidas_7_2.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (32, 7, N'HS_adidas_7_3.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (33, 7, N'HS_adidas_7_4.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (34, 9, N'MA_crumpler_9_1.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (35, 9, N'MA_crumpler_9_2.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (36, 9, N'MA_crumpler_9_3.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (37, 9, N'MA_crumpler_9_4.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (38, 10, N'DL_tactical_10_1.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (39, 10, N'DL_tactical_10_2.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (40, 10, N'DL_tactical_10_3.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (41, 10, N'DL_tactical_10_4.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (42, 12, N'D_calvinklein_12_1.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (43, 12, N'D_calvinklein_12_2.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (44, 12, N'D_calvinklein_12_3.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (45, 12, N'D_calvinklein_12_4.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (46, 13, N'QC_adidas_13_1.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (47, 13, N'QC_adidas_13_2.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (48, 13, N'QC_adidas_13_3.jpg', NULL)
INSERT [dbo].[Images] ([id], [product_id], [img_name], [note]) VALUES (49, 13, N'QC_adidas_13_4.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Images] OFF
GO
SET IDENTITY_INSERT [dbo].[Order_Details] ON 

INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (1, 3, 2, N'Balo túi dây Adidas', 400000, 1)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (2, 3, 3, N'Balo leo núi North Face', 3000000, 1)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (3, 3, 5, N'Balo thời trang Jansport', 1500000, 1)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (4, 4, 10, N'Balo du lịch Tactical đen', 950000, 1)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (5, 4, 7, N'Balo học sinh Adidas', 700000, 1)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (6, 4, 6, N'Balo thời trang Nike', 2500000, 2)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (7, 5, 1, N'Balo máy ảnh Crumpler Jackpack', 1050000, 1)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (8, 5, 5, N'Balo thời trang Jansport', 1500000, 1)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (9, 5, 6, N'Balo thời trang Nike', 2500000, 1)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (10, 5, 4, N'Balo thời trang Herschel', 2000000, 1)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (11, 6, 1, N'Balo máy ảnh Crumpler Jackpack', 1050000, 1)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (12, 6, 5, N'Balo thời trang Jansport', 1500000, 1)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (13, 6, 6, N'Balo thời trang Nike', 2500000, 1)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (14, 6, 4, N'Balo thời trang Herschel', 2000000, 1)
INSERT [dbo].[Order_Details] ([id], [order_id], [product_id], [product_name], [product_price], [quantity]) VALUES (15, 7, 10, N'Balo du lịch Tactical đen', 950000, 1)
SET IDENTITY_INSERT [dbo].[Order_Details] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([id], [name], [mobile], [address], [total_money], [note], [status]) VALUES (1, N'Dat', N'1234567', N'Hanoi', 2000000, N'-', 1)
INSERT [dbo].[Orders] ([id], [name], [mobile], [address], [total_money], [note], [status]) VALUES (2, N'Dat', N'1234567', N'Hanoi', 2000000, N'-', 1)
INSERT [dbo].[Orders] ([id], [name], [mobile], [address], [total_money], [note], [status]) VALUES (3, N'Tran Hoang', N'01234567', N'Ha Noi', 4900000, N'lol', 1)
INSERT [dbo].[Orders] ([id], [name], [mobile], [address], [total_money], [note], [status]) VALUES (4, N'An Đần', N'0969876543', N'TP Ho Chi Minh', 6650000, N'ahaha', 1)
INSERT [dbo].[Orders] ([id], [name], [mobile], [address], [total_money], [note], [status]) VALUES (7, N'Lulu', N'0986756432', N'Japan', 950000, N'Cool backpack', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([id], [brand_id], [category_id], [name], [price], [quantity], [img_name], [description], [note], [status]) VALUES (1, 1, 4, N'Balo máy ảnh Crumpler Jackpack', 1050000, 10, N'MA_crumpler_1_1.jpg', N'Cỡ vừa, ngăn để đồ rộng rãi, khóa kéo chất lượng cao, dáng vẻ hợp thời trang', N'Hot', 0)
INSERT [dbo].[Products] ([id], [brand_id], [category_id], [name], [price], [quantity], [img_name], [description], [note], [status]) VALUES (2, 5, 6, N'Balo túi dây Adidas', 400000, 15, N'TT_adidas_2_1.jpg', N'Nhỏ gọn, tiện lợi, hợp thời trang', N'Cool', 0)
INSERT [dbo].[Products] ([id], [brand_id], [category_id], [name], [price], [quantity], [img_name], [description], [note], [status]) VALUES (3, 2, 5, N'Balo leo núi North Face', 3000000, 10, N'LN_northface_3_1.jpg', N'Không gian rộng, nhiều ngăn', NULL, 1)
INSERT [dbo].[Products] ([id], [brand_id], [category_id], [name], [price], [quantity], [img_name], [description], [note], [status]) VALUES (4, 3, 6, N'Balo thời trang Herschel', 2000000, 15, N'TT_herschel_4_1.jpg', N'Thời trang, hợp mốt', NULL, 1)
INSERT [dbo].[Products] ([id], [brand_id], [category_id], [name], [price], [quantity], [img_name], [description], [note], [status]) VALUES (5, 7, 6, N'Balo thời trang Jansport', 1500000, 20, N'TT_jansport_5_1.jpg', N'Thời trang, hợp mốt', NULL, 0)
INSERT [dbo].[Products] ([id], [brand_id], [category_id], [name], [price], [quantity], [img_name], [description], [note], [status]) VALUES (6, 6, 6, N'Balo thời trang Nike', 2500000, 15, N'TT_nike_6_1.jpg', N'Thời trang, hợp mốt', NULL, 1)
INSERT [dbo].[Products] ([id], [brand_id], [category_id], [name], [price], [quantity], [img_name], [description], [note], [status]) VALUES (7, 5, 3, N'Balo học sinh Adidas', 700000, 10, N'HS_adidas_7_1.jpg', N'Rộng rãi, quai rộng thoải mái', NULL, 1)
INSERT [dbo].[Products] ([id], [brand_id], [category_id], [name], [price], [quantity], [img_name], [description], [note], [status]) VALUES (9, 1, 4, N'Balo máy ảnh Crumpler', 3000000, 12, N'MA_crumpler_9_1.jpg', N'Nhiều ngăn, rộng rãim bảo quản tốt máy ảnh và phụ kiện', NULL, 1)
INSERT [dbo].[Products] ([id], [brand_id], [category_id], [name], [price], [quantity], [img_name], [description], [note], [status]) VALUES (10, 4, 1, N'Balo du lịch Tactical đen', 950000, 7, N'DL_tactical_10_1.jpg', N'Bền chắc, rộng rãi, tiẹn dụng', NULL, 1)
INSERT [dbo].[Products] ([id], [brand_id], [category_id], [name], [price], [quantity], [img_name], [description], [note], [status]) VALUES (12, 9, 2, N'Balo da Calvin Klein', 500000, 6, N'D_calvinklein_12_1.jpg', N'Sang trọng, thời trang', NULL, 1)
INSERT [dbo].[Products] ([id], [brand_id], [category_id], [name], [price], [quantity], [img_name], [description], [note], [status]) VALUES (13, 5, 7, N'Balo 1 quai đeo chéo Adidas', 250000, 8, N'QC_adidas_13_1.jpg', N'Nhỏ gọn, thời trang, tiện lợi', NULL, 1)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Images]  WITH CHECK ADD  CONSTRAINT [FK_Image_Product] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([id])
GO
ALTER TABLE [dbo].[Images] CHECK CONSTRAINT [FK_Image_Product]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([brand_id])
REFERENCES [dbo].[Brands] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Product_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Product_Categories]
GO
USE [master]
GO
ALTER DATABASE [balo_shop] SET  READ_WRITE 
GO
