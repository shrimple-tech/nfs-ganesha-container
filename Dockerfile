FROM docker.io/library/debian:11-slim

ARG GANESHA_MAJOR_VERSION="4"
ARG GANESHA_MINOR_VERSION="0"

RUN apt-get update && \
    apt-get install -y wget gpg && \
    wget -O - https://download.nfs-ganesha.org/${GANESHA_MAJOR_VERSION}/rsa.pub | apt-key add - && \
    echo deb [arch=amd64] https://download.nfs-ganesha.org/${GANESHA_MAJOR_VERSION}/${GANESHA_MAJOR_VERSION}.${GANESHA_MINOR_VERSION}/Debian/bullseye/amd64/apt bullseye main > /etc/apt/sources.list.d/gluster.list && \
    apt-get update && \
    apt-get install -y nfs-ganesha && \
    apt-get clean
