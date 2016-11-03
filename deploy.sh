#!/bin/bash

DEPLOY_BRANCH=${DEPLOY_BRANCH:="gh-pages"}
DEPLOY_URL=${DEPLOY_URL:="http://web.xn--tcwp9o15n.taipei/"}
DEPLOY_ORIGIN_URL=${DEPLOY_ORIGIN_URL:="http://127.0.0.1:1313/"}
DEPLOY_CMD="hugo -D -t hugo-agency-theme"

. ~/gopath

sed -i.bat '/baseurl = /s,=.*$,= "'$DEPLOY_URL'",' config.toml

$DEPLOY_CMD

git checkout config.toml

git checkout $DEPLOY_BRANCH

cp -R public/* .

git commit -a -m "Relase"

# git push

# sed -i.bat '/baseurl = /s,=.*$,= "'$DEPLOY_ORIGIN_URL'",' config.toml
