# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "t3kit/t3kit"
    config.vm.box_check_update = true

    config.vm.network "private_network", ip: "192.168.3.3"
    config.vm.synced_folder "./shared", "/var/www/shared", type: "nfs"

    # Disable default shared folder
    config.vm.synced_folder ".", "/vagrant", disabled: true

    # Configure port forwards
    config.vm.network "forwarded_port", guest: 80, host: 8081   # Web
    #config.vm.network "forwarded_port", guest: 8080, host: 8080 # Solr (not installed)
    config.vm.network "forwarded_port", guest: 1080, host: 1080 # Mailcatcher
    config.vm.network "forwarded_port", guest: 3306, host: 3307 # MySql

    #Omit some terminal errors
    config.ssh.shell = "bash -c 'BASH_ENV=/etc/profile exec bash'"

    # Prevent from replacing unsecure key
    config.ssh.insert_key = false

    #Provision
    config.vm.provision :shell, path: "provision.sh"

    #Name of VM host
    config.vm.define "t3kit" do |site|
    end

    #VM Performance
    config.vm.provider "virtualbox" do |v|
        host = RbConfig::CONFIG['host_os']
        # Give VM 1/2 system memory & access to all cpu cores on the host
        if host =~ /darwin/
            cpus = `sysctl -n hw.ncpu`.to_i
            mem = `sysctl -n hw.memsize`.to_i / 1024 / 1024 / 4
        elsif host =~ /linux/
            cpus = `nproc`.to_i
            mem = `grep 'MemTotal' /proc/meminfo | sed -e 's/MemTotal://' -e 's/ kB//'`.to_i / 1024 / 4
        else
            cpus = 2
            mem = 2048
        end
        v.customize ["modifyvm", :id, "--memory", mem]
        v.customize ["modifyvm", :id, "--cpus", cpus]
    end
end
