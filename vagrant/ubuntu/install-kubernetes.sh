#!/bin/bash
export DEBIAN_FRONTEND=noninteractive 
curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - \
    && apt-get update \
    && apt-get install -y iptables arptables ebtables \
    && apt-get install -y kubelet kubeadm kubectl
