#!/bin/bash

source ./scripts/config.sh

for TARGET in "${!TARGETS[@]}"
do
  echo -e "\n\nBuilding for $TARGET..."
  mkdir -p $(pwd)/build/$TARGET
  echo "GOOS=$TARGET GOARCH=${TARGETS[$TARGET]} go build -o $(pwd)/build/$TARGET/${EXECUTABLES[$TARGET]} $(pwd)/src/hello.go"
  GOOS=$TARGET GOARCH=${TARGETS[$TARGET]} go build -o $(pwd)/build/$TARGET/${EXECUTABLES[$TARGET]} $(pwd)/src/hello.go
done
