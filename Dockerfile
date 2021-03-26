#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:b88b1a74d1b3cace1d2eedb41efd80917ddba1f00096eee85d5bcf79ad90f84a as build-bionic
FROM ubuntu:focal@sha256:64255397e256fd33d6c6ddbc371027093315f9822089a32b8eeb045d83bb91c4 as build-focal


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
