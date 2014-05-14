FROM ubuntu:latest
MAINTAINER Nathan Warner "nathan@frcv.net"

# CHANGE THIS PASSWORD IT IS FOR SSH
RUN echo "root:password" | chpasswd && \
    mkdir -p /data/db && \
    mkdir -p /var/run/sshd && \
    mkdir -p /var/log/supervisor && \
    apt-get install -y supervisor openssh-server software-properties-common mongodb && \
    sed -i 's/^PermitRootLogin.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    add-apt-repository --yes ppa:chris-lea/node.js && \
    apt-get update --yes && \
    apt-get install --yes nodejs && \
    cd / && \
    wget --quiet https://github.com/clarkda/action-jackson/archive/master.tar.gz -O action_jackson.tar.gz && \
    tar -zxf action_jackson.tar.gz && \
    cd action-jackson-master && \
    /usr/bin/npm install

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 22 3000
CMD ["/usr/bin/supervisord"]
