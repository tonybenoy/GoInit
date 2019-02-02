#!/usr/bin/env bash
# ------------------------------------------------------------------
# Author: Tony Benoy
#Script for easily creating a github repository anf then syncing it with go workspace
# ------------------------------------------------------------------

# https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/
authorization=""
# Url for github repo
myurl="https://tonybenoy.com"
#Github username used for gopath
username=""
# $GOPATH
GOPATH=""

curl -X POST "https://api.github.com/user/repos" -H "authorization: bearer $authorization" -d "{\"name\": \"$1\",
  \"description\": \"To be added soon\",
  \"homepage\": \"$myurl\",
  \"private\": false,
  \"has_issues\": true,
  \"has_projects\": false,
  \"has_wiki\": true,
  \"auto_int\": true,
  \"gitignore_template\": \"Go\",
  \"license_template\": \"mit\"
  }"

cd $GOPATH/go/src/github.com/"$username"/
git clone git@github.com:"$username"/"$1".git
