#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:2776e04192ee13ecb3a6e8499d9e7d31ef183125210ddcd765a624300e066a30 as build-focal
FROM ubuntu:jammy@sha256:f4dd0db54f116682a31ea556ae77e323493c72e194903e60cd7d68721816d50e as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
