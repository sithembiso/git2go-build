#!/bin/sh

set -ex

VENDORED_PATH=openssl

cd $VENDORED_PATH &&
mkdir -p install/lib &&

# Switch to a stable version
git checkout OpenSSL_1_0_2-stable &&
./config threads no-shared --prefix=`pwd`/install -fPIC -DOPENSSL_PIC &&
make depend &&
make &&
make install