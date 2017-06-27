FROM frolvlad/alpine-glibc:latest

RUN apk add --update curl bind-tools e2fsprogs
RUN curl -sSL https://dl.bintray.com/emccode/rexray/install | sh -s -- stable 0.9.1

RUN curl -sSL -o /usr/bin/gomplate https://github.com/hairyhenderson/gomplate/releases/download/v1.9.0/gomplate_linux-amd64
RUN chmod +x /usr/bin/gomplate

ADD entrypoint.sh /usr/bin/entrypoint.sh
ADD config.yml.tpl /etc/rexray/config.yml.tpl

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]
