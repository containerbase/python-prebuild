#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:e4c02475c7c9c43f8f5bf595d5260a84e1b44e49d9c5ece6d3e5dc6a0a5835a0 as build-focal
FROM ubuntu:jammy@sha256:39ab14240b6da1cb8c34bd4f498b90b7cf3b6c6aa2d524f45c9501038d6b2709 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
