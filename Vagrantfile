API_VERSION = "2"

Vagrant.configure(API_VERSION) do |config|
  # @see https://vagrantcloud.com
  config.vm.box = "ubuntu/xenial64"

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end

  # If true, agent forwarding over SSH connections is enabled
  config.ssh.forward_agent = true

  config.vm.network "private_network", type: "dhcp"
  config.vm.network "forwarded_port", guest: 80, host: 8888

  # Custom synced folder can be configured here
#  config.vm.synced_folder ".", "/vagrant"

  # Bash provision script
  config.vm.provision "shell", path: "provision.sh"
end
