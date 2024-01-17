#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:f2034e7195f61334e6caff6ecf2e965f92d11e888309065da85ff50c617732b8 as build-focal
FROM ubuntu:jammy@sha256:a2bbdf79d03f6d4171bbd6ebb4782f6229375951987d3427ec3d9373f9841cd7 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
