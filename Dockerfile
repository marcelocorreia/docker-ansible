FROM debian:jessie-slim
MAINTAINER marcelo correia <marcelocorreia@starvisitor.com>

RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y \
    curl \
    libldap2-dev \
    libpq-dev \
    libsasl2-dev \
    libxml2-dev \
    libxslt1-dev \
    openssl \
    python \
    python-dev \
    python-pip \
    tzdata \
    unzip
RUN pip install --upgrade pip
RUN pip install awscli boto
RUN pip install ansible

RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace

CMD ansible --version