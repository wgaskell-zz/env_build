#Move to working home directory
cd ~

#Installation of Environment Prerequisites#
curl -L https://www.opscode.com/chef/install.sh | bash

#Check Chef Version
chef-solo -v

#Download Chef 
wget http://github.com/opscode/chef-repo/tarball/master

#Extraction of Chef Master
tar -zxf master

#Move Chef into Repo directory
mv chef-chef-repo-e3efb8c chef-repo

#Delete tarball
rm master

#Change into working directory
cd ~/chef-repo/
mkdir .chef

echo "cookbook_path [ '/root/chef-repo/cookbooks' ]" > .chef/knife.rb

#Download of cookbooks and dependencies

cd ~/chef-repo/cookbooks
knife cookbook create phpapp
knife cookbook site download apache2
knife cookbook site download apt
knife cookbook site download iptables
knife cookbook site download logrotate
knife cookbook site download pacman
knife cookbook site download smf 2.2.1
knife cookbook site download yum-mysql-community 0.1.12
knife cookbook site download yum 3.5.2
knife cookbook site download php 1.5.0
knife cookbook site download build-essential 2.1.3
knife cookbook site download mysql 5.5.4
knife cookbook site download phpmyadmin 1.0.6
knife cookbook site download iis 2.1.6
knife cookbook site download xml 1.2.9
knife cookbook site download yum-epel 0.6.0
knife cookbook site download windows 1.36.1
knife cookbook site download chef_handler 1.1.6
knife cookbook site download chef-sugar 2.5.0
knife cookbook site download php-fpm 0.7.0

#Extraction of cookbooks and dependencies
tar zxf apache2*
tar zxf apt-2.6.1.tar.gz
tar zxf iptables-0.14.1.tar.gz
tar zxf logrotate-1.8.0.tar.gz
tar zxf pacman-1.1.1.tar.gz
tar zxf mysql-5.5.4.tar.gz
tar zxf smf-2.2.1.tar.gz
tar zxf yum-3.5.2.tar.gz
tar zxf yum-mysql-community-0.1.12.tar.gz
tar zxf phpmyadmin-1.0.6.tar.gz
tar zxf php-1.5.0.tar.gz
tar zxf build-essential-2.1.3.tar.gz
tar zxf iis-2.1.6.tar.gz
tar zxf xml-1.2.9.tar.gz
tar zxf yum-epel-0.6.0.tar.gz
tar zxf windows-1.36.1.tar.gz
tar zxf chef_handler-1.1.6.tar.gz
tar zxf chef-sugar-2.5.0.tar.gz
tar zxf php-fpm-0.7.0.tar.gz

#Cleanup of cookbooks
rm *.tar.gz
echo "bootstrapping complete"

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
#
echo installing phpMyAdmin
apt-get -y install phpMyAdmin #Install of phpMyAdmin

cp ~/env_build/metadata.rb ~/chef-repo/cookbooks/phpapp/
cp ~/env_build/default.rb ~/chef-repo/cookbooks/phpapp/recipes/

cd ~/chef-repo/

cat <<EOF >solo.rb
file_cache_path "/root/chef-solo"
cookbook_path "/root/chef-repo/cookbooks"
EOF

cat <<EOF >web.json
{
  "run_list": [ "recipe[apt]", "recipe[phpapp]" ]
}
EOF

#Run Chef cookbook
chef-solo -c solo.rb -j web.json

#Populate Database
cd ~/env_build
mysql -u 1020198 -p db1020198 --password=wayne2013 < data.sql

#Remove default webserver file
rm /var/www/html/index.html
