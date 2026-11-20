#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ghcr.io/containerbase/ubuntu:20.04@sha256:8feb4d8ca5354def3d8fce243717141ce31e2c428701f6682bd2fafe15388214 AS build-focal
FROM ghcr.io/containerbase/ubuntu:22.04@sha256:252bffe20cd96f4eca79e59b95ac87d05021ab22fcf57f621f9e244645c4eac7 AS build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} AS builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
