###### update OS
sudo dnf update -y

##### php
sudo dnf install https://rpms.remirepo.net/fedora/remi-release-$(rpm -E %fedora).rpm
sudo dnf module enable php:remi-8.2
sudo dnf install php php-mysqli php-pdo php-curl php-iconv php-json php-mbstring php-gd php-intl php-xml php-zip php-memcached php-zip php-xml
php -v

##### composer
sudi dnf install composer
composer --version

##### nodejs
# Check for latest stream: 
#     dnf module list nodejs
sudo dnf module install nodejs:18/common

##### git
git config --global user.name "Tom Wilford"
git config --global user.email "hello@jollyblueman.com"

##### docker
# install repo & docker
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
# start docker engine
sudo systemctl start docker
# test run
sudo docker run hello-world
# run at startup 
sudo systemctl enable docker

##### docker-composer
sudo dnf install docker-compose

