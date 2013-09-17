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
curl https://raw.github.com/ryurock/versicolor/master/packer/setup | sh -
cd versicolor
vagrant up
curl https://raw.github.com/ryurock/versicolor/master/vagrant/setup | sh -
vagrant ssh
```

or command oneliner

```
curl https://raw.github.com/ryurock/versicolor/master/packer/setup | sh -; cd versicolor; vagrant up; curl https://raw.github.com/ryurock/versicolor/master/vagrant/setup | sh -;
```

## Usage 

1. Using to Vagrant Login.
```
vagrant ssh
```

1. check Ansible Ping
```
ansible local -i local -m ping
```

1. Using Ansible Playbook(test-playbook.yml)
```
ansible-playbook -i local test-playbook.yml
```
