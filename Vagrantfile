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



  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  # config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Ansible, Chef, Docker, Puppet and Salt are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
