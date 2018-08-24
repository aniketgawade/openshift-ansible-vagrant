#!/bin/bash
yum install  vim git wget -y && wget -O /tmp/epel-release-latest-7.noarch.rpm https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && rpm -ivh /tmp/epel-release-latest-7.noarch.rpm && yum update -y

yum install python-netaddr -y
yum install -y centos-release-openshift-origin

mkdir -p /etc/origin/node
touch /etc/origin/node/resolv.conf

chattr +i /etc/resolv.conf

sed 's/SELINUX=permissive/SELINUX=enforcing/' /etc/selinux/config

sudo yum install python-pip python-devel python -y
sudo pip install pip --upgrade
sudo pip install ansible==2.5.2.0

git clone http://github.com/Juniper/openshift-ansible -b release-3.9-contrail

#cd openshift-ansible
#ansible-playbook -i inventory/ose-install playbooks/prerequisites.yml
#ansible-playbook -i inventory/ose-install playbooks/deploy_cluster.yml

