#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:04919776d30640ce4ed24442d5f7c1a8e4bd0e4793ed9469843cedaecb0d72fb as build-bionic
FROM ubuntu:focal@sha256:cf31af331f38d1d7158470e095b132acd126a7180a54f263d386da88eb681d93 as build-focal


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
