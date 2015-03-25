#! /bin/bash
PROJECT_DIR=$(pwd)
BUILD_DIR="$PROJECT_DIR/golang"

mkdir -p $BUILD_DIR

echo 'Getting and building go 1.4...'
git clone https://go.googlesource.com/go $BUILD_DIR/go1.4
cd $BUILD_DIR/go1.4/src
git checkout release-branch.go1.4
./make.bash

echo 'Getting and building go 1.5...'
git clone https://go.googlesource.com/go $BUILD_DIR/go1.5
cd $BUILD_DIR/go1.5/src
GOROOT_BOOTSTRAP=$BUILD_DIR/go1.4 ./all.bash

echo "Exporting GOBUILD=$BUILD_DIR/go1.5/bin/go"
export GOBUILD=$BUILD_DIR/go1.5/bin/go
