# buildozer3
[![License](https://img.shields.io/github/license/unsuitable001/buildozer3.svg?style=for-the-badge)](LICENSE)
[![Build Status](https://img.shields.io/travis/unsuitable001/buildozer3.svg?style=for-the-badge)](https://travis-ci.org/unsuitable001/buildozer3)
[![Docker Pulls](https://img.shields.io/docker/pulls/unsuitable001/buildozer3.svg?style=for-the-badge)](https://hub.docker.com/r/unsuitable001/buildozer3)


A docker container for using Buildozer with python3 &amp; kivy

Tested with python 3.6 & 3.7, kivy - latest, buildozer - latest, python-4-android - latest.

`Android NDK` will be downloaded automatically.
`Android NDK` is used by default as Crystax is depricated by Kivy. `NDK 14b` is used by default with
`SDK 20` and `android api 24` as it works the best.

A dummy `hello world` kivy app and `buildozer.spec` file is added in the `WORKDIR` for testing.
Change the spec file as per your needs. **I do not recommend changing `android.api, ndk, sdk etc` values if you aren't sure.**

## building from Dockerfile

`docker build -t buildozer3 .`

## pulling from dockerhub

`docker pull unsuitable001/buildozer3`

Docker Hub Page : https://hub.docker.com/r/unsuitable001/buildozer3

Github : https://github.com/unsuitable001/buildozer3/tree/master

## Docker Details

default work directory : `/home/kivy`

mounted volume to the host file system : `/home/kivy`

demo files are at : `/home/unsuitable001/bin`

default user : `kivy`

sudo status : `enabled`

sudo user : `kivy`

sudo password : `kivy`

## Reach Me

[Gitter](https://gitter.im/unsuitable001)

## CREDITS

A few already existing containers inspired me and helped me to make this.

https://hub.docker.com/r/jedie/buildozer

https://hub.docker.com/r/bodolsog/py3-kivy-buildozer
