FROM ubuntu:18.04

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y ca-certificates curl \
    && apt-get autoremove -y \
    && apt-get clean \
    && rm -rf /tmp/* /var/tmp/* \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/xds
RUN echo "lds1.yaml" > /etc/xds/current
COPY ./lds1.yaml /etc/xds/lds-active.yaml
COPY ./cds1.yaml /etc/xds/cds-active.yaml

COPY ./lds1.yaml /etc/xds/lds1.yaml
COPY ./lds2.yaml /etc/xds/lds2.yaml
COPY ./cds1.yaml /etc/xds/cds1.yaml
COPY ./cds2.yaml /etc/xds/cds2.yaml

COPY ./toggle.sh /etc/toggle.sh

RUN mkdir -p /etc/envoy

ADD envoy-static.stripped /usr/local/bin/envoy

EXPOSE 10000

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
