FROM ubuntu:18.04
MAINTAINER Ming Liu <liu.ming50@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y --fix-missing
RUN apt-get update && apt-get -y install locales python python3 sudo software-properties-common
RUN ["locale-gen", "en_US.UTF-8"]
RUN ["dpkg-reconfigure", "locales"]

ADD start.sh /usr/local/bin/
ENTRYPOINT ["start.sh"]