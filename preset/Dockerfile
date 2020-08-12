# https://hub.docker.com/r/preset/superset
FROM preset/superset

USER root

RUN pip --no-cache-dir install elasticsearch-dbapi \
 && pip --no-cache-dir install impyla \
 && pip --no-cache-dir install mysqlclient \
 && pip --no-cache-dir install redis