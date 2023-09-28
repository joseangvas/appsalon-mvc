-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Sep 28, 2023 at 08:50 PM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 8.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `peluqueria_eltinte_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `citas`
--

CREATE TABLE `citas` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuarioId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `citas`
--

INSERT INTO `citas` (`id`, `fecha`, `hora`, `usuarioId`) VALUES
(1, '2023-09-20', '10:00:00', 4),
(2, '2023-09-22', '14:00:00', 4),
(3, '2023-09-29', '10:00:00', 4),
(4, '2023-09-29', '11:00:00', 2),
(5, '2023-09-29', '12:00:00', 2),
(6, '2023-09-29', '12:00:00', 2),
(7, '2023-09-29', '13:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `citasservicios`
--

CREATE TABLE `citasservicios` (
  `id` int(11) NOT NULL,
  `citaId` int(11) DEFAULT NULL,
  `servicioId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `citasservicios`
--

INSERT INTO `citasservicios` (`id`, `citaId`, `servicioId`) VALUES
(1, NULL, NULL),
(2, NULL, NULL),
(3, NULL, NULL),
(4, NULL, NULL),
(5, NULL, NULL),
(6, NULL, NULL),
(7, NULL, NULL),
(8, NULL, NULL),
(9, NULL, NULL),
(10, NULL, NULL),
(11, NULL, NULL),
(12, NULL, NULL),
(13, NULL, NULL),
(14, NULL, NULL),
(15, NULL, NULL),
(16, NULL, NULL),
(17, NULL, NULL),
(18, NULL, NULL),
(19, NULL, NULL),
(20, NULL, NULL),
(21, NULL, NULL),
(22, NULL, NULL),
(23, NULL, NULL),
(24, NULL, NULL),
(25, NULL, NULL),
(26, NULL, NULL),
(27, 4, 1),
(28, 4, 4),
(29, 5, 2),
(30, 5, 3),
(31, 5, 5),
(32, 6, 8),
(33, 6, 4),
(34, 6, 6),
(35, 7, 9),
(36, 7, 2),
(37, 7, 13);

-- --------------------------------------------------------

--
-- Table structure for table `servicios`
--

CREATE TABLE `servicios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `precio` decimal(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `servicios`
--

INSERT INTO `servicios` (`id`, `nombre`, `precio`) VALUES
(1, 'Corte de Cabello Niño', 60.00),
(2, 'Corte de Cabello Hombre', 80.00),
(3, 'Corte de Barba', 60.00),
(4, 'Peinado Mujer', 80.00),
(5, 'Peinado Hombre', 60.00),
(6, 'Tinte', 300.00),
(7, 'Uñas', 50.00),
(8, 'Lavado de Cabello', 50.00),
(9, 'Tratamiento Capilar', 150.00),
(10, 'Perfilado de Cejas', 40.00),
(11, 'Tratamiento Facial', 160.00),
(12, 'Perfilado de Cejas', 40.00),
(13, 'Tratamiento Facial', 160.00),
(14, ' Corte de Cabello Afro Largo', 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `telefono` varchar(13) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `password`, `telefono`, `admin`, `confirmado`, `token`) VALUES
(1, ' José Angel', 'Vásquez', 'developer.javp@gmail.com', '$2y$10$n/ZlZdx6wU6gGYQfRcI.5O03QqHp6Se08ux1aiqsTL4hDoXhTFy7.', '04128728231', 1, 1, ''),
(2, ' Josias David', 'Vásquez Seijas', 'correo@correo.com', '$2y$10$GnZDxPz7QpqGrj20P1RC3u8ZrWi6pRYZK53s5cD0woipUZPyxCViW', '04128728231', 0, 1, ''),
(3, ' Miguel Angel', 'Vásquez Seijas', 'miguelpro@gmail.com', '$2y$10$wVlamyHTMLfQKwNhW7Ufgugki6P9jb6e7VLVdzudzfifMsxRZBHre', '04121472515', 0, 1, ''),
(4, ' Thaís Lisley', 'Seijas', 'thaislisley@gmail.com', '$2y$10$ynW9QUOJm3EVpOLoNtDumO8CuNj2p8TbWNv2y7ajR.HTP1G27w1e2', '04121472515', 0, 1, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `citas`
--
ALTER TABLE `citas`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `usuarioId` (`usuarioId`) USING BTREE;

--
-- Indexes for table `citasservicios`
--
ALTER TABLE `citasservicios`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `citaId` (`citaId`) USING BTREE,
  ADD KEY `servicioId` (`servicioId`) USING BTREE;

--
-- Indexes for table `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `citas`
--
ALTER TABLE `citas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `citasservicios`
--
ALTER TABLE `citasservicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `servicios`
--
ALTER TABLE `servicios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `citas`
--
ALTER TABLE `citas`
  ADD CONSTRAINT `usuarioId` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE SET NULL;

--
-- Constraints for table `citasservicios`
--
ALTER TABLE `citasservicios`
  ADD CONSTRAINT `citaId` FOREIGN KEY (`citaId`) REFERENCES `citas` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  ADD CONSTRAINT `servicioId` FOREIGN KEY (`servicioId`) REFERENCES `servicios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
