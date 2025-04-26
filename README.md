# Docker 模板集合

这是一个包含常用数据库服务的 Docker 模板集合，包括 MySQL、MongoDB 和 Redis。这些模板提供了快速部署和配置这些数据库服务的方法。

## 目录结构

```
.
├── docker_install.sh    # Docker 安装脚本
├── mongodb/            # MongoDB 配置
│   ├── data/          # 数据存储目录
│   └── docker-compose.yml
├── mysql/             # MySQL 配置
│   ├── data/          # 数据存储目录
│   └── docker-compose.yml
└── redis/             # Redis 配置
    ├── data/          # 数据存储目录
    ├── docker-compose.yml
    └── redis.conf     # Redis 配置文件
```

## 前置要求

- Linux 操作系统（推荐 Ubuntu/Debian）
- 具有 sudo 权限的用户
- 稳定的网络连接

## 安装 Docker

项目提供了自动安装 Docker 的脚本：

```bash
chmod +x docker_install.sh
./docker_install.sh
```

安装完成后，建议将当前用户添加到 docker 用户组：

```bash
sudo usermod -aG docker $USER
newgrp docker
```

## 使用说明

### MySQL

1. 进入 MySQL 目录：
```bash
cd mysql
```

2. 启动服务：
```bash
docker-compose up -d
```

3. 停止服务：
```bash
docker-compose down
```

### MongoDB

1. 进入 MongoDB 目录：
```bash
cd mongodb
```

2. 启动服务：
```bash
docker-compose up -d
```

3. 停止服务：
```bash
docker-compose down
```

### Redis

1. 进入 Redis 目录：
```bash
cd redis
```

2. 启动服务：
```bash
docker-compose up -d
```

3. 停止服务：
```bash
docker-compose down
```

## 注意事项

1. 所有数据都存储在各自的 `data` 目录中，请确保这些目录有足够的磁盘空间。
2. 首次使用前，建议先查看各个服务的 `docker-compose.yml` 文件，根据需要修改配置。
3. 所有服务默认使用官方镜像的最新版本。
4. 建议在生产环境中修改默认密码和其他安全相关配置。

## 许可证

MIT License
