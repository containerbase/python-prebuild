#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:bb1c41682308d7040f74d103022816d41c50d7b0c89e9d706a74b4e548636e54 as build-focal
FROM ubuntu:jammy@sha256:e9569c25505f33ff72e88b2990887c9dcf230f23259da296eb814fc2b41af999 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
