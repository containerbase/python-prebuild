#-------------------------
# renovate rebuild trigger
# Check:
# - https://www.python.org/downloads/
# - https://devguide.python.org/versions/#supported-versions
#-------------------------

# makes lint happy
FROM scratch

# EOL 2025-10
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.9.23

# EOL 2026-10
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.10.18

# EOL 2027-10
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.11.13

# EOL 2028-10
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.12.11

# EOL 2029-10
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.13.5
