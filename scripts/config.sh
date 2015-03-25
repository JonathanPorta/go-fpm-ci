#!/bin/sh

export APP='hello'
export VENDOR='jonathanporta.com'

declare -A TARGETS
TARGETS[windows]='386'
TARGETS[linux]='amd64'
TARGETS[darwin]='amd64'

declare -A EXECUTABLES
EXECUTABLES[windows]="$APP.exe"
EXECUTABLES[linux]=$APP
EXECUTABLES[darwin]=$APP

export TARGETS
export EXECUTABLES
