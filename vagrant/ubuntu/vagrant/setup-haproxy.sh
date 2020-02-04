#!/bin/bash
set -e
# Update /etc/haproxy/haproxy.cfg about other hosts
cat <<EOF | sudo tee /etc/haproxy/haproxy.cfg 
frontend kubernetes
    bind 192.168.5.130:6443
    option tcplog
    mode tcp
    default_backend kubernetes-master-nodes

backend kubernetes-master-nodes
    mode tcp
    balance roundrobin
    option tcp-check
    server master-1 192.168.5.111:6443 check fall 3 rise 2
    server master-2 192.168.5.112:6443 check fall 3 rise 2
EOF
systemctl restart haproxy
