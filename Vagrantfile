# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.hostname = "development.local"

  config.vm.provision :puppet do |puppet|
    puppet.options        = "--verbose --debug"
    puppet.manifests_path = ".puppet/manifests"
    puppet.module_path    = ".puppet/modules"
    puppet.manifest_file  = "default.pp"
  end

  config.vm.network :forwarded_port, host: 4567, guest: 80
end
