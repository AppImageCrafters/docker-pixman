#! /bin/bash

set -xe

source /entrypoint.sh

wget https://www.cairographics.org/releases/pixman-"$PIXMAN_VERSION".tar.gz -O- | tar xz

cd pixman-"$PIXMAN_VERSION"

export CFLAGS="-I/deps/include"
export LDFLAGS="-I/deps/lib"

./configure --prefix=/usr/local

# build and install into prefix
make all -j$(nproc)
make install

cd ..

rm -rf pixman-$PIXMAN_VERSION/
