#!/usr/bin/env bash

cat << EOF
1. 修改用户密码
EOF

# 读取用户输入脚本
read_input_file="read-input.sh"
if [[ ! -e ${read_input_file} ]] ; then
    wget -O ${read_input_file} https://raw.githubusercontent.com/yuanmomo/shell-utils/master/system/read-input.sh
fi
chmod +x ${read_input_file} && source ${read_input_file}

# 更改用户"$USER"密码
readInput "是否需要修改 "$USER" 密码, (y/n)? (默认: n) " "^([y]|[n])$" "n"
changePassword=${read_value}

if [[ ${changePassword} == y ]]; then
    echo "更改用户 $USER 密码"
    passwd
    result=-1
    until [[ ${result} == "0" ]]; do
        passwd
        result=`$?`
    done
fi
