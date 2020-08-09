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
