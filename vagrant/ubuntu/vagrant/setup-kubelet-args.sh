#!/bin/bash
set -e
# Update /etc/default/kubelet about other hosts
cat >> /etc/default/kubelet <<EOF
KUBELET_EXTRA_ARGS=--cgroup-driver=systemd
EOF
systemctl daemon-reload
systemctl restart kubelet
