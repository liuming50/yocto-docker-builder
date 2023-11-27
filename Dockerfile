FROM ubuntu:18.04
MAINTAINER Ming Liu <liu.ming50@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y --fix-missing
RUN apt-get update && apt-get -y install apt-utils ca-certificates chrpath cpio dbus-x11 devscripts diffstat gawk git gnome-terminal iptables less libcanberra-gtk3-module liberror-perl locales lzop mc mg nano nfs-common pigz python python-pip python3 python3-distutils python3-pip sudo texinfo vim wget whiptail zstd
RUN ["locale-gen", "en_US.UTF-8"]
RUN ["dpkg-reconfigure", "locales"]

ADD start.sh /usr/local/bin/
ENTRYPOINT ["start.sh"]
