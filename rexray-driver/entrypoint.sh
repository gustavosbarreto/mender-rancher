#!/bin/sh

gomplate -f /etc/rexray/config.yml.tpl -o /etc/rexray/config.yml

if [ "$REXRAY_SERVER_MODE" != "true" ]; then
  mount --rbind /host/dev /dev

  # Accept peer fingerprint
  # https://rexray.readthedocs.io/en/stable/user-guide/config/#peer-verification)
  rexray device ls <<!
yes
!
fi

rexray start -f
