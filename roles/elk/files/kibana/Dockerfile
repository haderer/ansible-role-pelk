FROM debian:jessie

# add our user and group first to make sure their IDs get assigned consistently
RUN groupadd -r kibana && useradd -r -g kibana kibana

RUN set -x \
    curl -sL https://deb.nodesource.com/setup_0.12 | bash -

RUN apt-get update && apt-get install -y \
    ca-certificates \
    nodejs \
    npm \
    curl --no-install-recommends &&\
    rm -rf /var/lib/apt/lists/*

# grab gosu for easy step-down from root
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
RUN arch="$(dpkg --print-architecture)" \
	&& set -x \
	&& curl -o /usr/local/bin/gosu -SL "https://github.com/tianon/gosu/releases/download/1.3/gosu-$arch" \
	&& curl -o /usr/local/bin/gosu.asc -SL "https://github.com/tianon/gosu/releases/download/1.3/gosu-$arch.asc" \
	&& gpg --verify /usr/local/bin/gosu.asc \
	&& rm /usr/local/bin/gosu.asc \
	&& chmod +x /usr/local/bin/gosu


ENV KIBANA_VERSION 4.0.2
ENV KIBANA_SHA1 c925f75cd5799bfd892c7ea9c5936be10a20b119

RUN set -x \
	&& curl -fSL "https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz" -o kibana.tar.gz \
	&& echo "${KIBANA_SHA1}  kibana.tar.gz" | sha1sum -c - \
	&& mkdir -p /opt/kibana \
	&& tar -xz --strip-components=1 -C /opt/kibana -f kibana.tar.gz \
	&& rm kibana.tar.gz

ENV PATH /opt/kibana/bin:$PATH

RUN npm install elasticdump -g

COPY ./docker-entrypoint.sh /
RUN chmod u+x ./docker-entrypoint.sh

EXPOSE 5601

