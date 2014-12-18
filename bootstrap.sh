#Installation of Environment Prerequisites#
ip=`ifconfig eth0 | grep 'inet addr' | awk '{print $2}'|cut -d: -f2`

echo "$ip puppet" >> /etc/hosts

#Installation of Puppet#
echo installing puppet master
apt-get -y install puppetmaster #Install of puppet master
echo puppetmaster installation complete
#
echo install puppet agent
apt-get -y install puppet #Install of puppet agent
echo puppet agent installation complete
#
echo enabling puppet agent
puppet agent --enable #Enable the agent
echo agent now enabled
#
#Installation of additional modules
puppet module install puppetlabs-java #Install Java runtime for puppet
puppet module install puppetlabs-apache #Install Apache
puppet module install puppetlabs-mysql #Install MYSQL module
#
#Start Puppet Master
service puppetmaster start
#
echo installing telnet
apt-get -y install telnet #Install of Telnet
echo telnet installed
#
echo installing WGET
apt-get -y install wget #Install of WGET
echo WGET installed
#
echo installing unzip
apt-get -y install unzip #Install of Unzip
echo unzip installed
#
echo updating all packages
apt-get -y update #Update Packages

cd /home/ubuntu/
cat <<EOF >data.sql
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

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
-- Adding data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`, `active`) VALUES
(2, 'test', '', 'password', 0),
(3, 'wayne', '', 'test', 0),
(4, 'gaskell', 'gaskell@email.com', 'password', 0);

--------------------------------------------------------

--
-- Table structure for table `piste`
--

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


EOF

sudo chown ubuntu:ubuntu data.sql

chmod 775 data.sql

cd /etc/puppet/manifests/
cat <<EOF >site.pp
node default {
    notify {"Helloworld":}
    package {'apache2':
      ensure => present,
    }

    class { 'mysql::server':
      root_password => '1234qwer',
      restart       => 'true',
    }

    mysql::db { 'db1020198':
    user     => '1020198',
    password => 'wayne2013',
    host     => 'localhost',
    grant    => ['all'],
    charset => 'utf8',
    sql      => '/home/ubuntu/data.sql',
    enforce_sql  => 'true',
    require => File['/root/.my.cnf'],

    }

}

EOF

puppet agent -t
rm /var/www/html/index.html