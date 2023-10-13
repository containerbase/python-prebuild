#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:0b5642e51a93c43da14d8c0322b43739abaa1ddd8b15f2c811175e42b6340d72 as build-focal
FROM ubuntu:jammy@sha256:a9038002b9b29c77c93b1c562ca2bee51313c6f5208c8d90b91929db62e96930 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
