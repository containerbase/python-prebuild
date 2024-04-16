#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:f71981ca44fed32f9c86886c5abc6db23363e2f8e6a99e4d03687444939427d0 as build-focal
FROM ubuntu:jammy@sha256:193c13d13beb11bedfc07587d208f880bce5535dc5f5cbb277e22a3847cc84a8 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
