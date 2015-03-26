#!/bin/bash

# We have to build go 1.5 if we want to cross compile
# Kind of messy, but will be a lot better when 1.5 is released!
# source $(pwd)/scripts/golang.sh
echo 'Going to import the config.sh values...'
echo "PWD: $(pwd)"
echo "LS:"
ls -la
# Actually build our app
source ./scripts/config.sh

for TARGET in "${!TARGETS[@]}"
do
  echo -e "\n\nBuilding for $TARGET..."
  mkdir -p $(pwd)/build/$TARGET
  echo "GOOS=$TARGET GOARCH=${TARGETS[$TARGET]} $HOME/go/bin/go build -o $(pwd)/build/$TARGET/${EXECUTABLES[$TARGET]} $(pwd)/src/hello.go"
  GOOS=$TARGET GOARCH=${TARGETS[$TARGET]} $HOME/go/bin/go build -o $(pwd)/build/$TARGET/${EXECUTABLES[$TARGET]} $(pwd)/src/hello.go
done
