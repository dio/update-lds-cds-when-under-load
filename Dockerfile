FROM envoyproxy/envoy-alpine:v1.11.1

RUN mkdir -p /etc/xds
RUN echo "lds1.yaml" > /etc/xds/current
COPY ./lds1.yaml /etc/xds/lds-active.yaml
COPY ./cds1.yaml /etc/xds/cds-active.yaml

COPY ./lds1.yaml /etc/xds/lds1.yaml
COPY ./lds2.yaml /etc/xds/lds2.yaml
COPY ./cds1.yaml /etc/xds/cds1.yaml
COPY ./cds2.yaml /etc/xds/cds2.yaml

COPY ./toggle.sh /etc/toggle.sh
