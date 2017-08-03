FROM docker.io/centos:latest

COPY run.sh /
RUN chmod +x /run.sh && yum install openssl openssh-clients.x86_64 openssh-server -y && yum clean all
RUN ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N '' && ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' && ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N ''
RUN echo 'abc123' | passwd --stdin root

ENV PORT=22025

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

CMD /run.sh $PORT
