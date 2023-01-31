#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:63986ce572d0e7b2268073c863561cb001ef3cb15ef69c45c1d890f7262e1bdf as build-bionic
FROM ubuntu:focal@sha256:b33325a00c7c27b23ae48cf17d2c654e2c30812b35e7846c006389318f6a71c2 as build-focal
FROM ubuntu:jammy@sha256:f05532b6a1dec5f7a77a8d684af87bc9cd1f2b32eab301c109f8ad151b5565d1 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
