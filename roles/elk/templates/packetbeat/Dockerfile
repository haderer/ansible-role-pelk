FROM phusion/baseimage:0.9.16
MAINTAINER Tudor Golubenco <tudor@packetbeat.com>

RUN apt-get update
RUN apt-get -y -q install libpcap0.8

RUN curl -L -o /tmp/packetbeat_amd64.deb https://github.com/elastic/packetbeat/releases/download/v0.5.0/packetbeat_0.5.0-1_amd64.deb
RUN dpkg -i /tmp/packetbeat_amd64.deb

ADD packetbeat.conf /etc/packetbeat/packetbeat.conf