#-------------------------
# renovate rebuild trigger
#-------------------------

# makes lint happy
FROM scratch


# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.6.13

# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.7.10

# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.8.9

# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.9.1
