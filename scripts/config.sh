#!/bin/bash

export APP='hello'
export VENDOR='jonathanporta.com'

export RELEASE_TAG=$TRAVIS_BRANCH-0.1.$TRAVIS_BUILD_NUMBER

declare -A TARGETS
TARGETS[windows]='amd64'
TARGETS[linux]='amd64'
TARGETS[darwin]='amd64'

declare -A EXECUTABLES
EXECUTABLES[windows]="$APP.exe"
EXECUTABLES[linux]=$APP
EXECUTABLES[darwin]=$APP

export TARGETS
export EXECUTABLES
