FROM devcloud-mysql-centos7base:5.7

COPY run.sh /
RUN chmod +x /run.sh

ENV PORT=33060

EXPOSE $PORT

ENV LANG=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8 

CMD /run.sh $PORT
