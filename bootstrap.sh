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
echo installing phpMyAdmin
apt-get -y install phpMyAdmin #Install of phpMyAdmin
echo phpMyAdmin installed
#
echo updating all packages
apt-get -y update #Update Packages

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
    sql      => '/home/ubuntu/env_build/data.sql',
    enforce_sql  => 'true',
    require => File['/root/.my.cnf'],

    }
}

EOF

puppet agent -t
rm /var/www/html/index.html
