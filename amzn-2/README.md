# build python for amazonlinux 2

Required for vercel

```console
docker build --progress plain -t al-python --load .
docker run --rm -it -v ${PWD}:/cache al-python cp python-amzn-2-x86_64.tar.xz /cache
```
