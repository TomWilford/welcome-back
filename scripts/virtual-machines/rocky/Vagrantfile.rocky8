Vagrant.configure("2") do |config|

  config.vm.box = "rockylinux/8"

    config.vm.network "forwarded_port", guest: 80, host: 8081, auto_correct: true
    config.vm.network "forwarded_port", guest: 3306, host: 3307

    config.vm.network "private_network", ip: "192.168.33.10"

    config.vm.network "public_network"

    config.vm.synced_folder ".", "/var/www/html"

    config.vm.provider "virtualbox" do |vb|
      vb.gui = false
      vb.memory = "1024"
      vb.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    end
end
