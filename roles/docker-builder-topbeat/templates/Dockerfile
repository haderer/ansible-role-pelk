FROM phusion/baseimage:0.9.16

RUN apt-get update && \
    apt-get -y -q install libpcap0.8 && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer

RUN curl -L -o /tmp/top_{{ topbeat_version }}.deb \ 
    https://download.elastic.co/beats/topbeat/topbeat_{{ topbeat_version }}.deb && \
    dpkg -i /tmp/top_{{ topbeat_version }}.deb

ADD topbeat.yml /etc/topbeat/topbeat.yml
ADD topbeat-entrypoint.sh /etc/service/topbeat/run
RUN chmod ugo+rx /etc/service/topbeat/run
