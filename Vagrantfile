# -*- mode: ruby -*-
# vi: set ft=ruby :

# Database Configuration
mysql_version         = "5.6"    # Options: 5.5 | 5.6
mysql_root_username   = "root"   # We'll assume user "root"
mysql_root_password   = "root"   # We'll assume user "root"
mysql_enable_remote   = "true"  # remote access enabled when true

db_name = "example"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

ENV["LC_ALL"] = "en_US.UTF-8"

Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "bento/ubuntu-18.04"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  # config.vm.box_check_update = false

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
  config.vm.network "private_network", ip: "192.168.33.101"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL

  #Setup apache2 + php
  config.vm.provision "shell", path: "bundle/install_bundle/setup_server.sh"

  # Provision MySQL
  # config.vm.provision "shell", path: "bundle/install_bundle/mysql.sh", args: [mysql_root_password, mysql_version, mysql_enable_remote]

  # Provision MySQL secure
  # config.vm.provision "shell", path: "bundle/install_bundle/mysql_secure.sh", args: [mysql_root_password]

  # Provision MariaDB
  # config.vm.provision "shell", path: "bundle/install_bundle/mariadb.sh", args: [mysql_root_password, mysql_enable_remote]

  # Provision MariaDB secure
  # config.vm.provision "shell", path: "bundle/install_bundle/mariadb_secure.sh", args: [mysql_root_password]

  # Provision PhpMyAdmin
  # config.vm.provision "shell", path: "bundle/install_bundle/phpmyadmin.sh", args: [mysql_root_password]

  # Execute Database
  # config.vm.provision "shell", path: "bundle/config_database/execute_db.sh", args: [mysql_root_username,mysql_root_password,db_name]

  # config.vm.synced_folder "./", "/var/www/html", :mount_options => ["dmode=777", "fmode=777"]

    # apt-get update
    # apt-get install -y apache2
  # SHELL
end
