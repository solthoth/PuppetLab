# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

# Config Values #
configValues = {
  # box
  #"box" => "centos/7",
  "box" => "puppetlabs/centos-7.0-64-puppet",
  "vm_name" => "Dev-Master",
  "hostname" => "puppetmaster"
}

PUPPET_SETUP = <<SCRIPT
  echo "### Install initial packages"
  yum install -y ruby ruby-libs ruby-shadow git nano

  echo "### Setup Puppet EPEL repository"
  rpm -Uvh http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-3.noarch.rpm

  echo "### Install Puppet"
  yum install -y puppet puppet-server facter
SCRIPT

Vagrant.configure(2) do |config|
  #config.vm.box_check_update = true
  config.vm.box = configValues["box"]
  config.vm.hostname = configValues["hostname"]
  #config.vm.synced_folder ".", "/vagrant", type: "virtualbox"
  #config.ssh.forward_agent = true
  config.ssh.insert_key = false
  config.vm.network "private_network", ip: "172.31.0.101"
  config.vm.provider "virtualbox" do |vb|
    vb.name = configValues["vm_name"]
    vb.gui = false
    vb.memory = 4096
    vb.cpus = 2
  end
  #config.vm.provision :shell, inline: PUPPET_SETUP, privileged: false
end
