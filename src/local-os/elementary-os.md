## PPA for packages
```shell
sudo apt update
sudo apt install software-properties-common apt-transport-https curl
```

## app-fast for quicker downloads
```shell
sudo add-apt-repository -y ppa:apt-fast/stable
sudo apt -y install apt-fast
echo $'\nalias apt="apt-fast"' >> ~/.bashrc
source ~/.bashrc
```

## Update OS
```shell
apt upgrade
apt autoremove -y && apt autoclean -y
```

## Git
```shell
sudo apt install git
git config --global user.name "Your Name"
git config --global user.email "your_email@example.com"
```

## Nice icon & cursor pack
```shell
mkdir ~/.icons && cd ~/.icons
git clone https://github.com/keeferrourke/la-capitaine-icon-theme.git
cd la-capitaine-icon-theme && ./configure

sudo add-apt-repository ppa:dyatlov-igor/la-capitaine
apt install la-capitaine-cursor-theme
cd ~/
```

## Restricted extras & multi-media codecs
`apt install ubuntu-restricted-extras libavcodec-extra`

## Archive formats
`apt install unace rar unrar p7zip-rar p7zip sharutils uudeview mpack arj cabextract lzip lunzip`

## Improved application speed
`apt install preload`

## Reduce Overheating & Improve Battery Life
```shell
sudo add-apt-repository ppa:linrunner/tlp
apt install tlp tlp-rdw
sudo tlp start
```

## Additional (ancient) fonts
`apt install ttf-ancient-fonts
`
## Change nameserver default to 1.1.1.1
1. `sudo apt install resolvconf`
2. `nano /etc/resolvconf/resolv.conf.d/tail`
3. Paste `nameserver 1.1.1.1`
4. `sudo systemctl enable systemd-resolved.service`
5. `sudo systemctl start systemd-resolved.service`

## Commandline Applications
```shell
sudo apt install snapd
sudo apt install xclip
sudo apt install net-tools
```

## GUI Applications
```shell
sudo snap install phpstorm --classic
sudo snap install firefox
sudo snap install spotify
sudo snap install keepassxc
sudo apt install filezilla
```

## Generate SSH Key
```shell
ssh-keygen -t ecdsa -b 521
cat ~/.ssh/id_ecdsa
```

## Credits
Based on [this gist by @georgenaranjo96](https://gist.github.com/georgenaranjo96/0a29f6eb8461f33606a243a637a75bd4)

