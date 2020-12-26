# PHP & Apache PPA
sudo add-apt-repository -y ppa:ondrej/apache2
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update

# Apache
sudo apt-get -y install apache2

# PHP
sudo apt-get -y install php7.4 libapache2-mod-php7.4
sudo apt-get -y install curl zip unzip php7.4-mysql php7.4-curl php7.4-ctype php7.4-uuid php7.4-iconv php7.4-json php7.4-mbstring php7.4-gd php7.4-intl php7.4-xml php7.4-zip php7.4-gettext php7.4-pgsql php7.4-bcmath php7.4-redis php-memcached
sudo phpenmod curl

# PEAR
sudo apt install php-pear
sudo pear channel-update PEAR
sudo pear upgrade PEAR

# Enable apache modules
sudo a2enmod rewrite
sudo a2enmod ssl
sudo a2enmod headers

sudo systemctl restart apache2

# Install Composer
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --force --filename=composer
mkdir -p ~/.composer
sudo chown -R $USER ~/.composer

# MySQL
sudo apt install mysql-server

# gmagick
sudo apt install graphicsmagick libgraphicsmagick1-dev
sudo pecl install gmagick-beta
# Create file /etc/php/7.4/mods-available/gmagick.ini and add a line:
#   extension=gmagick.so

# Setup git 
git config --global user.name "Tom Wilford"
git config --global user.email "hello@jollyblueman.com"

# nodejs
# check for up-to-date node release here:
#   https://github.com/nodesource/distributions
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs

# Yarn?
#curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#sudo apt-get update && sudo apt-get install yarn

#grunt
sudo npm install -g grunt-cli

#bower
sudo npm install -g bower

# Configure PHP (/etc/php/7.4/cli/php.ini || /etc/php/7.4/apache2/php.ini)
#   memory_limit = 512m
#   display_errors = On
#   html_errors = On
#   post_max_size = 32m
#   upload_max_filesize = 32m
#   default_charset = utf8

#virtual box
sudo apt install virtualbox -y

#vagrant
cd /tmp/
wget https://releases.hashicorp.com/vagrant/2.2.14/vagrant_2.2.14_x86_64.deb
sudo apt install ./vagrant_2.2.14_x86_64.deb
sudo apt install virtualbox-guest-additions-iso
sudo visudo
#   vagrant ALL=(ALL) NOPASSWD:ALL
#   Defaults:vagrant !requiretty

# Cleanup
sudo apt-get clean

# Check stuff
php -v
apachectl -v
composer --version
node -v
vagrant --version

