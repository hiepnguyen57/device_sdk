FROM ubuntu:22.04

LABEL maintainer="hoahiepk10@gmail.com"

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y git libncurses-dev gawk flex bison openssl libssl-dev dkms libelf-dev \
    libudev-dev libpci-dev libiberty-dev autoconf axel bc cmake

RUN apt-get install -y pkg-config