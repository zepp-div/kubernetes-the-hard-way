#!/bin/bash

# required for setting up password less ssh between guest VMs
apt-get install -y sshpass
sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
service sshd restart
