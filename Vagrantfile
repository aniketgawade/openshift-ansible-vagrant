if ARGV.first == "up"
	$my_dir = ENV['PWD']
	puts "#{$my_dir}"
	$my_host = ENV['HOSTNAME']
	puts "#{$my_host}"
end
# Number of VM's to spawn
num_instances = 3

# VM Basename
instance_name_prefix="ment"

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
# The most common configuration options are documented and commented below.
# For a complete reference, please see the online documentation at
# https://docs.vagrantup.com.

# Every Vagrant development environment requires a box. You can search for
# boxes at https://atlas.hashicorp.com/search.
	config.vm.box = "bento/centos-7.5"

# Settings for vagrant boxes

# Set up each box
	(1..num_instances).each do |i|
		vm_name = "%s-%02d" % [instance_name_prefix, i]
		config.vm.define vm_name do |host|
			host.vm.hostname = vm_name

			# Create ip address and assign hostname
			host.vm.network "public_network", bridge: "br0"
			host.ssh.username = 'root'
			host.ssh.password = 'vagrant'
			host.ssh.insert_key = 'true'

			host.vm.provider "virtualbox" do |v|
				v.cpus = 8
				v.memory = 32000
				v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
                		v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
			end

			host.vm.provision "shell", inline: "ssh-keygen -t rsa"
			if i == 1
				host.vm.provision "shell", inline: "cp /vagrant/scripts/ansible-node/id_rsa ~/.ssh/"
				host.vm.provision "shell", inline: "chmod 400 ~/.ssh/id_rsa"
			end
			host.vm.provision "shell", inline: "cat /vagrant/scripts/ansible-node/id_rsa.pub >> /root/.ssh/authorized_keys"
			
			host.vm.provision "shell", inline: <<-EOF
				echo "Host *" > /root/.ssh/config
				echo "  StrictHostKeyChecking no" >> /root/.ssh/config
				chmod 400 ~/.ssh/config
			EOF

			host.vm.provision "shell", inline: "/vagrant/scripts/setup_env.sh"
			#host.vm.provision "shell",
			#	run: "always",
			#	inline: "route add default gw 10.84.7.254"
			#Setup docker 
			#host.vm.provision :docker
		end
	end
end
