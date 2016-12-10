#!/bin/bash

set -e

cd "$(dirname "$0")"

. .env

git checkout master &> rebuild.log
git pull &>> rebuild.log
git checkout nightly &>> rebuild.log
git merge master --no-edit &>> rebuild.log
DATE=`date +%Y-%m-%d`
git commit --allow-empty -m "$DATE: check for new Zotero/Juris-M versions" &>> rebuild.log
git push &>> rebuild.log

/home/emile/.rvm/wrappers/ruby-2.3.0@zotero/rake s3form
