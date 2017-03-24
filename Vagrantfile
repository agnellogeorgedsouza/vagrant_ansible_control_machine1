# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "ansible-control-mach1"
  config.vm.box = "ubuntu/trusty64"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  #  config.vm.network :bridged
  config.vm.network "public_network", ip: "192.168.0.152" , bridge: "Realtek PCIe FE Family Controller"


  # this will configure you own key instead of using the dfault key 

    config.ssh.forward_agent    = true
    config.ssh.insert_key       = false
    config.ssh.private_key_path =  ["~/.vagrant.d/insecure_private_key","id_rsa1"]
    ssh_pub_key = File.readlines("id_rsa1.pub").first.strip
    config.vm.provision :shell, privileged: false,  inline: <<-SCRIPT
    sudo chmod ugo+x /vagrant/runonce.sh 
    sudo /bin/bash /vagrant/runonce.sh "#{ssh_pub_key}"
    SCRIPT


      
      

  #parameter to use custom user name 
  #config.ssh.username = "testuser1"
  # this  paraeter is used for increase the ram and cpu 

	config.vm.provider "virtualbox" do |v|
		v.memory = 750
		v.cpus = 2
	 end

end
