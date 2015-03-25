#! /bin/bash

# We have to build go 1.5 if we want to cross compile
# Kind of messy, but will be a lot better when 1.5 is released!
source ./scripts/golang.sh

# Actually build our app
APP='hello'

declare -A TARGETS
TARGETS[windows]='386'
TARGETS[linux]='amd64'
TARGETS[darwin]='amd64'

declare -A EXECUTABLES
EXECUTABLES[windows]="$APP.exe"
EXECUTABLES[linux]=$APP
EXECUTABLES[darwin]=$APP

for TARGET in "${!TARGETS[@]}"
do
  echo "Building for $TARGET...\n\n"
  mkdir -p ./build/$TARGET
  echo "GOOS=$TARGET GOARCH=${TARGETS[$TARGET]} $GOBUILD build -o ./build/$TARGET/${EXECUTABLES[$TARGET]} ./src/hello.go"
  GOOS=$TARGET GOARCH=${TARGETS[$TARGET]} $GOBUILD build -o ./build/$TARGET/${EXECUTABLES[$TARGET]} ./src/hello.go
done
