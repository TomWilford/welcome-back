#!/usr/bin/env bash

# Use single quotes instead of double quotes to make it work with special-character passwords
PASSWORD='root'

# update / upgrade
sudo apt-get update
sudo apt-get -y upgrade

sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/apache2

sudo apt-get install -y apache2
sudo apt-get install -y php8.2-{curl,mysql,mbstring,intl,zip,xml,memcached}
sudo apt install -y libapache2-mod-php8.2
sudo a2enmod php8.2

# install mysql and give password to installer
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password $PASSWORD"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $PASSWORD"
sudo apt-get -y install mysql-server

# setup hosts file
VHOST=$(cat <<EOF
<VirtualHost *:80>
    DocumentRoot "/var/www/html/"
    <Directory "/var/www/html/">
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
EOF
)
echo "${VHOST}" > /etc/apache2/sites-available/000-default.conf

#echo -n " index.php" >> /etc/apache2/mods-enabled/dir.conf

# enable mod_rewrite
sudo a2enmod rewrite

# restart apache
sudo service apache2 restart
