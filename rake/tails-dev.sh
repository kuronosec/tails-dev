#!/bin/bash

echo "deb http://ftp.us.debian.org/debian/ stable contrib" >> /etc/apt/sources.list
echo "deb http://ftp.us.debian.org/debian/ unstable main" |  tee /etc/apt/sources.list.d/unstable.list
tee /etc/apt/preferences.d/unstable <<EOF
Package: *
Pin: release o=Debian,a=unstable
Pin-Priority: 500
EOF

apt-get update
apt-get install -y --force-yes net-tools git virtualbox rake ruby-childprocess     ruby-erubis ruby-i18n ruby-log4r ruby-net-scp ruby bsdtar curl
tee /etc/apt/preferences.d/tails-build-vagrant <<EOF
Package: vagrant
Pin: version 1.4.3+dfsg1-3
Pin-Priority: 550

Package: ruby-net-ssh
Pin: version 1:2.6.8-2
Pin-Priority: 550
EOF

echo "deb http://snapshot.debian.org/archive/debian/20141010T042049Z/ unstable main" |  tee /etc/apt/sources.list.d/20141010T042049Z.list
apt-get -o Acquire::Check-Valid-Until=false update
apt-get install -y --force-yes vagrant ruby-net-ssh
rm /etc/apt/sources.list.d/20141010T042049Z.list
apt-get update
# git clone https://git-tails.immerda.ch/tails
# cd tails/
# git checkout devel
# rake build
