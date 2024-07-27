#!/bin/bash

# 备份当前的 sources.list
if [ -f /etc/apt/sources.list ]; then
    cp /etc/apt/sources.list /etc/apt/sources.list.bak
    echo "已备份原始的 sources.list 文件到 /etc/apt/sources.list.bak"
else
    echo "未找到 /etc/apt/sources.list 文件，跳过备份步骤"
fi

# 删除当前的 sources.list
rm -f /etc/apt/sources.list
# 替换为阿里云的镜像源
cat > /etc/apt/sources.list <<EOF
deb https://mirrors.aliyun.com/ubuntu/ jammy main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ jammy main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ jammy-security main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ jammy-security main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ jammy-updates main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ jammy-updates main restricted universe multiverse
# deb https://mirrors.aliyun.com/ubuntu/ jammy-proposed main restricted universe multiverse
# deb-src https://mirrors.aliyun.com/ubuntu/ jammy-proposed main restricted universe multiverse
deb https://mirrors.aliyun.com/ubuntu/ jammy-backports main restricted universe multiverse
deb-src https://mirrors.aliyun.com/ubuntu/ jammy-backports main restricted universe multiverse
EOF

# 更新软件包列表
apt-get update

echo "软件源已经成功更换为阿里云镜像源，并且更新了软件包列表。"
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 871920D1991BC93C
#还需完善，别急
