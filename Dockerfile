#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:bb1c41682308d7040f74d103022816d41c50d7b0c89e9d706a74b4e548636e54 as build-focal
FROM ubuntu:jammy@sha256:b6ec12b8345cdc0714add139b17803301aec077509820faf970a1dab0a7fce78 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
