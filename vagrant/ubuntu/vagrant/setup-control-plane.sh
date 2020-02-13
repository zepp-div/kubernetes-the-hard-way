#!/bin/bash

kubeadm init --apiserver-advertise-address="$1" --apiserver-cert-extra-sans="$1"  --control-plane-endpoint=lb:6443
sudo --user=vagrant mkdir -p /home/vagrant/.kube
cp -i /etc/kubernetes/admin.conf /home/vagrant/.kube/config
chown $(id -u vagrant):$(id -g vagrant) /home/vagrant/.kube/config
