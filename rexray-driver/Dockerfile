FROM frolvlad/alpine-glibc:latest

RUN apk add --update curl bind-tools e2fsprogs
RUN curl -sSL https://dl.bintray.com/emccode/rexray/install | sh -s -- stable 0.9.0

ADD entrypoint.sh /usr/bin/entrypoint.sh
ADD server-config.yml /etc/rexray/server-config.yml
ADD client-config.yml /etc/rexray/client-config.yml

ADD https://github.com/hairyhenderson/gomplate/releases/download/v1.9.0/gomplate_linux-amd64 /usr/bin/gomplate
RUN chmod +x /usr/bin/gomplate

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
