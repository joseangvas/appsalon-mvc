/*
SQLyog v13.1.9 (64 bit)
MySQL - 8.0.33 : Database - appsalon_mvc
*********************************************************************

/*Table structure for table `citas` */

DROP TABLE IF EXISTS `citas`;

CREATE TABLE `citas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `usuarioId` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `usuarioId` (`usuarioId`) USING BTREE
  ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `citas` */

insert  into `citas`(`id`,`fecha`,`hora`,`usuarioId`) values 
(1,'2023-09-20','10:00:00',4),
(2,'2023-09-22','14:00:00',4),
(3,'2023-09-29','10:00:00',4),
(4,'2023-09-29','11:00:00',2),
(5,'2023-09-29','12:00:00',2),
(6,'2023-09-29','12:00:00',2),
(7,'2023-09-29','13:00:00',2);

/*Table structure for table `citasservicios` */

DROP TABLE IF EXISTS `citasservicios`;

CREATE TABLE `citasservicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `citaId` int DEFAULT NULL,
  `servicioId` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `citaId` (`citaId`) USING BTREE,
  KEY `servicioId` (`servicioId`) USING BTREE
  ) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `citasservicios` */

insert  into `citasservicios`(`id`,`citaId`,`servicioId`) values 
(1,NULL,NULL),
(2,NULL,NULL),
(3,NULL,NULL),
(4,NULL,NULL),
(5,NULL,NULL),
(6,NULL,NULL),
(7,NULL,NULL),
(8,NULL,NULL),
(9,NULL,NULL),
(10,NULL,NULL),
(11,NULL,NULL),
(12,NULL,NULL),
(13,NULL,NULL),
(14,NULL,NULL),
(15,NULL,NULL),
(16,NULL,NULL),
(17,NULL,NULL),
(18,NULL,NULL),
(19,NULL,NULL),
(20,NULL,NULL),
(21,NULL,NULL),
(22,NULL,NULL),
(23,NULL,NULL),
(24,NULL,NULL),
(25,NULL,NULL),
(26,NULL,NULL),
(27,4,1),
(28,4,4),
(29,5,2),
(30,5,3),
(31,5,5),
(32,6,8),
(33,6,4),
(34,6,6),
(35,7,9),
(36,7,2),
(37,7,13);

/*Table structure for table `servicios` */

DROP TABLE IF EXISTS `servicios`;

CREATE TABLE `servicios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
  ) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `servicios` */

insert  into `servicios`(`id`,`nombre`,`precio`) values 
(1,'Corte de Cabello Niño',60.00),
(2,'Corte de Cabello Hombre',80.00),
(3,'Corte de Barba',60.00),
(4,'Peinado Mujer',80.00),
(5,'Peinado Hombre',60.00),
(6,'Tinte',300.00),
(7,'Uñas',50.00),
(8,'Lavado de Cabello',50.00),
(9,'Tratamiento Capilar',150.00),
(10,'Perfilado de Cejas',40.00),
(11,'Tratamiento Facial',160.00),
(12,'Perfilado de Cejas',40.00),
(13,'Tratamiento Facial',160.00),
(14,' Corte de Cabello Afro Largo',100.00);

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `apellido` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `admin` tinyint(1) DEFAULT NULL,
  `confirmado` tinyint(1) DEFAULT NULL,
  `token` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
  ) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`nombre`,`apellido`,`email`,`password`,`telefono`,`admin`,`confirmado`,`token`) values 
(1,' José Angel','Vásquez','developer.javp@gmail.com','$2y$10$n/ZlZdx6wU6gGYQfRcI.5O03QqHp6Se08ux1aiqsTL4hDoXhTFy7.','04128728231',1,1,''),
(2,' Josias David','Vásquez Seijas','correo@correo.com','$2y$10$GnZDxPz7QpqGrj20P1RC3u8ZrWi6pRYZK53s5cD0woipUZPyxCViW','04128728231',0,1,''),
(3,' Miguel Angel','Vásquez Seijas','miguelpro@gmail.com','$2y$10$wVlamyHTMLfQKwNhW7Ufgugki6P9jb6e7VLVdzudzfifMsxRZBHre','04121472515',0,1,''),
(4,' Thaís Lisley','Seijas','thaislisley@gmail.com','$2y$10$ynW9QUOJm3EVpOLoNtDumO8CuNj2p8TbWNv2y7ajR.HTP1G27w1e2','04121472515',0,1,'');


