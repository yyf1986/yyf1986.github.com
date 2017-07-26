FROM devcloud-openjdk-centos7base:1.8

COPY ElasticHD /

RUN chmod +x /ElasticHD

ENV ESUIPort=9800

EXPOSE $ESUIPort

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 

CMD /ElasticHD -p 0.0.0.0:$ESUIPort
