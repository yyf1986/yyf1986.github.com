FROM devcloud-openjdk-centos7base:1.8

COPY run.sh /
COPY sonar.tar.gz /opt/

RUN chmod +x /run.sh

# SONAR_WEBPORT: sonar http port
# SONAR_DBUSER: db username
# SONAR_DBPASS: db password
# SONAR_DB: db info like ip:port
# SONARDB_NAME: db name
ENV SONAR_WEBPORT=9000 \
    SONAR_DBUSER='NA' \
    SONAR_DBPASS='NA' \
    SONAR_DB='NA' \
    SONARDB_NAME='NA' 

EXPOSE $SONAR_WEBPORT

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 

CMD /run.sh $SONAR_WEBPORT $SONAR_DBUSER $SONAR_DBPASS $SONAR_DB $SONARDB_NAME
