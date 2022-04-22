#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:43d8a96ef9acfbec2da181adc3b72ff1f30a555716c717e4a722b5031fa3d83e as build-bionic
FROM ubuntu:focal@sha256:4e9ed8dc49c4c21888f4053e59d7ef0959f57e77d0fbe47ba0063fddd6b70f2c as build-focal


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
