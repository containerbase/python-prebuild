#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO=focal

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:c1d0baf2425ecef88a2f0c3543ec43690dc16cc80d3c4e593bb95e4f45390e45 as build-bionic
FROM ubuntu:focal@sha256:b872b0383a2149196c67d16279f051c3e36f2acb32d7eb04ef364c8863c6264f as build-focal
FROM ubuntu:jammy@sha256:9dc05cf19a5745c33b9327dba850480dae80310972dea9b05052162e7c7f2763 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
