##### php & apache PPA
sudo add-apt-repository -y ppa:ondrej/apache2
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update

##### apache
sudo apt-get -y install apache2

##### php
sudo apt-get -y install php8.2 libapache2-mod-php8.2
sudo apt-get -y install curl zip unzip php8.2-mysql php8.2-curl php8.2-ctype php8.2-uuid php8.2-iconv php8.2-json php8.2-mbstring php8.2-gd php8.2-intl php8.2-xml php8.2-zip php8.2-gettext php8.2-pgsql php8.2-bcmath php8.2-redis php8.2-memcached php8.2-zip php8.2-xml php8.2-simplexml php8.2-mbstring
sudo phpenmod curl

##### PEAR
sudo apt install php-pear
sudo pear channel-update PEAR
sudo pear upgrade PEAR

##### Enable apache modules
sudo a2enmod rewrite
sudo a2enmod ssl
sudo a2enmod headers

sudo systemctl restart apache2

##### composer
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --force --filename=composer
mkdir -p ~/.composer
sudo chown -R $USER ~/.composer

##### MySQL
sudo apt install mysql-server

##### gmagick
sudo apt install graphicsmagick libgraphicsmagick1-dev
sudo pecl install gmagick-beta
# Create file /etc/php/7.4/mods-available/gmagick.ini and add a line:
#   extension=gmagick.so

##### git 
git config --global user.name "Tom Wilford"
git config --global user.email "hello@jollyblueman.com"

##### nodejs
# check for up-to-date node release here:
#   https://github.com/nodesource/distributions
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs

##### Yarn?
#curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
#echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
#sudo apt-get update && sudo apt-get install yarn

##### grunt
sudo npm install -g grunt-cli

##### bower
sudo npm install -g bower

###### configure php (/etc/php/7.4/cli/php.ini || /etc/php/7.4/apache2/php.ini)
#   memory_limit = 512m
#   display_errors = On
#   html_errors = On
#   post_max_size = 32m
#   upload_max_filesize = 32m
#   default_charset = utf8

##### virtual box
sudo apt install virtualbox -y

##### vagrant
cd /tmp/
wget https://releases.hashicorp.com/vagrant/2.2.19/vagrant_2.2.19_x86_64.deb
sudo apt install ./vagrant_2.2.19_x86_64.deb
sudo apt install virtualbox-guest-additions-iso
sudo visudo
#   vagrant ALL=(ALL) NOPASSWD:ALL
#   Defaults:vagrant !requiretty
sudo vagrant plugin install vagrant-vbguest
vagrant reload
#   if non-zero exit status issue with umount /mnt...
#       sudo vagrant plugin uninstall vagrant-vbguest
#       sudo vagrant plugin install vagrant-vbguest --plugin-version 0.21
#       ty to this article https://www.devopsroles.com/vagrant-no-virtualbox-guest-additions-installation-found-fixed/


##### docker & docker compose
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update  && sudo apt-get install docker-ce docker-ce-cli containerd.io
sudo docker run hello-world
#    check for the latest docker-compose version at https://github.com/docker/compose/releases/
sudo curl -L "https://github.com/docker/compose/releases/download/2.17.2/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
sudo chmo +x /usr/local/bin/docker-compose
sudo usermod -aG docker $USER

##### clean up
sudo apt-get clean

##### check stuff
php -v
apachectl -v
composer --version
node -v
vagrant --version

