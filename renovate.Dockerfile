#-------------------------
# renovate rebuild trigger
#-------------------------

# makes lint happy
FROM scratch


# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.6.14

# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.7.11

# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.8.11

# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.9.5
