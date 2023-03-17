#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:focal@sha256:9fa30fcef427e5e88c76bc41ad37b7cc573e1d79cecb23035e413c4be6e476ab as build-focal
FROM ubuntu:jammy@sha256:2adf22367284330af9f832ffefb717c78239f6251d9d0f58de50b86229ed1427 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
