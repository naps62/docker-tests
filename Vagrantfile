Vagrant.configure('2') do |config|
  config.vm.box = 'hashicorp/precise32'
  config.vm.network :forwarded_port, guest: 8080, host: 80

  config.vm.provision :docker
end
