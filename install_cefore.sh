#!/bin/sh

sudo apt-get install -y autoconf
wget -q https://ftp.gnu.org/gnu/automake/automake-1.15.1.tar.gz
tar xvfz automake-1.15.1.tar.gz
cd automake-1.15.1/ || exit; ./configure; cd - || exit;
cd automake-1.15.1/ || exit; make; cd - || exit;
cd automake-1.15.1/ || exit; sudo make install; cd - || exit

git clone https://github.com/cefore/cefore.git
cd cefore/ || exit; autoconf; cd - || exit
cd cefore/ || exit; automake; cd - || exit
cd cefore/ || exit; ./configure --enable-csmgr --enable-cache; cd - || exit
cd cefore/ || exit; make; cd - || exit
cd cefore/ || exit; sudo make install; cd - || exit
cd cefore/ || exit; sudo ldconfig; cd - || exit