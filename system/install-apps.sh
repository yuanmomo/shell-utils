#!/usr/bin/env bash

# install common tools/utils
# Usage :
#   curl -s https://raw.githubusercontent.com/yuanmomo/shell-utils/master/system/install-apps.sh | bash -s  ${install_tools[*]}


cat << EOF
1. 安装工具 : $*
EOF

# Debian(Ubuntu) or RHEL(CentOS)
cmd="apt"
if [[ $(command -v yum) ]]; then
	cmd="yum"
fi

# update first
${cmd} -y update
if [[ ${cmd} == "apt" ]]; then
    ${cmd} -y upgrade
fi

# install
echo "$cmd install -y $*"
${cmd} install -y $*
