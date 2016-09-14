# t3kit_vagrant

## Vagrant/virtualbox development environment for [t3kit](https://github.com/t3kit/t3kit) project.

[![Release](https://img.shields.io/github/release/t3kit/t3kit_vagrant.svg?style=flat-square)](https://github.com/t3kit/t3kit_vagrant/releases)

### [CHANGELOG](https://github.com/t3kit/t3kit_vagrant/blob/master/CHANGELOG.md)
### [CONTRIBUTING](https://github.com/t3kit/t3kit/blob/master/CONTRIBUTING.md)


#### Required dependencies:

* [Git](https://git-scm.com/)
* [PHP 5.6](http://php.net/downloads.php) with openssl and fileinfo extension enabled & [Composer](https://getcomposer.org/)
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://www.vagrantup.com)

***

## First Startup using git submodules:
1. After first clone you need to get all submodules and install composer deppendencies: `./init.sh`
2. Start virtual machine `vagrant up`

## Setup t3kit using Composer Dependency Manager:

- `git clone git@github.com:t3kit/t3kit_vagrant.git`
- `cd t3kit_vagrant`
- `./initWithComposer.sh`
- `vagrant up`
- open in browser: `localhost:8081`


### Some important commands

* Start virtual-machine
`vagrant up`

* Stop vagrant VM
`vagrant halt`

* Delete the vagrant VM
`vagrant destroy`

* Check status of vagrant VM
`vagrant status`

* Check status of all vagrant VM
`vagrant global-status`

* SSH to vagrant VM
`vagrant ssh`

[Vagrant documentation](https://docs.vagrantup.com/v2/)

### Connecting

####TYPO3 Site is available at **http://localhost:8081/**

- TYPO3 login: admin
- TYPO3 password: admin1234
- TYPO3 install tool password: admin1234
- Web root from local machine is : `shared/site/`
- Web root from vagrant VM is : `/var/www/shared/site/`


####Mailcatcher is available at **http://localhost:1080/**

####MySQL is available at **localhost:3307**

- Username: t3kit
- Password: t3kit1234
- DB name: t3kit

##Vagrant BOX

* We are using a custom virtual box based on Ubuntu 14 [t3kit/t3kit](https://atlas.hashicorp.com/t3kit/boxes/t3kit)
* [t3kit packer template](https://github.com/t3kit/t3kit_packer_template)

***

##Windows specific

1. curl shipped with vagrant might be wrong, please download new one and replace it: http://curl.haxx.se/latest.cgi?curl=win64-ssl-sspi
2. there is a known problem with windows 10 virtualbox, please try the following workarounds if they work for you - https://laracasts.com/discuss/channels/general-discussion/windows-10-vagrant-virtualbox-homestead
