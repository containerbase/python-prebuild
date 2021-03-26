#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:122f506735a26c0a1aff2363335412cfc4f84de38326356d31ee00c2cbe52171 as build-bionic
FROM ubuntu:focal@sha256:a15789d24a386e7487a407274b80095c329f89b1f830e8ac6a9323aa61803964 as build-focal


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
