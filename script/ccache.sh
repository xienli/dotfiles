#!/usr/bin/env bash

cd /tmp || exit 1
git clone git://github.com/xienli/ccache.git
cd ccache || exit 1
./autogen.sh
./configure --disable-man
make -j"$(nproc)"
sudo make install
rm -rf "${PWD}"
cd - || exit 1
