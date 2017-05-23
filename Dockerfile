FROM alpine:3.5
MAINTAINER marcelo correia <marcelocorreia@starvisitor.com>

RUN set -ex && apk add --no-cache \
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
    && pip install ansible \
	&& apk del build-base py-pip libffi-dev openssl-dev
RUN mkdir -p /opt/workspace
WORKDIR /opt/workspace
CMD ansible --version