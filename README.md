# t3kit_vagrant

## Vagrant/virtualbox development environment for [t3kit](https://github.com/t3kit/t3kit) project.
[![Travis](https://img.shields.io/badge/t3kit-7.0.0-green.svg?style=flat-square)]()

### [CHANGELOG](https://github.com/t3kit/t3kit_vagrant/blob/master/CHANGELOG.md)

#### Required dependencies:

* [Git](https://git-scm.com/)
* [PHP 5.6](http://php.net/downloads.php) with openssl and fileinfo extension enabled & [Composer](https://getcomposer.org/)
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://www.vagrantup.com)

***

## First Startup
1. After first clone you need to get all submodules and install composer deppendencies: `./init.sh`
2. Start virtual machine `vagrant up`


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

# Contributing

Everyone can add feedback, bug reports and fixes. Here is several rules for contribute this repository. Please keep this in mind for better cooperation.


## Issues

If you have a question(feature) not covered in the documentation or want to report a bug, the best way to ensure it gets addressed is to file it in the appropriate **issues tracker**. Please check that you've completed the following steps:

* Make sure you're on the right version of **t3kit_vagrant**
* Make sure that you're cloned all deppendencies `init.sh`
* Used the **search** feature to ensure that the bug hasn't been reported before
* Included as much **information about the bug** as possible, including any output you've received, what OS and version you're on, etc.
* Try to reduce your code to the bare minimum required to reproduce the issue. This makes it much easier (and much faster) to isolate and fix the issue.


## Pull Requests

* Please check to make sure that there aren't existing pull requests attempting to address the issue mentioned. We also recommend checking for issues related to the issue on the tracker, as a team member may be working on the issue in a branch or fork.
* Non-trivial changes should be discussed in an issue first
* Develop in a topic branch, not master
* Follow [Style Guides](https://github.com/t3kit/t3kit_vagrant#style-guide)
* Follow [Git commit conventions](https://github.com/t3kit/t3kit_vagrant#git-commit-conventions-and-output-formatting)
* Write a convincing description of your PR and why we should land it


## Internal Fixes `t3kit team`

* Non-trivial changes should be discussed in **t3kit team**
* Master branch only for releases, so all development should be on `dev` branch.
* Follow [Style Guides](https://github.com/t3kit/t3kit_vagrant#style-guide)
* Follow [Git commit conventions](https://github.com/t3kit/t3kit_vagrant#git-commit-conventions-and-output-formatting)
* Keep in mind how to make [release](https://github.com/t3kit/t3kit_vagrant#how-to-make-release-of-t3kit_vagrant)

***

## Style Guide
This project uses special style guides. Those rules you can find on appropriate file: `.editorconfig`

* [editorconfig](http://editorconfig.org)

## Git commit conventions and output formatting
Please use semantic labels for your messages, but if commit message is not very important, you can skip labels. All commits with labels will be added in changelog, that's why it is important to use labels on your commits.
####Git labels:
* [FEATURE] A new feature
* [FIX] A bug fix
* [DOC] Documentation
* [STYLE] Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc)
* [TEST] Adding missing tests
* [CHORE] Changes to the build process or auxiliary tools, extensions and libraries

Examples:
* '[CHORE] update submodules'
* '[CHORE] add new Vagrant configuration'
* '[CHORE] update TYPO3 to 7.5.0'
* '[FIX] fix provision bug'
* '[TEST] add test for subscribe form on start page'
* '[TEST] implement CI tests'
* '[DOC] update changelog'
* '[DOC] add requirements info'
* '[FEATURE] add google map'
* '[FEATURE] add new content element'
* 'fix link in documentation'
* 'add new db path to vagrant config'

Please ensure any pull requests of fixes **follow this closely**. If you notice existing code which doesn't follow these practices, feel free to shout and we will address this.

***

##How to make release of t3kit_vagrant
1. Test last commit on `dev` branch
2. Update and commit **documentation** and **changelog**
2. Checkout to `master` branch: `git checkout master`
3. Marge `dev` branch into `master` using no-fast-forward merging: `git marge --no-ff dev -m 'Release 1.0.2`
4. Add git tag: `git tag 1.0.2`
5. Push to the server: `git push`
6. Push tags to the server: `git push --tags`

***

##Windows specific

1. curl shipped with vagrant might be wrong, please download new one and replace it: http://curl.haxx.se/latest.cgi?curl=win64-ssl-sspi
2. there is a known problem with windows 10 virtualbox, please tryt following workarounds if they work for you - https://laracasts.com/discuss/channels/general-discussion/windows-10-vagrant-virtualbox-homestead

