#!/bin/bash

cat <<EOF | tee /etc/netplan/60-routing.yaml
---
network:
  version: 2
  renderer: networkd
  ethernets:
    $1:        
      gateway4: $2
EOF

netplan apply