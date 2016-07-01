# -*- mode: ruby -*-
# vi: set ft=ruby :

require 'json'

# Config Values #
configValues = {
  # box
  "box" => "centos/7",
  "hostname" => "Dev.NodeJS"
}

Vagrant.configure(2) do |config|
  config.vm.box = configValues["box"]
  config.vm.hostname = configValues["hostname"]
  config.vm.box_check_update = false
  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.customize [
      "setextradata",
      :id,
      "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root",
      "1"
    ]
  end

  config.vm.provision :shell, :path => "shell/install-puppet.sh"
  config.vm.provision :shell, :path => "shell/install-librarian-puppet.sh"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "default.pp"
  end
end
