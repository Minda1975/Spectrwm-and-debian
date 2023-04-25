#!/bin/bash
#src and bin directories
stdir="$HOME/.local/src/st/"
bindir="$HOME/.local/bin/"

#either sudo or doas should work
[ -x "$(command -v doas)" ] && [ -e /etc/doas.conf ] && ld="doas"
[ -x "$(command -v sudo)" ] && ld="sudo"

#create stdir and bindir if they don't already exist
[ -e "$stdir" ] || mkdir -p $stdir
[ -e "$bindir" ] || mkdir -p $bindir

#install dependencies
$ld apt install gcc make libxft-dev libxcb1-dev libxinerama-dev libx11-dev -yy

#clone my build of st to ~/.local/src/st
git clone https://gitlab.com/linuxdabbler/st $stdir

#build it...
make --directory=$stdir

#symlink binary to ~/.local/bin/
ln -sf $stdir/st $bindir




