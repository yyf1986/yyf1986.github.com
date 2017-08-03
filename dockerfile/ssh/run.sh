#!/bin/bash
#yum install openssl openssh-clients.x86_64 openssh-server -y

#ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N ''
#ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''
#ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N ''

sed -i 's/#Port 22/Port '"$1"'/' /etc/ssh/sshd_config

/usr/sbin/sshd

while :
do
  echo "live"
  sleep 60
done
