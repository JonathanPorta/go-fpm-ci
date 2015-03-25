#! /bin/bash

# We have to build go 1.5 if we want to cross compile
# Kind of messy, but will be a lot better when 1.5 is released!
source $(pwd)/scripts/golang.sh

# Actually build our app
source $(pwd)/scripts/config.sh

for TARGET in "${!TARGETS[@]}"
do
  echo "Building for $TARGET...\n\n"
  mkdir -p $(pwd)/build/$TARGET
  echo "GOOS=$TARGET GOARCH=${TARGETS[$TARGET]} $GOBUILD build -o ./build/$TARGET/${EXECUTABLES[$TARGET]} ./src/hello.go"
  GOOS=$TARGET GOARCH=${TARGETS[$TARGET]} $GOBUILD build -o ./build/$TARGET/${EXECUTABLES[$TARGET]} ./src/hello.go
done
