/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.37-MariaDB : Database - task
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`task` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `task`;

/*Table structure for table `kategori` */

DROP TABLE IF EXISTS `kategori`;

CREATE TABLE `kategori` (
  `id_kategori` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id_kategori`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kategori` */

insert  into `kategori`(`id_kategori`,`nama`) values 
('KTG-1902-0001','Laptop'),
('KTG-1902-0002','Smartphone');

/*Table structure for table `merk` */

DROP TABLE IF EXISTS `merk`;

CREATE TABLE `merk` (
  `id_merk` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  PRIMARY KEY (`id_merk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `merk` */

insert  into `merk`(`id_merk`,`nama`) values 
('KTG-1902-0001','Acer'),
('KTG-1902-0002','Apple'),
('KTG-1902-0003','IPhone'),
('KTG-1902-0004','Samsung');

/*Table structure for table `produk` */

DROP TABLE IF EXISTS `produk`;

CREATE TABLE `produk` (
  `id_produk` varchar(50) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `id_kategori` varchar(50) NOT NULL,
  `id_merk` varchar(50) NOT NULL,
  PRIMARY KEY (`id_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `produk` */

insert  into `produk`(`id_produk`,`nama`,`id_kategori`,`id_merk`) values 
('PRDK-1902-0001','Macbook Pro','KTG-1902-0001','KTG-1902-0003'),
('PRDK-1902-0002','Macbook Air','KTG-1902-0001','KTG-1902-0003'),
('PRDK-1902-0003','Galaxy J7','KTG-1902-0002','KTG-1902-0004'),
('PRDK-1902-0004','Galaxy A8','KTG-1902-0002','KTG-1902-0004');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id_user` int(3) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telepon` varchar(13) DEFAULT NULL,
  `foto` varchar(100) DEFAULT NULL,
  `hak_akses` enum('Super Admin','Manajer','Pegawai','Pelanggan') NOT NULL,
  `status` enum('aktif','blokir') NOT NULL DEFAULT 'aktif',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`),
  KEY `level` (`hak_akses`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `users` */

insert  into `users`(`id_user`,`username`,`nama_user`,`password`,`email`,`telepon`,`foto`,`hak_akses`,`status`,`created_at`,`updated_at`) values 
(1,'superadmin','superadmin','aac1259dfa2c6c5ead508f34e52bb990','superadmin@gmail.com','12345678','user-default.png','Super Admin','aktif','2017-04-01 15:15:15','2019-02-14 15:05:40'),
(2,'kadina','Kadina Putri','202cb962ac59075b964b07152d234b70','kadinaputri@gmail.com','085680892909','kadina.png','Manajer','aktif','2017-04-01 15:15:15','2017-04-01 15:15:15'),
(3,'danang','Danang Kesuma','202cb962ac59075b964b07152d234b70','danang@gmail.com','085758858855','','Pegawai','aktif','2017-04-01 15:15:15','2019-01-22 10:34:09'),
(4,'admin','Admin','41504508b3cec65b1313905001118579','admin@gmail.com','085669919769','indrasatya.jpg','Super Admin','aktif','2017-04-01 15:15:15','2019-02-15 05:35:14'),
(5,'pegawai','pegawai','202cb962ac59075b964b07152d234b70','kadinaputri@gmail.com','085680892909','kadina.png','Pegawai','aktif','2017-04-01 15:15:15','2017-04-01 15:15:15'),
(6,'manajer','manajer','202cb962ac59075b964b07152d234b70','danang@gmail.com','085758858855','','Manajer','aktif','2017-04-01 15:15:15','2017-04-01 15:15:15'),
(7,'pelanggan','pelanggan','7f78f06d2d1262a0a222ca9834b15d9d','pelanggan@example.com','12345678',NULL,'Pelanggan','aktif','2019-02-22 01:23:57','2019-02-22 01:23:57');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
