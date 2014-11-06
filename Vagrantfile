Vagrant.configure("2") do |config|
  config.vm.box = "puphpet/debian75-x64"
  config.vm.box_url = "puphpet/debian75-x64"
  config.vm.hostname = "jiq.dev"

  config.vm.network :private_network, ip: "192.168.2.200"
  #config.vm.network :public_network

  config.ssh.forward_agent = true

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
    puppet.options = ['--verbose']
  end
end

