#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

# remove cache
if [ -f ./SUMMARY.md ]; then
    rm ./SUMMARY.md
fi

# init 
npm install gitbook-cli -g
gitbook install 
gitbook build
# fix plugin bug 
gitbook build

# fetch repo
git clone https://tanlukang:${GITHUB_TOKEN}@github.com/tanlukang/inception-wiki.git
cp -R ./_book/* ./inception-wiki/

# init repo info
cd inception-wiki
git remote rm origin
git remote add origin https://tanlukang:${GITHUB_TOKEN}@github.com/tanlukang/inception-wiki.git
git config --global user.email "robot@inceptionpad.com"
git config --global user.name "CI Robot"

# push
git add .
git commit -m "ci: auto deploy"
git push --set-upstream origin master