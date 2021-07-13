#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:3b8692dc4474d4f6043fae285676699361792ce1828e22b1b57367b5c05457e3 as build-bionic
FROM ubuntu:focal@sha256:b3e2e47d016c08b3396b5ebe06ab0b711c34e7f37b98c9d37abe794b71cea0a2 as build-focal


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
