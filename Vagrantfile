# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"
  config.ssh.insert_key = false
  config.ssh.private_key_path = "~/.ssh/insecure_private_key"

  config.vm.define "proxy" do |proxy|
    proxy.vm.hostname = "proxy"
    proxy.vm.network "private_network", ip: "192.168.56.1"
    proxy.vm.network "private_network", ip: "192.168.57.1"
  end

  MAX_OF_CLIENT = (ENV["MAX_OF_CLIENT"] || 1).to_i
  (1..MAX_OF_CLIENT).each do |id|
    config.vm.define "client#{id}" do |client|
    client.vm.hostname = "client#{id}"
    client.vm.network "private_network", ip: "192.168.56.#{10+id}"
    end
  end

  MAX_OF_PROVIDER = (ENV["MAX_OF_PROVIDER"] || 1).to_i
  (1..MAX_OF_PROVIDER).each do |id|
    config.vm.define "provider#{id}" do |provider|
    provider.vm.hostname = "provider#{id}"
    provider.vm.network "private_network", ip: "192.168.57.#{10+id}"
    end
  end

  # config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    # Customize the amount of memory on the VM:
    vb.memory = "8192"
  end
//test
  config.vm.provision :shell, :inline => <<-EOS
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get full-upgrade -y
    sudo apt-get autoremove -y
    sudo apt-get autoclean
    sudo apt-get clean

    sudo apt-get install -y build-essential

    sudo apt-get install -y autoconf
    wget -q https://ftp.gnu.org/gnu/automake/automake-1.15.1.tar.gz
    tar xvfz automake-1.15.1.tar.gz
    cd automake-1.15.1/; ./configure; cd -;
    cd automake-1.15.1/; make; cd -;
    cd automake-1.15.1/; sudo make install; cd -

    EOS



  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
