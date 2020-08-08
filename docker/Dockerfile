FROM python:3.6.9

RUN apt-get update -y \
    && apt-get install build-essential libssl-dev libffi-dev python-dev python-pip libsasl2-dev libldap2-dev -y \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/cache/apk/*

RUN pip install --upgrade setuptools pip \
    && pip --no-cache-dir install apache-superset \
    && pip --no-cache-dir install elasticsearch-dbapi \
	&& pip --no-cache-dir install impyla \
	&& pip --no-cache-dir install mysqlclient \
	&& pip --no-cache-dir install redis

EXPOSE 8088

COPY docker-entrypoint.sh /docker-entrypoint.sh

ENTRYPOINT ["bash", "/docker-entrypoint.sh"]

CMD ["run"]