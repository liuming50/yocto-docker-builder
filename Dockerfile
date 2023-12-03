FROM ubuntu:18.04
MAINTAINER Ming Liu <liu.ming50@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade -y --fix-missing
RUN apt-get update && apt-get -y install apt-utils ca-certificates chrpath cpio dbus-x11 devscripts diffstat gawk git gnome-terminal gcc-multilib g++-multilib iptables less libcanberra-gtk3-module liberror-perl libncurses5-dev locales lzop mc mg nano nfs-common openssh-server pigz python python-pip python3 python3-distutils python3-pip sed sudo texinfo vim wget whiptail zstd
RUN ["sed -i s/#X11UseLocalhost yes/X11UseLocalhost no/g", "/etc/ssh/sshd_config"]
RUN ["locale-gen", "en_US.UTF-8"]
RUN ["dpkg-reconfigure", "locales"]

ADD start.sh /usr/local/bin/
ENTRYPOINT ["start.sh"]
