# containerbase Python releases

[![build](https://github.com/containerbase/python-prebuild/actions/workflows/build.yml/badge.svg)](https://github.com/containerbase/python-prebuild/actions/workflows/build.yml?query=branch%3Amain)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/containerbase/python-prebuild)
![License: MIT](https://img.shields.io/github/license/containerbase/python-prebuild)

Prebuild Python releases used by [containerbase/base](https://github.com/containerbase/base).

## Local development

`mise install` installs Node.js, pnpm, jactionlint, shellcheck and zizmor, then `pnpm install --frozen-lockfile` installs the dependencies.

```bash
pnpm lint            # pnpm oxfmt-fix to fix the formatting
jactionlint          # the GitHub workflows
zizmor .github/      # security audit of the GitHub workflows
```

CI runs jactionlint and zizmor through mise in the `lint` job, and the commit hook runs them on staged workflow files.

Build the image

```bash
docker build -t builder --build-arg APT_PROXY=http://apt-proxy:3142 --build-arg DISTRO=focal .
```

Test the image

```bash
docker run --rm -it -v ${PWD}/.cache:/cache -e DEBURG=true builder 3.9.1
```

`${PWD}/.cache` will contain packed releases after successful build.

Optional environment variables

| Name        | Description                                                  | Default   |
| ----------- | ------------------------------------------------------------ | --------- |
| `DISTRO`    | Set an ubuntu base distro, `focal` and `jammy` are supported | `focal`   |
| `APT_PROXY` | Set an APT http proxy for installing build deps              | `<empty>` |
| `DEBUG`     | Show verbose php build output                                | `<empty>` |
