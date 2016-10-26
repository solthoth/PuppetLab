# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.hostmanager.enabled = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.define "puppet" do |puppet|
    config.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end
    puppet.vm.synced_folder ".", "/vagrant"
    puppet.vm.synced_folder "./code", "/puppet_code"
    puppet.vm.synced_folder "./puppetserver", "/puppet_puppetserver"
    puppet.vm.box = "boxcutter/centos72"
    puppet.vm.hostname = "puppet.example.com"
    puppet.vm.network :private_network, ip: "10.0.20.10"
    puppet.hostmanager.aliases = %w(puppet)
    puppet.vm.provision "shell", inline: <<-SHELL
      # sudo yum update -y
      sudo rpm -ivh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
      sudo yum install puppetserver -y
      sudo rm -rf /etc/puppetlabs/code
      sudo ln -s /puppet_code /etc/puppetlabs/code
      sudo rm -rf /etc/puppetlabs/puppetserver
      sudo ln -s /puppet_puppetserver /etc/puppetlabs/puppetserver
      sudo sed -i 's/2g/512m/g' /etc/sysconfig/puppetserver
      echo "*.example.com" | sudo tee /etc/puppetlabs/puppet/autosign.conf
      sudo service puppetserver start
    SHELL
  end

  config.vm.define "webserver" do |webserver|
    # Puppet agent on Windows 2012
    webserver.vm.box = "devopsguys/Windows2012R2Eval"
    webserver.vm.hostname = "webserver"
    webserver.vm.network :private_network, ip: "10.0.20.13"
    webserver.hostmanager.aliases = %w(webserver)
    webserver.vm.provision "shell", :path => "windows.ps1"
  end
end
