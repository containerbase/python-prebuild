FROM amazonlinux:2@sha256:c7bb98aab16b51fdda5072ce1956ba7f7b9d8f4a63ab7d005f5e936dda5dff37

RUN amazon-linux-extras install python3.8

RUN set -ex; \
    yum install -y \
        bzip2-devel \
        gcc \
        gcc-c++ \
        git \
        make \
        libffi-devel \
        pkgconfig \
        perl-IPC-Cmd \
        openssl11 \
        openssl11-devel \
        readline-devel \
        sqlite-devel \
        tar \
        xz \
        xz-devel \
        zlib-devel \
        ; \
    true

RUN set -ex; \
    git clone https://github.com/pyenv/pyenv.git; \
    pushd pyenv/plugins/python-build; \
    ./install.sh; \
    popd; \
    mkdir -p /usr/local/python; \
    true


ARG PYTHON_VERSION=3.12.1
RUN python-build -v "$PYTHON_VERSION" "/usr/local/python/$PYTHON_VERSION"

RUN tar -cJf "python-amzn-2-$(uname -p).tar.xz" -C /usr/local/python "$PYTHON_VERSION"