#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:138ddf6a0815d0db123be28790ef1cc5691de06fe7d9951953e2011fd0761685 as build-bionic
FROM ubuntu:focal@sha256:514c495036e344710402a1de098e2b81aee8727210d11c36e36aa4e44ec157d8 as build-focal
FROM ubuntu:jammy@sha256:86181188d631f0699afaefb177631b21a6d692629679443197472a3df6355012 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
