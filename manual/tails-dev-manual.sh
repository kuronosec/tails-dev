#!/bin/bash

echo "deb http://http.debian.net/debian jessie-backports main" >> /etc/apt/sources.list
echo "deb http://deb.tails.boum.org/ builder-jessie main" |  tee /etc/apt/sources.list.d/tails.list
apt-key add /home/tails/tails.chroot.gpg
tee /etc/apt/preferences.d/00-builder-jessie-pinning <<EOF
Package: *
Pin: release o=Debian,a=stable
Pin-Priority: 700

Package: *
Pin: origin deb.tails.boum.org
Pin-Priority: 800
EOF
apt-get update
apt-get install -y --force-yes dpkg-dev eatmydata gettext intltool libyaml-libyaml-perl libyaml-perl libyaml-syck-perl perlmagick po4a syslinux-utils time whois
apt-get install -y --force-yes debootstrap/jessie-backports ikiwiki/jessie-backports
apt-get install -y --force-yes live-build
