FROM phusion/baseimage:0.9.16

# install node & npm
#RUN set -x \
#    curl -sL https://deb.nodesource.com/setup_0.12 | bash -
#RUN apt-get update && apt-get install -y \
#    ca-certificates \
#    nodejs \
#    npm \
#    curl --no-install-recommends &&\
#    rm -rf /var/lib/apt/lists/*
#RUN npm install elasticdump -g

ENV KIBANA_VERSION {{ kibana.version }}
ENV KIBANA_SHA1 c925f75cd5799bfd892c7ea9c5936be10a20b119

RUN set -x \
	&& curl -fSL "https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz" -o kibana.tar.gz \
	&& echo "${KIBANA_SHA1}  kibana.tar.gz" | sha1sum -c - \
	&& mkdir -p /opt/kibana \
	&& tar -xz --strip-components=1 -C /opt/kibana -f kibana.tar.gz \
	&& rm kibana.tar.gz

ENV PATH /opt/kibana/bin:$PATH

COPY entrypoint.sh /etc/service/kibana/run
COPY kibana.yml /opt/kibana/config/kibana.yml
RUN  chmod u+x /etc/service/kibana/run