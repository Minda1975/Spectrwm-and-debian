#!/bin/bash

# declare colors
red='\033[0;31m'
nc='\033[0m'

# sources enabled?
src="$(grep ^deb-src /etc/apt/sources.list | wc -l)"

# directories
srcdir="$HOME/.local/src"
spectrsrc="$HOME/.local/src/spectrwm"
bindir="$HOME/.local/bin/"
libdir="/usr/local/lib/"

# use either doas or sudo... whichever one is configured
[ -x "$(command -v doas)" ] && [ -e /etc/doas.conf ] && ld="doas"
[ -x "$(command -v sudo)" ] && ld="sudo"

# install gcc and make if not already installed
[ -x "$(command -v gcc)" ] || $ld apt install gcc -yy
[ -x "$(command -v make)" ] || $ld apt install make -yy

[ "$src" -lt 1 ] && printf "${red} enable source repos in /etc/apt/sources.list and run script again${nc}\n" \
&& exit 1 \
|| $ld apt install xorg xserver-xorg firefox-esr pcmanfm xwallpaper suckless-tools -yy \
&& $ld apt build-dep spectrwm -yy \
&& [ -e "$srcdir" ] || mkdir -p $srcdir \
&& git clone https://github.com/conformal/spectrwm $spectrsrc \
&& make --directory $spectrsrc/linux/ \
&& ln -sf $spectrsrc/linux/spectrwm $bindir \
&& $ld ln -sf $spectrsrc/linux/libswmhack.so.0.0 $libdir \
&& printf "${red} spectrwm installed... binary placed in $bindir ${nc}\n"
