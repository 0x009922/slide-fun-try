#!/usr/bin/env sh

# остановить публикацию при ошибках
set -e

yarn build --mode ghpages
cd dist
git init
git add -A
git commit -m 'deploy'
git push -f git@github.com:liquidsolid/slide-fun-try.git master:gh-pages
cd -