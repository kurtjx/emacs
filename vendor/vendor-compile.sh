#!/bin/bash

#CEDET 
(cd cedet-1.0 && make)
(cd ecb

#Jabber
pushd emacs-jabber
autoconf
autoreconf
automake --add-missing
./configure
make
popd

#Pymacs
easy_install Pymacs-0.23

#pylint
apt-get install pylint

#auctex
apt-get install auctex
