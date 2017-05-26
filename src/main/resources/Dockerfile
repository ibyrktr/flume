FROM java:openjdk-8-jre

ENV DEBIAN_FRONTEND noninteractive
ENV FLUME_VERSION 1.7.0
ENV FLUME_HOME /opt/apache-flume
ENV FLUME_ROOT_LOG INFO,LOGFILE
ENV FLUME_CONF_FILE "$FLUME_HOME"/conf/flume.conf
ENV FLUME_CONF_DIR "$FLUME_HOME"/conf
ENV AGENT_NAME=agent

RUN apt-get update && \
    apt-get install -y zookeeper wget supervisor dnsutils && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    wget -q http://apache.proserve.nl/flume/"$FLUME_VERSION"/apache-flume-"$FLUME_VERSION"-bin.tar.gz -O /tmp/apache-flume-"$FLUME_VERSION"-bin.tar.gz && \
    mkdir "$FLUME_HOME" && \
    tar zxvf /tmp/apache-flume-"$FLUME_VERSION"-bin.tar.gz -C "$FLUME_HOME" --strip 1 && \
    rm /tmp/apache-flume-"$FLUME_VERSION"-bin.tar.gz


#RUN mkdir "$FLUME_HOME"/logs
ADD conf/flume.conf "$FLUME_CONF_FILE"
ADD conf/log4j.properties "$FLUME_CONF_DIR"/log4j.properties

ADD run/flume-supervisor.conf /etc/supervisor/conf.d/
ADD run/start-flume.sh "$FLUME_HOME"/bin/start-flume.sh
RUN chmod 755 "$FLUME_HOME"/bin/start-flume.sh

EXPOSE 1234
CMD ["supervisord", "-n"]