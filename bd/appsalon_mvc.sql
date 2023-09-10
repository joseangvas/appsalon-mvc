-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         8.0.33 - MySQL Community Server - GPL
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.5.0.6677
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
CREATE DATABASE IF NOT EXISTS `appsalon_mvc` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `appsalon_mvc`;

-- Volcando estructura para tabla appsalon_mvc.citas
CREATE TABLE IF NOT EXISTS `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuarioId` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `usuario_FK` (`usuarioId`),
  CONSTRAINT `usuario_FK` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla appsalon_mvc.citas: ~0 rows (aproximadamente)

-- Volcando estructura para tabla appsalon_mvc.citasservicios
CREATE TABLE IF NOT EXISTS `citasservicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citaId` int DEFAULT NULL,
  `servicioId` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cita_FK` (`citaId`),
  KEY `servicio_FK` (`servicioId`),
  CONSTRAINT `cita_FK` FOREIGN KEY (`citaId`) REFERENCES `citas` (`id`),
  CONSTRAINT `servicio_FK` FOREIGN KEY (`servicioId`) REFERENCES `servicios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla appsalon_mvc.citasservicios: ~0 rows (aproximadamente)

-- Volcando estructura para tabla appsalon_mvc.reservaciones
CREATE TABLE IF NOT EXISTS `reservaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `servicios` mediumtext COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla appsalon_mvc.reservaciones: ~31 rows (aproximadamente)
INSERT INTO `reservaciones` (`id`, `nombre`, `apellido`, `hora`, `fecha`, `servicios`) VALUES
	(1, 'Juan', 'De la torre', '10:30:00', '2021-06-28', 'Corte de Cabello Adulto, Corte de Barba'),
	(2, 'Antonio', 'Hernandez', '14:00:00', '2021-07-30', 'Corte de Cabello Niño'),
	(3, 'Pedro', 'Juarez', '20:00:00', '2021-06-25', 'Corte de Cabello Adulto'),
	(4, 'Mireya', 'Perez', '19:00:00', '2021-06-25', 'Peinado Mujer'),
	(5, 'Jose', 'Castillo', '14:00:00', '2021-07-30', 'Peinado Hombre'),
	(6, 'Maria', 'Diaz', '14:30:00', '2021-06-25', 'Tinte'),
	(7, 'Clara', 'Duran', '10:00:00', '2021-07-01', 'Uñas, Tinte, Corte de Cabello Mujer'),
	(8, 'Miriam', 'Ibañez', '09:00:00', '2021-07-01', 'Tinte'),
	(9, 'Samuel', 'Reyes', '10:00:00', '2021-07-02', 'Tratamiento Capilar'),
	(10, 'Joaquin', 'Muñoz', '19:00:00', '2021-06-28', 'Tratamiento Capilar'),
	(11, 'Julia', 'Lopez', '08:00:00', '2021-06-25', 'Tinte'),
	(12, 'Carmen', 'Ruiz', '20:00:00', '2021-07-01', 'Uñas'),
	(13, 'Isaac', 'Sala', '09:00:00', '2021-07-30', 'Corte de Cabello Adulto'),
	(14, 'Ana', 'Preciado', '14:30:00', '2021-06-28', 'Corte de Cabello Mujer'),
	(15, 'Sergio', 'Iglesias', '10:00:00', '2021-07-02', 'Corte de Cabello Adulto'),
	(16, 'Aina', 'Acosta', '14:00:00', '2021-07-30', 'Uñas'),
	(17, 'Carlos', 'Ortiz', '20:00:00', '2021-06-25', 'Corte de Cabello Niño'),
	(18, 'Roberto', 'Serrano', '10:00:00', '2021-07-30', 'Corte de Cabello Niño'),
	(19, 'Carlota', 'Perez', '14:00:00', '2021-07-01', 'Uñas'),
	(20, 'Ana Maria', 'Igleias', '14:00:00', '2021-07-02', 'Uñas, Tinte'),
	(21, 'Jaime', 'Jimenez', '14:00:00', '2021-07-01', 'Corte de Cabello Niño'),
	(22, 'Roberto', 'Torres', '10:00:00', '2021-07-02', 'Corte de Cabello Adulto'),
	(23, 'Juan', 'Cano', '09:00:00', '2021-07-02', 'Corte de Cabello Niño'),
	(24, 'Santiago', 'Hernandez', '19:00:00', '2021-06-28', 'Corte de Cabello Niño'),
	(25, 'Berta', 'Gomez', '09:00:00', '2021-07-01', 'Uñas'),
	(26, 'Miriam', 'Dominguez', '19:00:00', '2021-06-28', 'Corte de Cabello Niño'),
	(27, 'Antonio', 'Castro', '14:30:00', '2021-07-02', 'Corte de Cabello Adulti'),
	(28, 'Hugo', 'Alonso', '09:00:00', '2021-06-28', 'Corte de Barba'),
	(29, 'Victoria', 'Perez', '10:00:00', '2021-07-02', 'Uñas, Tinte'),
	(30, 'Jimena', 'Leon', '10:30:00', '2021-07-30', 'Uñas, Corte de Cabello Mujer'),
	(31, 'Raquel', 'Peña', '20:30:00', '2021-06-25', 'Corte de Cabello Mujer');

-- Volcando estructura para tabla appsalon_mvc.servicios
CREATE TABLE IF NOT EXISTS `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla appsalon_mvc.servicios: ~0 rows (aproximadamente)
INSERT INTO `servicios` (`id`, `nombre`, `precio`) VALUES
	(1, 'Corte de Cabello Niño', 60.00),
	(2, 'Corte de Cabello Hombre', 80.00),
	(3, 'Corte de Barba', 60.00),
	(4, 'Peinado Mujer', 80.00),
	(5, 'Peinado Hombre', 60.00),
	(6, 'Tinte', 300.00),
	(7, 'Uñas', 400.00),
	(8, 'Lavado de Cabello', 50.00),
	(9, 'Tratamiento Capilar', 150.00);

-- Volcando estructura para tabla appsalon_mvc.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `admin` tinyint(1) NOT NULL,
  `confirmado` tinyint(1) NOT NULL,
  `token` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Volcando datos para la tabla appsalon_mvc.usuarios: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
