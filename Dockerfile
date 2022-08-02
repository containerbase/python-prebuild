#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:eb1392bbdde63147bc2b4ff1a4053dcfe6d15e4dfd3cce29e9b9f52a4f88bc74 as build-bionic
FROM ubuntu:focal@sha256:af5efa9c28de78b754777af9b4d850112cad01899a5d37d2617bb94dc63a49aa as build-focal
FROM ubuntu:jammy@sha256:34fea4f31bf187bc915536831fd0afc9d214755bf700b5cdb1336c82516d154e as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
