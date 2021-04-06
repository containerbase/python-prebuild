#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:122f506735a26c0a1aff2363335412cfc4f84de38326356d31ee00c2cbe52171 as build-bionic
FROM ubuntu:focal@sha256:3c9c713e0979e9bd6061ed52ac1e9e1f246c9495aa063619d9d695fb8039aa1f as build-focal


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
