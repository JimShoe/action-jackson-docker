FROM ubuntu:latest
MAINTAINER Nathan Warner "nathan@frcv.net"

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list \
    && mkdir -p /data/db \
    && apt-get install -y supervisor openssh-server python-software-properties mongodb \
    && mkdir -p /var/run/sshd \
    && mkdir -p /var/log/supervisor \
    && echo "root:password" | chpasswd \
    && add-apt-repository --yes ppa:chris-lea/node.js \
    && apt-get update --yes \
    && apt-get install --yes nodejs \
    && cd / \
    && wget --quiet https://github.com/clarkda/action-jackson/archive/master.tar.gz -O action_jackson.tar.gz \
    && tar -zxf action_jackson.tar.gz \
    && cd action-jackson-master \
    && /usr/bin/npm install

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22 3000
CMD ["/usr/bin/supervisord"]
