#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ghcr.io/containerbase/ubuntu:20.04@sha256:6b74c1a5996659717ade273c4dae317b58790479b46ce8c7d4e635e7262e8cac as build-focal
FROM ghcr.io/containerbase/ubuntu:22.04@sha256:94618b2ce8a064c6e3b88ef11e7030a6ad6f3e2bcb62b5afba2f63feb01a8f32 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
