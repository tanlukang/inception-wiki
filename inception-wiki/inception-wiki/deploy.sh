#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

git clone https://tanlukang:${GITHUB_TOKEN}@github.com/tanlukang/inception-wiki.git

npm install gitbook-cli -g
gitbook install 
gitbook build
cp -R ./_book/* ./inception-wiki/

cd inception-wiki
git remote rm origin
git remote add origin https://tanlukang:${GITHUB_TOKEN}@github.com/tanlukang/inception-wiki.git
git config --global user.email "robot@inceptionpad.com"
git config --global user.name "CI Robot"

git add .
git commit -m "ci: auto deploy"
git push --set-upstream origin master