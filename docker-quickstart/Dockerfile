FROM preset/superset

USER root

RUN pip --no-cache-dir install mysqlclient && pip --no-cache-dir install redis

USER superset

RUN superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password admin

RUN superset db upgrade

RUN superset load_examples

RUN superset init


