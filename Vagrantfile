# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "bento/ubuntu-20.04"
    config.ssh.insert_key = false
    config.ssh.private_key_path = "~/.vagrant.d/insecure_private_key"
    # config.ssh.private_key_path = "~/.ssh/id_rsa"
    # config.ssh.verify_host_key
    # config.ssh.password = "vagrant"

    # 共通設定
    config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        vb.gui = false
        # Customize the amount of memory on the VM:
        vb.memory = "8192"
        # vb.customize ["modifyvm", :id, "--cableconnected1", "on"]
        vb.customize ["modifyvm", :id, "--uart1", "0x3F8", "4"]
        vb.customize ["modifyvm", :id, "--uartmode1", "file", File::NULL]
        vb.customize ["modifyvm", :id, "--audio", "none"]
        vb.customize ["modifyvm", :id, "--usb", "off"]
        vb.customize ["modifyvm", :id, "--uart2", "off"]
        vb.customize ["modifyvm", :id, "--uart3", "off"]
        vb.customize ["modifyvm", :id, "--uart4", "off"]
    end

    config.vm.synced_folder "./torrent", "/home/vagrant/torrent", type:"virtualbox"

    # proxy
    config.vm.define "proxy" do |proxy|
        proxy.vm.hostname = "proxy"
        proxy.vm.network "private_network", ip: "192.168.60.10", virtualbox__intnet: true
        proxy.vm.network "private_network", ip: "192.168.61.10", virtualbox__intnet: true
        proxy.vm.network "private_network", ip: "192.168.62.10", virtualbox__intnet: true
        proxy.vm.synced_folder ".share/proxy", "/share", type:"virtualbox"
        proxy.vm.network "public_network", bridge: "enp6s0: Ethernet"
    end

    # client
    MAX_OF_CLIENT = (ENV["MAX_OF_CLIENT"] || 1).to_i
    (1..MAX_OF_CLIENT).each do |id|
        config.vm.define "client#{id}" do |client|
            client.vm.hostname = "client#{id}"
            client.vm.network "private_network", ip: "192.168.62.#{100+id}", virtualbox__intnet: true
            client.vm.synced_folder ".share/client", "/share", type:"virtualbox"
            client.vm.network "public_network", bridge: "enp6s0: Ethernet"
        end
    end

    # provider
    MAX_OF_PROVIDER = (ENV["MAX_OF_PROVIDER"] || 1).to_i
    (1..MAX_OF_PROVIDER).each do |id|
        config.vm.define "provider#{id}" do |provider|
            provider.vm.hostname = "provider#{id}"
            provider.vm.network "private_network", ip: "192.168.60.#{100+id}", virtualbox__intnet: true
            # 固定 IP を割り当てる場合
            provider.vm.network "public_network", bridge: "enp6s0: Ethernet"
            provider.vm.synced_folder ".share/provider", "/share", type:"virtualbox"
        end
    end

    # router
    MAX_OF_ROUTER = (ENV["MAX_OF_ROUTER"] || 1).to_i
    (1..MAX_OF_ROUTER).each do |id|
        config.vm.define "router#{id}" do |router|
            router.vm.hostname = "router#{id}"
            router.vm.network "private_network", ip: "192.168.61.#{200+id}", virtualbox__intnet: true
            router.vm.network "private_network", ip: "192.168.62.#{200+id}", virtualbox__intnet: true
            router.vm.synced_folder ".share/router", "/share", type:"virtualbox"
            router.vm.network "public_network", bridge: "enp6s0: Ethernet"
        end
    end

    # provisioning
    # 共通
    config.vm.provision :shell, path: "common.sh"
    # proxy
    config.vm.define "proxy" do |proxy|
        proxy.vm.provision :shell, path: "install_cefore.sh"
        # ceforeの設定
        proxy.vm.provision :shell, path: "proxy/cefore_setting.sh"
        proxy.vm.provision :shell, run: "always", path: "buffa_tune.sh"
    end
    # client
    (1..MAX_OF_CLIENT).each do |id|
        config.vm.define "client#{id}" do |client|
            client.vm.provision :shell, path: "install_cefore.sh"

            client.vm.provision :shell, path: "client/cefore_setting.sh"
            client.vm.provision :shell, run: "always", path: "buffa_tune.sh"
        end
    end
    # router
    (1..MAX_OF_ROUTER).each do |id|
        config.vm.define "router#{id}" do |router|
            router.vm.provision :shell, path: "install_cefore.sh"
            router.vm.provision :shell, path: "router.cefore_setting.sh"
            router.vm.provision :shell, run: "always", path: "buffa_tune.sh"
        end
    end
    # provider
    (1..MAX_OF_PROVIDER).each do |id|
        config.vm.define "provider#{id}" do |provider|
            provider.vm.provision :shell, path: "install_gnome.sh"
            provider.vm.provision :shell, path: "provider_setup.sh"
        end
    end

    # config.vm.provision "shell", inline: <<-SHELL
    #   apt-get update
    #   apt-get install -y apache2
    # SHELL
end
