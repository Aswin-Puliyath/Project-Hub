/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.22 : Database - projecthub
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`projecthub` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `projecthub`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add assign_project',7,'add_assign_project'),
(26,'Can change assign_project',7,'change_assign_project'),
(27,'Can delete assign_project',7,'delete_assign_project'),
(28,'Can view assign_project',7,'view_assign_project'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add project',9,'add_project'),
(34,'Can change project',9,'change_project'),
(35,'Can delete project',9,'delete_project'),
(36,'Can view project',9,'view_project'),
(37,'Can add task',10,'add_task'),
(38,'Can change task',10,'change_task'),
(39,'Can delete task',10,'delete_task'),
(40,'Can view task',10,'view_task'),
(41,'Can add task_report',11,'add_task_report'),
(42,'Can change task_report',11,'change_task_report'),
(43,'Can delete task_report',11,'delete_task_report'),
(44,'Can view task_report',11,'view_task_report'),
(45,'Can add project_report',12,'add_project_report'),
(46,'Can change project_report',12,'change_project_report'),
(47,'Can delete project_report',12,'delete_project_report'),
(48,'Can view project_report',12,'view_project_report');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$FolYov4m3IOpgL2YxrZBKg$d01qnF98/ZpeHmx+IUjmmjWPw06TFoJ9C6rLTATuXrU=','2024-07-13 05:06:03.605991',1,'aswin','','','aswin@gmail.com',1,1,'2024-07-12 22:32:48.781199');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(7,'proapp','assign_project'),
(8,'proapp','login'),
(9,'proapp','project'),
(12,'proapp','project_report'),
(10,'proapp','task'),
(11,'proapp','task_report'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2024-07-12 07:30:13.726150'),
(2,'auth','0001_initial','2024-07-12 07:30:14.344593'),
(3,'admin','0001_initial','2024-07-12 07:30:14.487286'),
(4,'admin','0002_logentry_remove_auto_add','2024-07-12 07:30:14.487286'),
(5,'admin','0003_logentry_add_action_flag_choices','2024-07-12 07:30:14.503007'),
(6,'contenttypes','0002_remove_content_type_name','2024-07-12 07:30:14.582613'),
(7,'auth','0002_alter_permission_name_max_length','2024-07-12 07:30:14.630097'),
(8,'auth','0003_alter_user_email_max_length','2024-07-12 07:30:14.661841'),
(9,'auth','0004_alter_user_username_opts','2024-07-12 07:30:14.679725'),
(10,'auth','0005_alter_user_last_login_null','2024-07-12 07:30:14.724879'),
(11,'auth','0006_require_contenttypes_0002','2024-07-12 07:30:14.724879'),
(12,'auth','0007_alter_validators_add_error_messages','2024-07-12 07:30:14.740667'),
(13,'auth','0008_alter_user_username_max_length','2024-07-12 07:30:14.788443'),
(14,'auth','0009_alter_user_last_name_max_length','2024-07-12 07:30:14.836275'),
(15,'auth','0010_alter_group_name_max_length','2024-07-12 07:30:14.851957'),
(16,'auth','0011_update_proxy_permissions','2024-07-12 07:30:14.867843'),
(17,'auth','0012_alter_user_first_name_max_length','2024-07-12 07:30:14.915498'),
(18,'proapp','0001_initial','2024-07-12 07:30:15.389452'),
(19,'sessions','0001_initial','2024-07-12 07:30:15.436648'),
(20,'proapp','0002_project_proid','2024-07-12 09:04:21.088112'),
(21,'proapp','0003_auto_20240712_1536','2024-07-12 10:06:48.141295'),
(22,'proapp','0004_alter_assign_project_deadline','2024-07-12 10:40:35.798621'),
(23,'proapp','0005_alter_project_ptitle','2024-07-12 12:28:49.917594'),
(24,'proapp','0006_alter_task_deadline','2024-07-12 16:25:11.257576'),
(25,'proapp','0007_alter_assign_project_date','2024-07-12 18:18:36.957453');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('2u0s1oowp9o3x9czhencwrtyful21sa7','.eJyrVsrJTFGyMtJRKgDRhkC6KD85vzSvBMzJSU1MgfKASnIRzESo6hIQbQykUxCaMgugbAMdpWQkw0pKEPpLkqFimQVgdSUlKWA6FyqeCxXPBYvXAgCtlDHP:1sSOeO:zY9mIYJ7d5oYQeojhv4JVwbYHtokeaGdHCf7uO1BDPY','2024-07-26 22:22:00.710546'),
('omc8c5fbob4tufmhyhpw5eo3h0bkt2zx','.eJyrVsrJTFGyMtJRKilJzi_NK4GwU6BsQx2lzAIo20BHKTkfIZ6TmpiC0JELY9YCAEEXGmo:1sSOhk:4WPwj-scG_9bNh7FiuOljwD-GlwbvtHru3OOY62KyJs','2024-07-26 22:25:28.909975');

/*Table structure for table `proapp_assign_project` */

DROP TABLE IF EXISTS `proapp_assign_project`;

CREATE TABLE `proapp_assign_project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `deadline` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  `PROJECT_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proapp_assign_project_LOGIN_id_3a6219f7_fk_proapp_login_id` (`LOGIN_id`),
  KEY `proapp_assign_project_PROJECT_id_3370651f_fk_proapp_project_id` (`PROJECT_id`),
  CONSTRAINT `proapp_assign_project_LOGIN_id_3a6219f7_fk_proapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `proapp_login` (`id`),
  CONSTRAINT `proapp_assign_project_PROJECT_id_3370651f_fk_proapp_project_id` FOREIGN KEY (`PROJECT_id`) REFERENCES `proapp_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `proapp_assign_project` */

insert  into `proapp_assign_project`(`id`,`date`,`deadline`,`status`,`LOGIN_id`,`PROJECT_id`) values 
(1,'2024-07-12','2024-07-12','Completed',3,1),
(3,'2024-07-12','2024-07-13','To-Do',4,3);

/*Table structure for table `proapp_login` */

DROP TABLE IF EXISTS `proapp_login`;

CREATE TABLE `proapp_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `proapp_login` */

insert  into `proapp_login`(`id`,`username`,`password`,`type`) values 
(2,'admin','123','Admin'),
(3,'Aswin','123','TL'),
(4,'Akshay','123','TL'),
(5,'Ajay','123','TM'),
(6,'Soorya','123','TM'),
(7,'bonny','94468374','TL');

/*Table structure for table `proapp_project` */

DROP TABLE IF EXISTS `proapp_project`;

CREATE TABLE `proapp_project` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ptitle` longtext NOT NULL,
  `pdesc` longtext NOT NULL,
  `date` date NOT NULL,
  `deadline` date NOT NULL,
  `proid` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `proapp_project` */

insert  into `proapp_project`(`id`,`ptitle`,`pdesc`,`date`,`deadline`,`proid`) values 
(1,'Hospital Management','Framework: Django & Flutter','2024-07-12','2024-07-12','P001'),
(2,'College Management System','End users are students and staffs.\r\n','2024-07-12','2024-07-12','P002'),
(3,'College Management','End users are students and staffs.','2024-07-12','2024-07-13','P002');

/*Table structure for table `proapp_project_report` */

DROP TABLE IF EXISTS `proapp_project_report`;

CREATE TABLE `proapp_project_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `report` longtext NOT NULL,
  `ASSIGN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proapp_project_repor_ASSIGN_id_01196030_fk_proapp_as` (`ASSIGN_id`),
  CONSTRAINT `proapp_project_repor_ASSIGN_id_01196030_fk_proapp_as` FOREIGN KEY (`ASSIGN_id`) REFERENCES `proapp_assign_project` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `proapp_project_report` */

insert  into `proapp_project_report`(`id`,`date`,`report`,`ASSIGN_id`) values 
(1,'2024-07-12 19:41:50.000000','Hiii',1),
(2,'2024-07-12 19:49:27.000000','wsdfgh jkjgfdfg hjkgfdcv yugtyvhy ukrg yuhruvh rebyur bvfje nvjkern ebdfyb reyefe fegf f ef f3ew f e f ef 3 ',1),
(3,'2024-07-12 19:50:12.000000','wsdfgh jkjgfdfg hjkgfdcv yugtyvhy ukrg yuhruvh rebyur bvfje nvjkern ebdfyb reyefe fegf f ef f3ew f e f ef 3 ',1),
(4,'2024-07-12 19:50:30.000000','wsdfgh jkjgfdfg hjkgfdcv yugtyvhy ukrg yuhruvh rebyur bvfje nvjkern ebdfyb reyefe fegf f ef f3ew f e f ef 3 ',3),
(5,'2024-07-12 19:50:47.000000','wsdfgh jkjgfdfg hjkgfdcv yugtyvhy ukrg yuhruvh rebyur bvfje nvjkern ebdfyb reyefe fegf f ef f3ew f e f ef 3 ',1),
(6,'2024-07-12 19:50:59.000000','wsdfgh jkjgfdfg hjkgfdcv yugtyvhy ukrg yuhruvh rebyur bvfje nvjkern ebdfyb reyefe fegf f ef f3ew f e f ef 3 ',3),
(7,'2024-07-13 01:01:31.468270','Hloiiii',1);

/*Table structure for table `proapp_task` */

DROP TABLE IF EXISTS `proapp_task`;

CREATE TABLE `proapp_task` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ttitle` varchar(20) NOT NULL,
  `tdesc` longtext NOT NULL,
  `date` datetime(6) NOT NULL,
  `deadline` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `ASSIGN_id` bigint NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proapp_task_ASSIGN_id_6c68078c_fk_proapp_assign_project_id` (`ASSIGN_id`),
  KEY `proapp_task_LOGIN_id_266a5868_fk_proapp_login_id` (`LOGIN_id`),
  CONSTRAINT `proapp_task_ASSIGN_id_6c68078c_fk_proapp_assign_project_id` FOREIGN KEY (`ASSIGN_id`) REFERENCES `proapp_assign_project` (`id`),
  CONSTRAINT `proapp_task_LOGIN_id_266a5868_fk_proapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `proapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `proapp_task` */

insert  into `proapp_task`(`id`,`ttitle`,`tdesc`,`date`,`deadline`,`status`,`ASSIGN_id`,`LOGIN_id`) values 
(2,'Database Design.','Database design','2024-07-12 22:08:07.401134','2024-07-15','To-Do',1,6),
(3,'UI Design','Must be interactive.','2024-07-12 22:39:28.632783','2024-07-16','Completed',1,5);

/*Table structure for table `proapp_task_report` */

DROP TABLE IF EXISTS `proapp_task_report`;

CREATE TABLE `proapp_task_report` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `report` longtext NOT NULL,
  `TASK_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proapp_task_report_TASK_id_eadc6a27_fk_proapp_task_id` (`TASK_id`),
  CONSTRAINT `proapp_task_report_TASK_id_eadc6a27_fk_proapp_task_id` FOREIGN KEY (`TASK_id`) REFERENCES `proapp_task` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `proapp_task_report` */

insert  into `proapp_task_report`(`id`,`date`,`report`,`TASK_id`) values 
(1,'2024-07-13 01:59:33.352412','45% Completed',2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
