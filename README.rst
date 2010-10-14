EnigmaCurry's Emacs Config - hacked by kurtjx
---------------------------------------------

This is `kurtjx's <http://kurtisrandom.com/>`_ fork of Ryan McGuire's (EnigmaCurry) Emacs Configuration.

You can find more about this environment at `Ryan's Blog <http://www.enigmacurry.com/category/emacs>`_.

Some stuff didn't work for me (kurtjx), here's the install guidelines I followed for Ubuntu 10 (note I've made some changes to vendor/vendor-compile.sh which make it Ubuntu-specific):

This is all from `Ryan's Blog <http://www.enigmacurry.com/category/emacs>`_.

- Enable the universe repository
- sudo apt-get update
- sudo apt-get install emacs-snapshot git-core automake libgconf2-dev texinfo python-setuptools
- cd ~
- git clone git://github.com/EnigmaCurry/emacs .emacs.d
- cd ~/.emacs.d
- git submodule init
- git submodule update
- cd ~/.emacs.d/vendor
- sudo ./vendor-compile.sh

The rope/ropemacs/ropemode stuff wasn't working so I did:

- sudo apt-get install mercurial
- mkdir /tmp/rope && cd /tmp/rope
- hg clone http://bitbucket.org/agr/rope
- hg clone http://bitbucket.org/agr/ropemacs
- hg clone http://bitbucket.org/agr/ropemode
- sudo easy_install rope
- ln -s ./ropemode/ropemode ./ropemacs/
- sudo easy_install ropemacs
