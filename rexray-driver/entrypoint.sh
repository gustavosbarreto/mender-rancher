#!/bin/sh

if [ "$REXRAY_SERVICE_MODE" = "true" ]; then
    cp /etc/rexray/server-config.yml /etc/rexray/config.yml
else
    cp /etc/rexray/client-config.yml /etc/rexray/config.yml

    REXRAY_IPADDRESS=$(dig +short rexray.rexray-$REXRAY_PROVIDER.rancher.internal)

    sed -i /etc/rexray/config.yml -e "s,_REXRAY_IPADDRESS_,$REXRAY_IPADDRESS,g"
    sed -i /etc/rexray/config.yml -e "s,_REXRAY_DEFAULT_VOLUME_SIZE_,$REXRAY_ENV_DEFAULT_VOLUME_SIZE,g"
fi

sed -i /etc/rexray/config.yml -e "s,_REXRAY_PROVIDER_,$REXRAY_PROVIDER,g"

mount --rbind /host/dev /dev

export LD_PRELOAD=/usr/lib/libcrypto.so.41.0.1

rexray -v -l debug start -f
