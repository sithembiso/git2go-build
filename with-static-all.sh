#!/bin/sh

set -ex


export VENDOR="$PWD"
export LIBSSH2="$VENDOR/libssh2"
export OPENSSL="$VENDOR/openssl"
export PARSER="$VENDOR/http-parser"
#export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$LIBGIT2/build:$LIBSSH2/build/src:$OPENSSL/install/lib/pkgconfig:$PARSER"

#export LIBGIT2_BUILD="$LIBGIT2/build"

#FLAGS=$(pkg-config --static --libs --cflags libcrypto openssl libssh2 libgit2) || exit 1
#export CGO_LDFLAGS="$LIBGIT2_BUILD/libgit2.a $PARSER/libhttp_parser.a $OPENSSL/libcrypto.a $OPENSSL/libssl.a $LIBSSH2/build/src/libssh2.a -L$BUILD ${FLAGS}"
#export CGO_CFLAGS="-I$LIBGIT2/include:$OPENSSL/include:$LIBSSH2/include"

export BUILD="$PWD/../../libgit2/git2go/vendor/libgit2/build"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$LIBGIT2:$OPENSSL/install/lib/pkgconfig:$LIBSSH2/build/src:$PARSER"

FLAGS=$(pkg-config --static --libs --cflags libssh2 libgit2) || exit 1
export CGO_LDFLAGS="$BUILD/libgit2.a $OPENSSL/libcrypto.a $OPENSSL/libssl.a $LIBSSH2/build/src/libssh2.a -L$BUILD ${FLAGS}"
export CGO_CFLAGS="-I$PWD/../../libgit2/git2go/vendor/libgit2/include"

$@
