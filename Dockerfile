FROM ubuntu:16.04
MAINTAINER Chris Samuel <chris@csamuel.org>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget bison flex python-setuptools python-dev autoconf \
                       libtool zlib1g-dev texinfo help2man gawk g++ curl texlive cmake subversion default-jdk

RUN adduser --disabled-password --gecos "Google OR User" googleor
ENV HOME /home/googleor

WORKDIR /home/googleor

RUN su googleor -c "wget 'https://github.com/google/or-tools/releases/download/v4.3/or-tools_Ubuntu-16.04-64bit_v4.3.3802.tar.gz'"

RUN su googleor -c "tar xf or-tools_Ubuntu-16.04-64bit_v4.3.3802.tar.gz"
