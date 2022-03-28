# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-18.04"

  config.vm.define = "proxy" do |proxy|
    proxy.vm.hostname = "proxy"
    proxy.vm.network "private_network", ip: "192.168.10.1"
    proxy.vm.network "private_network", ip: "192.168.20.1"
  end

  MAX_OF_CLIENT = (ENV["MAX_OF_CLIENT"] || 1).to_i
  (1..MAX_OF_CLIENT).each do |id|
    config.vm.define "client#{id}" do |client|
    client.vm.hostname = "client#{id}"
    client.vm.network "private_network", ip: "192.168.10.#{10+id}"
    end
  end

  MAX_OF_PROVIDER = (ENV["MAX_OF_PROVIDER"] || 1).to_i
  (1..MAX_OF_PROVIDER).each do |id|
    config.vm.define "provider#{id}" do |provider|
    provider.vm.hostname = "provider#{id}"
    provider.vm.network "private_network", ip: "192.168.20.#{10+id}"
    end
  end

  # config.vm.network "public_network"

  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end


  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
