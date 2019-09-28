#!/usr/bin/env bash

# 脚本说明
cat << EOF
1. 配置 SSH 服务
    1.1 修改 sshd port
    1.2 禁用密码登陆，仅允许免密登陆
    1.3 禁用 DNS 反向解析
EOF


# change ssh config
read -p "是否需要修改 SSH 配置（y/n）：" chsh
until [[ $chmi =~ ^([y]|[n])$ ]]; do
    read -p "请重新键入是否需要修改 SSH 配置（y/n）：" chsh
done
if [[ $chsh == y ]]; then
    read -p "请指定自定义SSH端口号（可用范围为0-65535 推荐使用大端口号）：" Port;Port=${Port:-22233}
    until  [[ $Port =~ ^([0-9]{1,4}|[1-5][0-9]{4}|6[0-5]{2}[0-3][0-5])$ ]];do
        read -p "请重新键入SSH自定义端口号：" Port;Port=${Port:-22233};
    done

    # update port
    sed -i 's/^Port/#Port/g' /etc/ssh/sshd_config
    # turn off password authentication
    sed -i 's/^PasswordAuthentication/#PasswordAuthentication/g' /etc/ssh/sshd_config
    # turn off dns
    sed -i 's/^UseDNS/#UseDNS/g' /etc/ssh/sshd_config

    echo "Port $Port">> /etc/ssh/sshd_config
    echo "PasswordAuthentication no">> /etc/ssh/sshd_config
    echo "UseDNS no">> /etc/ssh/sshd_config

    service sshd restart

    iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport $Port -j ACCEPT
    echo "新的 SSH 端口号 : $Port"
fi