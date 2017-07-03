FROM golang:1.8-alpine3.6

WORKDIR /go/src/github.com/rancher/storage

RUN apk add --update --no-cache jq bind-tools e2fsprogs blkid bash curl && \
    apk add --update --no-cache --virtual build-dependencies alpine-sdk

# Build and install Rancher storage plugin
RUN curl -sSOL https://github.com/rancher/storage/archive/v0.8.2.tar.gz && \
    tar xvf v0.8.2.tar.gz -C /go/src/github.com/rancher/storage/ --strip-components 1 && \
    cp -rf vendor/* /go/src/ && \
    go build && \
    go install && \
    cp -rf package/common/* /usr/bin/

ENV RANCHER_SSL_SCRIPT_COMMIT=98660ada3d800f653fc1f105771b5173f9d1a019

RUN curl -sL https://raw.githubusercontent.com/rancher/rancher/${RANCHER_SSL_SCRIPT_COMMIT}/server/bin/update-rancher-ssl > /usr/bin/update-rancher-ssl && \
    chmod +x /usr/bin/update-rancher-ssl

RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

# Install REX-Ray
RUN curl -sSL https://dl.bintray.com/emccode/rexray/install | sh -s -- stable 0.9.2

# Clean environment
RUN apk del build-dependencies
WORKDIR /go
RUN rm -rf /go/src/*

ADD rexray-dobs /usr/bin/

CMD ["start.sh", "storage", "--driver-name", "rexray-dobs"]
