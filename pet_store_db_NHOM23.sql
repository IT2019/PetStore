-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1:3306
-- Thời gian đã tạo: Th2 11, 2020 lúc 05:39 AM
-- Phiên bản máy phục vụ: 5.7.26
-- Phiên bản PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `pet_store_db`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `dongdh`
--

DROP TABLE IF EXISTS `dongdh`;
CREATE TABLE IF NOT EXISTS `dongdh` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_vat_nuoi` int(11) NOT NULL,
  `id_dh` int(11) NOT NULL,
  `so_luong` int(11) NOT NULL,
  `trang_thai` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `dongdh`
--

INSERT INTO `dongdh` (`id`, `id_vat_nuoi`, `id_dh`, `so_luong`, `trang_thai`) VALUES
(128, 6, 427, 1, 1),
(127, 3, 115, 1, 1),
(126, 2, 115, 1, 1),
(125, 4, 237, 1, 1),
(124, 3, 237, 4, 1),
(123, 3, 92, 1, 1),
(129, 3, 711, 1, 1),
(130, 2, 511, 1, 1),
(131, 9, 737, 6, 1),
(132, 3, 301, 1, 1),
(133, 3, 3, 5, 1),
(134, 6, 3, 3, 1),
(135, 2, 594, 1, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `don_hang`
--

DROP TABLE IF EXISTS `don_hang`;
CREATE TABLE IF NOT EXISTS `don_hang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_nguoi_dat` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngay_dat` date NOT NULL,
  `dia_chi_giao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=738 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `don_hang`
--

INSERT INTO `don_hang` (`id`, `ten_nguoi_dat`, `sdt`, `email`, `ngay_dat`, `dia_chi_giao`) VALUES
(278, 'Tran Son', '325753939', '0510825089son@gmail.com', '2019-12-12', 'adf'),
(280, 'Nh?t Khánh V? Qu?c', '325753939', '0510825089son@gmail.com', '2019-12-12', 'adf'),
(112, 'Tran Son', '325753939', '0510825089son@gmail.com', '2020-01-09', 'adf'),
(92, 'Tran Son', '325753939', '0510825089son@gmail.com', '2020-01-09', 'adf'),
(237, 'V? Qu?c', '325753939', '0510825089son@gmail.com', '2020-01-09', 'adf'),
(115, 'V? Qu?c', '325753939', '0510825089son@gmail.com', '2020-01-09', 'ádfsdffgfdg'),
(427, 'V? Qu?c', '325753939', '0510825089son@gmail.com', '2020-01-10', 'adf'),
(711, 'dsa', '0352667377', 'xoangimay@gmail.com', '2020-01-11', 'aaaaaa'),
(511, 'ddd?', '0352667377', 'xoangimay@gmail.com', '2020-01-11', 'aaaaaa'),
(737, 'S?n Tr?n', '111111111', 'xoangimay@gmail.com', '2020-01-11', 'Quy nh?n'),
(301, 'S?n', '012345', 'xoangimay@gmail.com', '2020-01-11', 'aaaaaa'),
(3, 'Tran Son', '0352667377', 'xoangimay@gmail.com', '2020-01-11', 'Nguyen Lu'),
(594, 'ddd?', '0352667377', 'xoangimay@gmail.com', '2020-01-14', 'dddddd');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `loai_vat`
--

DROP TABLE IF EXISTS `loai_vat`;
CREATE TABLE IF NOT EXISTS `loai_vat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_loai` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ma_loai` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `loai_vat`
--

INSERT INTO `loai_vat` (`id`, `ten_loai`, `ma_loai`) VALUES
(1, 'Chó', '01'),
(2, 'Mèo', '02'),
(3, 'Chuột', '03'),
(4, 'Cá', '04'),
(5, 'Chim', '05');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vat_nuoi`
--

DROP TABLE IF EXISTS `vat_nuoi`;
CREATE TABLE IF NOT EXISTS `vat_nuoi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ten_vat_nuoi` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `gia_tien` int(11) NOT NULL,
  `hinh_anh` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mo_ta` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_loai` int(11) NOT NULL,
  `so_luong` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `vat_nuoi`
--

INSERT INTO `vat_nuoi` (`id`, `ten_vat_nuoi`, `gia_tien`, `hinh_anh`, `mo_ta`, `id_loai`, `so_luong`) VALUES
(2, 'Chó Ngao Tây Tạng', 1000000, 'product-1.jpg', 'Màu nâu đen', 1, 2),
(3, 'Chó Phú Quốc', 2000011, 'product-4.jpg', 'Màu đen', 1, 3),
(4, 'Mèo Ashera', 1000, 'product-thumb-2.jpg', 'Màu vàng đóm', 2, 1),
(5, 'Mèo Ba Tư', 3000000, 'product-thumb-3.jpg', 'Màu đen', 2, 2),
(6, 'Chó ngao tây tạng', 2000, 'product-2.jpg', 'Màu nâu vàng', 1, 1),
(7, 'Chó Phú Quốc', 8888, 'product-3.jpg', 'Màu vàng đóm', 1, 2),
(8, 'Chó Alaska', 6666, 'product-5.jpg', 'Màu trắng', 1, 2),
(9, 'Chó Alaska lớn', 3333, 'product-6.jpg', 'Màu đen trắng', 1, 1),
(10, 'Chó Alaska', 4321, 'product-thumb-1.jpg', 'Màu trắng vàng', 1, 2),
(11, 'Mèo meow', 100, 'product-thumb-4.jpg', 'Màu trắng vàng', 2, 1),
(12, 'Chuột Hamster', 120, 'chuot-1.jpg', 'Màu trắng', 3, 2),
(13, 'Chuột Hamster', 120, 'chuot-1.jpg', 'Màu trắng', 3, 2),
(14, 'Chuột Hamster', 120, 'chuot-2.jpg', 'Màu vàng', 3, 1),
(15, 'Chuột Hamster', 120, 'chuot-3.jpg', 'Màu đen', 3, 1),
(16, 'Cá rồng', 1200, 'ca-rong-1.jpg', 'Màu hồng', 4, 2),
(17, 'Cá rồng', 1200, 'ca-rong-2.jpg', 'Màu vàng', 4, 1),
(18, 'Cá rồng', 1200, 'ca-rong-3.jpg', 'Màu trắng', 4, 2),
(19, 'Vẹt Nam Mỹ', 150, 'vet-xanh-1.jpg', 'Màu xanh lá', 5, 2),
(20, 'Vẹt Nam Mỹ', 150, 'vet-xanh-2.jpg', 'Màu xanh dương', 5, 1),
(21, 'Vẹt Nam Mỹ', 150, 'vet-xanh-3.jpg', 'Màu xanh dương chấm đen', 5, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
