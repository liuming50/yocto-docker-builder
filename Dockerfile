FROM ubuntu:16.04
MAINTAINER Ming Liu <liu.ming50@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y --fix-missing
RUN apt-get update && apt-get -y install ca-certificates chrpath cpio dbus-x11 devscripts diffstat gawk git git-lfs gnome-terminal iptables less libcanberra-gtk3-module liberror-perl locales lz4 lzop mc mg nano nfs-common pigz python-is-python3 python3 python3-pip sudo texinfo vim wget whiptail zstd
RUN ["locale-gen", "en_US.UTF-8"]
RUN ["dpkg-reconfigure", "locales"]

ADD start.sh /usr/local/bin/
ENTRYPOINT ["start.sh"]
