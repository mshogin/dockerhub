#!/bin/bash

set -x
docker build --build-arg UBUNTU_VERSION=18.04 . -t mshogin/dpkg-buildpackage:bionic
docker build --build-arg UBUNTU_VERSION=20.04 . -t mshogin/dpkg-buildpackage:falcon
