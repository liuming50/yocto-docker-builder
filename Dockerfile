FROM ubuntu:18.04
MAINTAINER Ming Liu <liu.ming50@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y --fix-missing
RUN apt-get update && apt-get -y install locales python python3 python3-distutils iproute2 iptables sudo software-properties-common binutils chrpath cpio cpp diffstat g++ gawk gcc git make patch libc-dev-bin wget
RUN ["locale-gen", "en_US.UTF-8"]
RUN ["dpkg-reconfigure", "locales"]

ADD start.sh /usr/local/bin/
ENTRYPOINT ["start.sh"]
