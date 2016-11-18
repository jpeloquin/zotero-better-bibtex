#!/bin/sh

set -e

cd "$(dirname "$0")"

. .env

git pull --all > rebuild.log 2>&1
git merge master --no-edit >> rebuild.log 2>&1
DATE=`date +%Y-%m-%d`
git commit --allow-empty -m "$DATE: check for new Zotero/Juris-M versions" >> rebuild.log 2>&1
git push >> rebuild.log 2>&1

/home/emile/.rvm/wrappers/ruby-2.3.0@zotero/rake s3form
