versicolor
=================

My DevOps repos - An idea, afix, etc. you can send me a PullRequest

## Requirements

* [VirtualBox](https://www.virtualbox.org/)
* [Homebrew](http://brew.sh/)
* [Git](http://git-scm.com/)
* [Vagrant](http://www.vagrantup.com/)
* [Packer](http://www.packer.io/)

## Quick Start

### OSX

I can start very easily that versicolor to command one run

```
curl https://raw.github.com/ryurock/versicolor/master/setup | sh -
```


## Usage 

## Memo

### VagrantのSSHプライベートキー

https://github.com/mitchellh/vagrant/blob/master/keys/vagrant

```
curl https://raw.github.com/mitchellh/vagrant/master/keys/vagrant > ~/.ssh/id_rsa; chmod 600 ~/.ssh/id_rsa; ssh-agent bash; ssh-add ~/.ssh/id_rsa
```

