#!/usr/bin/env bash

cat << EOF
1. 默认配置 DNS server 为 8.8.8.8 和 8.8.4.4
EOF

# update dns server
dns_config=/etc/resolv.conf
sed -i 's/^nameserver.*$//g' $dns_config
echo "
nameserver 8.8.8.8
nameserver 8.8.4.4
" >> $dns_config

## delete blank rows
sed -i '/^$/d' /etc/resolv.conf

