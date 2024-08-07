-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         11.2.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para appsalon_mvc
CREATE DATABASE IF NOT EXISTS `appsalon_mvc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `appsalon_mvc`;

-- Volcando estructura para tabla appsalon_mvc.citas
CREATE TABLE IF NOT EXISTS `citas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuarioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `usuarioId` (`usuarioId`) USING BTREE,
  CONSTRAINT `usuarioId` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla appsalon_mvc.citas: ~7 rows (aproximadamente)
REPLACE INTO `citas` (`id`, `fecha`, `hora`, `usuarioId`) VALUES
	(1, '2023-09-20', '10:00:00', 4),
	(2, '2023-09-22', '14:00:00', 4),
	(3, '2023-09-29', '10:00:00', 4),
	(4, '2023-09-29', '11:00:00', 2),
	(5, '2023-09-29', '12:00:00', 2),
	(6, '2023-09-29', '12:00:00', 2),
	(7, '2023-09-29', '13:00:00', 2);

-- Volcando estructura para tabla appsalon_mvc.citasservicios
CREATE TABLE IF NOT EXISTS `citasservicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citaId` int(11) DEFAULT NULL,
  `servicioId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citaId` (`citaId`) USING BTREE,
  KEY `servicioId` (`servicioId`) USING BTREE,
  CONSTRAINT `citaId` FOREIGN KEY (`citaId`) REFERENCES `citas` (`id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `servicioId` FOREIGN KEY (`servicioId`) REFERENCES `servicios` (`id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla appsalon_mvc.citasservicios: ~37 rows (aproximadamente)
REPLACE INTO `citasservicios` (`id`, `citaId`, `servicioId`) VALUES
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

-- Volcando estructura para tabla appsalon_mvc.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla appsalon_mvc.servicios: ~14 rows (aproximadamente)
REPLACE INTO `servicios` (`id`, `nombre`, `precio`) VALUES
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

-- Volcando estructura para tabla appsalon_mvc.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `apellido` varchar(60) DEFAULT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `telefono` varchar(13) DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla appsalon_mvc.usuarios: ~4 rows (aproximadamente)
REPLACE INTO `usuarios` (`id`, `nombre`, `apellido`, `email`, `password`, `telefono`, `admin`, `confirmado`, `token`) VALUES
	(1, ' José Angel', 'Vásquez', 'developer.javp@gmail.com', '$2y$10$n/ZlZdx6wU6gGYQfRcI.5O03QqHp6Se08ux1aiqsTL4hDoXhTFy7.', '04128728231', 1, 1, ''),
	(2, ' Josias David', 'Vásquez Seijas', 'correo@correo.com', '$2y$10$GnZDxPz7QpqGrj20P1RC3u8ZrWi6pRYZK53s5cD0woipUZPyxCViW', '04128728231', 0, 1, ''),
	(3, ' Miguel Angel', 'Vásquez Seijas', 'miguelpro@gmail.com', '$2y$10$wVlamyHTMLfQKwNhW7Ufgugki6P9jb6e7VLVdzudzfifMsxRZBHre', '04121472515', 0, 1, ''),
	(4, ' Thaís Lisley', 'Seijas', 'thaislisley@gmail.com', '$2y$10$ynW9QUOJm3EVpOLoNtDumO8CuNj2p8TbWNv2y7ajR.HTP1G27w1e2', '04121472515', 0, 1, '');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
