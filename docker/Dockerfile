FROM python:3.6.9

RUN apt-get update -y \
    && apt-get install build-essential libssl-dev libffi-dev python-dev python-pip libsasl2-dev libldap2-dev -y \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade setuptools pip

RUN pip install apache-superset

RUN superset db upgrade

RUN superset fab create-admin \
              --username admin \
              --firstname Superset \
              --lastname Admin \
              --email admin@superset.com \
              --password admin

RUN superset load_examples

RUN superset init

EXPOSE 8088

CMD superset run  -h 0.0.0.0 -p 8088 --with-threads


