# Manual build environtment for Tails Live

FROM debian:jessie
MAINTAINER Tails Developers tails-dev@boum.org

LABEL container.label=tails-dev-manual

RUN mkdir /home/tails
COPY tails-dev-manual.sh /home/tails/tails-dev-manual.sh
COPY tails.chroot.gpg    /home/tails/tails.chroot.gpg

# Installing prerequisites.
RUN cd /home/tails/                                && \
    ./tails-dev-manual.sh

WORKDIR /home/tails/tails
