#!/usr/bin/env bash

cat << EOF
1. 安装工具 : $*
EOF

# Debian(Ubuntu) or RHEL(CentOS)
cmd="apt"
if [[ $(command -v yum) ]]; then
	cmd="yum"
fi

# update first
$cmd update

# install
echo "$cmd install -y $*"
$cmd install -y $*
