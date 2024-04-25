#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:812f80bf21ba2dca10345c1b4dfe9aaaddf2a431cc43849e5293e792b1b1bfa6 as build-focal
FROM ubuntu:jammy@sha256:590f59cd1a88bebe6293510a76b28a92a28782f483a1ec1f69ccbc716735b796 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
