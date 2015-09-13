FROM phusion/baseimage:0.9.16

RUN groupadd -r kibana && useradd -r -g kibana kibana

# java install
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer


# elasticsearch install
RUN curl -L -o \
   /tmp/elasticsearch-{{ elasticsearch.version }}.deb \
   https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-{{ elasticsearch.version }}.deb && \
   dpkg -i /tmp/elasticsearch-{{ elasticsearch.version }}.deb


ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV PATH /usr/share/elasticsearch/bin:$PATH


COPY logging.yml /usr/share/elasticsearch/config/logging.yml
COPY elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml
COPY entrypoint.sh /etc/service/elasticsearch/run
RUN  chmod  u+x /etc/service/elasticsearch/run


EXPOSE 9200 9300 9400

VOLUME /usr/share/elasticsearch/data
VOLUME /usr/share/elasticsearch/config