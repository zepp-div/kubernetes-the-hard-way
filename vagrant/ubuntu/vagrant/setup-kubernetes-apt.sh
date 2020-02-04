#!/bin/bash
set -e
# Update /etc/default/kubelet about other hosts
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF