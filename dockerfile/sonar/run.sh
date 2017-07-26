#!/bin/bash
SONAR_WEBPORT=$1
SONAR_DBUSER=$2
SONAR_DBPASS=$3
SONAR_DB=$4
SONARDB_NAME=$5
if [ -f /opt/sonar.tar.gz ]; then
  echo "tar zxvf sonar.tar.gz...."
  cd /opt/;tar zxvf sonar.tar.gz --no-same-owner > /dev/null;rm -fr sonar.tar.gz
  echo "modify /opt/sonar/conf/sonar.properties"
  sed -i 's/##SONAR_DBUSER##/'"$SONAR_DBUSER"'/' /opt/sonar/conf/sonar.properties
  sed -i 's/##SONAR_DBPASS##/'"$SONAR_DBPASS"'/' /opt/sonar/conf/sonar.properties
  sed -i 's/##SONAR_DB##/'"$SONAR_DB"'/' /opt/sonar/conf/sonar.properties
  sed -i 's/##SONARDB_NAME##/'"$SONARDB_NAME"'/' /opt/sonar/conf/sonar.properties
  sed -i 's/##SONAR_PORT##/'"$SONAR_WEBPORT"'/' /opt/sonar/conf/sonar.properties
fi
if [ -f /opt/initdb.py ]; then
  sed -i 's/##SONAR_DBUSER##/'"$SONAR_DBUSER"'/' /opt/initdb.py
  sed -i 's/##SONAR_DBPASS##/'"$SONAR_DBPASS"'/' /opt/initdb.py
  sed -i 's/##SONAR_DB##/'"$SONAR_DB"'/' /opt/initdb.py
  sed -i 's/##SONARDB_NAME##/'"$SONARDB_NAME"'/' /opt/initdb.py
fi
#cd /opt;python initdb.py
cd /opt/sonar/bin/linux-x86-64;./sonar.sh start
