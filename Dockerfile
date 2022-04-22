#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:1c3f36f44928aafe1ae126b3e1bfe52d083f04bed7957012b3099e2176522c12 as build-bionic
FROM ubuntu:focal@sha256:146382ce422c8066c5c7b3f16ded4b5a6eb455894b797e9bb231c9d4afca74c0 as build-focal


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
