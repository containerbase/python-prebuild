#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:982d72c16416b09ffd2f71aa381f761422085eda1379dc66b668653607969e38 as build-bionic
FROM ubuntu:focal@sha256:9101220a875cee98b016668342c489ff0674f247f6ca20dfc91b91c0f28581ae as build-focal


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
