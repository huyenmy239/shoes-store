USE [master]
GO
/****** Object:  Database [BGD]    Script Date: 30/07/2024 11:47:08 pm ******/
CREATE DATABASE [BGD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BGD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BGD.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BGD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BGD_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BGD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BGD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BGD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BGD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BGD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BGD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BGD] SET ARITHABORT OFF 
GO
ALTER DATABASE [BGD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BGD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BGD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BGD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BGD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BGD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BGD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BGD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BGD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BGD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BGD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BGD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BGD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BGD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BGD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BGD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BGD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BGD] SET RECOVERY FULL 
GO
ALTER DATABASE [BGD] SET  MULTI_USER 
GO
ALTER DATABASE [BGD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BGD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BGD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BGD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BGD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BGD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BGD', N'ON'
GO
ALTER DATABASE [BGD] SET QUERY_STORE = ON
GO
ALTER DATABASE [BGD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BGD]
GO
/****** Object:  User [ql]    Script Date: 30/07/2024 11:47:08 pm ******/
CREATE USER [ql] FOR LOGIN [ql] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [nv]    Script Date: 30/07/2024 11:47:08 pm ******/
CREATE USER [nv] FOR LOGIN [nv] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [kh]    Script Date: 30/07/2024 11:47:08 pm ******/
CREATE USER [kh] FOR LOGIN [kh] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [QuanLy]    Script Date: 30/07/2024 11:47:08 pm ******/
CREATE ROLE [QuanLy]
GO
/****** Object:  DatabaseRole [NhanVien]    Script Date: 30/07/2024 11:47:08 pm ******/
CREATE ROLE [NhanVien]
GO
/****** Object:  DatabaseRole [KhachHang]    Script Date: 30/07/2024 11:47:08 pm ******/
CREATE ROLE [KhachHang]
GO
ALTER ROLE [QuanLy] ADD MEMBER [ql]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [ql]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [ql]
GO
ALTER ROLE [db_datareader] ADD MEMBER [ql]
GO
ALTER ROLE [NhanVien] ADD MEMBER [nv]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [nv]
GO
ALTER ROLE [db_datareader] ADD MEMBER [nv]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [nv]
GO
ALTER ROLE [KhachHang] ADD MEMBER [kh]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [QuanLy]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [QuanLy]
GO
ALTER ROLE [db_datareader] ADD MEMBER [QuanLy]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [NhanVien]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NhanVien]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [NhanVien]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NOT NULL,
	[MauSac] [nvarchar](10) NOT NULL,
	[Size] [tinyint] NOT NULL,
	[ChatLieu] [nvarchar](30) NOT NULL,
	[XuatXu] [nvarchar](30) NOT NULL,
	[Gia] [money] NOT NULL,
	[TG_BaoHanh] [tinyint] NOT NULL,
	[SLTon] [int] NOT NULL,
	[MaHang] [varchar](10) NOT NULL,
	[MaLoai] [varchar](10) NOT NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_XemCacSanPhamHienCo]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_XemCacSanPhamHienCo] AS
SELECT * FROM SanPham
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[TongTien] [money] NULL,
	[ThoiGian] [datetime] NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[V_XemDoanhThuTheoNgayHienTai]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[V_XemDoanhThuTheoNgayHienTai] AS
