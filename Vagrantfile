Vagrant.configure("2") do |config|
  config.vm.define "wordpress" do |wordpress|
    wordpress.vm.box="ubuntu/jammy64"
    wordpress.vm.network "private_network", ip: "192.168.56.12"
    wordpress.vm.hostname = "wordpress.local"
    wordpress.vm.provision "shell", path: "wordpress.sh"
  end
  config.vm.provider "virtualbox" do |vb|
    #   vb.gui = true
    #
    #   vb.memory = "1024"
     end
  config.vm.boot_timeout = "1440"

  config.vm.define "database" do |database|
    database.vm.box="ubuntu/jammy64"
    database.vm.network "private_network", ip: "192.168.56.11"
    database.vm.hostname = "database.local"
    database.vm.provision "shell", path: "database.sh"
  end
end
