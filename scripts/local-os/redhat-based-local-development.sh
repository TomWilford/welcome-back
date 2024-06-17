###### update OS
sudo dnf update -y

###### codecs
sudo dnf group install Multimedia

##### php
sudo dnf install https://rpms.remirepo.net/fedora/remi-release-$(rpm -E %fedora).rpm
sudo dnf module enable php:remi-8.2
sudo dnf install php php-mysqli php-pdo php-curl php-iconv php-json php-mbstring php-gd php-intl php-xml php-zip php-memcached php-zip php-xml
php -v

##### composer
sudo dnf install composer
composer --version

##### nodejs
# Check for latest stream: 
#     dnf module list nodejs
sudo dnf install nodejs

##### git
git config --global user.name "Tom Wilford"
git config --global user.email "hello@jollyblueman.com"

##### docker
# install repo & docker
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# start docker engine
sudo systemctl start docker
# run at startup 
sudo systemctl enable docker

##### docker-compose
# download RPM from https://docs.docker.com/desktop/install/fedora/
cd ~/Downloads/
sudo dnf install ./docker-desktop-<version>-<arch>.rpm