SELECT SUM(TongTien) AS TongDoanhThu
FROM HoaDon
WHERE CONVERT(date, ThoiGian) = CONVERT(date, GETDATE());
GO
/****** Object:  Table [dbo].[CT_DonDH]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_DonDH](
	[MaCTDDH] [int] IDENTITY(1,1) NOT NULL,
	[MaGio] [int] NOT NULL,
	[MaDDH] [int] NOT NULL,
	[SoLuong] [tinyint] NOT NULL,
	[MaHD] [int] NULL,
 CONSTRAINT [PK_CT_DonDH] PRIMARY KEY CLUSTERED 
(
	[MaCTDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CT_KhuyenMai]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CT_KhuyenMai](
	[MaDotKM] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[PhanTramKM] [tinyint] NOT NULL,
 CONSTRAINT [PK_CT_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[MaDotKM] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhGia]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhGia](
	[MaCTDDH] [int] NOT NULL,
	[Sao] [tinyint] NOT NULL,
	[NoiDung] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_DanhGia] PRIMARY KEY CLUSTERED 
(
	[MaCTDDH] ASC,
	[Sao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoiTra]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoiTra](
	[MaDT] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NOT NULL,
	[MaCTDDH] [int] NOT NULL,
	[LyDo] [nvarchar](100) NOT NULL,
	[TG_DoiTra] [datetime] NOT NULL,
 CONSTRAINT [PK_DoiTra_1] PRIMARY KEY CLUSTERED 
(
	[MaDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonDH]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDH](
	[MaDDH] [int] IDENTITY(1,1) NOT NULL,
	[TG_Dat] [datetime] NOT NULL,
	[TrangThai] [nvarchar](20) NOT NULL,
	[HinhThuc] [nvarchar](50) NOT NULL,
	[ThanhToan] [nvarchar](12) NOT NULL,
	[MaNV] [int] NULL,
 CONSTRAINT [PK_DonDH] PRIMARY KEY CLUSTERED 
(
	[MaDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GiaoHang]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GiaoHang](
	[MaGH] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NOT NULL,
	[MaDDH] [int] NOT NULL,
	[ThoiGian_BD] [datetime] NOT NULL,
	[ThoiGian_KT] [datetime] NULL,
	[TenNguoiNhan] [nvarchar](50) NULL,
	[SDT] [varchar](10) NULL,
	[DiaChiGH] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_GiaoHang_1] PRIMARY KEY CLUSTERED 
(
	[MaGH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioHang]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioHang](
	[MaGio] [int] IDENTITY(1,1) NOT NULL,
	[usernameKH] [varchar](50) NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_GioHang] PRIMARY KEY CLUSTERED 
(
	[MaGio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hang]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hang](
	[MaHang] [varchar](10) NOT NULL,
	[TenHang] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_HANG] PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[Ho] [nvarchar](100) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaDotKM] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NOT NULL,
	[LyDo] [nvarchar](100) NOT NULL,
	[ThoiGian_BD] [datetime] NOT NULL,
	[ThoiGian_KT] [datetime] NOT NULL,
 CONSTRAINT [PK_KHUYENMAI] PRIMARY KEY CLUSTERED 
(
	[MaDotKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [varchar](10) NOT NULL,
	[TenLoai] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_LOAI] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanBH]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanBH](
	[MaNhanBH] [int] IDENTITY(1,1) NOT NULL,
	[MaBH] [int] NOT NULL,
	[MaNV] [int] NOT NULL,
	[LyDoBH] [nvarchar](200) NOT NULL,
	[TG_Nhan] [datetime] NOT NULL,
 CONSTRAINT [PK_NhanBH] PRIMARY KEY CLUSTERED 
(
	[MaNhanBH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [int] IDENTITY(1,1) NOT NULL,
	[Ho] [nvarchar](100) NOT NULL,
	[Ten] [nvarchar](50) NOT NULL,
	[GioiTinh] [nvarchar](3) NOT NULL,
	[CCCD] [varchar](12) NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[SDT] [varchar](10) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[NghiViec] [bit] NOT NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuBH]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuBH](
	[MaBH] [int] IDENTITY(1,1) NOT NULL,
	[MaCTDDH] [int] NOT NULL,
	[MaNV] [int] NOT NULL,
	[Ngay_BD] [date] NOT NULL,
	[Ngay_KT] [date] NOT NULL,
 CONSTRAINT [PK_PhieuBH] PRIMARY KEY CLUSTERED 
(
	[MaBH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QTQuanLy]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QTQuanLy](
	[MaQL] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [int] NOT NULL,
	[Ngay_BD] [date] NOT NULL,
	[NhiemKy] [tinyint] NOT NULL,
	[Ngay_KT] [date] NULL,
	[TrangThai] [bit] NOT NULL,
 CONSTRAINT [PK_QUANLY] PRIMARY KEY CLUSTERED 
(
	[MaQL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThayDoiGia]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThayDoiGia](
	[MaNV] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[TG_ThayDoi] [datetime] NOT NULL,
	[TG_ApDung] [datetime] NOT NULL,
	[GiaCu] [money] NOT NULL,
	[GiaMoi] [money] NOT NULL,
 CONSTRAINT [PK_THAYDOIGIA] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC,
	[MaSP] ASC,
	[TG_ThayDoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TK_KhachHang]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TK_KhachHang](
	[usernameKH] [varchar](50) NOT NULL,
	[pwKH] [varchar](100) NOT NULL,
	[MaKH] [int] NOT NULL,
 CONSTRAINT [PK_TK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[usernameKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TK_NhanVien]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TK_NhanVien](
	[usernameNV] [varchar](10) NOT NULL,
	[pwNV] [varchar](50) NOT NULL,
	[MaNV] [int] NOT NULL,
 CONSTRAINT [PK_TK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[usernameNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TraBH]    Script Date: 30/07/2024 11:47:08 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraBH](
	[MaTraBH] [int] IDENTITY(1,1) NOT NULL,
	[MaNhanBH] [int] NOT NULL,
	[MaNV] [int] NOT NULL,
	[TinhTrangSauBH] [nvarchar](100) NOT NULL,
	[TG_Tra] [datetime] NOT NULL,
 CONSTRAINT [PK_TraBH] PRIMARY KEY CLUSTERED 
(
	[MaTraBH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CT_DonDH] ON 

INSERT [dbo].[CT_DonDH] ([MaCTDDH], [MaGio], [MaDDH], [SoLuong], [MaHD]) VALUES (1, 1, 2, 1, 3)
INSERT [dbo].[CT_DonDH] ([MaCTDDH], [MaGio], [MaDDH], [SoLuong], [MaHD]) VALUES (2, 3, 3, 1, 4)
INSERT [dbo].[CT_DonDH] ([MaCTDDH], [MaGio], [MaDDH], [SoLuong], [MaHD]) VALUES (3, 6, 3, 2, 4)
INSERT [dbo].[CT_DonDH] ([MaCTDDH], [MaGio], [MaDDH], [SoLuong], [MaHD]) VALUES (4, 1, 5, 1, 5)
INSERT [dbo].[CT_DonDH] ([MaCTDDH], [MaGio], [MaDDH], [SoLuong], [MaHD]) VALUES (5, 10, 6, 1, 6)
INSERT [dbo].[CT_DonDH] ([MaCTDDH], [MaGio], [MaDDH], [SoLuong], [MaHD]) VALUES (6, 11, 6, 1, 6)
INSERT [dbo].[CT_DonDH] ([MaCTDDH], [MaGio], [MaDDH], [SoLuong], [MaHD]) VALUES (7, 8, 7, 10, 7)
INSERT [dbo].[CT_DonDH] ([MaCTDDH], [MaGio], [MaDDH], [SoLuong], [MaHD]) VALUES (9, 10, 10, 1, 9)
INSERT [dbo].[CT_DonDH] ([MaCTDDH], [MaGio], [MaDDH], [SoLuong], [MaHD]) VALUES (10, 2, 17, 1, 14)
INSERT [dbo].[CT_DonDH] ([MaCTDDH], [MaGio], [MaDDH], [SoLuong], [MaHD]) VALUES (11, 8, 18, 2, 15)
INSERT [dbo].[CT_DonDH] ([MaCTDDH], [MaGio], [MaDDH], [SoLuong], [MaHD]) VALUES (13, 7, 20, 1, 17)
INSERT [dbo].[CT_DonDH] ([MaCTDDH], [MaGio], [MaDDH], [SoLuong], [MaHD]) VALUES (14, 5, 21, 1, 18)
SET IDENTITY_INSERT [dbo].[CT_DonDH] OFF
GO
INSERT [dbo].[CT_KhuyenMai] ([MaDotKM], [MaSP], [PhanTramKM]) VALUES (6, 2, 10)
INSERT [dbo].[CT_KhuyenMai] ([MaDotKM], [MaSP], [PhanTramKM]) VALUES (10, 8, 10)
INSERT [dbo].[CT_KhuyenMai] ([MaDotKM], [MaSP], [PhanTramKM]) VALUES (15, 9, 15)
GO
SET IDENTITY_INSERT [dbo].[DonDH] ON 

INSERT [dbo].[DonDH] ([MaDDH], [TG_Dat], [TrangThai], [HinhThuc], [ThanhToan], [MaNV]) VALUES (2, CAST(N'2024-05-30T14:50:00.000' AS DateTime), N'Đã hoàn thành', N'Online', N'Chuyển khoản', 2)
INSERT [dbo].[DonDH] ([MaDDH], [TG_Dat], [TrangThai], [HinhThuc], [ThanhToan], [MaNV]) VALUES (3, CAST(N'2024-06-01T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Offline (không giao hàng)', N'Tiền mặt', 1)
INSERT [dbo].[DonDH] ([MaDDH], [TG_Dat], [TrangThai], [HinhThuc], [ThanhToan], [MaNV]) VALUES (5, CAST(N'2024-07-02T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Offline (không giao hàng)', N'Chuyển khoản', 3)
INSERT [dbo].[DonDH] ([MaDDH], [TG_Dat], [TrangThai], [HinhThuc], [ThanhToan], [MaNV]) VALUES (6, CAST(N'2024-07-12T00:00:00.000' AS DateTime), N'Đã hoàn thành', N'Online', N'Chuyển khoản', 1)
INSERT [dbo].[DonDH] ([MaDDH], [TG_Dat], [TrangThai], [HinhThuc], [ThanhToan], [MaNV]) VALUES (7, CAST(N'2024-09-02T00:00:00.000' AS DateTime), N'Đang giao hàng', N'Online', N'Tiền mặt', 3)
INSERT [dbo].[DonDH] ([MaDDH], [TG_Dat], [TrangThai], [HinhThuc], [ThanhToan], [MaNV]) VALUES (10, CAST(N'2024-05-30T02:10:00.000' AS DateTime), N'Đã hoàn thành', N'Online', N'Chuyển khoản', 2)
INSERT [dbo].[DonDH] ([MaDDH], [TG_Dat], [TrangThai], [HinhThuc], [ThanhToan], [MaNV]) VALUES (17, CAST(N'2024-05-31T05:57:47.670' AS DateTime), N'Đã hoàn thành', N'Online', N'Chuyển khoản', 3)
INSERT [dbo].[DonDH] ([MaDDH], [TG_Dat], [TrangThai], [HinhThuc], [ThanhToan], [MaNV]) VALUES (18, CAST(N'2024-05-31T06:58:54.947' AS DateTime), N'Đang chuẩn bị', N'Online', N'Chuyển khoản', 1)
INSERT [dbo].[DonDH] ([MaDDH], [TG_Dat], [TrangThai], [HinhThuc], [ThanhToan], [MaNV]) VALUES (20, CAST(N'2024-06-01T00:00:00.000' AS DateTime), N'Đang chuẩn bị', N'Online', N'Chuyển khoản', 1)
INSERT [dbo].[DonDH] ([MaDDH], [TG_Dat], [TrangThai], [HinhThuc], [ThanhToan], [MaNV]) VALUES (21, CAST(N'2024-05-31T09:59:20.717' AS DateTime), N'Đã hoàn thành', N'Online', N'Chuyển khoản', 2)
SET IDENTITY_INSERT [dbo].[DonDH] OFF
GO
SET IDENTITY_INSERT [dbo].[GiaoHang] ON 

INSERT [dbo].[GiaoHang] ([MaGH], [MaNV], [MaDDH], [ThoiGian_BD], [ThoiGian_KT], [TenNguoiNhan], [SDT], [DiaChiGH]) VALUES (2, 1, 2, CAST(N'2024-05-30T08:10:00.000' AS DateTime), CAST(N'2024-05-31T00:00:00.000' AS DateTime), N'Mie', N'0363032802', N'Phường Tăng Nhơn Phú A, quận 9')
INSERT [dbo].[GiaoHang] ([MaGH], [MaNV], [MaDDH], [ThoiGian_BD], [ThoiGian_KT], [TenNguoiNhan], [SDT], [DiaChiGH]) VALUES (3, 3, 6, CAST(N'2024-07-13T00:00:00.000' AS DateTime), CAST(N'2024-07-20T00:00:00.000' AS DateTime), N'Thành Nam', N'0329899232', N'Phường 2, Quận 1')
INSERT [dbo].[GiaoHang] ([MaGH], [MaNV], [MaDDH], [ThoiGian_BD], [ThoiGian_KT], [TenNguoiNhan], [SDT], [DiaChiGH]) VALUES (7, 1, 10, CAST(N'2024-05-31T02:43:32.480' AS DateTime), CAST(N'2024-06-02T00:00:00.000' AS DateTime), N'Mie', N'023458', N'Quận 9')
INSERT [dbo].[GiaoHang] ([MaGH], [MaNV], [MaDDH], [ThoiGian_BD], [ThoiGian_KT], [TenNguoiNhan], [SDT], [DiaChiGH]) VALUES (8, 1, 17, CAST(N'2024-05-31T06:07:40.697' AS DateTime), CAST(N'2024-06-20T00:00:00.000' AS DateTime), N'Cường', N'054678999', N'Quận Bình Thạnh')
INSERT [dbo].[GiaoHang] ([MaGH], [MaNV], [MaDDH], [ThoiGian_BD], [ThoiGian_KT], [TenNguoiNhan], [SDT], [DiaChiGH]) VALUES (9, 3, 7, CAST(N'2024-09-04T00:00:00.000' AS DateTime), NULL, N'Nam', N'0123654879', N'97 Man Thiện')
INSERT [dbo].[GiaoHang] ([MaGH], [MaNV], [MaDDH], [ThoiGian_BD], [ThoiGian_KT], [TenNguoiNhan], [SDT], [DiaChiGH]) VALUES (10, 1, 21, CAST(N'2024-05-31T10:06:28.540' AS DateTime), CAST(N'2024-06-12T00:00:00.000' AS DateTime), N'Hùng', N'036565989', N'Quận 9')
SET IDENTITY_INSERT [dbo].[GiaoHang] OFF
GO
SET IDENTITY_INSERT [dbo].[GioHang] ON 

INSERT [dbo].[GioHang] ([MaGio], [usernameKH], [MaSP], [SoLuong], [TrangThai]) VALUES (1, N'mie239', 2, 0, 0)
INSERT [dbo].[GioHang] ([MaGio], [usernameKH], [MaSP], [SoLuong], [TrangThai]) VALUES (2, N'mie239', 5, 0, 0)
INSERT [dbo].[GioHang] ([MaGio], [usernameKH], [MaSP], [SoLuong], [TrangThai]) VALUES (3, N'luat03', 7, 0, 0)
INSERT [dbo].[GioHang] ([MaGio], [usernameKH], [MaSP], [SoLuong], [TrangThai]) VALUES (5, N'luat03', 8, 0, 0)
INSERT [dbo].[GioHang] ([MaGio], [usernameKH], [MaSP], [SoLuong], [TrangThai]) VALUES (6, N'luat03', 2, 0, 0)
INSERT [dbo].[GioHang] ([MaGio], [usernameKH], [MaSP], [SoLuong], [TrangThai]) VALUES (7, N'xnam2003', 3, 0, 0)
INSERT [dbo].[GioHang] ([MaGio], [usernameKH], [MaSP], [SoLuong], [TrangThai]) VALUES (8, N'tmkhai22', 1, 1, 1)
INSERT [dbo].[GioHang] ([MaGio], [usernameKH], [MaSP], [SoLuong], [TrangThai]) VALUES (10, N'luat03', 6, 0, 0)
INSERT [dbo].[GioHang] ([MaGio], [usernameKH], [MaSP], [SoLuong], [TrangThai]) VALUES (11, N'luat03', 10, 0, 0)
SET IDENTITY_INSERT [dbo].[GioHang] OFF
GO
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'ADID', N'ADIDAS')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'CONV', N'CONVERSE')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'FILA', N'FILA')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'MLB', N'Major League Baseball')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'BALA', N'NEW BALANCE')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (N'NIKE', N'NIKE')
GO
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [TongTien], [ThoiGian], [MaNV]) VALUES (3, 1800000.0000, CAST(N'2024-05-30T13:55:23.353' AS DateTime), 2)
INSERT [dbo].[HoaDon] ([MaHD], [TongTien], [ThoiGian], [MaNV]) VALUES (4, 6700000.0000, CAST(N'2024-06-01T13:54:32.510' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [TongTien], [ThoiGian], [MaNV]) VALUES (5, 2000000.0000, CAST(N'2024-07-02T13:51:32.190' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [TongTien], [ThoiGian], [MaNV]) VALUES (6, 5400000.0000, CAST(N'2024-07-12T13:52:05.830' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [TongTien], [ThoiGian], [MaNV]) VALUES (7, 100000.0000, CAST(N'2024-05-30T15:43:27.320' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [TongTien], [ThoiGian], [MaNV]) VALUES (9, 2100000.0000, CAST(N'2024-05-30T14:09:52.013' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [TongTien], [ThoiGian], [MaNV]) VALUES (14, 2000000.0000, CAST(N'2024-05-31T06:01:50.473' AS DateTime), 4)
INSERT [dbo].[HoaDon] ([MaHD], [TongTien], [ThoiGian], [MaNV]) VALUES (15, 3000000.0000, CAST(N'2024-05-31T07:01:01.737' AS DateTime), 1)
INSERT [dbo].[HoaDon] ([MaHD], [TongTien], [ThoiGian], [MaNV]) VALUES (17, 0.0000, NULL, NULL)
INSERT [dbo].[HoaDon] ([MaHD], [TongTien], [ThoiGian], [MaNV]) VALUES (18, 2300000.0000, CAST(N'2024-05-31T10:04:09.683' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [SDT], [Email]) VALUES (1, N'Nguyễn Thị Huyền', N'My', N'0363032802', N'nmhhuong3@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [SDT], [Email]) VALUES (2, N'Lê Ngọc', N'Luân', N'0545452158', N'lngola@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [SDT], [Email]) VALUES (3, N'Nguyễn Đình', N'Luật', N'0916487224', N'luatnwe@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [SDT], [Email]) VALUES (4, N'Đặng Xuân', N'Nam', N'0787512942', N'dangxnam21@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [SDT], [Email]) VALUES (5, N'Trần Minh', N'Khải', N'0456487898', N'serwr@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [SDT], [Email]) VALUES (6, N'dang', N'nam', N'23232', N'n@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [SDT], [Email]) VALUES (9, N'dang', N'nam', N'010603', N'nam111@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [SDT], [Email]) VALUES (10, N'v', N'a', N'09013', N'q12@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [SDT], [Email]) VALUES (11, N'Nguyễn Thái', N'Hà', N'0123123215', N'thaiha_ha@gmail.com')
INSERT [dbo].[KhachHang] ([MaKH], [Ho], [Ten], [SDT], [Email]) VALUES (12, N'Nguyễn Văn', N'Minh', N'0465465488', N'vanminh@gmail.com')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
GO
SET IDENTITY_INSERT [dbo].[KhuyenMai] ON 

INSERT [dbo].[KhuyenMai] ([MaDotKM], [MaNV], [LyDo], [ThoiGian_BD], [ThoiGian_KT]) VALUES (6, 3, N'Tri ân Ngày Nhà giáo Việt Nam', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(N'2024-06-05T00:00:00.000' AS DateTime))
INSERT [dbo].[KhuyenMai] ([MaDotKM], [MaNV], [LyDo], [ThoiGian_BD], [ThoiGian_KT]) VALUES (10, 2, N'Mừng ngày Trái Đất', CAST(N'2024-06-06T00:00:00.000' AS DateTime), CAST(N'2024-06-10T00:00:00.000' AS DateTime))
INSERT [dbo].[KhuyenMai] ([MaDotKM], [MaNV], [LyDo], [ThoiGian_BD], [ThoiGian_KT]) VALUES (15, 2, N'Nghỉ', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(N'2024-06-10T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[KhuyenMai] OFF
GO
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'BOO', N'Boot')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'CAO', N'Cao gót')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'CUS', N'Custom')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'DER', N'Derby')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'OXF', N'Oxford')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'PEN', N'Penny Loafer')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'SAN', N'Sandal')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (N'SNE', N'Sneaker')
GO
SET IDENTITY_INSERT [dbo].[NhanVien] ON 

INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [CCCD], [NgaySinh], [SDT], [Email], [NghiViec]) VALUES (1, N'Nguyễn Thị Huyền', N'My', N'Nữ', N'232323232', CAST(N'2003-10-18' AS Date), N'0363032802', N'nmhh33@gmail.com', 0)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [CCCD], [NgaySinh], [SDT], [Email], [NghiViec]) VALUES (2, N'Trần Anh', N'Dũng', N'Nam', N'415465212', CAST(N'2002-12-12' AS Date), N'056528776', N'tahung@gmail.com', 0)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [CCCD], [NgaySinh], [SDT], [Email], [NghiViec]) VALUES (3, N'Lâm Thị Yến', N'Như', N'Nữ', N'398420938', CAST(N'2005-04-01' AS Date), N'0243288579', N'ltyennhu@gmail.com', 0)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [CCCD], [NgaySinh], [SDT], [Email], [NghiViec]) VALUES (4, N'Lê Ngọc', N'Luân', N'Nam', N'990694300', CAST(N'2001-01-14' AS Date), N'0365325865', N'llluan123@gmail.com', 0)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [CCCD], [NgaySinh], [SDT], [Email], [NghiViec]) VALUES (6, N'Nguyễn Minh', N'Nhật', N'Nam', N'48723500675', CAST(N'2002-02-02' AS Date), N'0458792239', N'soisieuquay@gmail,com', 1)
INSERT [dbo].[NhanVien] ([MaNV], [Ho], [Ten], [GioiTinh], [CCCD], [NgaySinh], [SDT], [Email], [NghiViec]) VALUES (8, N'Trần Minh', N'Hoàng', N'Nam', N'3546490097', CAST(N'2004-02-02' AS Date), N'056989789', N'minhhoanghihi@gmail.com', 1)
SET IDENTITY_INSERT [dbo].[NhanVien] OFF
GO
SET IDENTITY_INSERT [dbo].[PhieuBH] ON 

INSERT [dbo].[PhieuBH] ([MaBH], [MaCTDDH], [MaNV], [Ngay_BD], [Ngay_KT]) VALUES (1, 1, 1, CAST(N'2024-05-31' AS Date), CAST(N'2025-05-31' AS Date))
INSERT [dbo].[PhieuBH] ([MaBH], [MaCTDDH], [MaNV], [Ngay_BD], [Ngay_KT]) VALUES (3, 2, 2, CAST(N'2024-06-01' AS Date), CAST(N'2025-06-01' AS Date))
INSERT [dbo].[PhieuBH] ([MaBH], [MaCTDDH], [MaNV], [Ngay_BD], [Ngay_KT]) VALUES (4, 3, 2, CAST(N'2024-06-01' AS Date), CAST(N'2025-06-01' AS Date))
INSERT [dbo].[PhieuBH] ([MaBH], [MaCTDDH], [MaNV], [Ngay_BD], [Ngay_KT]) VALUES (6, 4, 1, CAST(N'2024-07-02' AS Date), CAST(N'2025-07-02' AS Date))
INSERT [dbo].[PhieuBH] ([MaBH], [MaCTDDH], [MaNV], [Ngay_BD], [Ngay_KT]) VALUES (7, 5, 1, CAST(N'2024-07-13' AS Date), CAST(N'2025-07-13' AS Date))
INSERT [dbo].[PhieuBH] ([MaBH], [MaCTDDH], [MaNV], [Ngay_BD], [Ngay_KT]) VALUES (8, 6, 1, CAST(N'2024-07-13' AS Date), CAST(N'2025-07-13' AS Date))
INSERT [dbo].[PhieuBH] ([MaBH], [MaCTDDH], [MaNV], [Ngay_BD], [Ngay_KT]) VALUES (9, 13, 1, CAST(N'2024-06-01' AS Date), CAST(N'2025-06-01' AS Date))
SET IDENTITY_INSERT [dbo].[PhieuBH] OFF
GO
SET IDENTITY_INSERT [dbo].[QTQuanLy] ON 

INSERT [dbo].[QTQuanLy] ([MaQL], [MaNV], [Ngay_BD], [NhiemKy], [Ngay_KT], [TrangThai]) VALUES (1, 1, CAST(N'2024-03-20' AS Date), 6, NULL, 0)
SET IDENTITY_INSERT [dbo].[QTQuanLy] OFF
GO
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MauSac], [Size], [ChatLieu], [XuatXu], [Gia], [TG_BaoHanh], [SLTon], [MaHang], [MaLoai]) VALUES (1, N'Giày Nike Air Force 1', N'Đỏ', 36, N'Da', N'Việt Nam', 2000000.0000, 6, 1, N'NIKE', N'SNE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MauSac], [Size], [ChatLieu], [XuatXu], [Gia], [TG_BaoHanh], [SLTon], [MaHang], [MaLoai]) VALUES (2, N'Giày Nike Air Force', N'Đỏ', 37, N'Da', N'Việt Nam', 2000000.0000, 6, 12, N'NIKE', N'SNE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MauSac], [Size], [ChatLieu], [XuatXu], [Gia], [TG_BaoHanh], [SLTon], [MaHang], [MaLoai]) VALUES (3, N'Giày Nike Jordan 1', N'Xanh trắng', 37, N'Da', N'Việt Nam', 2300000.0000, 12, 19, N'NIKE', N'SNE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MauSac], [Size], [ChatLieu], [XuatXu], [Gia], [TG_BaoHanh], [SLTon], [MaHang], [MaLoai]) VALUES (4, N'Giày Converse 1970s True Navy', N'Xanh', 37, N'Da', N'Việt Nam', 1820000.0000, 12, 12, N'CONV', N'SNE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MauSac], [Size], [ChatLieu], [XuatXu], [Gia], [TG_BaoHanh], [SLTon], [MaHang], [MaLoai]) VALUES (5, N'Giày Converse 1970s True Navy', N'Vàng', 37, N'Da', N'Việt Nam', 2000000.0000, 6, 14, N'CONV', N'SNE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MauSac], [Size], [ChatLieu], [XuatXu], [Gia], [TG_BaoHanh], [SLTon], [MaHang], [MaLoai]) VALUES (6, N'Giày Converse 1970s True Navy', N'Vàng', 36, N'Da', N'Việt Nam', 2100000.0000, 6, 7, N'CONV', N'SNE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MauSac], [Size], [ChatLieu], [XuatXu], [Gia], [TG_BaoHanh], [SLTon], [MaHang], [MaLoai]) VALUES (7, N'Giày  Adidas Ultra Boost 22', N'Trắng', 36, N'Da', N'Việt Nam', 3100000.0000, 5, 9, N'ADID', N'SNE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MauSac], [Size], [ChatLieu], [XuatXu], [Gia], [TG_BaoHanh], [SLTon], [MaHang], [MaLoai]) VALUES (8, N'Giày Adidas Duramo 10 ', N'Đen', 37, N'Da', N'Việt Nam', 2300000.0000, 10, 24, N'ADID', N'SNE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MauSac], [Size], [ChatLieu], [XuatXu], [Gia], [TG_BaoHanh], [SLTon], [MaHang], [MaLoai]) VALUES (9, N'Giày Adidas Terrex Speed Ultra', N'Đen Trắng', 37, N'Da', N'Việt Nam', 3300000.0000, 12, 12, N'ADID', N'SNE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MauSac], [Size], [ChatLieu], [XuatXu], [Gia], [TG_BaoHanh], [SLTon], [MaHang], [MaLoai]) VALUES (10, N'Giày Adidas Terrex Speed Ultra', N'Đen Xanh', 37, N'Da', N'Việt Nam', 3300000.0000, 12, 12, N'ADID', N'SNE')
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [MauSac], [Size], [ChatLieu], [XuatXu], [Gia], [TG_BaoHanh], [SLTon], [MaHang], [MaLoai]) VALUES (12, N'Giày Nike Ultra Boots', N'Trắng', 38, N'Da', N'Việt Nam', 5000000.0000, 10, 10, N'NIKE', N'SNE')
SET IDENTITY_INSERT [dbo].[SanPham] OFF
GO
INSERT [dbo].[ThayDoiGia] ([MaNV], [MaSP], [TG_ThayDoi], [TG_ApDung], [GiaCu], [GiaMoi]) VALUES (1, 1, CAST(N'2024-05-30T00:00:00.000' AS DateTime), CAST(N'2024-05-31T00:00:00.000' AS DateTime), 1500000.0000, 2000000.0000)
GO
INSERT [dbo].[TK_KhachHang] ([usernameKH], [pwKH], [MaKH]) VALUES (N'luan003', N'ahihi', 2)
INSERT [dbo].[TK_KhachHang] ([usernameKH], [pwKH], [MaKH]) VALUES (N'luat03', N'456456', 3)
INSERT [dbo].[TK_KhachHang] ([usernameKH], [pwKH], [MaKH]) VALUES (N'mie239', N'111111', 1)
INSERT [dbo].[TK_KhachHang] ([usernameKH], [pwKH], [MaKH]) VALUES (N'nam', N'123', 6)
INSERT [dbo].[TK_KhachHang] ([usernameKH], [pwKH], [MaKH]) VALUES (N'thaiha.22', N'22022005', 11)
INSERT [dbo].[TK_KhachHang] ([usernameKH], [pwKH], [MaKH]) VALUES (N'tmkhai22', N'123456', 5)
INSERT [dbo].[TK_KhachHang] ([usernameKH], [pwKH], [MaKH]) VALUES (N'vanminh.11', N'123456', 12)
INSERT [dbo].[TK_KhachHang] ([usernameKH], [pwKH], [MaKH]) VALUES (N'vqha', N'123', 10)
INSERT [dbo].[TK_KhachHang] ([usernameKH], [pwKH], [MaKH]) VALUES (N'xnam2003', N'hihihihi', 4)
GO
INSERT [dbo].[TK_NhanVien] ([usernameNV], [pwNV], [MaNV]) VALUES (N'huyynhi', N'yennhi123', 3)
INSERT [dbo].[TK_NhanVien] ([usernameNV], [pwNV], [MaNV]) VALUES (N'll', N'123456', 4)
INSERT [dbo].[TK_NhanVien] ([usernameNV], [pwNV], [MaNV]) VALUES (N'nthmy', N'123456', 1)
INSERT [dbo].[TK_NhanVien] ([usernameNV], [pwNV], [MaNV]) VALUES (N'tranhung', N'thung159', 2)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_TENHANG]    Script Date: 30/07/2024 11:47:08 pm ******/
ALTER TABLE [dbo].[Hang] ADD  CONSTRAINT [UK_TENHANG] UNIQUE NONCLUSTERED 
(
	[TenHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_EMAIL]    Script Date: 30/07/2024 11:47:08 pm ******/
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [UK_EMAIL] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_SDT]    Script Date: 30/07/2024 11:47:08 pm ******/
ALTER TABLE [dbo].[KhachHang] ADD  CONSTRAINT [UK_SDT] UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_TENLOAI]    Script Date: 30/07/2024 11:47:08 pm ******/
ALTER TABLE [dbo].[Loai] ADD  CONSTRAINT [UK_TENLOAI] UNIQUE NONCLUSTERED 
(
	[TenLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_CCCD]    Script Date: 30/07/2024 11:47:08 pm ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [UK_CCCD] UNIQUE NONCLUSTERED 
(
	[CCCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_EMAIL_NV]    Script Date: 30/07/2024 11:47:08 pm ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [UK_EMAIL_NV] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_SDT_NV]    Script Date: 30/07/2024 11:47:08 pm ******/
ALTER TABLE [dbo].[NhanVien] ADD  CONSTRAINT [UK_SDT_NV] UNIQUE NONCLUSTERED 
(
	[SDT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_MaCTDDH]    Script Date: 30/07/2024 11:47:08 pm ******/
ALTER TABLE [dbo].[PhieuBH] ADD  CONSTRAINT [UK_MaCTDDH] UNIQUE NONCLUSTERED 
(
	[MaCTDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_QTQuanLy]    Script Date: 30/07/2024 11:47:08 pm ******/
ALTER TABLE [dbo].[QTQuanLy] ADD  CONSTRAINT [UK_QTQuanLy] UNIQUE NONCLUSTERED 
(
	[MaNV] ASC,
	[Ngay_BD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_SanPham]    Script Date: 30/07/2024 11:47:08 pm ******/
ALTER TABLE [dbo].[SanPham] ADD  CONSTRAINT [UK_SanPham] UNIQUE NONCLUSTERED 
(
	[TenSP] ASC,
	[MauSac] ASC,
	[Size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_MaNV]    Script Date: 30/07/2024 11:47:08 pm ******/
ALTER TABLE [dbo].[TK_NhanVien] ADD  CONSTRAINT [UK_MaNV] UNIQUE NONCLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UK_MaNhanBH]    Script Date: 30/07/2024 11:47:08 pm ******/
ALTER TABLE [dbo].[TraBH] ADD  CONSTRAINT [UK_MaNhanBH] UNIQUE NONCLUSTERED 
(
	[MaNhanBH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[DonDH] ADD  CONSTRAINT [DF_DonDH_TG_Dat]  DEFAULT (getdate()) FOR [TG_Dat]
GO
ALTER TABLE [dbo].[GiaoHang] ADD  CONSTRAINT [DF_GiaoHang_ThoiGian_BD]  DEFAULT (getdate()) FOR [ThoiGian_BD]
GO
ALTER TABLE [dbo].[CT_DonDH]  WITH CHECK ADD  CONSTRAINT [FK_CT_DonDH_DonDH] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDH] ([MaDDH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_DonDH] CHECK CONSTRAINT [FK_CT_DonDH_DonDH]
GO
ALTER TABLE [dbo].[CT_DonDH]  WITH CHECK ADD  CONSTRAINT [FK_CT_DonDH_GioHang] FOREIGN KEY([MaGio])
REFERENCES [dbo].[GioHang] ([MaGio])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_DonDH] CHECK CONSTRAINT [FK_CT_DonDH_GioHang]
GO
ALTER TABLE [dbo].[CT_DonDH]  WITH CHECK ADD  CONSTRAINT [FK_CT_DonDH_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_DonDH] CHECK CONSTRAINT [FK_CT_DonDH_HoaDon]
GO
ALTER TABLE [dbo].[CT_KhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_CT_KhuyenMai_KhuyenMai] FOREIGN KEY([MaDotKM])
REFERENCES [dbo].[KhuyenMai] ([MaDotKM])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_KhuyenMai] CHECK CONSTRAINT [FK_CT_KhuyenMai_KhuyenMai]
GO
ALTER TABLE [dbo].[CT_KhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_CT_KhuyenMai_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CT_KhuyenMai] CHECK CONSTRAINT [FK_CT_KhuyenMai_SanPham]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [FK_DanhGia_CT_DonDH] FOREIGN KEY([MaCTDDH])
REFERENCES [dbo].[CT_DonDH] ([MaCTDDH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [FK_DanhGia_CT_DonDH]
GO
ALTER TABLE [dbo].[DoiTra]  WITH CHECK ADD  CONSTRAINT [FK_DoiTra_CT_DonDH] FOREIGN KEY([MaCTDDH])
REFERENCES [dbo].[CT_DonDH] ([MaCTDDH])
GO
ALTER TABLE [dbo].[DoiTra] CHECK CONSTRAINT [FK_DoiTra_CT_DonDH]
GO
ALTER TABLE [dbo].[DoiTra]  WITH CHECK ADD  CONSTRAINT [FK_DoiTra_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DoiTra] CHECK CONSTRAINT [FK_DoiTra_NhanVien]
GO
ALTER TABLE [dbo].[DonDH]  WITH CHECK ADD  CONSTRAINT [FK_DonDH_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[DonDH] CHECK CONSTRAINT [FK_DonDH_NhanVien]
GO
ALTER TABLE [dbo].[GiaoHang]  WITH CHECK ADD  CONSTRAINT [FK_GiaoHang_DonDH] FOREIGN KEY([MaDDH])
REFERENCES [dbo].[DonDH] ([MaDDH])
GO
ALTER TABLE [dbo].[GiaoHang] CHECK CONSTRAINT [FK_GiaoHang_DonDH]
GO
ALTER TABLE [dbo].[GiaoHang]  WITH CHECK ADD  CONSTRAINT [FK_GiaoHang_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GiaoHang] CHECK CONSTRAINT [FK_GiaoHang_NhanVien]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_SanPham]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [FK_GioHang_TK_KhachHang] FOREIGN KEY([usernameKH])
REFERENCES [dbo].[TK_KhachHang] ([usernameKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [FK_GioHang_TK_KhachHang]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_NhanVien]
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_KhuyenMai_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[KhuyenMai] CHECK CONSTRAINT [FK_KhuyenMai_NhanVien]
GO
ALTER TABLE [dbo].[NhanBH]  WITH CHECK ADD  CONSTRAINT [FK_NhanBH_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[NhanBH] CHECK CONSTRAINT [FK_NhanBH_NhanVien]
GO
ALTER TABLE [dbo].[NhanBH]  WITH CHECK ADD  CONSTRAINT [FK_NhanBH_PhieuBH] FOREIGN KEY([MaBH])
REFERENCES [dbo].[PhieuBH] ([MaBH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NhanBH] CHECK CONSTRAINT [FK_NhanBH_PhieuBH]
GO
ALTER TABLE [dbo].[PhieuBH]  WITH CHECK ADD  CONSTRAINT [FK_PhieuBH_CT_DonDH] FOREIGN KEY([MaCTDDH])
REFERENCES [dbo].[CT_DonDH] ([MaCTDDH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PhieuBH] CHECK CONSTRAINT [FK_PhieuBH_CT_DonDH]
GO
ALTER TABLE [dbo].[PhieuBH]  WITH CHECK ADD  CONSTRAINT [FK_PhieuBH_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhieuBH] CHECK CONSTRAINT [FK_PhieuBH_NhanVien]
GO
ALTER TABLE [dbo].[QTQuanLy]  WITH CHECK ADD  CONSTRAINT [FK_QuanLy_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[QTQuanLy] CHECK CONSTRAINT [FK_QuanLy_NhanVien]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Hang] FOREIGN KEY([MaHang])
REFERENCES [dbo].[Hang] ([MaHang])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Hang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Loai]
GO
ALTER TABLE [dbo].[ThayDoiGia]  WITH CHECK ADD  CONSTRAINT [FK_ThayDoiGia_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ThayDoiGia] CHECK CONSTRAINT [FK_ThayDoiGia_NhanVien]
GO
ALTER TABLE [dbo].[ThayDoiGia]  WITH CHECK ADD  CONSTRAINT [FK_ThayDoiGia_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[ThayDoiGia] CHECK CONSTRAINT [FK_ThayDoiGia_SanPham]
GO
ALTER TABLE [dbo].[TK_KhachHang]  WITH CHECK ADD  CONSTRAINT [FK_TK_KhachHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TK_KhachHang] CHECK CONSTRAINT [FK_TK_KhachHang_KhachHang]
GO
ALTER TABLE [dbo].[TK_NhanVien]  WITH CHECK ADD  CONSTRAINT [FK_TK_NhanVien_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[TK_NhanVien] CHECK CONSTRAINT [FK_TK_NhanVien_NhanVien]
GO
ALTER TABLE [dbo].[TraBH]  WITH CHECK ADD  CONSTRAINT [FK_TraBH_NhanBH] FOREIGN KEY([MaNhanBH])
REFERENCES [dbo].[NhanBH] ([MaNhanBH])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[TraBH] CHECK CONSTRAINT [FK_TraBH_NhanBH]
GO
ALTER TABLE [dbo].[TraBH]  WITH CHECK ADD  CONSTRAINT [FK_TraBH_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[TraBH] CHECK CONSTRAINT [FK_TraBH_NhanVien]
GO
ALTER TABLE [dbo].[CT_DonDH]  WITH CHECK ADD  CONSTRAINT [CK_CT_DonDH_SOLUONG] CHECK  (([SOLUONG]>(0)))
GO
ALTER TABLE [dbo].[CT_DonDH] CHECK CONSTRAINT [CK_CT_DonDH_SOLUONG]
GO
ALTER TABLE [dbo].[CT_KhuyenMai]  WITH CHECK ADD  CONSTRAINT [CK_PHANTRAMKM] CHECK  (([PHANTRAMKM]>(0) AND [PHANTRAMKM]<=(100)))
GO
ALTER TABLE [dbo].[CT_KhuyenMai] CHECK CONSTRAINT [CK_PHANTRAMKM]
GO
ALTER TABLE [dbo].[DanhGia]  WITH CHECK ADD  CONSTRAINT [CK_DanhGia_SAO] CHECK  (([Sao]>=(1) AND [Sao]<=(5)))
GO
ALTER TABLE [dbo].[DanhGia] CHECK CONSTRAINT [CK_DanhGia_SAO]
GO
ALTER TABLE [dbo].[DoiTra]  WITH CHECK ADD  CONSTRAINT [CK_DoiTra_TG_DOITRA] CHECK  (([TG_DoiTra]>=getdate()))
GO
ALTER TABLE [dbo].[DoiTra] CHECK CONSTRAINT [CK_DoiTra_TG_DOITRA]
GO
ALTER TABLE [dbo].[DonDH]  WITH CHECK ADD  CONSTRAINT [CK_HINHTHUC] CHECK  (([HinhThuc]=N'Online' OR [HinhThuc]=N'Offline (giao hàng)' OR [HinhThuc]=N'Offline (không giao hàng)'))
GO
ALTER TABLE [dbo].[DonDH] CHECK CONSTRAINT [CK_HINHTHUC]
GO
ALTER TABLE [dbo].[DonDH]  WITH CHECK ADD  CONSTRAINT [CK_THANHTOAN] CHECK  (([ThanhToan]=N'Chuyển khoản' OR [THANHTOAN]=N'Tiền mặt'))
GO
ALTER TABLE [dbo].[DonDH] CHECK CONSTRAINT [CK_THANHTOAN]
GO
ALTER TABLE [dbo].[DonDH]  WITH CHECK ADD  CONSTRAINT [CK_TRANGTHAI] CHECK  (([TrangThai]=N'Đang duyệt' OR [TrangThai]=N'Đang chuẩn bị' OR [TrangThai]=N'Đang giao hàng' OR [TrangThai]=N'Đã hủy' OR [TrangThai]=N'Đã hoàn thành'))
GO
ALTER TABLE [dbo].[DonDH] CHECK CONSTRAINT [CK_TRANGTHAI]
GO
ALTER TABLE [dbo].[GiaoHang]  WITH CHECK ADD  CONSTRAINT [CK_GiaoHang_THOIGIAN_BD] CHECK  (([ThoiGian_BD]>=getdate()))
GO
ALTER TABLE [dbo].[GiaoHang] CHECK CONSTRAINT [CK_GiaoHang_THOIGIAN_BD]
GO
ALTER TABLE [dbo].[GiaoHang]  WITH CHECK ADD  CONSTRAINT [CK_GiaoHang_THOIGIAN_KT_THOIGIAN_BD] CHECK  (([ThoiGian_KT]>[ThoiGian_BD]))
GO
ALTER TABLE [dbo].[GiaoHang] CHECK CONSTRAINT [CK_GiaoHang_THOIGIAN_KT_THOIGIAN_BD]
GO
ALTER TABLE [dbo].[GioHang]  WITH CHECK ADD  CONSTRAINT [ck_soluongspgio] CHECK  (([SoLuong]>=(0)))
GO
ALTER TABLE [dbo].[GioHang] CHECK CONSTRAINT [ck_soluongspgio]
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD  CONSTRAINT [CK_KhuyenMai_THOIGIAN_KT_THOIGIAN_BD] CHECK  (([ThoiGian_KT]>[ThoiGian_BD]))
GO
ALTER TABLE [dbo].[KhuyenMai] CHECK CONSTRAINT [CK_KhuyenMai_THOIGIAN_KT_THOIGIAN_BD]
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD  CONSTRAINT [CK_THOIGIAN_BD] CHECK  (([thoigian_bd]>=getdate()))
GO
ALTER TABLE [dbo].[KhuyenMai] CHECK CONSTRAINT [CK_THOIGIAN_BD]
GO
ALTER TABLE [dbo].[NhanBH]  WITH CHECK ADD  CONSTRAINT [CK_NhanBH_TG_NHAN] CHECK  (([TG_Nhan]>=getdate()))
GO
ALTER TABLE [dbo].[NhanBH] CHECK CONSTRAINT [CK_NhanBH_TG_NHAN]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CK_GIOITINH] CHECK  (([gioitinh]=N'Nam' OR [gioitinh]=N'Nữ'))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_GIOITINH]
GO
ALTER TABLE [dbo].[NhanVien]  WITH CHECK ADD  CONSTRAINT [CK_NGAYSINH] CHECK  (([NGAYSINH]<CONVERT([date],getdate())))
GO
ALTER TABLE [dbo].[NhanVien] CHECK CONSTRAINT [CK_NGAYSINH]
GO
ALTER TABLE [dbo].[PhieuBH]  WITH CHECK ADD  CONSTRAINT [CK_PhieuBH_NGAY_BD] CHECK  (([Ngay_BD]>=CONVERT([date],getdate())))
GO
ALTER TABLE [dbo].[PhieuBH] CHECK CONSTRAINT [CK_PhieuBH_NGAY_BD]
GO
ALTER TABLE [dbo].[PhieuBH]  WITH CHECK ADD  CONSTRAINT [CK_PhieuBH_NGAY_KT_NGAY_BD] CHECK  (([Ngay_KT]>[Ngay_BD]))
GO
ALTER TABLE [dbo].[PhieuBH] CHECK CONSTRAINT [CK_PhieuBH_NGAY_KT_NGAY_BD]
GO
ALTER TABLE [dbo].[QTQuanLy]  WITH CHECK ADD  CONSTRAINT [CK_QuanLy_NGAY_KT_NGAY_BD] CHECK  (([Ngay_KT]>[Ngay_BD]))
GO
ALTER TABLE [dbo].[QTQuanLy] CHECK CONSTRAINT [CK_QuanLy_NGAY_KT_NGAY_BD]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [CK_GIA] CHECK  (([GIA]>(0)))
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [CK_GIA]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [CK_SIZE] CHECK  (([SIZE]>=(15) AND [SIZE]<=(45)))
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [CK_SIZE]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [CK_SLTON] CHECK  (([SLTON]>=(0)))
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [CK_SLTON]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [CK_TG_BAOHANH] CHECK  (([TG_BAOhANH]>(0)))
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [CK_TG_BAOHANH]
GO
ALTER TABLE [dbo].[ThayDoiGia]  WITH CHECK ADD  CONSTRAINT [CK_ThayDoiGia_GIACU_GIAMOI] CHECK  (([GiaCu]<>[GiaMoi]))
GO
ALTER TABLE [dbo].[ThayDoiGia] CHECK CONSTRAINT [CK_ThayDoiGia_GIACU_GIAMOI]
GO
/****** Object:  StoredProcedure [dbo].[SP_CapNhatDotKhuyenMai]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_CapNhatDotKhuyenMai]
@maDotKM int,
@manv int,
@lyDo NVARCHAR(100),
@tgianBD DATETIME,
@tgianKT DATETIME
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE KhuyenMai
	SET MaNV = @manv,
	LyDo = @lyDo,
	ThoiGian_BD = @tgianBD,
	ThoiGian_KT = @tgianKT
	WHERE MaDotKM = @maDotKM
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ChinhSuaSoLuongSanPhamTrongGioHang]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ChinhSuaSoLuongSanPhamTrongGioHang]
    @MaSP INT,
    @SoLuong TINYINT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM SanPham WHERE MaSP = @MaSP)
    BEGIN
        IF EXISTS (SELECT 1 FROM GioHang WHERE MaSP = @MaSP)
        BEGIN
            UPDATE GioHang
            SET SoLuong = SoLuong + @SoLuong
            WHERE MaSP = @MaSP;
            PRINT N'Số lượng sản phẩm trong giỏ hàng đã được cập nhật.';
        END
    END
    ELSE
    BEGIN
        RAISERROR('Không tồn tại tài khoản này.', 16, 1);
    END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ChinhSuaThongTinKhachHang]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ChinhSuaThongTinKhachHang]
    @usernameKH VARCHAR(50),
    @Ho NVARCHAR(100),
	@Ten NVARCHAR(50),
	@Sdt NVARCHAR(20),
    @Email NVARCHAR(100) 
  
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @MaKh VARCHAR(10);

    SELECT @MaKh = MaKh
    FROM TK_KhachHang
    WHERE usernameKH = @usernameKH;

    IF @MaKh IS NULL
    BEGIN
        PRINT 'không tìm thấy KH nào';
        RETURN;
    END

    UPDATE KhachHang
    SET
        Ho = COALESCE(@Ho, Ho),
	Ten = COALESCE(@Ten, Ten),
        Email = COALESCE(@Email, Email),
        SDT = COALESCE(@Sdt, Sdt)
    WHERE maKh = @MaKh
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ChinhSuaThongTinNhanVien]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ChinhSuaThongTinNhanVien]
@MANV INT,
@HO NVARCHAR(100), @TEN NVARCHAR(50), @GIOITINH NVARCHAR(3), @CCCD VARCHAR(12), 
@NGAYSINH DATE, @SDT VARCHAR(10), @EMAIL VARCHAR(50),@NGHIVIEC BIT
AS
BEGIN
	UPDATE NhanVien
	SET Ho=@HO,Ten=@TEN,GioiTinh=@GIOITINH,CCCD=@CCCD,NgaySinh=@NGAYSINH,SDT=@SDT,Email=@EMAIL,NghiViec=@NGHIVIEC
	WHERE MANV = @MANV
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DoiMatKhauTKKhachHang]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DoiMatKhauTKKhachHang]
    @username NVARCHAR(50),
    @oldPW NVARCHAR(50),
    @newPW NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @existingPW NVARCHAR(50);

    SELECT @existingPW = pwKH
    FROM TK_KhachHang
    WHERE usernameKH = @username;

    IF @existingPW <> @oldPW
    BEGIN
        RAISERROR ('Mật khẩu cũ không chính xác.', 16, 1);
        RETURN;
    END;

    UPDATE TK_KhachHang
    SET pwKH = @newPW
    WHERE usernameKH = @username;

END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DoiMatKhauTKNhanVien]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DoiMatKhauTKNhanVien]
    @username NVARCHAR(50),
    @oldPW NVARCHAR(50),
    @newPW NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @existingPW NVARCHAR(50);

    SELECT @existingPW = pwNV
    FROM TK_NhanVien

    WHERE usernameNV = @username;

    IF @existingPW <> @oldPW
    BEGIN
        RAISERROR ('Mật khẩu cũ không chính xác.', 16, 1);
        RETURN;
    END;

    UPDATE TK_NhanVien
    SET pwNV = @newPW
    WHERE usernameNV = @username;

END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DuyetDonHang]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_DuyetDonHang]
	@maddh int,
	@manv int
AS
BEGIN
	IF EXISTS (SELECT * FROM DonDH WHERE MaDDH = @maddh AND TrangThai = N'Đang duyệt')
	BEGIN
		UPDATE DonDH
		SET TrangThai = N'Đang chuẩn bị',
			MaNV = @manv
		WHERE MaDDH = @maddh
	END

	ELSE
	BEGIN
		RAISERROR('Đơn hàng này không tồn tại hoặc không thể duyệt.', 16, 1)
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[SP_GiaoHangTheoDon]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_GiaoHangTheoDon]
    @manv INT,
    @maddh INT,
    @ten NVARCHAR(100),
    @sdt NVARCHAR(15),
    @diachi NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    BEGIN TRANSACTION;

    BEGIN TRY
        IF EXISTS (SELECT 1 FROM DonDH WHERE MaDDH = @maddh AND TrangThai = N'Đang chuẩn bị')
        BEGIN
            INSERT INTO GiaoHang (MaNV, MaDDH, TenNguoiNhan, SDT, DiaChiGH)
            VALUES (@manv, @maddh, @ten, @sdt, @diachi);

            UPDATE DonDH
            SET TrangThai = N'Đang giao hàng'
            WHERE MaDDH = @maddh;
        END
        ELSE
        BEGIN
            RAISERROR('Đơn hàng không tồn tại hoặc trạng thái không hợp lệ.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        COMMIT TRANSACTION;
    END TRY

    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000)

        SELECT 
            @ErrorMessage = ERROR_MESSAGE()

        RAISERROR (@ErrorMessage, 16, 1);
        
        ROLLBACK TRANSACTION;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_KhachHangDangNhap]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_KhachHangDangNhap]
    @username NVARCHAR(50),
    @pw NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM TK_KhachHang WHERE usernameKH = @username)
    BEGIN
        IF EXISTS (SELECT 1 FROM TK_KhachHang WHERE usernameKH = @username AND pwKH = @pw)
        BEGIN
            SELECT KH.MaKH, KH.Ho, KH.Ten, KH.SDT, KH.Email
            FROM KhachHang KH
            INNER JOIN TK_KhachHang TK ON KH.MaKH = TK.MaKH
            WHERE TK.usernameKH = @username;
        END
        ELSE
        BEGIN
            RAISERROR('Sai mật khẩu.', 16, 1);
        END
    END
    ELSE
    BEGIN
        RAISERROR('Tài khoản không tồn tại.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_NhanVienDangNhap]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_NhanVienDangNhap]
    @username NVARCHAR(50),
    @pw NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM TK_NhanVien WHERE usernameNV = @username)
    BEGIN
        IF EXISTS (SELECT 1 FROM TK_NhanVien WHERE usernameNV = @username AND pwNV = @pw)
        BEGIN
            SELECT NV.Ho, NV.Ten, NV.GioiTinh, NV.CCCD, NV.NgaySinh, NV.SDT, NV.Email
            FROM NhanVien NV
            INNER JOIN TK_NhanVien TK ON NV.MaNV = TK.MaNV
            WHERE TK.usernameNV = @username;
        END
        ELSE
        BEGIN
            RAISERROR('Sai mật khẩu.', 16, 1);
        END
    END
    ELSE
    BEGIN
        RAISERROR('Tài khoản này không tồn tại.', 16, 1);
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_TaoDonHang]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TaoDonHang]
@HINHTHUC NVARCHAR(20), @THANHTOAN NVARCHAR(20)
AS
BEGIN
	INSERT INTO DonDH(TG_Dat,TrangThai,HinhThuc,ThanhToan)
	VALUES(GETDATE(),N'Đang duyệt',@HINHTHUC,@THANHTOAN);
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TaoDotKhuyenMai]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TaoDotKhuyenMai]
@manv INT,
@lyDo NVARCHAR(100),
@tgianBD DATETIME,
@tgianKT DATETIME
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM KhuyenMai WHERE ThoiGian_BD = @tgianBD AND ThoiGian_KT = @tgianKT)
	BEGIN
		RAISERROR('Đã tồn tại mã đợt khuyến mãi khác trùng với khoảng thời gian này.', 16, 1);
	END
	ELSE
	BEGIN
		INSERT INTO KhuyenMai(MaNV, LyDo, ThoiGian_BD, ThoiGian_KT)
		VALUES (@manv, @lyDo, @tgianBD, @tgianKT)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TaoTKKhachHang]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TaoTKKhachHang]
    @Ho NVARCHAR(50),
    @Ten NVARCHAR(50),
    @SDT NVARCHAR(20),
    @Email NVARCHAR(100),
    @Username NVARCHAR(50),
    @Password NVARCHAR(50)
	
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO KhachHang (Ho, Ten, SDT, Email)
    VALUES (@Ho, @Ten, @SDT, @Email);
	declare @MaKH NVARCHAR(10)
	select top 1 @MaKH = MaKH from KhachHang order by MaKH desc
    INSERT INTO TK_KhachHang (usernameKH, pwKH, MaKH)
    VALUES (@Username, @Password, @MaKH);

   
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_TaoTKNhanVien]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TaoTKNhanVien]
    @Ho NVARCHAR(50),
    @Ten NVARCHAR(50),
	@GioiTinh NVARCHAR(3),
	@NgaySinh date,
    @SDT NVARCHAR(20),
	@cccd VARCHAR(12),
    @Email NVARCHAR(100),
    @Username NVARCHAR(50),
    @Password NVARCHAR(50)
	
	
AS
BEGIN TRANSACTION
begin try
    SET NOCOUNT ON;

    INSERT INTO NhanVien (Ho, Ten, SDT, Email, NghiViec, GioiTinh, CCCD, NgaySinh)
    VALUES (@Ho, @Ten, @SDT, @Email, 0, @GioiTinh, @cccd, @NgaySinh);
	declare @MANV varchar(10)
	SELECT TOP 1 @MANV = MANV FROM NHANVIEN ORDER BY MANV DESC

    INSERT INTO TK_NhanVien (usernameNV, pwNV, MaNV)
    VALUES (@Username, @Password, @MaNV);
commit
end try
BEGIN CATCH
   ROLLBACK
   DECLARE @ErrorMessage VARCHAR(2000)
   SELECT @ErrorMessage = 'Lỗi: ' + ERROR_MESSAGE()
   RAISERROR(@ErrorMessage, 16, 1)
END CATCH
GO
/****** Object:  StoredProcedure [dbo].[SP_Test]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_Test]
AS
SELECT * FROM HOADON
GO
/****** Object:  StoredProcedure [dbo].[SP_ThayDoiThongTinSanPham]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ThayDoiThongTinSanPham]
    @masp INT,
    @tensp NVARCHAR(50),
    @mausac NVARCHAR(10),
    @size TINYINT,
    @chatlieu NVARCHAR(30),
    @xuatxu NVARCHAR(30),
    @gia money,
    @tg_bh tinyint,
    @slt smallint,
    @mahang  varchar(10),
    @maloai  varchar(10)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE SanPham
    SET TenSP = @tensp,
        MauSac = @mausac,
        Size = @size,
		ChatLieu=@chatlieu,
		XuatXu=@xuatxu,
		Gia=@gia,
		TG_BaoHanh=@tg_bh,
		SLTon=@slt,
		MaHang=@mahang,
		MaLoai=@maloai

	WHERE MaSP = @masp;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ThemChiTietDonHang]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ThemChiTietDonHang]
    @magio INT,
    @maddh INT,
    @sl INT,
    @mahd INT
AS
BEGIN
    SET NOCOUNT ON;

        BEGIN TRANSACTION;

        IF NOT EXISTS (SELECT 1 FROM GioHang WHERE MaGio = @magio AND TrangThai <> 0)
        BEGIN
            RAISERROR('Mã Giỏ không tồn tại.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        IF NOT EXISTS (SELECT 1 FROM DonDH WHERE MaDDH = @maddh)
        BEGIN
            RAISERROR('Mã Đơn hàng không tồn tại.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        IF EXISTS (SELECT 1 
                   FROM CT_DonDH CT
                   JOIN HoaDon HD ON CT.MaHD = HD.MaHD
                   WHERE CT.MaDDH = @maddh AND HD.TongTien <> 0)
        BEGIN
            RAISERROR('Đơn hàng này đã được thanh toán.', 16, 1);
            ROLLBACK TRANSACTION;
            RETURN;
        END

        INSERT INTO CT_DonDH (MaGio, MaDDH, SoLuong, MaHD)
        VALUES (@magio, @maddh, @sl, @mahd);

        COMMIT TRANSACTION;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ThemSanPhamMoi]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_ThemSanPhamMoi]
    @tensp NVARCHAR(50),
    @mausac NVARCHAR(10),
    @size TINYINT,
    @chatlieu NVARCHAR(30),
    @xuatxu NVARCHAR(30),
    @gia money,
    @tg_bh tinyint,
    @slt smallint,
    @mahang  varchar(10),
    @maloai  varchar(10)
AS
BEGIN
    INSERT INTO SanPham(TenSP, MauSac, Size, ChatLieu, XuatXu,Gia,TG_BaoHanh,SLTon,MaHang,MaLoai)
    VALUES (@tensp, @mausac, @size, @chatlieu, @xuatxu,@gia,@tg_bh,@slt,@mahang,@maloai);
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_ThemSanPhamVaoDotKM]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ThemSanPhamVaoDotKM]
	@madotkm int,
	@masp int,
	@phantram tinyint
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM KhuyenMai WHERE MaDotKM = @madotkm)
	BEGIN
		RAISERROR('Mã đợt khuyến mãi này không tồn tại.', 16, 1);
		RETURN
	END

	IF NOT EXISTS (SELECT * FROM SanPham WHERE MaSP = @masp)
	BEGIN
		RAISERROR('Mã sản phẩm này không tồn tại.', 16, 1);
		RETURN
	END

	INSERT INTO CT_KhuyenMai (MaDotKM, MaSP, PhanTramKM)
	VALUES (@madotkm, @masp, @phantram)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_ThongTinGioHangTheoTKKhachHang]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_ThongTinGioHangTheoTKKhachHang]
    @username NVARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM GioHang WHERE usernameKH = @username AND TrangThai = 1)
    BEGIN
        SELECT SP.TenSP, SP.MauSac, SP.Size, GH.SoLuong, SP.Gia
        FROM GioHang GH
        INNER JOIN SanPham SP ON GH.MaSP = SP.MaSP
        WHERE GH.usernameKH = @username AND GH.TrangThai = 1;
    END
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_TinhTienHoaDonTheoMa]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TinhTienHoaDonTheoMa]
	@MADDH INT,
	@MANV INT
AS
BEGIN
	DECLARE @TONGTIEN FLOAT, @MAHD VARCHAR(20)
	SELECT DISTINCT @MAHD = MAHD FROM CT_DonDH WHERE MADDH = @MADDH 

	SELECT SP.MASP,SP.GIA, CTDH.SOLUONG, PhanTramKM = (
CASE
	WHEN (SP.MASP IN (SELECT MASP FROM CT_KhuyenMai) AND GETDATE() BETWEEN KM.ThoiGian_BD AND KM.ThoiGian_KT) THEN ISNULL(PhanTramKM,0)
	ELSE 0
END), THANHTIEN = (
CASE
	WHEN (SP.MASP IN (SELECT MASP FROM CT_KhuyenMai) AND GETDATE() BETWEEN KM.ThoiGian_BD AND KM.ThoiGian_KT) THEN CTDH.SOLUONG*SP.GIA*((100-ISNULL(PhanTramKM,0))/100.00)
	ELSE CTDH.SOLUONG*SP.GIA
END)
INTO #TEMP
FROM CT_DonDH CTDH INNER JOIN GioHang GH ON CTDH.MaGio = GH.MaGio INNER JOIN SanPham SP ON GH.MaSP = SP.MASP 
LEFT JOIN CT_KhuyenMai CTKM ON SP.MaSP = CTKM.MASP LEFT JOIN KhuyenMai KM ON CTKM.MaDotKM = KM.MaDotKM
	WHERE CTDH.MADDH = @MADDH
	SELECT @TONGTIEN = SUM(THANHTIEN) FROM #TEMP
	UPDATE HoaDon SET TongTien=@TONGTIEN,ThoiGian=GETDATE(), MaNV = @MANV WHERE MAHD = @MAHD
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TongDoanhThuTheoKhoangTG]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TongDoanhThuTheoKhoangTG]
    @fromDate DATETIME,
    @toDate DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    SELECT SUM(TongTien) AS TongDoanhThu
    FROM HoaDon
    WHERE ThoiGian BETWEEN @fromDate AND @toDate;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_TongDoanhThuTheoNam]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_TongDoanhThuTheoNam]
@nam INT
AS
BEGIN
	SELECT DOANHTHU = SUM(TongTien)
	FROM HoaDon
	WHERE YEAR([ThoiGian]) = @nam
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_XemDoanhThuTopCacSanPhamBanChayNhat]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XemDoanhThuTopCacSanPhamBanChayNhat]
@top TINYINT
AS
BEGIN
    WITH ProductSales AS (
        SELECT 
            SP.MaSP, 
            SP.TenSP, 
            CTDDH.SoLuong, 
            SP.Gia AS DonGia,
            CASE 
                WHEN SP.MaSP IN (SELECT MaSP FROM CT_KhuyenMai) AND HD.ThoiGian BETWEEN KM.ThoiGian_BD AND KM.ThoiGian_KT 
                THEN ISNULL(CTKM.PhanTramKM, 0) * CTDDH.SoLuong * SP.Gia / 100 
                ELSE 0 
            END AS TienGiamGia,
            CTDDH.SoLuong * SP.Gia AS TongTienTruocGiamGia
        FROM SanPham SP
        INNER JOIN GioHang GH ON SP.MaSP = GH.MaSP
        INNER JOIN CT_DonDH CTDDH ON GH.MaGio = CTDDH.MaGio
        LEFT JOIN CT_KhuyenMai CTKM ON SP.MaSP = CTKM.MaSP
        LEFT JOIN KhuyenMai KM ON CTKM.MaDotKM = KM.MaDotKM
        INNER JOIN HoaDon HD ON CTDDH.MaHD = HD.MaHD
        WHERE CTDDH.MaHD IS NOT NULL
    )
    SELECT TOP (@top) 
        MaSP, 
        TenSP, 
        SUM(SoLuong) AS SoLuong, 
        DonGia, 
        SUM(TongTienTruocGiamGia - TienGiamGia) AS TongTien,
        SUM(TongTienTruocGiamGia) AS TongTienTruocGiamGia,
        SUM(TienGiamGia) AS TienGiamGia
    FROM ProductSales
    GROUP BY MaSP, TenSP, DonGia
    ORDER BY TongTien DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XemDonDHTheoTrangThai]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XemDonDHTheoTrangThai]
    @trangthai NVARCHAR(30)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM DonDH
    WHERE TrangThai = @trangthai;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_XemDonHangKhachHang]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XemDonHangKhachHang]
@username NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT 1 FROM TK_KhachHang WHERE usernameKH = @username)
	BEGIN
		SELECT DISTINCT DonDH.MaDDH, @username, Ho, Ten, TG_Dat, TrangThai, HinhThuc, ThanhToan
		FROM (SELECT MaKH, Ho, Ten FROM KhachHang) KH
		JOIN (SELECT usernameKH, MaKH FROM TK_KhachHang) TKKH
		ON KH.MaKH = TKKH.MaKH
		JOIN (SELECT MaGio, usernameKH, MaSP FROM GioHang) GH
		ON TKKH.usernameKH = GH.usernameKH
		JOIN (SELECT MaSP, TenSP, Gia FROM SanPham) SP
		ON GH.MaSP = SP.MaSP
		JOIN (SELECT MaDDH, MaCTDDH, MaGio FROM CT_DonDH) CTDDH
		ON GH.MaGio = CTDDH.MaGio
		JOIN DonDH
		ON CTDDH.MaDDH = DonDH.MaDDH
		WHERE TKKH.usernameKH = @username
	END
	ELSE
	BEGIN
		RAISERROR('Không tồn tại tài khoản này.', 16, 1);
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XemTopSanPhamCoSLBanNhieuNhat]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XemTopSanPhamCoSLBanNhieuNhat]
@top TINYINT
AS
BEGIN
	
	SELECT TOP (@top) SP.MaSP, SP.TenSP, SoLuong = SUM(SoLuong)
	FROM (SELECT MaSP, TenSP FROM SanPham) SP
	INNER JOIN (SELECT MaGio, MaSP FROM GioHang) GH
	ON SP.MaSP = GH.MaSP
	INNER JOIN (SELECT MaGio, SoLuong, MaHD FROM CT_DonDH) CTDDH
	ON GH.MaGio = CTDDH.MaGio
	WHERE MaHD IS NOT NULL
	GROUP BY SP.MaSP, SP.TenSP
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XoaSanPham]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XoaSanPham]
@masp INT
AS
BEGIN
	BEGIN TRANSACTION;

	BEGIN TRY
		IF EXISTS (SELECT 1 FROM GioHang WHERE MaSP = @masp)
		BEGIN
			RAISERROR('Sản phẩm này không thể xóa.', 16, 1);
			ROLLBACK TRANSACTION;
			RETURN;
		END

		DELETE FROM SanPham
		WHERE MaSP = @masp;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XoaTaiKhoanNhanVien]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[SP_XoaTaiKhoanNhanVien]
@manv int
AS
BEGIN
	BEGIN TRANSACTION;
	
	BEGIN TRY
		IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNV = @manv)
		BEGIN
			RAISERROR('Mã nhân viên không tồn tại.', 16, 1);
			ROLLBACK TRANSACTION;
			RETURN;
		END

		UPDATE NhanVien
		SET NghiViec = 1
		WHERE MaNV = @manv;

		DELETE FROM TK_NhanVien
		WHERE MaNV = @manv;

		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		THROW;
	END CATCH
END
GO
/****** Object:  Trigger [dbo].[TG_CTDDH_CapNhatSLTon]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_CTDDH_CapNhatSLTon]
ON [dbo].[CT_DonDH]
FOR INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE GioHang
    SET soluong = soluong - (SELECT inserted.SoLuong FROM inserted INNER JOIN GioHang ON inserted.MaGio = GioHang.MaGio)
    WHERE EXISTS (SELECT 1 FROM inserted WHERE inserted.MaGio = GioHang.MaGio);

	IF EXISTS (SELECT 1 FROM GioHang WHERE SoLuong < 0)
    BEGIN
        RAISERROR ('Số lượng sản phẩm ở Giỏ hàng không thể âm.', 16, 1);
        ROLLBACK TRANSACTION;
    END

    UPDATE SanPham
    SET SLTon = CASE 
                    WHEN SLTon IS NULL THEN 0
                    ELSE SLTon 
                END
                - (SELECT inserted.SoLuong 
                    FROM inserted 
                    INNER JOIN GioHang ON inserted.MaGio = GioHang.MaGio 
                    WHERE GioHang.MaSP = SanPham.MaSP)
    WHERE EXISTS (SELECT 1 FROM inserted WHERE inserted.MaGio IN (SELECT MaGio FROM GioHang WHERE GioHang.MaSP = SanPham.MaSP));

    IF EXISTS (SELECT 1 FROM SanPham WHERE SLTon < 0)
    BEGIN
        RAISERROR ('Số lượng tồn không thể âm.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
GO
ALTER TABLE [dbo].[CT_DonDH] ENABLE TRIGGER [TG_CTDDH_CapNhatSLTon]
GO
/****** Object:  Trigger [dbo].[TG_DT_CheckNhanVienNghiViec]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_DT_CheckNhanVienNghiViec] 
ON [dbo].[DoiTra]
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaNV VARCHAR(10);

    SELECT @MaNV = inserted.MaNV
    FROM inserted;

    IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNV = @MaNV AND NghiViec = 0)
    BEGIN
        RAISERROR('Nhân viên này hiện đang nghỉ việc.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO
ALTER TABLE [dbo].[DoiTra] ENABLE TRIGGER [TG_DT_CheckNhanVienNghiViec]
GO
/****** Object:  Trigger [dbo].[TG_DDH_CheckNhanVienNghiViec]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_DDH_CheckNhanVienNghiViec] 
ON [dbo].[DonDH]
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaNV VARCHAR(10);

	IF @MaNV IS NULL
	RETURN

    SELECT @MaNV = inserted.MaNV
    FROM inserted;

    IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNV = @MaNV AND NghiViec = 0)
    BEGIN
        RAISERROR('Nhân viên này hiện đang nghỉ việc.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO
ALTER TABLE [dbo].[DonDH] ENABLE TRIGGER [TG_DDH_CheckNhanVienNghiViec]
GO
/****** Object:  Trigger [dbo].[TG_DDH_ThemHoaDon]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_DDH_ThemHoaDon]
ON [dbo].[DonDH]
AFTER INSERT
AS
BEGIN

    INSERT INTO HoaDon (TongTien)
    VALUES (0)
END;
GO
ALTER TABLE [dbo].[DonDH] ENABLE TRIGGER [TG_DDH_ThemHoaDon]
GO
/****** Object:  Trigger [dbo].[TG_GH_CapNhatTrangThaiSauKhiGiaoHang]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_GH_CapNhatTrangThaiSauKhiGiaoHang]
ON [dbo].[GiaoHang]
AFTER INSERT, UPDATE
AS
BEGIN
    IF UPDATE(ThoiGian_KT)
    BEGIN
        UPDATE DonDH
        SET TrangThai = N'Đã hoàn thành'
        FROM DonDH d
        JOIN inserted i ON d.MaDDH = i.MaDDH
        WHERE i.ThoiGian_KT IS NOT NULL;
    END
END
GO
ALTER TABLE [dbo].[GiaoHang] ENABLE TRIGGER [TG_GH_CapNhatTrangThaiSauKhiGiaoHang]
GO
/****** Object:  Trigger [dbo].[TG_GH_CheckNhanVienNghiViec]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_GH_CheckNhanVienNghiViec] 
ON [dbo].[GiaoHang]
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaNV VARCHAR(10);

    SELECT @MaNV = inserted.MaNV
    FROM inserted;

    IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNV = @MaNV AND NghiViec = 0)
    BEGIN
        RAISERROR('Nhân viên này hiện đang nghỉ việc.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO
ALTER TABLE [dbo].[GiaoHang] ENABLE TRIGGER [TG_GH_CheckNhanVienNghiViec]
GO
/****** Object:  Trigger [dbo].[TG_GioH_CheckSLTon]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_GioH_CheckSLTon]
ON [dbo].[GioHang]
FOR INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN SanPham s ON i.MaSP = s.MaSP
        WHERE i.SoLuong > s.SLTon
    )
    BEGIN
        RAISERROR ('Số lượng sản phẩm trong giỏ hàng không được lớn hơn số lượng tồn.', 16, 1)
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;
GO
ALTER TABLE [dbo].[GioHang] ENABLE TRIGGER [TG_GioH_CheckSLTon]
GO
/****** Object:  Trigger [dbo].[TG_GioH_UpdateTrangThaiGioHang]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_GioH_UpdateTrangThaiGioHang]
ON [dbo].[GioHang]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE GioHang
    SET TrangThai = CASE 
                        WHEN SoLuong = 0 THEN 'False'
                        ELSE 'True'
                    END
    WHERE MaGio IN (SELECT MaGio FROM inserted);

END;
GO
ALTER TABLE [dbo].[GioHang] ENABLE TRIGGER [TG_GioH_UpdateTrangThaiGioHang]
GO
/****** Object:  Trigger [dbo].[TG_KM_CheckNhanVienNghiViec]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_KM_CheckNhanVienNghiViec] 
ON [dbo].[KhuyenMai]
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaNV VARCHAR(10);

    SELECT @MaNV = inserted.MaNV
    FROM inserted;

    IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNV = @MaNV AND NghiViec = 0)
    BEGIN
        RAISERROR('Nhân viên này hiện đang nghỉ việc.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO
ALTER TABLE [dbo].[KhuyenMai] ENABLE TRIGGER [TG_KM_CheckNhanVienNghiViec]
GO
/****** Object:  Trigger [dbo].[TG_NBH_CheckNhanVienNghiViec]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_NBH_CheckNhanVienNghiViec] 
ON [dbo].[NhanBH]
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaNV VARCHAR(10);

    SELECT @MaNV = inserted.MaNV
    FROM inserted;

    IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNV = @MaNV AND NghiViec = 0)
    BEGIN
        RAISERROR('Nhân viên này hiện đang nghỉ việc.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO
ALTER TABLE [dbo].[NhanBH] ENABLE TRIGGER [TG_NBH_CheckNhanVienNghiViec]
GO
/****** Object:  Trigger [dbo].[TG_PBH_CheckNhanVienNghiViec]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_PBH_CheckNhanVienNghiViec] 
ON [dbo].[PhieuBH]
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaNV VARCHAR(10);

    SELECT @MaNV = inserted.MaNV
    FROM inserted;

    IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNV = @MaNV AND NghiViec = 0)
    BEGIN
        RAISERROR('Nhân viên này hiện đang nghỉ việc.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO
ALTER TABLE [dbo].[PhieuBH] ENABLE TRIGGER [TG_PBH_CheckNhanVienNghiViec]
GO
/****** Object:  Trigger [dbo].[TG_PBH_NgayKT]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_PBH_NgayKT]
ON [dbo].[PhieuBH]
FOR INSERT, UPDATE
AS
BEGIN
	DECLARE @thang int
	SET @thang = (
					SELECT TG_BaoHanh
					FROM SanPham SP
					INNER JOIN GioHang GH
					ON SP.MaSP = GH.MaSP
					INNER JOIN CT_DonDH
					ON GH.MaGio = CT_DonDH.MaGio
					INNER JOIN inserted i
					ON CT_DonDH.MaCTDDH = i.MaCTDDH)
	UPDATE PhieuBH
	SET Ngay_KT = DATEADD(MONTH, @thang, Ngay_BD)
END;
GO
ALTER TABLE [dbo].[PhieuBH] ENABLE TRIGGER [TG_PBH_NgayKT]
GO
/****** Object:  Trigger [dbo].[TG_QTQL_TrangThaiQuanLy]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_QTQL_TrangThaiQuanLy]
ON [dbo].[QTQuanLy]
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM inserted WHERE TrangThai = 1)
    BEGIN
        IF EXISTS (SELECT 1 FROM QTQuanLy WHERE TrangThai = 1 AND MaQL NOT IN (SELECT MaQL FROM inserted WHERE TrangThai = 1))
        BEGIN
            RAISERROR ('Đang có nhân viên hiện là Quản lý.', 16, 1)
            ROLLBACK TRANSACTION;
            RETURN;
        END
    END
END;
GO
ALTER TABLE [dbo].[QTQuanLy] ENABLE TRIGGER [TG_QTQL_TrangThaiQuanLy]
GO
/****** Object:  Trigger [dbo].[TG_TDG_CheckNhanVienNghiViec]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_TDG_CheckNhanVienNghiViec] 
ON [dbo].[ThayDoiGia]
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaNV VARCHAR(10);

    SELECT @MaNV = inserted.MaNV
    FROM inserted;

    IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNV = @MaNV AND NghiViec = 0)
    BEGIN
        RAISERROR('Nhân viên này hiện đang nghỉ việc.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO
ALTER TABLE [dbo].[ThayDoiGia] ENABLE TRIGGER [TG_TDG_CheckNhanVienNghiViec]
GO
/****** Object:  Trigger [dbo].[TG_TDG_ThayDoiGia]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_TDG_ThayDoiGia]
ON [dbo].[ThayDoiGia]
FOR INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM inserted i
        INNER JOIN SanPham sp ON i.MaSP = sp.MaSP
        WHERE i.GiaCu <> sp.Gia
    ) 
    BEGIN
        RAISERROR ('Giá cũ phải giống với giá hiện tại của Sản phẩm.', 16, 1);
    END;

    IF EXISTS (
        SELECT 1
        FROM inserted
        WHERE GiaCu = GiaMoi
    ) 
    BEGIN
        RAISERROR ('Giá cũ phải khác với Giá mới.', 16, 1);
    END;
	UPDATE SanPham
	SET Gia = (SELECT i.GiaMoi FROM inserted i)
	WHERE MaSP = (SELECT i.MASP FROM inserted i)

END;
GO
ALTER TABLE [dbo].[ThayDoiGia] ENABLE TRIGGER [TG_TDG_ThayDoiGia]
GO
/****** Object:  Trigger [dbo].[TG_TBH_CheckNhanVienNghiViec]    Script Date: 30/07/2024 11:47:09 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TG_TBH_CheckNhanVienNghiViec] 
ON [dbo].[TraBH]
FOR INSERT, UPDATE
AS
BEGIN
    DECLARE @MaNV VARCHAR(10);

    SELECT @MaNV = inserted.MaNV
    FROM inserted;

    IF NOT EXISTS (SELECT 1 FROM NhanVien WHERE MaNV = @MaNV AND NghiViec = 0)
    BEGIN
        RAISERROR('Nhân viên này hiện đang nghỉ việc.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END;
END;
GO
ALTER TABLE [dbo].[TraBH] ENABLE TRIGGER [TG_TBH_CheckNhanVienNghiViec]
GO
USE [master]
GO
ALTER DATABASE [BGD] SET  READ_WRITE 
GO
