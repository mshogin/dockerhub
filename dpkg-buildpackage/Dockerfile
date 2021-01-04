#: Usage example:
#:  cd /your/src
#:  docker run -v $(pwd):/mnt/src/ dpkg-buildpackage
ARG UBUNTU_VERSION

FROM golang:1.15 as go
FROM ubuntu:${UBUNTU_VERSION}

MAINTAINER "Mikhail Shogin <mshogin@gmail.com>"

ENV DEBIAN_FRONTEND noniteractive
RUN apt-get update && apt-get -y --no-install-recommends install \
  automake \
  autoconf \
  build-essential \
  cmake \
  debhelper \
  devscripts dh-systemd \
  python3 python3-pip curl

#: add support building documentation
RUN pip3 install Sphinx sphinx-rtd-theme

#: copy go
COPY --from=go /go /
COPY --from=go /usr/local/go /usr/local/

#: add go to path
ENV PATH="/usr/local/go/bin:$PATH"

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["dpkg-buildpackage", "-us", "-uc", "-b"]
