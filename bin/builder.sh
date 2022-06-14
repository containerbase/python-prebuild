#!/bin/bash

set -e

VERSION=${1}

# shellcheck disable=SC1091
CODENAME=$(. /etc/os-release && echo "${VERSION_CODENAME}")

NAME=python
ARCH=$(uname -p)
BUILD_ARGS=

if [[ "${DEBUG}" == "true" ]]; then
  BUILD_ARGS="-v"
fi

SEMVER_REGEX="^(0|[1-9][0-9]*)(\.(0|[1-9][0-9]*))?(\.(0|[1-9][0-9]*))?([a-z-].*)?$"

function check_semver () {
  if [[ ! "${1}" =~ ${SEMVER_REGEX} ]]; then
    echo "Not a semver like version - aborting: ${1}" >&2
    exit 1
  fi
  export MAJOR=${BASH_REMATCH[1]}
  export MINOR=${BASH_REMATCH[3]}
  export PATCH=${BASH_REMATCH[5]}
}

if [[ ! -f "/usr/local/share/python-build/${VERSION}" ]]; then
  echo "Missing build definition for ${VERSION}. Trying to find older patch build definition"
  check_semver "${VERSION}"
  if [[ ! "${MAJOR}" || ! "${MINOR}" || ! "${PATCH}" ]]; then
    echo "Invalid version: ${TOOL_VERSION}" >&2
    exit 1
  fi
  oldVersion=$(find /usr/local/share/python-build -type f -name "${MAJOR}.${MINOR}.*" -printf '%f\n' | grep -P '^\d+\.\d+.\d+$' | sort --version-sort -r | head -n 1)

  if [[ -z $oldVersion ]]; then
    echo "No usable definition found" >&2
    exit 1
  fi

  echo "Using version $oldVersion"

  cp "/usr/local/share/python-build/$oldVersion" "/usr/local/share/python-build/${VERSION}"
  sed -i "s/Python-${oldVersion}/Python-${VERSION}/g" "/usr/local/share/python-build/${VERSION}"
  sed -i "s#Python/${oldVersion}#Python/${VERSION}#g" "/usr/local/share/python-build/${VERSION}"
  sed -i -E 's/#[a-z0-9]+"/"/' "/usr/local/share/python-build/${VERSION}"
fi

echo "Building ${NAME} ${VERSION} for ${CODENAME}-${ARCH}"
python-build ${BUILD_ARGS} "${VERSION}" "/usr/local/${NAME}/${VERSION}"


"/usr/local/${NAME}/${VERSION}/bin/python" -v

echo "Compressing ${NAME} ${VERSION} for ${CODENAME}-${ARCH}"
tar -cJf "/cache/${NAME}-${VERSION}-${CODENAME}-${ARCH}.tar.xz" -C /usr/local/${NAME} "${VERSION}"
