# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.require_plugin "vagrant-omnibus"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian-7"

  config.omnibus.chef_version = :latest 

  config.vm.provision "chef_solo" do |chef| 
    chef.cookbooks_path = "vendor/cookbooks"
    chef.data_bags_path = "tulp_repo/databags"
    chef.environments_path = "tulp_repo/environments"
    chef.environment = "vagrant"
    chef.roles_path = "tulp_repo/roles"
    chef.add_recipe "emacs24"
    %w{
      vm-base 
      postgresql-master 
      redis-master 
      sphinx 
      application}.each { |role| chef.add_role role }
  end
  config.vm.host_name = 'tulp-vagrant.local'
end
