#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

git clone https://tanlukang:${GITHU_TOKEN}@github.com/tanlukang/inception-wiki.git
cp ./deploy.sh ./inception-wiki/deploy.sh
cd inception-wiki
git remote rm origin
git remote add origin https://tanlukang:${GITHU_TOKEN}@github.com/tanlukang/inception-wiki.git
git add .
git commit -m "ci: auto deploy"
git push --set-upstream origin master