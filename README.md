# Surf Live Quorum Dev VM

This repository contains vagrant setup for Quorum and IPFS multi-machine environment.

### Requirements

  1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
  2. Install [Vagrant](https://www.vagrantup.com/downloads.html)

(If you are behind a proxy server, please see https://github.com/jpmorganchase/quorum/issues/23)


## STEPS TO GO
1. Please adjust `config.vm.synced_folder` paths in `Vagrantfile` to fit your dir structure**
1. Please check `machine.vm.network` to see, if it has set different network than your original host has.
If this is the same, than change it to different one. This setup is in more than one place - change all.   
1. Please run `vagrant box update`
1. Lastly run `vagrant up`


Configuration include:
* [7nodes](https://github.com/jpmorganchase/quorum-examples/tree/master/examples/7nodes): 
Starts up a fully-functioning Quorum environment consisting of 7 independent nodes. 
From this example one can test consensus, privacy, and all the expected functionality of an Ethereum platform.
* [5nodesRTGS](https://github.com/bacen/quorum-examples/tree/master/examples/5nodesRTGS): 
[__Note__: This links to an external repo which you will need to clone, thanks to @rsarres for this contribution!] 
Starts up a set of 5 nodes that simulates a Real-time Gross Setlement environment with 3 banks, 
one regulator (typically a central bank) and an observer that cannot access the private data.
* IPFS


**Important note**: Any account/encryption keys contained in this repository are for
demonstration and testing purposes only. Before running a real environment, you should
generate new ones using Geth's `account` tool and `constellation-node --generate-keys`.

## Vagrant Usage

This is a complete Vagrant environment containing 
[Quorum 2.0.2](https://github.com/jpmorganchase/quorum/),
[Porosity 1.2.0](https://github.com/jpmorganchase/quorum/releases/download/v1.2.0/porosity), 
[Constellation 0.3.2](https://github.com/jpmorganchase/constellation/),
[IPFS 0.4.15](https://dist.ipfs.io/go-ipfs/v0.4.15/go-ipfs_v0.4.15_linux-amd64.tar.gz) 
and the Quorum examples.


### Running

```sh
git clone https://github.com/DZariusz/vagrant-quorum
cd quorum-examples
vagrant up
# (should take 5 or so minutes)
vagrant ssh
# Once in the VM environment:
cd quorum-examples
# then simply follow the instructions for the demo you'd like to run. eg:
# https://github.com/jpmorganchase/quorum#quickstart
```

(*macOS note*: If you get an error saying that the ubuntu/xenial64 image doesn't
exist, please run `sudo rm -r /opt/vagrant/embedded/bin/curl`. This is usually due to
issues with the version of curl bundled with Vagrant.)

To shut down the Vagrant instance, run `vagrant suspend`. To delete it, run
`vagrant destroy`. To start from scratch, run `vagrant up` after destroying the
instance.

## After `vagrant up`

#### Istanbul BFT

Quorum nodes are installed on primary vm.
Login to ssh by `vagrant ssh [quorum]` and run this commands:
```
# istambul setup
cd /home/vagrant/quorum-examples/7nodes
./istanbul-init.sh
./istanbul-start.sh

# run test transaction
./runscript.sh private-contract.js
```


#### InterPlanetary File System (IPFS)

IPFS nodes are installed on other 7 vms. Namer of machines are `ipfsX` where X is number from 1..7.
Ports for IPFS should be redirected. 

To get started you can check this [ipfs.io/docs/getting-started/](https://ipfs.io/docs/getting-started/)

To quick verify if all is working good you can do this:

```
cd ~
ipfs init
ipfs daemon
ipfs cat /ipfs/QmW2WQi7j6c7UgJTarActp7tDNikE4B2qXtFCfLPdsgaTQ/cat.jpg > cat.jpg
```
 
