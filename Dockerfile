#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:73ef04ccea7af212944c9e6d264cda26fe347a5f70b14ce31ee2831883d412d9 as build-bionic
FROM ubuntu:focal@sha256:31af67112c3cf56861a0ec7074863f0e110b8eae088c1f095cf23d89b9df5aa9 as build-focal


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
