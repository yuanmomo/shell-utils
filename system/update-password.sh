#!/usr/bin/env bash

cat << EOF
1. 修改用户密码
EOF

# 更改用户"$USER"密码
read -p "是否需要修改"$USER"密码（y/n）：" chmi
until [[ $chmi =~ ^([y]|[n])$ ]]; do
    read -p "请重新键入是否需要修改"$USER"密码（y/n）：" chmi
done
if [[ $chmi == y ]]; then
    echo "更改用户 $USER 密码"
    passwd
    until [[ `echo $?` == "0" ]]; do
        passwd
    done
fi
