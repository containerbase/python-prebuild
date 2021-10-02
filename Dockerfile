#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:d501bde46939f19cb83d6fc604f8d0cda403683e8aa9765f5f0f271de3025279 as build-bionic
FROM ubuntu:focal@sha256:44ab2c3b26363823dcb965498ab06abf74a1e6af20a732902250743df0d4172d as build-focal


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
