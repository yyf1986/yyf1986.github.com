#!/bin/bash
filename="elasticsearch-5.2.2"
ClusterName=$1
HttpPort=$2
TransPort=$3
if [ -f /opt/${filename}.tar.gz ]; then
  echo "install..."

  cd /opt;tar zxvf ${filename}.tar.gz > /dev/null;rm -fr ${filename}.tar.gz
  
  echo "add user es"
  useradd es

  chown -R es.es $filename

  echo "start to config..."
  sed -i 's/^#cluster.name: .*$/cluster.name: '"$ClusterName"'/' /opt/elasticsearch-5.2.2/config/elasticsearch.yml
  sed -i 's/^#network.host: .*$/network.host: 0.0.0.0/' /opt/elasticsearch-5.2.2/config/elasticsearch.yml
  sed -i 's/^#http.port: .*$/http.port: '"$HttpPort"'/' /opt/elasticsearch-5.2.2/config/elasticsearch.yml
  sed -i '59a transport.tcp.port: '"$TransPort"'' /opt/elasticsearch-5.2.2/config/elasticsearch.yml
  
  echo "modify config sucess"

fi
echo "start es..."
echo "ClusterName $ClusterName HttpPort $HttpPort TransPort $TransPort"
su - es -c "cd /opt/$filename/bin;./elasticsearch"
