#!/bin/sh

exec /usr/local/openresty/bin/openresty -g "daemon off;" $*
