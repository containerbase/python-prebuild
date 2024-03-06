#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:4aa8450a95b7f109ba1dc18ea541a42186bb87e75c8fbbee089ecf20c165c7e4 as build-focal
FROM ubuntu:jammy@sha256:6064e6a1e8c281e943e6d14d4722643ee9fa828d17764db84863811950ffb9ef as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
