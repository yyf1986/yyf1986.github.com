FROM devcloud-openjdk-centos7base:1.8

COPY run.sh /
COPY elasticsearch-5.2.2.tar.gz /opt/

RUN chmod +x /run.sh

ENV ClusterName=devcloud \
    HttpPort=9200 \
    TransPort=9300

EXPOSE $HttpPort $TransPort

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 

CMD /run.sh $ClusterName $HttpPort $TransPort
