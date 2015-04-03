#!/bin/bash

source ./scripts/config.sh

git config --global user.email "builds@travis-ci.com"
git config --global user.name "Travis CI"

echo -e "Pushing tag $RELEASE_TAG.\n\n"
git tag $RELEASE_TAG -a -m "Generated tag from TravisCI for build $TRAVIS_BUILD_NUMBER"
git push -q "$RELEASE_REPO" --tags
