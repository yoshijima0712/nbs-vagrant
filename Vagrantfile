Vagrant.configure("2") do |config|

  config.vm.box = "CentOS6.5"
  config.vm.box_url = 'https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box'

  config.vm.define "app" do |node|
    node.vm.hostname = "app"
    node.vm.network "private_network", ip: "192.168.10.10"
    #node.vm.synced_folder "../nbs-vagrant/", "/var/www/", owner: "nginx", group: "nginx", create: false, mount_options: ['dmode=775','fmode=755']
    node.vm.synced_folder "../nbs-vagrant/", "/var/www/", create: false, mount_options: ['dmode=775','fmode=755']
  end

  config.vm.provider "virtualbox" do |vb|
    vb.cpus = 1
    vb.memory = "512"
  end

  config.vm.provision "file", source: "provision/files/php-fpm.conf", destination: "php-fpm.conf"
  config.vm.provision "file", source: "provision/files/www.conf", destination: "www.conf"
  config.vm.provision "file", source: "provision/files/nginx.conf", destination: "nginx.conf"
  config.vm.provision "file", source: "provision/files/app.conf", destination: "app.conf"
  config.vm.provision "file", source: "provision/scripts/php-fpm", destination: "php-fpm"
  config.vm.provision "shell", :path => "provision/scripts/provision_root.sh"
  config.vm.provision "shell", :path => "provision/scripts/provision.sh", :privileged => false
end
