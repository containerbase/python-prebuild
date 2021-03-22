#!/bin/bash

set -e

VERSION=${1}

CODENAME=$(. /etc/os-release && echo ${VERSION_CODENAME})

NAME=python
ARCH=$(uname -p)
BUILD_ARGS=

if [[ "${DEBUG}" == "true" ]]; then
  BUILD_ARGS="-v"
fi

echo "Building ${NAME} ${VERSION} for ${CODENAME}-${ARCH}"
python-build ${BUILD_ARGS} ${VERSION} /usr/local/${NAME}/${VERSION}


/usr/local/${NAME}/${VERSION}/bin/python -v

echo "Compressing ${NAME} ${VERSION} for ${CODENAME}-${ARCH}"
tar -cJf /cache/${NAME}-${VERSION}-${CODENAME}-${ARCH}.tar.xz -C /usr/local/${NAME} ${VERSION}
