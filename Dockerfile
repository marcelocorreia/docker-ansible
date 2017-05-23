FROM alpine:3.5
MAINTAINER marcelo correia <marcelocorreia@starvisitor.com>

RUN set -ex
RUN apk add --no-cache \
        py-pip \
        build-base \
        python-dev \
        libffi-dev \
        openssl-dev \
        bash \
        tzdata \
        git \
        make \
        openssh
RUN pip install ansible
RUN rm /var/cache/apk/*
RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace
CMD ansible --version