#!/bin/bash

set -e


echo "APT::Install-Recommends \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf
echo "APT::Get::Upgrade \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf
echo "APT::Get::Install-Suggests \"false\";" | tee -a /etc/apt/apt.conf.d/99buildpack.conf

if [[ ! -z "${APT_PROXY+x}" ]]; then
  echo "Acquire::http::proxy \"${APT_PROXY}\";" | tee -a /etc/apt/apt.conf.d/99buildpack-proxy.conf
fi

export DEBIAN_FRONTEND=noninteractive

apt-get update -q
apt-get install -q -y \
  build-essential \
  ca-certificates \
  curl \
  dumb-init \
  git \
  libbz2-dev \
  libffi-dev \
  liblzma-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  zlib1g-dev \
  ;

git clone https://github.com/pyenv/pyenv.git
pushd pyenv/plugins/python-build
./install.sh
popd

mkdir -p /usr/local/python /cache

#--------------------------------
# cleanup
#--------------------------------
if [[ ! -z "${APT_PROXY+x}" ]]; then
  rm -f /etc/apt/apt.conf.d/99buildpack-proxy.conf
fi
