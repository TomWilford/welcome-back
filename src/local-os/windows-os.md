## Install php
1. Download [Thread Safe] version of [php from here](https://www.php.net/downloads.php)
2. Create folder `C:\php`
   - Create subfolder for specific php version (if running multiple)
   - E.g. `C:\php\php74`
3. Extract downloaded zip file into appropriate php folder
4. Open the folder and locate the php.exe file 
5. Rename the php.exe file to match the version folder
   - E.g. `php.exe` > `php74.exe`

## Configure php.ini
1. Rename php.ini-development > php.ini
2. Locate "extension_dir" section
   - Add path to appropriate versions extension directory
   - E.g. `extension_dir = "C:\php\php74\ext"`
3. Enable required extensions by removing leading semi-colon
   ```shell
   ;extension=curl > extension=curl
   ;extension=gd > extension=gd
   ;extension=mbstring > extension=mbstring
   ;extension=pdo_mysql > extension=pdo_mysql
   ```

## Configure Windows 
1. Press Windows key, type `Environment Variables` and click to open
2. From the Advanced tab click `Environment Variables` 
3. In `System Variables` click on the `Path` entry
4. Click the `Edit...` button (in the System Variables section)
5. In the new window that appears click `New`
6. Type the path to your version of php
   - E.g. `C:\php\php74`
7. Click `OK`
8. Click `OK`
9. Click `OK`

## Install Composer
Download and install the latest version of [composer from here](https://getcomposer.org/download/)

## Install VirtualBox
1. Download the latest version of [VirtualBox from here](https://www.virtualbox.org/wiki/Downloads)
2. Open downloads folder
3. Right click on VirtualBox .exe file 
4. Run as Administrator

## Install Vagrant
1. Download the latest version of [Vagrant from here](https://www.vagrantup.com/downloads)
2. Press Windows key & type cmd
3. Click `Run As Administrator`
4. Navigate to downloads `cd C:\Users\UserName\Downloads`
5. Run installer by typing name and pressing enter
6. In gitbash run 
   ```shell
   vagrant plugin install vagrant-vbguest
   vagrant plugin install vagrant-winnfsd
   ```

## Install npm
`curl -qL https://www.npmjs.com/install.sh | sh`

## Install Sass/scss
`npm install -g sass`

## Generate SSH Key
`ssh-keygen -t ecdsa -b 521`

## Install Filezilla
Download and install the latest version of [Filezilla from here](https://filezilla-project.org/download.php?type=client)

## Install Greenshot
Download and install the latest version of [Greenshot](https://getgreenshot.org/downloads/)
