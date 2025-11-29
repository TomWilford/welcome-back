## php & apache PPA
```shell
sudo add-apt-repository -y ppa:ondrej/apache2
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get update
```

## apache
`sudo apt-get -y install apache2`

## php
```shell
sudo apt-get -y install php8.2 libapache2-mod-php8.2
sudo apt-get -y install curl zip unzip php8.2-mysql php8.2-curl php8.2-ctype php8.2-uuid php8.2-iconv php8.2-json php8.2-mbstring php8.2-gd php8.2-intl php8.2-xml php8.2-zip php8.2-gettext php8.2-pgsql php8.2-bcmath php8.2-redis php8.2-memcached php8.2-zip php8.2-xml php8.2-simplexml php8.2-mbstring
sudo phpenmod curl
```

## configure php
1. `vi /etc/php/7.4/cli/php.ini` or `vi /etc/php/7.4/apache2/php.ini`
2. ```shell
   memory_limit = 512m
   display_errors = On
   html_errors = On
   post_max_size = 32m
   upload_max_filesize = 32m
   default_charset = utf8
   ```


## PEAR
```shell
sudo apt install php-pear
sudo pear channel-update PEAR
sudo pear upgrade PEAR
```

## Enable apache modules
```shell
sudo a2enmod rewrite
sudo a2enmod ssl
sudo a2enmod headers

sudo systemctl restart apache2
```

## composer
1. Make a temporary installer `vi /tmp/install-composer.sh`
2. Paste this block
   ```shell
   #!/bin/sh

   EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
   php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
   ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

   if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
   then
       >&2 echo 'ERROR: Invalid installer checksum'
       rm composer-setup.php
       exit 1
   fi
   
   php composer-setup.php --quiet  --install-dir=/usr/local/bin --filename=composer
   RESULT=$?
   rm composer-setup.php
   exit $RESULT
   ```
3. Run the script `sudo bash /tmp/installer-composer.sh`
4. Remove the script (optional) `rm /tmp/install-composer.sh`

## MySQL
`sudo apt install mysql-server`

## gmagick
1. `sudo apt install graphicsmagick libgraphicsmagick1-dev`
2. `sudo pecl install gmagick-beta`
3. `vi /etc/php/7.4/mods-available/gmagick.ini`
4. Paste `extension=gmagick.so`

## git 
```shell
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

## nodejs
Check for up-to-date node release [here](https://github.com/nodesource/distributions)
```shell
curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
sudo apt install -y nodejs
```

## Yarn
```shell
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
```

## grunt
`sudo npm install -g grunt-cli`

## bower
`sudo npm install -g bower`

## virtual box
sudo apt install virtualbox -y

## vagrant
1. ```shell
   cd /tmp/
   wget https://releases.hashicorp.com/vagrant/2.2.19/vagrant_2.2.19_x86_64.deb
   sudo apt install ./vagrant_2.2.19_x86_64.deb
   sudo apt install virtualbox-guest-additions-iso
   sudo visudo
   ```
2. Paste:
   ```shell
   vagrant ALL=(ALL) NOPASSWD:ALL
   Defaults:vagrant !requiretty
   ```
3. ```shell
   sudo vagrant plugin install vagrant-vbguest
   vagrant reload
   ```

## docker & docker compose
1. ```shell
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
   sudo apt update  && sudo apt-get install docker-ce docker-ce-cli containerd.io
   sudo docker run hello-world
   ```
2. Check for the latest docker-compose version at https://github.com/docker/compose/releases/
3. ```shell
   sudo curl -L "https://github.com/docker/compose/releases/download/2.17.2/docker-compose-linux-x86_64" -o /usr/local/bin/docker-compose
   sudo chmo +x /usr/local/bin/docker-compose
   sudo usermod -aG docker $USER
   ```

## clean up
`sudo apt-get clean`

## check stuff
```shell
php -v
apachectl -v
composer --version
node -v
vagrant --version
```

