FROM phusion/baseimage:0.9.16

RUN apt-get update && \
    apt-get -y -q install libpcap0.8 && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer



RUN curl -L -o /tmp/packetbeat_0.5.0-1_amd64.deb \ 
    https://github.com/elastic/packetbeat/releases/download/v0.5.0/packetbeat_0.5.0-1_amd64.deb && \
    dpkg -i /tmp/packetbeat_0.5.0-1_amd64.deb

ADD packetbeat.conf /etc/packetbeat/packetbeat.conf
ADD packetbeat-entrypoint.sh /etc/service/packetbeat/run

RUN chmod ugo+rx /etc/service/packetbeat/run
