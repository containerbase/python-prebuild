#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:8517db592129015f59735a921fa1780d2775ba7dc4353e306d344a6308480154 as build-focal
FROM ubuntu:jammy@sha256:90f3997e3e5f82097fa3046152944772876ac338365954f693b9e1bd3dd3c280 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
