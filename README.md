# SuperSet QuickStart

```
~]# docker run -d -p 8080:8088 registry.cn-beijing.aliyuncs.com/basic-mirrors/superset-quickstart
```

# SuperSet 配置外部数据库

```
# 创建MySQL数据库
CREATE DATABASE superset;
GRANT ALL PRIVILEGES ON *.* TO 'superset'@'%' identified by 'changeme';
FLUSH PRIVILEGES;

# 配置数据库连接
~]# vi superset_config.py
SQLALCHEMY_DATABASE_URI = 'mysql://superset:changeme@192.168.116.139/superset'

# superset初始化
~]# docker run -v /home/docker/superset/superset_config.py:/superset/superset_config.py registry.cn-beijing.aliyuncs.com/basic-mirrors/superset init
  
# 启动服务
~]# docker run -d \
  -p 8088:8088 \
  -v /home/docker/superset/superset_config.py:/superset/superset_config.py \
  registry.cn-beijing.aliyuncs.com/basic-mirrors/superset
```

# 使用 preset/superset 基础镜像

https://hub.docker.com/r/preset/superset

```
docker run -d -p 8080:8080 \
        -v /home/docker/superset/superset_config.py:/app/pythonpath/superset_config.py \
        --name superset pregistry.cn-beijing.aliyuncs.com/basic-mirrors/preset-superset

docker exec -it superset superset fab create-admin \
               --username admin \
               --firstname Superset \
               --lastname Admin \
               --email admin@superset.com \
               --password admin

docker exec -it superset superset db upgrade

docker exec -it superset superset load_examples

docker exec -it superset superset init
```

