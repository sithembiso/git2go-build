#!/bin/sh

set -ex

VENDORED_PATH=http-parser

cd $VENDORED_PATH &&
make library &&
make package