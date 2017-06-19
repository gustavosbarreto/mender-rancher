#!/bin/sh

gomplate -f /etc/rexray/config.yml.tpl -o /etc/rexray/config.yml

mount --rbind /host/dev /dev

rexray start -f
