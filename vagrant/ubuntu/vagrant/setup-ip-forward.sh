#!/bin/bash

sed -i 's/#net.ipv4.ip_forward/net.ipv4.ip_forward/' /etc/sysctl.conf
sysctl -w net.ipv4.ip_forward=1
