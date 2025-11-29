## Update OS
`sudo dnf update -y`

## Fedora Setup
Run through any commands you want in here `https://github.com/devangshekhawat/Fedora-43-Post-Install-Guide`

## SSH Keys
Best encryption (with passphrase):
```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id_ed25519.pub
```

Can be more compatible (with passphrase):
```bash
ssh-keygen -t ecdsa -b 521
cat ~/.ssh/id_ecdsa.pub
```

## git
```bash
sudo dnf install git
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

## php
Check Remi Repo for latest instructions `https://rpms.remirepo.net/wizard/`
```bash
sudo dnf install https://rpms.remirepo.net/fedora/remi-release-$(rpm -E %fedora).rpm
sudo dnf config-manager setopt remi.enabled=1
sudo dnf module reset php
sudo dnf module enable php:remi-8.
sudo dnf install php php-mysqli php-pdo php-curl php-iconv php-json php-mbstring php-gd php-intl php-xml php-zip php-memcached
php -v
```

## composer
Run this block
```bash
EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php
exit $RESULT
```

## nodejs
Check for latest stream `dnf module list nodejs`

`sudo dnf install nodejs`

## docker
Install repo and docker
```bash
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Start docker now and at startup
```bash
sudo systemctl start docker
sudo systemctl enable docker
```

##### docker-compose
Download RPM from `https://docs.docker.com/desktop/install/fedora/`
```bash
cd ~/Downloads/
sudo dnf install ./docker-desktop-<version>-<arch>.rpm
```

