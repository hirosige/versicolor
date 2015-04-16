# -*- mode: ruby -*-
# vi: set ft=ruby :

BOX_NAME = "CentOS-6.6-x86"

Vagrant.configure("2") do |config|
  config.vm.box = BOX_NAME

  config.vm.box_url = "./packer/vagrant-boxes/" + BOX_NAME + ".box"

  require 'vagrant-vbguest' unless defined? config.vbguest
  config.vbguest.auto_update = true

  config.vm.network :private_network, ip: "192.168.59.103"

  config.vm.synced_folder "synced", "/synced",:nfs => true

  config.vm.provider :virtualbox do |vb|
     vb.name = BOX_NAME
     vb.customize ["modifyvm", :id, "--memory", "1024"]
     vb.customize ["modifyvm", :id, "--cpus", "1"]
     vb.customize ["modifyvm", :id, "--rtcuseutc", "off"]
   end

   config.vm.provision "ansible" do |ansible|
     ansible.inventory_path = 'ansible/inventories/vagrant_local'
     ansible.playbook       = "ansible/site.yml"
     ansible.limit          = "all"
     ansible.verbose        = "vvv"
   end
end
