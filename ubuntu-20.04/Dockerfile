FROM golang:1.16 as go
FROM ubuntu:20.04

MAINTAINER "Mikhail Shogin <mshogin@gmail.com>"

ENV DEBIAN_FRONTEND noniteractive
RUN apt-get update && apt-get -y --no-install-recommends install \
    automake \
    autoconf \
    build-essential \
    cmake \
    debhelper \
    devscripts dh-systemd \
    python3 python3-pip curl tar mak gcc jq procps ansible

#: add support building documentation
RUN pip3 install Sphinx sphinx-rtd-theme

#: copy go
COPY --from=go /go /
COPY --from=go /usr/local/go /usr/local/

#: add go to path
ENV PATH="/usr/local/go/bin:$PATH"

COPY entrypoint.sh /
RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["dpkg-buildpackage", "-us", "-uc", "-b"]
