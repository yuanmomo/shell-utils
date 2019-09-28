#!/usr/bin/env bash

# install docker first
if [[ ! $(command -v docker) ]]; then
    echo "自动安装 docker 。。。。。"
    wget -qO- get.docker.com | bash
fi

if [[ ! $(command -v docker-compose) ]]; then
    echo "自动安装 docker-compose 。。。。。"
    curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi

