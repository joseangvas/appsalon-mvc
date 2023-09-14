/*
SQLyog Trial v13.1.9 (64 bit)
MySQL - 8.0.33 : Database - appsalon_mvc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`appsalon_mvc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `appsalon_mvc`;

/*Table structure for table `citas` */

DROP TABLE IF EXISTS `citas`;

CREATE TABLE `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuarioId` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `usuario_FK` (`usuarioId`),
  CONSTRAINT `usuario_FK` FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `citas` */

insert  into `citas`(`id`,`fecha`,`hora`,`usuarioId`) values 
(1,'2023-09-14','14:00:00',2),
(2,'2023-09-15','10:30:00',2),
(3,'2023-09-15','12:00:00',3),
(4,'2023-09-18','14:00:00',3),
(5,'2023-09-20','10:00:00',4),
(6,'2023-09-22','14:00:00',4),
(7,'2023-09-29','10:00:00',4);

/*Table structure for table `citasservicios` */

DROP TABLE IF EXISTS `citasservicios`;

CREATE TABLE `citasservicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citaId` int DEFAULT NULL,
  `servicioId` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cita_FK` (`citaId`),
  KEY `servicio_FK` (`servicioId`),
  CONSTRAINT `cita_FK` FOREIGN KEY (`citaId`) REFERENCES `citas` (`id`),
  CONSTRAINT `servicio_FK` FOREIGN KEY (`servicioId`) REFERENCES `servicios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `citasservicios` */

insert  into `citasservicios`(`id`,`citaId`,`servicioId`) values 
(1,1,1),
(2,1,2),
(3,1,3),
(4,1,8),
(5,2,2),
(6,2,8),
(7,2,3),
(8,3,2),
(9,3,3),
(10,3,8),
(11,4,1),
(12,4,4),
(13,5,4),
(14,5,6),
(15,5,8),
(16,6,1),
(17,6,7),
(18,6,9),
(19,7,4),
(20,7,8);

/*Table structure for table `reservaciones` */

DROP TABLE IF EXISTS `reservaciones`;

CREATE TABLE `reservaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apellido` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `hora` time NOT NULL,
  `fecha` date NOT NULL,
  `servicios` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `reservaciones` */

insert  into `reservaciones`(`id`,`nombre`,`apellido`,`hora`,`fecha`,`servicios`) values 
(1,'Juan','De la torre','10:30:00','2021-06-28','Corte de Cabello Adulto, Corte de Barba'),
(2,'Antonio','Hernandez','14:00:00','2021-07-30','Corte de Cabello Niño'),
(3,'Pedro','Juarez','20:00:00','2021-06-25','Corte de Cabello Adulto'),
(4,'Mireya','Perez','19:00:00','2021-06-25','Peinado Mujer'),
(5,'Jose','Castillo','14:00:00','2021-07-30','Peinado Hombre'),
(6,'Maria','Diaz','14:30:00','2021-06-25','Tinte'),
(7,'Clara','Duran','10:00:00','2021-07-01','Uñas, Tinte, Corte de Cabello Mujer'),
(8,'Miriam','Ibañez','09:00:00','2021-07-01','Tinte'),
(9,'Samuel','Reyes','10:00:00','2021-07-02','Tratamiento Capilar'),
(10,'Joaquin','Muñoz','19:00:00','2021-06-28','Tratamiento Capilar'),
(11,'Julia','Lopez','08:00:00','2021-06-25','Tinte'),
(12,'Carmen','Ruiz','20:00:00','2021-07-01','Uñas'),
(13,'Isaac','Sala','09:00:00','2021-07-30','Corte de Cabello Adulto'),
(14,'Ana','Preciado','14:30:00','2021-06-28','Corte de Cabello Mujer'),
(15,'Sergio','Iglesias','10:00:00','2021-07-02','Corte de Cabello Adulto'),
(16,'Aina','Acosta','14:00:00','2021-07-30','Uñas'),
(17,'Carlos','Ortiz','20:00:00','2021-06-25','Corte de Cabello Niño'),
(18,'Roberto','Serrano','10:00:00','2021-07-30','Corte de Cabello Niño'),
(19,'Carlota','Perez','14:00:00','2021-07-01','Uñas'),
(20,'Ana Maria','Igleias','14:00:00','2021-07-02','Uñas, Tinte'),
(21,'Jaime','Jimenez','14:00:00','2021-07-01','Corte de Cabello Niño'),
(22,'Roberto','Torres','10:00:00','2021-07-02','Corte de Cabello Adulto'),
(23,'Juan','Cano','09:00:00','2021-07-02','Corte de Cabello Niño'),
(24,'Santiago','Hernandez','19:00:00','2021-06-28','Corte de Cabello Niño'),
(25,'Berta','Gomez','09:00:00','2021-07-01','Uñas'),
(26,'Miriam','Dominguez','19:00:00','2021-06-28','Corte de Cabello Niño'),
(27,'Antonio','Castro','14:30:00','2021-07-02','Corte de Cabello Adulti'),
(28,'Hugo','Alonso','09:00:00','2021-06-28','Corte de Barba'),
(29,'Victoria','Perez','10:00:00','2021-07-02','Uñas, Tinte'),
(30,'Jimena','Leon','10:30:00','2021-07-30','Uñas, Corte de Cabello Mujer'),
(31,'Raquel','Peña','20:30:00','2021-06-25','Corte de Cabello Mujer');

/*Table structure for table `servicios` */

DROP TABLE IF EXISTS `servicios`;

CREATE TABLE `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `precio` decimal(6,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `servicios` */

insert  into `servicios`(`id`,`nombre`,`precio`) values 
(1,'Corte de Cabello Niño',60.00),
(2,'Corte de Cabello Hombre',80.00),
(3,'Corte de Barba',60.00),
(4,'Peinado Mujer',80.00),
(5,'Peinado Hombre',60.00),
(6,'Tinte',300.00),
(7,'Uñas',400.00),
(8,'Lavado de Cabello',50.00),
(9,'Tratamiento Capilar',150.00);

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `apellido` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `telefono` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`nombre`,`apellido`,`email`,`password`,`telefono`,`admin`,`confirmado`,`token`) values 
(1,' José Angel','Vásquez','developer.javp@gmail.com','$2y$10$n/ZlZdx6wU6gGYQfRcI.5O03QqHp6Se08ux1aiqsTL4hDoXhTFy7.','04128728231',1,1,''),
(2,' Josias David','Vásquez Seijas','correo@correo.com','$2y$10$GnZDxPz7QpqGrj20P1RC3u8ZrWi6pRYZK53s5cD0woipUZPyxCViW','04128728231',0,1,''),
(3,' Miguel Angel','Vásquez Seijas','miguelpro@gmail.com','$2y$10$wVlamyHTMLfQKwNhW7Ufgugki6P9jb6e7VLVdzudzfifMsxRZBHre','04121472515',0,1,''),
(4,' Thaís Lisley','Seijas','thaislisley@gmail.com','$2y$10$ynW9QUOJm3EVpOLoNtDumO8CuNj2p8TbWNv2y7ajR.HTP1G27w1e2','04121472515',0,1,'');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
