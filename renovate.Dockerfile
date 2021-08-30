#-------------------------
# renovate rebuild trigger
# Check https://www.python.org/downloads/
#-------------------------

# makes lint happy
FROM scratch

# EOL 2021-12-23
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.6.14

# EOL 2023-06-27
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.7.11

# EOL 2024-10
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.8.11

# EOL 2025-10
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.9.6
