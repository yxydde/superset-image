FROM python:3.6.9

RUN apt-get update -y \
    && apt-get install build-essential libssl-dev libffi-dev python-dev python-pip libsasl2-dev libldap2-dev -y \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade setuptools pip

RUN pip install apache-superset

EXPOSE 8080