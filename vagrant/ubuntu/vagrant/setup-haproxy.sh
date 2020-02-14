#!/bin/bash
set -e
# Update /etc/haproxy/haproxy.cfg about other hosts
cat <<EOF | tee /etc/haproxy/haproxy.cfg
frontend kubernetes
    bind 192.168.5.30:6443
    option tcplog
    mode tcp
    default_backend kubernetes-master-nodes

backend kubernetes-master-nodes
    mode tcp
    balance roundrobin
    option tcp-check
    server master-1 192.168.5.11:6443 check fall 3 rise 2
EOF

systemctl restart haproxy
