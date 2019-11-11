#!/usr/bin/env bash

# install app  if not installed
# $1 command to check
# $2 app name to install
function install_ufw(){
    command=$1
    app_name=$1
    # install app
    if [[ ! $(command -v ${command}) ]] ;then
        if [[ $(command -v apt) ]]; then
            echo "Start to check and install ${app_name} on remote Debian system ....."
            dpkg -l | grep -qw ${app_name} || apt install -y ${app_name}
        else
            ## RHEL
            echo "Start to check and install ${app_name} on remote RHEL system ....."
            rpm -qa | grep -qw ${app_name} || yum install -y ${app_name}
        fi
    fi
}

function install_ufw(){
    if [[ ! $(command -v ufw) ]]; then
        echo "Installing ufw ..."
        install ufw ufw
    fi
}

function enable_ufw(){
    echo "y"|ufw enable
    ufw default deny
}

# default only IPv4
function port_allow_ufw_v4(){
    # port
    port=$1
    # tcp or udp
    type=$2

    if [[ ! ${type} ]]; then
        type="tcp"
    fi

    echo "Allow port ${port}/${type} in...."

    exist_tcp_and_udp=$(ufw status verbose |grep -v '(v6)' |awk -F ' ' '{print $1}' |egrep -w "^${port}$")
    if [[ ${exist_tcp_and_udp} ]]; then
        # already exists
        exist_rule=`ufw status verbose |grep -v "(v6)" | egrep -w "^${port}"`
        echo "Rule already exist : ${exist_rule} "
        return
    fi

    exist_type=$(ufw status verbose |grep -v '(v6)' |awk -F ' ' '{print $1}' |egrep -w "^${port}/${type}$")
    if [[ ${exist_type} ]]; then
        # already exists
        exist_rule=`ufw status verbose |grep -v '(v6)' | egrep -w "^${port}/${type}"`
        echo "Rule already exist : ${exist_rule} "
        return
    fi

    ufw allow ${port}/${type}
}

# default allow ssh port
ssh_port=`ss -tulpn | grep -i sshd | awk -F ' ' '{print $5}'  | grep "\*"|awk -F ':' '{print $2}'`

port_allow_ufw_v4 ${ssh_port} "tcp"

port_allow_ufw_v4 22 "tcp"
port_allow_ufw_v4 22 "udp"
port_allow_ufw_v4 22

port_allow_ufw_v4 5000 "tcp"

port_allow_ufw_v4 900:1900 "tcp"
port_allow_ufw_v4 900:1900 "tcp"




