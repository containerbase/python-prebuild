#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:3badff71342d281e7b268f86c1cf870d9e480adba4c5da1b8fb8dc4eb76ed110 as build-bionic
FROM ubuntu:focal@sha256:b4aa552dd3f2ed84f3214b0e8add3648aee0205ef58295c92fe0899f96ad8755 as build-focal


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
