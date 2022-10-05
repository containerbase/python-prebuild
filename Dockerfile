#--------------------------------------
# Ubuntu flavor
#--------------------------------------
ARG DISTRO

#--------------------------------------
# base images
#--------------------------------------
FROM ubuntu:bionic@sha256:50e71ab17a4bfbb11ec9c93aec3fca0b3acad79b4155b717842f1983cb42039e as build-bionic
FROM ubuntu:focal@sha256:e81eb151de587f6b02ab9daea410a819382bdeb27b7a01342f7167d606635078 as build-focal
FROM ubuntu:jammy@sha256:e00bd9ad7f936c975dd7c15c71d216f6456aabc39118df7eaa6919d7ddfdb3b0 as build-jammy


#--------------------------------------
# builder images
#--------------------------------------
FROM build-${DISTRO} as builder


ENTRYPOINT [ "dumb-init", "--", "builder.sh" ]

COPY bin /usr/local/bin

RUN install-builder.sh
