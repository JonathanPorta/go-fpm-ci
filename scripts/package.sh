#!/bin/bash

vendor='jonathanporta.com'
pkg_name='fpm-test'



install_dir="/opt/$publisher/$pkg_name/"
version='0.0.1'

src_dir="$(pwd)/src"
pkg_dir="$(pwd)/pkg"


mkdir -p $pkg_dir

fpm -s dir \
  -t rpm \
  -n $pkg_name \
  -p $pkg_dir \
  -v $version \
  --vendor $vendor \
  $src_dir=$install_dir
