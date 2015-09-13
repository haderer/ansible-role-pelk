FROM phusion/baseimage:0.9.16


# java install
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  apt-get install -y libc6-dev && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# logstash install
RUN curl -L -o /tmp/logstash_{{ logstash.version }}_all.deb \ 
    http://download.elastic.co/logstash/logstash/packages/debian/logstash_{{ logstash.version }}_all.deb && \
    dpkg -i /tmp/logstash_{{ logstash.version }}_all.deb



ENV PATH /opt/logstash/bin:$PATH
ENV HOME /root


ADD *.conf /etc/logstash/conf.d/
ADD nginx.pattern /opt/logstash/patterns/nginx

COPY entrypoint.sh /etc/service/logstash/run
RUN  chmod u+x /etc/service/logstash/run
