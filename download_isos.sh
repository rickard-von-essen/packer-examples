#!/bin/bash

CENTOS_ISO=CentOS-6.5-x86_64-bin-DVD1.iso
CENTOS_MD5=83221db52687c7b857e65bfe60787838
CENTOS_BASE_URL=http://ftp.sunet.se/pub/Linux/distributions/centos/6.5/isos/x86_64
if [ ! -e "~/Downloads/$CENTOS_ISO" ]; then
  wget $CENTOS_BASE_URL/$CENTOS_ISO -O ~/Downloads/$CENTOS_ISO
fi

if [ ! -e "isos/$CENTOS_ISO" ]; then
  ln -s ~/Downloads/$CENTOS_ISO isos/
fi

MD5=`md5 isos/$CENTOS_ISO | cut -d= -f 2 | tr -d " "`
if [ $MD5 != $CENTOS_MD5 ]; then
  echo "MD5 Check failed!"
  echo "was: $MD5, expected $CENTOS_MD5"
  exit 17
fi

echo "OK!"
