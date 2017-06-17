FROM mendersoftware/api-gateway:1.0.0

COPY nginx.conf /usr/local/openresty/nginx/conf/nginx.conf

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
