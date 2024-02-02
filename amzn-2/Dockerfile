FROM amazonlinux:2@sha256:90e48c53055fc5943819e6a75e0227ecd43384ba3dbe949030f164645c485518

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