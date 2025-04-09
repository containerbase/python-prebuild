#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ghcr.io/containerbase/ubuntu:20.04@sha256:b650347f3d05a762604a103b48099273713d60e2754ed8dba158cc6b67cbdbb3 as build-focal
FROM ghcr.io/containerbase/ubuntu:22.04@sha256:bd01a6d8f34e0bc273d88e30547a0f3633875a0d1902fd39d6d1ad5aca123868 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
