#-------------------------
# renovate rebuild trigger
# Check:
# - https://www.python.org/downloads/
# - https://devguide.python.org/versions/#supported-versions
#-------------------------

# makes lint happy
FROM scratch

# EOL 2024-10
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.8.18

# EOL 2025-10
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.9.18

# EOL 2026-10
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.10.13

# EOL 2027-10
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.11.7

# EOL 2023-10
# renovate: datasource=docker depName=python versioning=docker
ENV PYTHON_VERSION=3.12.2
