#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:a283507f25d2cd01d60594bb6e7dcae568e3248b359fe39461ffbd80327b6cdf as build-focal
FROM ubuntu:jammy@sha256:2a357c4bd54822267339e601ae86ee3966723bdbcae640a70ace622cc9470c83 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
