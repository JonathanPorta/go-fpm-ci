#! /bin/bash

git clone https://go.googlesource.com/go $HOME/go1.4
cd $HOME/go1.4/src
git checkout release-branch.go1.4
./make.bash

git clone https://go.googlesource.com/go $HOME/go
cd $HOME/go/src
GOROOT_BOOTSTRAP=$HOME/go1.4 ./all.bash

export PATH=$PATH:$HOME/go/bin
