FROM phusion/baseimage:0.9.16

RUN apt-get update && \
    apt-get -y -q install libpcap0.8 && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer

RUN curl -L -o /tmp/packetbeat_{{ packetbeat_version }}.deb \ 
    https://download.elastic.co/beats/packetbeat/packetbeat_{{ packetbeat_version }}.deb && \
    dpkg -i /tmp/packetbeat_{{ packetbeat_version }}.deb

ADD packetbeat.yml /etc/packetbeat/packetbeat.yml
ADD packetbeat-entrypoint.sh /etc/service/packetbeat/run
RUN chmod ugo+rx /etc/service/packetbeat/run
