#!/bin/sh

source ./scripts/config.sh

BUILD_DIR="$(pwd)/build/linux"
OUTPUT_DIR="$(pwd)/pkg/linux"
INSTALL_DIR="/opt/$VENDOR/$PKG_NAME/"

PKG_NAME="$APP-linux"
version='0.0.1'

mkdir -p $OUTPUT_DIR

fpm -s dir \
  -t rpm \
  -n $PKG_NAME \
  -p $OUTPUT_DIR \
  -v $version \
  --vendor $VENDOR \
  $BUILD_DIR=$INSTALL_DIR
