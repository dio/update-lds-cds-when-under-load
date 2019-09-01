#!/bin/sh

current=$(cat /etc/xds/current)
if [ "$current" == "lds1.yaml" ]; then
    cat /etc/xds/lds2.yaml > /tmp/lds.yaml
    cat /etc/xds/cds2.yaml > /tmp/cds.yaml
    echo "lds2.yaml" > /etc/xds/current
    echo "updated to lds2.yaml"
else
    cat /etc/xds/lds1.yaml > /tmp/lds.yaml
    cat /etc/xds/cds1.yaml > /tmp/cds.yaml
    echo "lds1.yaml" > /etc/xds/current
    echo "updated to lds1.yaml"
fi

mv /tmp/lds.yaml /etc/xds/lds-active.yaml
mv /tmp/cds.yaml /etc/xds/cds-active.yaml
