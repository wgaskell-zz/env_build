-- Host: localhost
-- Generation Time: Dec 15, 2013 at 05:45 PM


SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `active`) VALUES
(2, 'test', '', 'password', 0),
(3, 'info', '', 'test', 0),
(4, 'test1', 'codingcyber@gmail.com', 'test', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

DROP TABLE IF EXISTS `piste`;

CREATE TABLE `piste` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `resort` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(200) NOT NULL DEFAULT '',
  `level` varchar(200) NOT NULL DEFAULT '',
  `length` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `piste` WRITE;

INSERT INTO `piste` (`id`, `resort`, `name`, `level`, `length`)
VALUES
        (1,'Morzine','Tetras','Red','2.1km'),
        (2,'Morzine','Freux','Red','1.2km'),
        (3,'Morzine','Lievre','Blue','2.9km'),
        (4,'Morzine','Creux','Black','3.6km'),
        (5,'Morzine','Aigle','Black','4.1km'),
        (6,'Morzine','Revour Des','Green','2.6km'),
        (7,'Morzine','Chamois','Red','2.9km'),
        (8,'Morzine','Freux','Red','4.4km'),
        (9,'Morzine','Pieney','Green','3.2km'),
        (10,'Morzine','Raverettes','Blue','3.3km'),
        (11,'Borovets','Sitnyakovo','Red','1.9km'),
        (12,'Borovets','Yastrebets','Blue','3.3km'),
        (13,'Borovets','Popangelov','Red','3.8km'),
        (14,'Borovets','Markujik','Red','2.9km'),
        (15,'Borovets','Fonfon','Black','2.6km'),
        (16,'Borovets','Haramiya','Blue','2.2km'),
        (17,'Borovets','Rila','Blue','1.3km'),
        (18,'Borovets','Cherveno zname','Black','5.3km'),
        (19,'Borovets','Funpark','Red','2.8km'),
        (20,'Borovets','Sitnyakovski pat','Blue','2.3km'),
        (21,'Andorra','Fletxa','Blue','3.3km'),
        (22,'Andorra','Directa','Red','2.3km'),
        (23,'Andorra','Gavatxa','Red','2.1km'),
        (24,'Andorra','Pastora','Blue','1.9km'),
        (25,'Andorra','Mirador','Blue','1.2km'),
        (26,'Andorra','Tamarro','Black','3.2km'),
        (27,'Andorra','Jordi Angles','Black','2.3km'),
        (28,'Andorra','Gall de bosc','Blue','4.2km'),
        (29,'Andorra','Oreneta','Blue','3.7km'),
        (30,'Andorra','Corb','Black','2.0km'),
        (31,'AlpDuez','Les rousses','Red','3.3km'),
        (32,'AlpDuez','Pautat','Red','2.7km'),
        (33,'AlpDuez','Vachettes','Blue','1.7km'),
        (34,'AlpDuez','Lac blanc','Green','3.3km'),
        (35,'AlpDuez','Fontbelle','Blue','2.4km'),
        (36,'AlpDuez','Balcons','Black','5.2km'),
        (37,'AlpDuez','Sagnes','Green','3.0km'),
        (38,'AlpDuez','Clarines','Green','2.0km'),
        (39,'AlpDuez','Sarenne','Black','5.1km'),
        (40,'AlpDuez','Lievre blanks','Red','1.1km');

UNLOCK TABLES;