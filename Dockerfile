#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ghcr.io/containerbase/ubuntu:20.04@sha256:d10b9095125a8f4ae2d245df5f191aa53d1f5cf53042d3b0e9dc35da9f45a5bf as build-focal
FROM ghcr.io/containerbase/ubuntu:22.04@sha256:ca9449d4bae930d098f5d05aa33d0d279db957461b06b16928f65794ba8b3c80 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
