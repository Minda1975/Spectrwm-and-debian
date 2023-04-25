#!/bin/bash
red="\033[0;31m"
nc="\033[0m"
user="$(getent group 1000 | cut -d':' -f 1)"
runas=($whoami)

[ $runas != 'root' ] && printf "${red}command must be run as root...exiting ${nc}\n" && exit 1

apt install doas -yy

[ -e /etc/doas.conf ] && printf "${red} /etc/doas.conf already exists, move to a backup location and run script again.${nc}\n" \
&& exit 1

[ -x "$command -v wget" ] || apt install wget

wget https://raw.githubusercontent.com/Minda1975/window-managers-configs/master/super-user/doas.conf

sed -i "s/mike/${user}/g" doas.conf

mv doas.conf /etc/doas.conf


