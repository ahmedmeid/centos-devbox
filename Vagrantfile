Vagrant.configure(2) do |config|
	config.vm.define "devops-box" do |devbox|
		devbox.name = "centos-devbox"
		devbox.vm.box = "minimal/centos7"
    		devbox.vm.network "private_network", ip: "192.168.56.9"
    		devbox.vm.hostname = "devops-box"
      		devbox.vm.provision "shell", path: "scripts/install.sh"
    		devbox.vm.provider "virtualbox" do |v|
    		  v.memory = 4096
    		  v.cpus = 2
    		end
	end
end
