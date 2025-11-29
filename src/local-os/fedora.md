## Update OS
`sudo dnf update -y`

## Fedora Setup
Run through any commands required from [this post install guide](https://github.com/devangshekhawat/Fedora-43-Post-Install-Guide)

## SSH Keys
Best encryption (with passphrase):
```shell
ssh-keygen -t ed25519 -C "your_email@example.com"
cat ~/.ssh/id_ed25519.pub
```

Can be more compatible (with passphrase):
```shell
ssh-keygen -t ecdsa -b 521
cat ~/.ssh/id_ecdsa.pub
```

## git
```shell
sudo dnf install git
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

## php
Check [Remi Repo wizard](https://rpms.remirepo.net/wizard/) for latest instructions
```shell
sudo dnf install https://rpms.remirepo.net/fedora/remi-release-$(rpm -E %fedora).rpm
sudo dnf config-manager setopt remi.enabled=1
sudo dnf module reset php
sudo dnf module enable php:remi-8.5
sudo dnf install php php-mysqli php-pdo php-curl php-iconv php-json php-mbstring php-gd php-intl php-xml php-zip php-memcached
php -v
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

## PhpStorm
1. Install Fuse `sudo dnf install fuse-libs`
2. [Download JetBrains Toolbox](https://www.jetbrains.com/toolbox-app/download/download-thanks.html?platform=linux)
3. Go to your downloads folder `cd ~/Downloads`
4. Install unpack and install Toolbox `tar -xzf jetbrains-toolbox-*.tar.gz && cd jetbrains-toolbox-*/bin && ./jetbrains-toolbox`
5. Login/download PhpStorm
6. Ctrl + C in the terminal to quit the app (it's still accessible from the software menu)

## nodejs
Check for latest stream `dnf module list nodejs`

`sudo dnf install nodejs`

## docker
Install repo and docker
```shell
sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Start docker now and at startup
```shell
sudo systemctl start docker
sudo systemctl enable docker
```

##### docker-compose
Download RPM from `https://docs.docker.com/desktop/install/fedora/`
```shell
cd ~/Downloads/
sudo dnf install ./docker-desktop-<version>-<arch>.rpm
```

