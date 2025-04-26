#!/bin/bash

set -e

echo "🔧 正在更新软件包索引..."
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "🔑 添加 Docker GPG 密钥..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | \
    sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "📦 添加 Docker APT 软件源..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/debian $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "🔄 再次更新软件包索引（包含 Docker 源）..."
sudo apt update

echo "⬇️ 安装 Docker 引擎及相关组件..."
sudo apt install -y docker-ce docker-ce-cli containerd.io \
    docker-buildx-plugin docker-compose-plugin

echo "🚀 启动并设置 Docker 服务开机自启..."
sudo systemctl enable docker
sudo systemctl start docker

echo "✅ 安装完成，测试运行 hello-world..."
sudo docker run --rm hello-world

echo "🎉 Docker 已成功安装！你可以使用 docker 命令了。"

echo "🔐 如果你希望当前用户使用 Docker 而不需要 sudo，请执行："
echo "    sudo usermod -aG docker \$USER"
echo "    然后重新登录或运行 newgrp docker"
