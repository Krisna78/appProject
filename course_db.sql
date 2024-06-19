-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2024 at 10:11 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `course_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookmark`
--

CREATE TABLE `bookmark` (
  `user_id` varchar(20) NOT NULL,
  `playlist_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookmark`
--

INSERT INTO `bookmark` (`user_id`, `playlist_id`) VALUES
('lgkDiUGk6KI5zTLIFdxp', '3piP4gl9PKBv9lTsatuu');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` varchar(20) NOT NULL,
  `content_id` varchar(20) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` int(10) NOT NULL,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`name`, `email`, `number`, `message`) VALUES
('hakura', 'saipulscp@gmail.com', 857906632, 'memek ku basah');

-- --------------------------------------------------------

--
-- Table structure for table `content`
--

CREATE TABLE `content` (
  `id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `playlist_id` varchar(20) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `video` varchar(100) DEFAULT NULL,
  `thumb` varchar(100) DEFAULT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'deactive'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `content`
--

INSERT INTO `content` (`id`, `tutor_id`, `playlist_id`, `title`, `description`, `video`, `thumb`, `date`, `status`) VALUES
('663c489caa5dc', 'KTurMzQfcSusCQhiLlRQ', '6ZEkZn3njHyCsjGvLmhN', '安田現象', 'dgvfrdgdfrgcfredgvregfdvrfdrfdr', '1715232517.mp4', '1717829419.png', '2024-05-09', 'active'),
('663c49e774538', 'KTurMzQfcSusCQhiLlRQ', '6ZEkZn3njHyCsjGvLmhN', 'ハロウィン？　#アニメ作ってみた', 'samurai', '1715227111.mp4', '1717829428.png', '2024-05-09', 'active'),
('664056f1182e1', '1d9226a0-4a59-4daf-9', '664056ce8e5b4', 'ambadedblou', 'hewahunja', '1715492593.mp4', '1715492593.jpg', '2024-05-12', 'active'),
('6640574980ec7', '1d9226a0-4a59-4daf-9', '664056ce8e5b4', 'on shittt', 'daaaaaaaaaaaaa', '1715492681.mp4', '1715492681.jpg', '2024-05-12', 'active'),
('664057932aa7d', '1d9226a0-4a59-4daf-9', '664056ce8e5b4', 'ambatukaaa haaa aaa haa', 'ambatenut', '1715492755.mp4', '1715492755.jpg', '2024-05-12', 'active'),
('664070c91e07e', 'KTurMzQfcSusCQhiLlRQ', '664070a776287', 'haha', 'wkwkw', '1715499209.mp4', '1717829406.png', '2024-05-12', 'active'),
('664db7a6df407', 'KTurMzQfcSusCQhiLlRQ', '664db6c6a3595', 'Pronounce Basic English', 'belajar pronounce awal dari penyebutan kata', '1716369318.mp4', '1717829397.png', '2024-05-22', 'active'),
('66506e4daf273', 'KTurMzQfcSusCQhiLlRQ', '3piP4gl9PKBv9lTsatuu', 'scsszcsxd', 'sadcszdxsdcsdx', '1717830657.mp4', '1717829385.png', '2024-05-24', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `dtl_user`
--

CREATE TABLE `dtl_user` (
  `id_user` varchar(20) NOT NULL,
  `playlist_id` varchar(20) DEFAULT NULL,
  `tutor_id` varchar(20) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dtl_user`
--

INSERT INTO `dtl_user` (`id_user`, `playlist_id`, `tutor_id`, `status`, `created_at`, `updated_at`) VALUES
('115fe19f-d7a5-4215-a', '3piP4gl9PKBv9lTsatuu', 'KTurMzQfcSusCQhiLlRQ', 'selesai', '2024-05-30 13:24:15', '2024-05-30 07:14:09'),
('115fe19f-d7a5-4215-a', '663f4e44abaab', 'KTurMzQfcSusCQhiTyWQ', 'selesai', '2024-05-30 13:24:15', '2024-05-30 13:24:47'),
('115fe19f-d7a5-4215-a', '664056ce8e5b4', '1d9226a0-4a59-4daf-9', 'pending', '2024-05-30 06:24:54', '2024-05-30 06:24:54'),
('ab195a84-4640-452b-a', '664070a776287', 'KTurMzQfcSusCQhiLlRQ', 'ongoing', '2024-05-31 02:03:39', '2024-06-08 00:53:31'),
('115fe19f-d7a5-4215-a', '664070a776287', 'KTurMzQfcSusCQhiLlRQ', 'ongoing', '2024-06-08 00:53:15', '2024-06-08 00:53:31');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `user_id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `content_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `playlist`
--

CREATE TABLE `playlist` (
  `id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `date` date NOT NULL DEFAULT current_timestamp(),
  `status` varchar(20) NOT NULL DEFAULT 'deactive',
  `harga` int(20) DEFAULT NULL,
  `tingkatan` varchar(50) NOT NULL,
  `jenis` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `playlist`
--

INSERT INTO `playlist` (`id`, `tutor_id`, `title`, `description`, `thumb`, `date`, `status`, `harga`, `tingkatan`, `jenis`) VALUES
('3piP4gl9PKBv9lTsatuu', 'KTurMzQfcSusCQhiLlRQ', 'Belajar Konsep HTML untuk Programming', 'Selfi Ananda', '1717152607.png', '2024-05-05', 'active', 1000000, 'intermiadtel', 'Pemrograman'),
('663f4e44abaab', 'KTurMzQfcSusCQhiTyWQ', 'Belajar Quality Assurance untuk Software Tester', 'Anggita Ayu Dewi', '1717156048.png', '2024-05-11', 'active', 1300000, 'intermiadtel', 'Umum'),
('664056ce8e5b4', '1d9226a0-4a59-4daf-9', 'Desain UX dalam Perangkat Lunak & Aplikasi dengan Figma', 'Imam Mahdi', '1717153511.png', '2024-05-12', 'active', 1200000, 'intermiadtel', 'Ui/Ux'),
('664070a776287', 'KTurMzQfcSusCQhiLlRQ', 'Desain Visual Toko Online dengan Figma', 'Selfi Ananda', '1717153291.png', '2024-05-12', 'active', 1000000, 'intermiadtel', 'Ui/Ux'),
('6641c5dcc66f4', '1d9226a0-4a59-4daf-9', 'Kuasai Python Dasar untuk Data Scientist', 'Imam Mahdi', '1717153453.png', '2024-05-13', 'active', 1500000, 'intermiadtel', 'Pemrograman'),
('664db6c6a3595', 'KTurMzQfcSusCQhiLlRQ', 'IT Help Desk untuk Pemula', 'Selfi Ananda', '1717153231.png', '2024-05-22', 'active', 1200000, 'beginer', 'Pemrograman'),
('6659b12c49c84', '2013a0f9-eedb-46fb-b', 'PHP for Beginners - Menjadi Master PHP', 'Surya Pambudi', '1717154843.png', '2024-05-31', 'active', 1500000, 'beginer', 'Pemrograman'),
('6659b4a2dadce', '2013a0f9-eedb-46fb-b', 'Visual Studio Code for Beginners to Advanced', 'Surya Pambudi', '1717154978.png', '2024-05-31', 'active', 1500000, 'beginer', 'Pemrograman'),
('6ZEkZn3njHyCsjGvLmhN', 'KTurMzQfcSusCQhiLlRQ', 'Bahasa Wajib Programmer : C++ dan .Net Core', 'Selfi Ananda', '1717153141.png', '2024-05-08', 'active', 1250000, 'beginer', 'Pemrograman');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` varchar(50) NOT NULL,
  `id_user` varchar(20) DEFAULT NULL,
  `id_playlist` varchar(20) DEFAULT NULL,
  `tanggal` date NOT NULL,
  `bukti_pembayaran` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `id_playlist`, `tanggal`, `bukti_pembayaran`) VALUES
('2013f33e41214a05651c', '115fe19f-d7a5-4215-a', '3piP4gl9PKBv9lTsatuu', '2024-05-30', '1717075209.jpg'),
('2c7944a70cc857530a3a', 'ab195a84-4640-452b-a', '664070a776287', '2024-05-31', '1717146219.jpg'),
('7549126a2aea4fb523c6', '115fe19f-d7a5-4215-a', '663f4e44abaab', '2024-05-30', '1717075426.jpg'),
('a6cf0553a413a4713e43', '115fe19f-d7a5-4215-a', '664070a776287', '2024-06-08', '1717833195.png');

-- --------------------------------------------------------

--
-- Table structure for table `tutors`
--

CREATE TABLE `tutors` (
  `id` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `profession` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL,
  `role` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tutors`
--

INSERT INTO `tutors` (`id`, `name`, `profession`, `email`, `password`, `image`, `role`) VALUES
('1d9226a0-4a59-4daf-9', 'Imam Mahdi', 'developer', 'pramudyakun@gmail.com', '$2y$12$WGSyaBz5yF9pJ8qp2svZsOp9MBRd9v5FZJOt7ByYwHUrZtLy9PtvW', '6640ede35d7cd.jpg', 'guru'),
('2013a0f9-eedb-46fb-b', 'Surya Pambudi', 'Web Development', 'suryapampam@gmail.com', '$2y$12$mHYdviGMsnwjhNchc.t6keFMDPJe5yxSFvvHe4/eO1DVbO4FeqFCK', '1715499273.jpg', 'guru'),
('KTurMzQfcSusCQhiherY', 'yamashi', 'musician', 'yamashi@gmail.com', '$2y$12$ETx9b/L07m07HhCxfJxI7eKWckeWnqxvwiExMCXXSb/yaiWoScSdu', '663f6b37b14a1.jpg', 'superadmin'),
('KTurMzQfcSusCQhiLlRQ', 'Selfi Ananda', 'developer', 'adie6809@gmail.com', '$2y$12$Cx6AlCw2CpMvxEidO27b0ueoqKVLW.YPRrffU.CbLUinMOCPW0fEG', '665083726ab21.jpg', 'guru'),
('KTurMzQfcSusCQhiTyWQ', 'Anggita Ayu Dewi', 'desginer', 'anggita12@gmail.com', '$2y$12$ETx9b/L07m07HhCxfJxI7eKWckeWnqxvwiExMCXXSb/yaiWoScSdu', '6659b84ca9e53.png', 'guru');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` varchar(20) NOT NULL,
  `tutor_id` varchar(20) DEFAULT NULL,
  `playlist_id` varchar(20) DEFAULT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `tutor_id`, `playlist_id`, `name`, `email`, `password`, `image`) VALUES
('115fe19f-d7a5-4215-a', 'KTurMzQfcSusCQhiLlRQ', '3piP4gl9PKBv9lTsatuu', 'Lewd chan', 'lewdchan55@gmail.com', '$2y$12$wGrippeZr0bKBSImRICHnOeXuFlFJNJnelSQNkXNqz8eq7h/kWNYi', '1717912780.jpg'),
('38bc23b4-b23c-4984-8', NULL, NULL, 'good', 'goodman@gmail.com', '$2y$12$I7/6Vwu5Xa1ml4GZDc5.X.ui5gZcaCEAjT.ltRbq/34.nPalTQ66y', '1716967597.jpg'),
('ab195a84-4640-452b-a', NULL, NULL, 'adi putra', 'adiecangkarok@gmail.com', '$2y$12$ZIILdMioScPX.ObJ08DcRel5wTf/wbRNcYTOrKrehp7CJKLmwk.RO', '1717137392.jpg'),
('f7817488-4a24-4b9c-8', NULL, NULL, 'yae', 'yaekunkawai@gmail.com', '$2y$12$OTM5qApKY57Zg/Q7IOmYEuoArss/qS0nezT6B1vkh84H/xMm4KqxW', '1717859156.jpg'),
('lgkDiUGk6KI5zTLIFdxp', 'KTurMzQfcSusCQhiTyWQ', '663f4e44abaab', 'onishima', 'saipulscp@gmail.com', '$2y$12$ETx9b/L07m07HhCxfJxI7eKWckeWnqxvwiExMCXXSb/yaiWoScSdu', 'HIZKXpbrtmHVeoscLafg.jpg');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indexes for table `tutors`
--
ALTER TABLE `tutors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
