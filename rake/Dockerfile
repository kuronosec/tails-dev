# Build a developing environtment for Tails Live 

FROM debian:jessie
MAINTAINER Tails Developers tails-dev@boum.org

LABEL container.label=tails-dev

RUN mkdir /home/tails
COPY tails-dev.sh /home/tails/tails-dev.sh

# Installing prerequisites.
RUN cd /home/tails/                                && \
    ./tails-dev.sh

WORKDIR /home/tails/tails
