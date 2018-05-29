# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|



    config.vm.define "quorum", primary: true do |quorum|

        quorum.vm.box = "ubuntu/xenial64"
        quorum.vm.network "private_network", ip: "192.168.7.4"
        # in case of issues, please switch to DHCP:
        # machine.vm.network "private_network", type: "dhcp"
        quorum.vm.provision :shell, path: "vagrant/quorum-ipfs.sh"

        # if you need shared folder, then adjust the paths below or comment it out
        quorum.vm.synced_folder "D:/wamp64/www/s/surf-live", "/home/vagrant/surf-live", nfs: true, nfs_udp: false, create: true
        # for some reasons when I shared this filder, quorum examples stop working, maybe need to check paths
        # quorum.vm.synced_folder "D:/wamp64/www/s/surf-live/quorum-examples", "/home/vagrant/quorum-examples", nfs: true, nfs_udp: false, create: true


        # vagrant is the default username
        ## config.ssh.username = "vagrant"
        ## config.ssh.password = ""



        # ports for each Quorum node
        quorum.vm.network "forwarded_port", guest: 22001, host: 22001
        quorum.vm.network "forwarded_port", guest: 22002, host: 22002
        quorum.vm.network "forwarded_port", guest: 22003, host: 22003
        quorum.vm.network "forwarded_port", guest: 22004, host: 22004
        quorum.vm.network "forwarded_port", guest: 22005, host: 22005
        quorum.vm.network "forwarded_port", guest: 22006, host: 22006
        quorum.vm.network "forwarded_port", guest: 22007, host: 22007


        # IPFS
        quorum.vm.network :forwarded_port, guest: 4001, host: 4001
        quorum.vm.network :forwarded_port, guest: 5001, host: 5001
        quorum.vm.network :forwarded_port, guest: 8080, host: 8080

        quorum.vm.network :forwarded_port, guest: 8000, host: 8000
        quorum.vm.network :forwarded_port, guest: 8545, host: 8545



        quorum.vm.provider "virtualbox" do |v|
            v.name = "quorum"
            v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
            v.memory = 4096
        end
    end
end
