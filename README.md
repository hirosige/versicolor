versicolor
=================

My DevOps repos - An idea, fix, etc. you can send me a PullRequest

## Requirements

* [Ansible](http://docs.ansible.com/)

## Quick Start

### OSX

I can start very easily that versicolor to command one run

### Requirements Ansible Install

Using to [ryurock/ansible-installer](https://github.com/ryurock/ansible-installer)

```shell
url https://raw.github.com/ryurock/ansible-installer/master/bin/setup | bash
# OSX
source ~/.bash_profile
# or
source ~/.bashrc

# Linux
source /etc/profile
```

### Ansible OSX Install developments setup

```shell
git clone https://github.com/ryurock/versicolor.git
cd versicolor
ansible-playbook -i ansible/inventories/osx -c local --ask-sudo-pass ansible/site.yml
# sudo User Passowrd input
sudo password: 

>PLAY [all] ******************************************************************** 
>GATHERING FACTS *************************************************************** 
>ok: [127.0.0.1]
>
>TASK: [sshd | Install sshd-server] ******************************************** 
>skipping: [127.0.0.1]
.
.
.
```


## Usage 

1. Using to Vagrant Login.
```
vagrant ssh
```

1. Using Ansible Playbook(main)
```
ansible-playbook -i ansible/inventories/local ansible/site.yml 
```

1. Using Serverspec
```
cd serverspec
rake spec
```

## TrableShutting

### An error occurred during installation of VirtualBox Guest Additions x.x.x. Some functionality may not work as intended.

VirtualBox Guest Additions not same VirtualBox version.

```
vagrant vbguest --do rebuild
```

### No installation found.

VirtualBox Guest Additions not install

```
vagrant vbguest --do install
```
