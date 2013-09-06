# ansible install

#for ansible dependency (centos 6)
yum -y install PyYAML
yum -y install python-paramiko
yum -y install python-jinja2

cd /tmp
git clone https://github.com/ansible/ansible.git
cd ansible
make
make install
