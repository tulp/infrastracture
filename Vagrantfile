VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "debian-7"

  config.vm.define "app" do
    config.vm.network "forwarded_port", guest: 80, host: 8888
    config.vm.network "forwarded_port", guest: 3001, host: 8881
    config.ssh.forward_agent = true

    config.omnibus.chef_version = :latest 

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--memory", 1024]
      vb.customize ["modifyvm", :id, "--cpus", 1]
    end

    config.vm.provision "chef_solo" do |chef| 
      chef.cookbooks_path = '~/.berkshelf/cookbooks'
      chef.data_bags_path = "tulp_repo/databags"
      chef.environments_path = "tulp_repo/environments"
      chef.environment = "vagrant"
      chef.roles_path = "tulp_repo/roles"    

      chef.add_recipe "emacs24"
      %w{
        vm-base 
        postgresql-master 
        redis-master
        application        
        sphinx
        riemann-server
      }.each { |role| chef.add_role role }
    end
    config.vm.host_name = 'tulp-vagrant.local'
  end

end
