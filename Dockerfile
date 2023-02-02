#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:4a45212e9518f35983a976eead0de5eecc555a2f047134e9dd2cfc589076a00d as build-focal
FROM ubuntu:jammy@sha256:9a0bdde4188b896a372804be2384015e90e3f84906b750c1a53539b585fbbe7f as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
